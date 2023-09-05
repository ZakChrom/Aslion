const std = @import("std");
const A8 = @import("a8.zig").A8;

pub fn convertFile(filename: []const u8) !void {
	var file = try std.fs.cwd().openFile(filename, .{});
    defer file.close();
    var buf = try file.readToEndAlloc(std.heap.page_allocator, 1024*1024);
    try convert(buf);
}

const Arg = enum(u2) {
	NO,
	ARG,
	IMMEDIATE
};

const HashMapData = struct {
	replacement: []const u8,
	arg: Arg
};


pub fn convert(astrisc: []u8) !void {
	var s = std.StringHashMap(HashMapData).init(std.heap.page_allocator);
	const put = struct {fn _(h: *std.StringHashMap(HashMapData), k: []const u8, r: []const u8, a: Arg) !void {
		var t = HashMapData {.replacement = r, .arg = a};
		try h.put(k, t);
	}}._;

	try put(&s, "NOP", "nop", .NO);

	try put(&s, "AIN", "mov ax, [%d]", .ARG);
	try put(&s, "BIN", "mov bx, [%d]", .ARG);
	try put(&s, "CIN", "mov cx, [%d]", .ARG);

	try put(&s, "LDIA", "mov ax, %d", .ARG);
	try put(&s, "LDIB", "mov bx, %d", .ARG);
	try put(&s, "STA", "mov [%d], ax", .ARG);
	
	try put(&s, "ADD", "add ax, bx", .NO);
	try put(&s, "SUB", "sub ax, bx", .NO);
	try put(&s, "MULT", "imul ax, bx", .NO);
	try put(&s, "DIV", "div ax, bx", .NO);
	
	try put(&s, "JMP", "jmp %d", .IMMEDIATE);
	try put(&s, "JMPZ", "jz %d", .IMMEDIATE);
	try put(&s, "JMPC", "jc %d", .IMMEDIATE);
	try put(&s, "JREG", "jmp ax", .NO);

	try put(&s, "LDAIN", "mov ax, [ax]", .NO);
	try put(&s, "STAOUT", "mov [ax], bx", .NO);
	try put(&s, "LDLGE", "mov ax, %d", .IMMEDIATE);
	try put(&s, "STLGE", "mov %d, [ax]", .IMMEDIATE);
	try put(&s, "LDW", "mov ax, %d", .IMMEDIATE);

	try put(&s, "SWP", "mov cx, ax\n\tmov ax, bx\n\tmov bx, cx", .NO);
	try put(&s, "SWPC", "mov bx, ax\n\tmov ax, cx\n\tmov cx, bx", .NO);

	//put("PCR", "mov ax, idk", false);

	try put(&s, "BSL", "shl ax, bx", .NO);
	try put(&s, "BSR", "shr ax, bx", .NO);
	try put(&s, "AND", "and ax, bx", .NO);
	try put(&s, "OR", "or ax, bx", .NO);
	try put(&s, "NOT", "not ax", .NO);

	try put(&s, "BNK", "mov dx, %d", .ARG);
	try put(&s, "VBUF", "call vbuf", .NO);
	try put(&s, "BNKC", "mov dx, cx", .NO);
	try put(&s, "LDWB", "mov bx, %d", .IMMEDIATE);

	var it1 = std.mem.split(u8, astrisc, "\n");

	_ = std.c.printf("extern vbuf\nglobal _start\nsection .text\n_start:\n");
	
	while (it1.next()) |line| {
		var it = std.mem.split(u8, line, " ");
		var data: [3]u16 = undefined;
        var data_s: [3][]const u8 = undefined;
        var i: u16 = 0;

        while (it.next()) |e| {
            if (i != 0) {
                var a = std.fmt.parseUnsigned(u32, e, 10) catch 0;
                data[i] = if (a > 65535) 65535 else @intCast(a);
            }
            data_s[i] = e;
            i += 1;
        }

        if (std.mem.eql(u8, data_s[0], "SET")) {
            unreachable;
        }

        if (std.mem.eql(u8, data_s[0], "HERE")) {
			_ = std.c.printf("\tdw %d\n", data[1]);
            continue;
        }

        var value = s.get(data_s[0]);
		if (value) |v| {
			var str = try std.heap.page_allocator.alloc(u8, v.replacement.len+1);
			std.mem.copy(u8, str[0..], v.replacement);
			
			var a: i32 = switch (v.arg) {
				.NO => -2,
				.ARG => @intCast(data[1]),
				.IMMEDIATE => blk: {
					var split = std.mem.split(u8, it1.next().?, " ");
					_ = split.next();
					var a = std.fmt.parseUnsigned(u32, split.next().?, 10) catch 0;
					break :blk if (a > 65535) 65535 else @intCast(a);
				}
			};

			//std.debug.print("        {s} | ", .{data_s[0]});
			_ = std.c.printf("\t");
			_ = std.c.printf(@ptrCast(str.ptr), a);
			_ = std.c.printf("\t; INST");
			_ = std.c.printf("\n");
		} else {
			std.debug.print("INVALID: {s}\n", .{data_s[0]});
		}
    }
}
