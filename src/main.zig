// DONE: Use raygui for GUI
    // TODO: A menu bar at the top
    // DONE: Implement mouse
    // TODO: Implement keyboard
    // TODO: Make my own renderer instead of copying sam :staring_cat:
// TODO: Implement filesystem :skull:

// TODO?: Figure out how to store the memory better. Maybe std.ArrayList?
    // There isnt a good way making 2d array with that tho
// TODO?: Implement easy way of setting/getting expansion ports. Maybe normal memory too idk

const std = @import("std");
const A8 = @import("a8.zig");
const display = @import("display.zig");
const c = @cImport({
    @cInclude("signal.h");
});
const ray = @cImport({
	@cInclude("raylib.h");
});

/// Da main function
pub fn main() !void {
    // Get the args and skip the first one (program name)
    var args = std.process.args();
    _ = args.skip();

    const command = args.next().?;

    std.debug.print("sizeof(A8) = {d} bytes\n", .{@sizeOf(A8)});

	try display.loadCharSetMemTape("char_set_memtape");

    //if (std.mem.eql(u8, command, "print")) {
    //    try print(args.next().?);
    if (std.mem.eql(u8, command, "speed")) {
        try speed(args.next().?);
    //} else if (std.mem.eql(u8, command, "save")) {
    //    try save(args.next().?);
    } else if (std.mem.eql(u8, command, "run")) {
		try run(args.next().?);
    } else {
        std.debug.print(":staring_cat:\n", .{});
    }
}

fn run(filename: []const u8) !void {
	var a8 = try A8.initFile(filename);
	var pixels: [108*108]u32 = [_]u32{0}**(108*108);
	const width = 108*4*2;
	const height = 108*4;


	ray.InitWindow(width, height, "Aslion");
	ray.SetTargetFPS(60);

	for (a8.memory[0][0..5000]) |mem| {
		std.debug.print("{s} {d}\n", .{A8.astrisc[mem>>11], mem&0b11111111111});
	}

	var rtexture = ray.LoadRenderTexture(108, 108);

	var pix: u32 = 0;
	var x: u16 = 0;
	var y: u16 = 0;

	while (!ray.WindowShouldClose()) {
		while (!a8.vbuf) a8.update();
		a8.vbuf = false;

		display.Draw(a8, &pixels);
		ray.UpdateTexture(rtexture.texture, &pixels);

		var ax: u32 = @intCast(ray.GetMouseX());
		var ay: u32 = @intCast(ray.GetMouseY());
		if (ax > 108*4) {
			x = @intCast(@divExact(ax, 4)-108);
			y = @intCast(@divExact(ay, 4));
			pix = pixels[y*108+x];
		}

		a8.memory[1][53501] = ((x<<7)|y)|(a8.memory[1][53501]&0b1100000000000000);

		if (ray.IsMouseButtonDown(ray.MOUSE_BUTTON_LEFT)) {
			std.debug.print("Left down\n", .{});
			a8.memory[1][53501] = 16384 | a8.memory[1][53501];
		} else if (ray.IsMouseButtonDown(ray.MOUSE_BUTTON_RIGHT)) {
			std.debug.print("Right down\n", .{});
			a8.memory[1][53501] = 32768 | a8.memory[1][53501];
		} else if (ray.IsMouseButtonReleased(ray.MOUSE_BUTTON_LEFT)) {
			std.debug.print("Left released\n", .{});
			a8.memory[1][53501] = 16384 ^ a8.memory[1][53501];
		} else if (ray.IsMouseButtonReleased(ray.MOUSE_BUTTON_RIGHT)) {
			std.debug.print("Right released\n", .{});
			a8.memory[1][53501] = 32768 ^ a8.memory[1][53501];
		}
		
		ray.BeginDrawing();
			ray.ClearBackground(ray.GRAY);
			ray.DrawFPS(0, 0);
			var key = ray.GetCharPressed();
			var str = try std.fmt.allocPrint(
				std.heap.page_allocator,
				"PCR: {d}\nA B C: {d} {d} {d}\nX Y PIX: {d} {d} {d}\nKEY: {c} {d}",
				.{
					a8.program_counter,
					a8.a, a8.b, a8.c,
					x, y, pix,
					@as(u8, @truncate(@as(u32, @intCast(key)))), key
				}
			);
			ray.DrawText(str.ptr, 0, 19, 19, ray.PURPLE);
			ray.DrawTextureEx(rtexture.texture, .{.x = 108*4, .y = 0}, 0, 4, ray.WHITE);
		ray.EndDrawing();
	}

	ray.CloseWindow();
}

// If the user does Ctrl c this will hopefully get set to true and the program should exit normally instead of being killed
var shouldClose: bool = false;
/// Meazures how fast the program goes in instructions per sec
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
//fn print(filename: []const u8) !void {
//    var a8 = try A8.initFile(filename);
    //while (true) {
    //    a8.update();
    //    if (a8.vbuf) {
    //        std.debug.print("\x1b[H", .{});
    //        display.printChars(a8);
    //        a8.vbuf = false;
    //    }
    //}

//    std.debug.print("Screen:\n", .{});
//    display.printScreen(a8);

//    std.debug.print("Chars:\n", .{});
//    display.printChars(a8);
//}

//fn save(filename: []const u8) !void {
//    var a8 = try A8.initFile(filename);
    
//    var i: u32 = 0;
//    while (i < 120) {
//        a8.update();
//        if (a8.vbuf) {
//            i+=1;
//            a8.vbuf = false;
//            var buf: [100]u8 = undefined;
//            _ = try std.fmt.bufPrint(&buf, "./out/frame{d}.png", .{i});
//            display.render(a8, &buf);
//        }
//    }
//}

// Unused code for now
// var inst = a8.memory[0][a8.program_counter-1]>>11;
// var data = a8.memory[0][a8.program_counter-1]&A8.UINT11_MASK;
// std.debug.print(
//     "\x1b[H{d}\n{s} {d}     \n",
//     .{a8.program_counter, A8.astrisc[inst], data}
// );
// std.debug.print("\x1b[?47h\x1b 7\x1b[?25l\x1b[2J", .{});
// std.debug.print("\x1b[?47l\x1b 8\x1b[?25h", .{});
