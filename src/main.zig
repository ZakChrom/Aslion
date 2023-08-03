const std = @import("std");
const A8 = @import("a8.zig");
const display = @import("display.zig");
const c = @cImport({
    @cInclude("signal.h");
});

pub fn main() !void {
    // Get the args and skip the first one (program name)
    var args = try std.process.argsWithAllocator(std.heap.page_allocator);
    defer args.deinit();
    _ = args.skip();

    const command = args.next().?;

    std.debug.print("sizeof(A8) = {d} bytes\n", .{@sizeOf(A8)});

    if (std.mem.eql(u8, command, "print")) {
        try print(args.next().?);
    } else if (std.mem.eql(u8, command, "speed")) {
        try speed(args.next().?);
    } else if (std.mem.eql(u8, command, "save")) {
        try save(args.next().?);
    } else {
        std.debug.print(":staring_cat:\n", .{});
    }
}

// If the user does Ctrl c this will hopefully get set to true and the program should exit normally instead of being killed
var shouldClose: bool = false;
fn speed(filename: []const u8) !void {
    // Very cursed lambda function
    _ = c.signal(c.SIGINT, &struct{fn _(_: c_int) callconv(.C) void {
        shouldClose = true;
    }}._);

    // Array for average a8 speed
    var array = std.ArrayList(u64).init(std.heap.page_allocator);
    defer array.deinit();

    // Initalize a8 and timer
    var a8 = try A8.initFile(filename);
    var timer = try std.time.Timer.start();

    // Main loop (i is the amount of instructions we managed to execute in a second)
    var i: u64 = 0;
    while (!shouldClose) : (i += 1) {
        a8.update();
        if (timer.read() >= std.time.ns_per_s) {
            var mhz = (i/1024)/1024;
            try array.append(mhz);

            var avg: f32 = 0;
            for (array.items) |item| {
                avg += @floatFromInt(item);
            }

			var num: f32 = @floatFromInt(array.items.len); // Zig changed it so @floatFromInt doesnt accept output type anymore so i have todo this
            
            std.debug.print("Current: {d}; Avg: {d}\n", .{mhz, avg/num});
            timer.reset();
            i = 0;
        }
    }
    std.debug.print("Exiting...\n", .{});
}

// Runs a program until it vbufs. Then it prints the pixels and chars to stdout
fn print(filename: []const u8) !void {
    var a8 = try A8.initFile(filename);
    //while (true) {
    //    a8.update();
    //    if (a8.vbuf) {
    //        std.debug.print("\x1b[H", .{});
    //        display.printChars(a8);
    //        a8.vbuf = false;
    //    }
    //}

    std.debug.print("Screen:\n", .{});
    display.printScreen(a8);

    std.debug.print("Chars:\n", .{});
    display.printChars(a8);
}

fn save(filename: []const u8) !void {
    var a8 = try A8.initFile(filename);
    try display.loadCharSetMemTape("char_set_memtape");
    
    var i: u32 = 0;
    while (i < 120) {
        a8.update();
        if (a8.vbuf) {
            i+=1;
            a8.vbuf = false;
            var buf: [100]u8 = undefined;
            _ = try std.fmt.bufPrint(&buf, "./out/frame{d}.png", .{i});
            display.render(a8, &buf);
        }
    }
}

// Unused code for now
// var inst = a8.memory[0][a8.program_counter-1]>>11;
// var data = a8.memory[0][a8.program_counter-1]&A8.UINT11_MASK;
// std.debug.print(
//     "\x1b[H{d}\n{s} {d}     \n",
//     .{a8.program_counter, A8.astrisc[inst], data}
// );
// std.debug.print("\x1b[?47h\x1b 7\x1b[?25l\x1b[2J", .{});
// std.debug.print("\x1b[?47l\x1b 8\x1b[?25h", .{});
