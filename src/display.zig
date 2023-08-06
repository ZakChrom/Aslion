const std = @import("std");
const A8 = @import("a8.zig");
//const stb = @cImport({
//    @cDefine("STB_IMAGE_WRITE_IMPLEMENTATION", {});
//    @cInclude("stb_image_write.h");
//});

var asciiToSdcii: [600]i32 = [600]i32;
var sdciiToAscii: [600]i32 = [600]i32;

pub fn generateAsciiSdciiTables() void {
	for (0..599) |i| {
		asciiToSdcii[i] = -1;
		sdciiToAscii[i] = -1;
	}

	asciiToSdcii['\n'] = 85; // enter -> enter
	asciiToSdcii[' '] = 0; // space -> blank
	//asciiToSdcii[58] = 1; // f1 -> smaller solid square
	//asciiToSdcii[59] = 2; // f2 -> full solid square
	asciiToSdcii['+'] = 3; // + -> +
	asciiToSdcii['-'] = 4; // - -> -
	asciiToSdcii['*'] = 5; // * -> *
	asciiToSdcii['/'] = 6; // / -> /
	//asciiToSdcii[60] = 7; // f3 -> full hollow square
	asciiToSdcii['_'] = 8; // _ -> _
	//asciiToSdcii[80] = 9; // l-arr -> <
	//asciiToSdcii[79] = 10; // r-arr -> >
	//asciiToSdcii[82] = 71; // u-arr -> u-arr
	//asciiToSdcii[81] = 72; // d-arr -> d-arr
	asciiToSdcii['|'] = 11; // | -> vertical line |
	//asciiToSdcii[66] = 12; // f9 -> horizontal line --
	asciiToSdcii[','] = 54; // , -> ,
	asciiToSdcii['/'] = 55; // . -> .

	// Letters
	asciiToSdcii['a'] = 13; // a -> a
	asciiToSdcii['b'] = 14; // b -> b
	asciiToSdcii['c'] = 15; // c -> c
	asciiToSdcii['d'] = 16; // d -> d
	asciiToSdcii['e'] = 17; // e -> e
	asciiToSdcii['f'] = 18; // f -> f
	asciiToSdcii['g'] = 19; // g -> g
	asciiToSdcii['h'] = 20; // h -> h
	asciiToSdcii['i'] = 21; // i -> i
	asciiToSdcii['j'] = 22; // j -> j
	asciiToSdcii['k'] = 23; // k -> k
	asciiToSdcii['l'] = 24; // l -> l
	asciiToSdcii['m'] = 25; // m -> m
	asciiToSdcii['n'] = 26; // n -> n
	asciiToSdcii['o'] = 27; // o -> o
	asciiToSdcii['p'] = 28; // p -> p
	asciiToSdcii['q'] = 29; // q -> q
	asciiToSdcii['r'] = 30; // r -> r
	asciiToSdcii['s'] = 31; // s -> s
	asciiToSdcii['t'] = 32; // t -> t
	asciiToSdcii['u'] = 33; // u -> u
	asciiToSdcii['v'] = 34; // v -> v
	asciiToSdcii['w'] = 35; // w -> w
	asciiToSdcii['x'] = 36; // x -> x
	asciiToSdcii['y'] = 37; // y -> y
	asciiToSdcii['z'] = 38; // z -> z

	// Numbers
	asciiToSdcii['0'] = 39; // 0 -> 0
	asciiToSdcii['1'] = 40; // 1 -> 1
	asciiToSdcii['2'] = 41; // 2 -> 2
	asciiToSdcii['3'] = 42; // 3 -> 3
	asciiToSdcii['4'] = 43; // 4 -> 4
	asciiToSdcii['5'] = 44; // 5 -> 5
	asciiToSdcii['6'] = 45; // 6 -> 6
	asciiToSdcii['7'] = 46; // 7 -> 7
	asciiToSdcii['8'] = 47; // 8 -> 8
	asciiToSdcii['9'] = 48; // 9 -> 9


	//asciiToSdcii[8] = 70; // backspace -> backspace


	sdciiToAscii[13] = 'a'; // a -> a
	sdciiToAscii[14] = 'b'; // b -> b
	sdciiToAscii[15] = 'c'; // c -> c
	sdciiToAscii[16] = 'd'; // d -> d
	sdciiToAscii[17] = 'e'; // e -> e
	sdciiToAscii[18] = 'f'; // f -> f
	sdciiToAscii[19] = 'g'; // g -> g
	sdciiToAscii[20] = 'h'; // h -> h
	sdciiToAscii[21] = 'i'; // i -> i
	sdciiToAscii[22] = 'j'; // j -> j
	sdciiToAscii[23] = 'k'; // k -> k
	sdciiToAscii[24] = 'l'; // l -> l
	sdciiToAscii[25] = 'm'; // m -> m
	sdciiToAscii[26] = 'n'; // n -> n
	sdciiToAscii[27] = 'o'; // o -> o
	sdciiToAscii[28] = 'p'; // p -> p
	sdciiToAscii[29] = 'q'; // q -> q
	sdciiToAscii[30] = 'r'; // r -> r
	sdciiToAscii[31] = 's'; // s -> s
	sdciiToAscii[32] = 't'; // t -> t
	sdciiToAscii[33] = 'u'; // u -> u
	sdciiToAscii[34] = 'v'; // v -> v
	sdciiToAscii[35] = 'w'; // w -> w
	sdciiToAscii[36] = 'x'; // x -> x
	sdciiToAscii[37] = 'y'; // y -> y
	sdciiToAscii[38] = 'z'; // z -> z


	sdciiToAscii[0] = ' '; // space -> space


	sdciiToAscii[85] = '\n'; // newline -> newline

	// Number
	sdciiToAscii[39] = '0'; // 0 -> 0
	sdciiToAscii[40] = '1'; // 1 -> 1
	sdciiToAscii[41] = '2'; // 2 -> 2
	sdciiToAscii[42] = '3'; // 3 -> 3 
	sdciiToAscii[43] = '4'; // 4 -> 4
	sdciiToAscii[44] = '5'; // 5 -> 5
	sdciiToAscii[45] = '6'; // 6 -> 6
	sdciiToAscii[46] = '7'; // 7 -> 7
	sdciiToAscii[47] = '8'; // 8 -> 8
	sdciiToAscii[48] = '9'; // 9 -> 9

	sdciiToAscii[54] = '.'; // . -> .
}

pub fn a8colToRgb(col: u16) [3]u16{return[3]u16{((col>>10)&0b11111)*8,((col>>5)&0b11111)*8,(col&0b11111)*8};}
pub fn a8charToAscii(mem: u16) u8 {
    return switch (mem&255) {
        0 => ' ',
        3 => '+',
        4 => '-',
        5 => 'x',
        6 => '/',
        8 => '_',
        9 => '<',
        10 => '>',
        11 => '|',
        13...38 => 65+@as(u8, @intCast(mem))-13,
        39...48 => 48+@as(u8, @intCast(mem))-39,
        49 => '?',
        50 => '!',
        51 => '#',
        52 => '$',
        53 => '%',
        54 => '.',
        55 => ',',
        56 => ':',
        57 => ';',
        58 => '(',
        59 => ')',
        60 => '[',
        61 => ']',
        62 => '{',
        63 => '}',
        64 => '"',
        65 => '\'',
        66 => '*',
        67 => '^',
        68 => '=',
        else => undefined
    };
}

pub fn printScreen(a8: A8) void {
    var prevmem: u16 = A8.UINT16_MAX;
    for (a8.memory[1][53871..65535], 1..) |mem, i| {
        const col = a8colToRgb(mem);
        if (prevmem != mem) { // TODO: Figure out how do change background color without it breaking
            std.debug.print("\x1b[38;2;{d};{d};{d}m██", .{col[0], col[1], col[2]});
        } else {
            std.debug.print("██", .{});
        }
        prevmem = mem;
        if (i % 108 == 0) {
            std.debug.print("\n", .{});
        }
    }
    std.debug.print("\x1b[0m", .{});
}
pub fn printChars(a8: A8) void {
    for (a8.memory[1][53546..53870], 1..) |mem, i| {
        const char = a8charToAscii(mem);
        std.debug.print("{c} ", .{char});
        if (i % 18 == 0) {
            std.debug.print("\n", .{});
        }
    }
}

pub var font: [0b1111111111111]u1 = undefined;

pub fn loadCharSetMemTape(filename: []const u8) !void {
    var file = try std.fs.cwd().openFile(filename, .{});
    defer file.close();
    var reader = file.reader();
    
    for (0..font.len) |i| {
        font[i] = @intFromBool(try reader.readByte() == '1');
    }
}

// Stolen from sam since my code didnt work for some reason
var char_index: u32 = 0;
var char_y: u32 = 0;
var char_x: u32 = 0;

var pixel_index: u32 = 0;
var img_y: u32 = 0;
var img_x: u32 = 0;

pub fn Draw(a8: A8, pixels: []u32) void {
	while (pixel_index < 108*108) {
		DrawNextPixel(a8, pixels);
	}
    pixel_index = 0;
}

pub fn DrawNextPixel(a8: A8, pixels: []u32) void {
	const char = a8.memory[1][53546+char_index];
	const p = font[((char&0b11111111)*64)+(char_y*8)+char_x];
	var colorValue = (char >> 8) & 0b11111111;
	
    var r: u8 = 0;
    var g: u8 = 0;
    var b: u8 = 0;
	if (p == 1) {
		// If the color is set to 0, then make it white, or vice versa.
		// This is for compatibility with previous program versions, which default the color to 0.
		if (colorValue == 0) {
			colorValue = 0b11111111;
        } else if (colorValue == 0b11111111) {
			colorValue = 0;
        }

		r = @truncate(((colorValue>>5)&0b111) * 36 + 0b11);
		g = @truncate(((colorValue>>2)&0b111) * 36 + 0b11); // 0b00011111
		b = @truncate((colorValue&0b11) * 85);
	} else {
        const col = a8.memory[1][53546+pixel_index + 324];
        r = @truncate(((col>>10)&0b11111) * 8); // Get first 5 bits
        g = @truncate(((col>>5)&0b11111) * 8); // get middle bits
        b = @truncate((col&0b11111) * 8); // Gets last 5 bits
	}

    //pixels[img_y*108+img_x] = (@as(u32, @intCast(r))<<24)|(@as(u32, @intCast(g))<<16)|(@as(u32, @intCast(b))<<8)|0xff;
    pixels[img_y*108+img_x] = 0xFF000000|(@as(u32, @intCast(b))<<16)|(@as(u32, @intCast(g))<<8)|r;


	img_x += 1;
	char_x += 1;
	if (char_x >= 6) {
		char_x = 0;
		char_index += 1;
	}

	// If x-coord is max, reset and increment y-coord
	if (img_x >= 108) {
		img_y += 1;
		char_y += 1;
		char_x = 0;
		img_x = 0;

		if (char_y < 6) char_index -= 18;
	}

	if (char_y >= 6) {
		char_y = 0;
	}


	if (img_y >= 108) {
		img_y = 0;

		char_index = 0;
		char_y = 0;
		char_x = 0;
	}

	pixel_index += 1;
}

pub fn render(a8: A8, filename: [*c]const u8) void {
    var pixels: [108*108]u32 = [_]u32{0}**(108*108);
    //for (a8.memory[1][53871..65535], 0..) |mem, i| {
    //    const col = a8colToRgb(mem);
    //    pixels[i] = 0xFF000000|@intCast(u32, col[0])<<16|(@intCast(u32, col[1])<<8)|col[2];
    //}

    //for (a8.memory[1][53546..53870], 0..) |mem, i| {
    //    for (0..6) |y| {
    //        for (0..6) |x| {
    //            const pix = font[((mem&0b1111111)<<6)|((y&0b111)<<3)|(x&0b111)];
    //            if (pix == 1) {
    //                pixels[(i*6)+(y*108+x)] = 0xFFFFFFFF;
    //            }
    //        }
    //    }
    //}
    Draw(a8, &pixels);

	_ = filename;
	unreachable;

    //_ = stb.stbi_write_png(filename, 108, 108, 4, &pixels, @sizeOf(u32)*108);
}
