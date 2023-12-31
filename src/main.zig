// TODO: Implement filesystem :skull:
// TODO: Add channels to sound
// TODO: Make my own renderer instead of copying sam :staring_cat:

// TODO?: Figure out how to store the memory better. Maybe std.ArrayList?
// There isnt a good way making 2d array with that tho

// TODO: Add more tests to a8.zig

const std = @import("std");
const A8 = @import("a8.zig");
const argsParser = @import("args.zig");
//const convertFile = @import("astrisc2x86.zig").convertFile;
const utils = @import("utils.zig");
const ray = @cImport({
    @cInclude("raylib.h");
});

const keys = [_]u16{
    ray.KEY_SPACE,
    ray.KEY_NULL, // TODO: Square
    ray.KEY_NULL, // TODO: Full square
    ray.KEY_KP_ADD,
    ray.KEY_MINUS,
    ray.KEY_KP_MULTIPLY,
    ray.KEY_SLASH,
    ray.KEY_NULL, // TODO: Not filled in square
    '_',
    ray.KEY_LEFT,
    ray.KEY_RIGHT,
    ray.KEY_NULL, // TODO: Pole
    ray.KEY_NULL, // TODO: Sideways pole
    ray.KEY_A,
    ray.KEY_B,
    ray.KEY_C,
    ray.KEY_D,
    ray.KEY_E,
    ray.KEY_F,
    ray.KEY_G,
    ray.KEY_H,
    ray.KEY_I,
    ray.KEY_J,
    ray.KEY_K,
    ray.KEY_L,
    ray.KEY_M,
    ray.KEY_N,
    ray.KEY_O,
    ray.KEY_P,
    ray.KEY_Q,
    ray.KEY_R,
    ray.KEY_S,
    ray.KEY_T,
    ray.KEY_U,
    ray.KEY_V,
    ray.KEY_W,
    ray.KEY_X,
    ray.KEY_Y,
    ray.KEY_Z,
    ray.KEY_ZERO,
    ray.KEY_ONE,
    ray.KEY_TWO,
    ray.KEY_THREE,
    ray.KEY_FOUR,
    ray.KEY_FIVE,
    ray.KEY_SIX,
    ray.KEY_SEVEN,
    ray.KEY_EIGHT,
    ray.KEY_NINE,
    '?',
    '!',
    '#',
    '$',
    '%',
    ray.KEY_PERIOD,
    ray.KEY_COMMA,
    ':',
    ';',
    '(',
    ')',
    ray.KEY_LEFT_BRACKET,
    ray.KEY_RIGHT_BRACKET,
    '{',
    '}',
    '"',
    '\'',
    '*',
    '^',
    ray.KEY_EQUAL,
    ray.KEY_NULL, // TODO: Small square
    ray.KEY_BACKSPACE,
    ray.KEY_UP,
    ray.KEY_DOWN,
    ray.KEY_NULL, // TODO: Not filled circle
    ray.KEY_NULL, // TODO: Circle
    ray.KEY_NULL, // TODO: Diagonal \
    ray.KEY_NULL, // TODO: Diagonal /
    ray.KEY_NULL, // TODO: _ but up
    ray.KEY_NULL, // TODO: Grid or smth
    ray.KEY_NULL, // TODO: Idk
    ray.KEY_NULL, // TODO: Idk
    ray.KEY_NULL, // TODO: Idk
    ray.KEY_NULL, // TODO: Idk
    ray.KEY_NULL, // TODO: Cursor
    ray.KEY_NULL, // Something is missing and causes enter to be offset by -1 here so this is to counter that
    ray.KEY_ENTER,
};

const TIME: bool = A8.TIME;
const allocator = std.heap.page_allocator;

/// Da main function
pub fn main() !u8 {
    const Options = struct {
        @"no-ui": bool = false,
        help: bool = false,
        @"char-set-memtape": []const u8 = "char_set_memtape",
        fps: i32 = 0,
        exit: bool = false,

        pub const shorthands = .{ .n = "no-ui", .h = "help", .c = "char-set-memtape", .f = "fps", .e = "exit" };

        pub const meta = .{ .option_docs = .{ .@"no-ui" = "Dont display the ui", .help = "Show this text", .@"char-set-memtape" = "The location of char_set_memtape", .fps = "Limit the framerate. <= 0 is unlimited", .exit = "When the program VBUF's exit" } };
    };

    const options = argsParser.parseForCurrentProcess(Options, allocator, .print) catch return 1;
    defer options.deinit();

    if (options.options.help or options.positionals.len == 0) {
        try argsParser.printHelp(Options, options.executable_name orelse "aslion", std.io.getStdOut().writer());
    } else {
        std.debug.print("sizeof(A8) = {d} bytes\n", .{@sizeOf(A8)});
        try utils.loadCharSetMemTape(options.options.@"char-set-memtape");
        try run(options.positionals[0], options.options.@"no-ui", options.options.fps, options.options.exit);
    }
    return 0;
}

var freq: f32 = 0;
var audio_freq: f32 = 0;
var sine_idx: f32 = 0;

fn audio_callback(buffer: ?*anyopaque, frames: c_uint) callconv(.C) void {
    audio_freq = freq + (audio_freq - freq) * 0.9;
    var incr = audio_freq / 44100;
    var d: [*c]i16 = @ptrCast(@alignCast(buffer));
    for (0..frames) |i| {
        d[i] = @intFromFloat(32000 * std.math.sin(2 * std.math.pi * sine_idx));
        sine_idx += incr;
        if (sine_idx > 1) sine_idx -= 1;
    }
}

const default_config: A8.Config = .{ .using_keyboard = true, .using_mouse = true, .using_file_system = false, .using_sound = true };

/// The emulator ig
fn run(filename: []const u8, noui: bool, fps: i32, exit: bool) !void {
    var a8 = try A8.initFile(filename, allocator);
    a8.config = default_config;
    a8.memory[1][53500] = 168;

    var pixels: [108 * 108]u32 = [_]u32{0} ** (108 * 108);
    var width: i32 = 108 * 4;
    if (!noui) {
        width *= 2;
    }
    const height = 108 * 4;

    // Array for average a8 speed
    var speedarray = std.ArrayList(u64).init(allocator);
    defer speedarray.deinit();

    ray.InitWindow(width, height, "Aslion");
    ray.InitAudioDevice();
    ray.SetAudioStreamBufferSizeDefault(4096);
    var audio = ray.LoadAudioStream(44100, 16, 1);
    ray.SetAudioStreamCallback(audio, audio_callback);
    ray.PlayAudioStream(audio);

    if (fps > 0) {
        ray.SetTargetFPS(fps);
    }

    var rtexture = ray.LoadRenderTexture(108, 108);

    var pix: u32 = 0;
    var x: u16 = 0;
    var y: u16 = 0;
    var mhz: u64 = 0;
    var avg: f32 = 0;
    // The amount of instructions we managed to execute in a second
    var i: u64 = 0;
    //var file: std.c.FILE = undefined;
    //var returning_file_data: bool = false;
    //var received_path: *const [:0]u8 = "";
    // Timer
    var timer = try std.time.Timer.start();

    while (!ray.WindowShouldClose()) {
        if (ray.IsFileDropped()) {
            var dropped = ray.LoadDroppedFiles();

            const something: [*:0]const u8 = @ptrCast(dropped.paths[0]);
            a8 = try A8.initFile(std.mem.span(something), allocator);
            a8.config = default_config;

            ray.UnloadDroppedFiles(dropped);
        }

        while (!a8.vbuf) : (i += 1) a8.update();

        if (exit) break;
        a8.vbuf = false;

        var time = timer.read();
        if (time >= std.time.ns_per_s) {
            mhz = (i / (time / std.time.ns_per_s) / 1024) / 1024; // When it takes longer than a second to vbuf the mhz will be wrong so we have to divide by time/ns_per_s
            try speedarray.append(mhz);
            var num: f32 = @floatFromInt(speedarray.items.len);

            avg = 0;
            for (speedarray.items) |item| {
                avg += @floatFromInt(item);
            }
            avg /= num;

            //std.debug.print("{d} {d}\n", .{ time, i });

            timer.reset();
            i = 0;
        }

        utils.Draw(a8, &pixels);
        ray.UpdateTexture(rtexture.texture, &pixels);

        if (a8.config.using_mouse) {
            var ax: i32 = @intCast(ray.GetMouseX());
            var ay: i32 = @intCast(ray.GetMouseY());
            if (noui) {
                if (ax > 0 and ax < 108 * 4 and ay > 0 and ax < 108 * 4) {
                    x = @intCast(@divTrunc(ax, 4));
                    y = @intCast(@divTrunc(ay, 4));
                    if (x < 108 and y < 108) pix = pixels[y * 108 + x];
                }
            } else {
                if (ax > 108 * 4 and ax < 108 * 8 and ay > 0 and ay < 108 * 8) {
                    x = @intCast(@divTrunc(ax, 4) - 108);
                    y = @intCast(@divTrunc(ay, 4));
                    if (x < 108 and y < 108) pix = pixels[y * 108 + x];
                }
            }

            a8.memory[1][53501] = ((x << 7) | y) | (a8.memory[1][53501] & 0b1100000000000000);

            if (ray.IsMouseButtonDown(ray.MOUSE_BUTTON_LEFT)) {
                a8.memory[1][53501] = 16384 | a8.memory[1][53501];
            } else if (ray.IsMouseButtonDown(ray.MOUSE_BUTTON_RIGHT)) {
                a8.memory[1][53501] = 32768 | a8.memory[1][53501];
            } else if (ray.IsMouseButtonReleased(ray.MOUSE_BUTTON_LEFT)) {
                a8.memory[1][53501] = 16384 ^ a8.memory[1][53501];
            } else if (ray.IsMouseButtonReleased(ray.MOUSE_BUTTON_RIGHT)) {
                a8.memory[1][53501] = 32768 ^ a8.memory[1][53501];
            }
        }

        var key: c_int = 0;
        if (a8.config.using_keyboard) {
            a8.memory[1][53500] = 168;
            var index: u16 = 0;
            for (keys) |c| {
                if (c != ray.KEY_NULL) {
                    if (ray.IsKeyDown(c)) {
                        key = c;
                        a8.memory[1][53500] = index | (1 << 15);
                    }
                }
                index += 1;
            }
        }

        if (a8.config.using_sound) {
            freq = @floatFromInt(utils.a8soundToFreq(@intCast((a8.memory[1][53502] >> 3) & 0b11111)));
        }

        // if (a8.config.using_file_system) {
        //     var mem = a8.memory[1][53505];
        //     if (returning_file_data) {
        //         //
        //     } else {
        //         if (mem >= 0b1111000000000000) {
        //             var ch: u8 = mem & 255;
        //             if (ch == 85 and file == undefined) {
        //                 file = std.c.fopen(received_path, "a");
        //                 received_path = "";
        //             } else if (ch == 78 and file != undefined) {
        //                 std.c.fclose(file);
        //                 file = undefined;
        //             } else {
        //                 var ascii = display.a8charToAscii(ch);
        //                 if (file.is_open()) {
        //                     std.c.fwrite(ascii, 1, 1, file);
        //                 } else {
        //                     var result: [received_path.len + 1]u8 = undefined;
        //                     std.mem.copy(u8, result[0..], received_path);
        //                     std.mem.copy(u8, result[received_path.len..], ascii);
        //                     //received_path += ascii;
        //                 }
        //             }
        //         }
        //         a8.memory[1][53505] = 0;
        //     }
        // }
        ray.BeginDrawing();
        if (!noui) {
            ray.ClearBackground(ray.RAYWHITE);
            ray.DrawFPS(0, 0);
            var text = try std.fmt.allocPrint(allocator, "PCR: {d}\nA B C: {d} {d} {d}\nX Y PIX: {d} {d} {d}\nSPEED: {d} / {d}\nMEM KEY: {d} / {c}", .{ a8.program_counter, a8.a, a8.b, a8.c, x, y, pix, mhz, avg, a8.memory[1][53500], @as(u8, @intCast(key)) });
            ray.DrawText(text.ptr, 0, 19, 19, ray.PURPLE);
            allocator.free(text);

            if (TIME) {
                for (0..31) |inst| {
                    text = try std.fmt.allocPrint(allocator, "{s}: {d} / {d} / {d}", .{ @tagName(@as(A8.Instruction, @enumFromInt(inst))), a8.times[inst].current, a8.times[inst].max, a8.times[inst].min });
                    ray.DrawText(text.ptr, 0, @as(c_int, (19 * 5) + (@as(u16, @truncate(inst)) * 10)), 10, ray.PURPLE);
                    allocator.free(text);
                }
            }
        }
        var loc = ray.Vector2{ .x = 108 * 4, .y = 0 };
        if (noui) {
            loc.x = 0;
        }
        ray.DrawTextureEx(rtexture.texture, loc, 0, 4, ray.WHITE);
        ray.EndDrawing();
    }

    ray.CloseWindow();
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
