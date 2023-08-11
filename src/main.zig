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
const ray = @cImport({
	@cInclude("raylib.h");
});

/// Da main function
pub fn main() !void {
    // Get the args and skip the first one (program name)
    var args = std.process.args();
    _ = args.skip();
    std.debug.print("sizeof(A8) = {d} bytes\n", .{@sizeOf(A8)});

	try display.loadCharSetMemTape("char_set_memtape");
	try run(args.next().?);
}

/// The emulator ig
fn run(filename: []const u8) !void {
	var a8 = try A8.initFile(filename);
	var pixels: [108*108]u32 = [_]u32{0}**(108*108);
	const width = 108*4*2;
	const height = 108*4;

	// Array for average a8 speed
    var speedarray = std.ArrayList(u64).init(std.heap.page_allocator);
    defer speedarray.deinit();

	ray.InitWindow(width, height, "Aslion");

	var rtexture = ray.LoadRenderTexture(108, 108);

	var pix: u32 = 0;
	var x: u16 = 0;
	var y: u16 = 0;
	var mhz: u64 = 0;
	var avg: f32 = 0;
	// The amount of instructions we managed to execute in a second
	var i: u64 = 0;
	
	// Timer
    var timer = try std.time.Timer.start();

	while (!ray.WindowShouldClose()) {
		if (ray.IsFileDropped()) {
			var dropped = ray.LoadDroppedFiles();

			const something: [*:0]const u8 = @ptrCast(dropped.paths[0]);
			a8 = try A8.initFile(std.mem.span(something));
			
			ray.UnloadDroppedFiles(dropped);
		}
		
		while (!a8.vbuf) : (i += 1) a8.update();
		a8.vbuf = false;

		if (timer.read() >= std.time.ns_per_s) {
            mhz = (i/1024)/1024;
            try speedarray.append(mhz);
			var num: f32 = @floatFromInt(speedarray.items.len);
			
            avg = 0;
            for (speedarray.items) |item| {
                avg += @floatFromInt(item);
            }
			avg /= num;

            timer.reset();
            i = 0;
        }

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
			a8.memory[1][53501] = 16384 | a8.memory[1][53501];
		} else if (ray.IsMouseButtonDown(ray.MOUSE_BUTTON_RIGHT)) {
			a8.memory[1][53501] = 32768 | a8.memory[1][53501];
		} else if (ray.IsMouseButtonReleased(ray.MOUSE_BUTTON_LEFT)) {
			a8.memory[1][53501] = 16384 ^ a8.memory[1][53501];
		} else if (ray.IsMouseButtonReleased(ray.MOUSE_BUTTON_RIGHT)) {
			a8.memory[1][53501] = 32768 ^ a8.memory[1][53501];
		}
		
		ray.BeginDrawing();
			ray.ClearBackground(ray.RAYWHITE);
			ray.DrawFPS(0, 0);
			ray.DrawText((try std.fmt.allocPrint(
				std.heap.page_allocator,
				"PCR: {d}\nA B C: {d} {d} {d}\nX Y PIX: {d} {d} {d}\nSPEED: {d} / {d}",
				.{
					a8.program_counter,
					a8.a, a8.b, a8.c,
					x, y, pix,
					mhz, avg
				}
			)).ptr, 0, 19, 19, ray.PURPLE);
			ray.DrawTextureEx(rtexture.texture, .{.x = 108*4, .y = 0}, 0, 4, ray.WHITE);
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
