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
const Self = @This();

pub const NUMBER_OF_BANKS = 2;
pub const UINT16_MAX      = std.math.maxInt(u16);
pub const UINT11_MASK     = std.math.maxInt(u11);

/// Every instruction in string form
pub const astrisc = [_][]const u8{"NOP", "AIN", "BIN", "CIN", "LDIA", "LDIB", "STA", "ADD", "SUB", "MULT", "DIV", "JMP", "JMPZ", "JMPC", "JREG", "LDAIN", "STAOUT", "LDLGE", "STLGE", "LDW", "SWP", "SWPC", "PCR", "BSL", "BSR", "AND", "OR", "NOT", "BNK", "VBUF", "BNKC", "LDWB"};

/// An enum with every instruction
pub const Instruction = enum(u5) {
    NOP,
    AIN,
    BIN,
    CIN,
    LDIA,
    LDIB,
    STA,
    ADD,
    SUB,
    MULT,
    DIV,
    JMP,
    JMPZ,
    JMPC,
    JREG,
    LDAIN,
    STAOUT,
    LDLGE,
    STLGE,
    LDW,
    SWP,
    SWPC,
    PCR,
    BSL,
    BSR,
    AND,
    OR,
    NOT,
    BNK,
    VBUF,
    BNKC,
    LDWB
};

/// Just a struct for config stuff
pub const Config = struct {
    using_keyboard: bool,
    using_mouse: bool,
    performance_mode: bool,
    using_file_system: bool
};

a: u16 = 0,
b: u16 = 0,
c: u16 = 0,
bank: u16 = 0,
program_counter: u16 = 0,
flags: [2]bool = [2]bool{false, false},
vbuf: bool = false,
config: Config = Config {
    .using_keyboard = false,
    .using_mouse = false,
    .performance_mode = false,
    .using_file_system = false
},
memory: [NUMBER_OF_BANKS][UINT16_MAX]u16 = [_][UINT16_MAX]u16{[_]u16{0}**UINT16_MAX}**NUMBER_OF_BANKS,

/// Same as init() but with file
pub fn initFile(filename: []const u8) !Self {
    var file = try std.fs.cwd().openFile(filename, .{});
    defer file.close();
    var buf = try file.readToEndAlloc(std.heap.page_allocator, 1024*1024);
    return init(buf);
}

/// Initializes the A8 struct with asm
pub fn init(assembly: []u8) Self {
    var a8 = Self{};
    var it1 = std.mem.split(u8, assembly, "\n");

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
            a8.memory[0][data[1]] = data[2];
            continue;
        }

        if (std.mem.eql(u8, data_s[0], "HERE")) {
            a8.memory[0][a8.program_counter] = data[1];
            a8.program_counter += 1;
            continue;
        }

        var inst: u5 = for (astrisc, 0..) |inst, in| {
            if (std.mem.eql(u8, data_s[0], inst)) {
                break @intCast(in);
            }
        };

        var dataa: u11 = 0;
        if (!std.mem.eql(u8, line, data_s[0])) {
            dataa = @intCast(data[1]);
        }
        a8.memory[0][a8.program_counter] = (@as(u16, @intCast(inst))<<11)|dataa;
        a8.program_counter += 1;
    }
    a8.program_counter = 0;
    return a8;
}

/// Executes 1 instruction
pub fn update(self: *Self) void {
    const instruction: Instruction = @enumFromInt(self.memory[0][self.program_counter]>>11);
    const data = self.memory[0][self.program_counter]&UINT11_MASK;
    self.program_counter +%= 1;
    var bus: i32 = 0;
    
    switch (instruction) {
        .NOP  => {},
        .AIN  => self.a = self.memory[self.bank][data],
        .BIN  => self.b = self.memory[self.bank][data],
        .CIN  => self.c = self.memory[self.bank][data],
        .LDIA => self.a = data,
        .LDIB => self.b = data,
        .STA  => self.memory[self.bank][data] = self.a,
        .ADD  => {
            bus = @as(i32, self.a) + self.b;
            self.flags[1] = false;
            self.flags[0] = bus == 0;
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .SUB => {
            bus = @as(i32, self.a) - self.b;
            self.flags[1] = true;
            self.flags[0] = bus == 0;
            while (bus < 0) {
                bus = 65535 - bus;
                self.flags[1] = false;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .MULT => {
            bus = @as(i32, self.a) * self.b;
            self.flags[1] = false;
            self.flags[0] = bus == 0;
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .DIV => {
            self.flags[1] = false;
            if (self.b != 0) {
                bus = self.a / self.b;
                self.flags[0] = bus == 0;
            } else {
                self.flags[0] = true;
                bus = 0;
            }
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .JMP => self.program_counter = self.memory[0][self.program_counter],
        .JMPZ => {
            if (self.flags[0] == true){
                self.program_counter = self.memory[0][self.program_counter];
            } else {
                self.program_counter +%= 1;
            }
        },
        .JMPC => {
            if (self.flags[1] == true) {
                self.program_counter = self.memory[0][self.program_counter];
            } else {
                self.program_counter +%= 1;
            }
        },
        .JREG => self.program_counter = self.a,
        .LDAIN => self.a = self.memory[self.bank][self.a],
        .STAOUT => self.memory[self.bank][self.a] = self.b,
        .LDLGE => {
            self.a = self.memory[self.bank][self.memory[0][self.program_counter]];
            self.program_counter +%= 1;
        },
        .STLGE => {
            self.memory[self.bank][self.memory[0][self.program_counter]] = self.a;
            self.program_counter +%= 1;
        },
        .LDW => {
            self.a = self.memory[0][self.program_counter];
            self.program_counter +%= 1;
        },
        .SWP => {
            self.c = self.a;
            self.a = self.b;
            self.b = self.c;
        },
        .SWPC => {
            self.b = self.c;
            self.c = self.a;
            self.a = self.b;
        },
        .PCR => self.a = self.program_counter - 1,
        .BSL => {
            bus = std.math.shl(u16, self.a, self.b);
            self.flags[1] = false;
            self.flags[0] = bus == 0;
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .BSR => {
            bus = std.math.shr(u16, self.a, self.b);
            self.flags[1] = false;
            self.flags[0] = bus == 0;
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .AND => {
            bus = self.a & self.b;
            self.flags[1] = false;
            self.flags[0] = bus == 0;
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .OR => {
            bus = self.a | self.b;
            self.flags[1] = false;
            self.flags[0] = bus == 0;
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .NOT => {
            bus = ~self.a;
            self.flags[1] = false;
            self.flags[0] = bus == 0;
            while (bus > 65535) {
                bus -= 65535;
                self.flags[1] = true;
            }
            self.a = @truncate(@as(u32, @intCast(bus)));
        },
        .BNK => self.bank = data&0b11,
        .VBUF => self.vbuf = true,
        .BNKC => self.bank = self.c&0b11,
        .LDWB => {
            self.b = self.memory[0][self.program_counter];
            self.program_counter +%= 1;
        }
    }
}

//test "init" {
//    var a8 = try Self.init("./pong.asm");
//    var file = try std.fs.cwd().openFile("./pong.asm", .{});
//    defer file.close();
//    var reader = file.reader();
//    var buf: [256]u8 = undefined;
//    var i: u32 = 0;
//    while (try reader.readUntilDelimiterOrEof(&buf, '\n')) |line| {
//        var mem = a8.memory[0][1];
//        var it = std.mem.split(u8, line, " ");
//        var thing = it.next().?;
//        if (std.mem.eql(u8, thing, "SET")) {
//
//        } else if (std.mem.eql(u8, thing, "HERE")) {
//
//        } else {
//            var inst: []u8 = undefined;
//            if (it.next()) |_| {
//                std.debug.print("{s}\n", .{line});
//                inst = try std.fmt.allocPrint(std.heap.page_allocator, "{s} {d}", .{
//                    astrisc[mem>>11],
//                    mem&UINT11_MASK
//                });    
//            } else {
//                inst = try std.fmt.allocPrint(std.heap.page_allocator, "{s}", .{astrisc[mem>>11]});
//            }
//            std.debug.print("{s}\n", .{inst});
//            try std.testing.expect(std.mem.eql(u8, line, inst));
//            i += 1;
//        }
//    }
//}
