// TODO: Labels
// TODO: Use ? for the errors uhh (only i know what i mean cry about it)
use std::{collections::HashMap, str::Split, sync::OnceLock};

const YELLOW: &str = "\x1b[38;2;252;232;3m";
const RED: &str = "\x1b[38;2;255;0;0m";
const RESET: &str = "\x1b[0m";
const ERROR: &str = "\x1b[38;2;255;0;0mError:\x1b[0m";
const WARNING: &str = "\x1b[38;2;252;232;3mWarning:\x1b[0m";

pub const MAX_BANKS: u16 = 6;

fn astrisc() -> &'static Vec<&'static str> {
    static ASTRISC: OnceLock<Vec<&str>> = OnceLock::new();
    ASTRISC.get_or_init(|| {
        vec!["NOP", "AIN", "BIN", "CIN", "LDIA", "LDIB", "STA", "ADD", "SUB", "MULT", "DIV", "JMP", "JMPZ", "JMPC", "JREG", "LDAIN", "STAOUT", "LDLGE", "STLGE", "LDW", "SWP", "SWPC", "PCR", "BSL", "BSR", "AND", "OR", "NOT", "BNK", "VBUF", "BNKC", "LDWB"]
    })
}

enum Instruction {
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
    /// I dont like the name but idk what to name it
    /// Vbuf isnt really a int but whatever
    /// INT 0 is VBUF for backwards combatability
    /// 
    /// INT 1 is int set
    ///     Reg A: Code used when calling
    ///     Reg B: Location to jump to if called
    ///     Does not change any registers
    /// 
    ///     Code 0 gets called every 1000 instructions (for now) so dont use it for things other than for timing
    /// 
    /// INT 2 is int call
    ///     Reg A: Code
    ///     Does not change any registers
    /// 
    /// INT 3 is pop int stack
    ///     Pops the state of when it was called and puts it to location from reg a (a..a + 6)
    /// 
    /// INT 4 is panic
    ///     It panic
    /// 
    /// INT 5 is int return
    ///     Loads state from location from reg a
    INT,
    BNKC,
    LDWB
}

impl Instruction {
    fn from_u16(u: u16) -> Instruction {
        match u {
            0 => Instruction::NOP,
            1 => Instruction::AIN,
            2 => Instruction::BIN,
            3 => Instruction::CIN,
            4 => Instruction::LDIA,
            5 => Instruction::LDIB,
            6 => Instruction::STA,
            7 => Instruction::ADD,
            8 => Instruction::SUB,
            9 => Instruction::MULT,
            10 => Instruction::DIV,
            11 => Instruction::JMP,
            12 => Instruction::JMPZ,
            13 => Instruction::JMPC,
            14 => Instruction::JREG,
            15 => Instruction::LDAIN,
            16 => Instruction::STAOUT,
            17 => Instruction::LDLGE,
            18 => Instruction::STLGE,
            19 => Instruction::LDW,
            20 => Instruction::SWP,
            21 => Instruction::SWPC,
            22 => Instruction::PCR,
            23 => Instruction::BSL,
            24 => Instruction::BSR,
            25 => Instruction::AND,
            26 => Instruction::OR,
            27 => Instruction::NOT,
            28 => Instruction::BNK,
            29 => Instruction::INT,
            30 => Instruction::BNKC,
            31 => Instruction::LDWB,
            _ => panic!("Invalid number for conversion"),
        }
    }
}

struct ParsingState<'a> {
    /// This also contains labels
    variables: HashMap<String, u16>,
    path: &'a str,
    line: usize
}

impl ParsingState<'_> {
    fn new(path: &str) -> ParsingState {
        ParsingState {
            path,
            variables: HashMap::new(),
            // Line is incremented at the very start of parsing the loop so when its logged it will always be > 0 so it will work correctly
            line: 0
        }
    }

    /// Parse next argument as a variable
    #[allow(unused)]
    fn next_var(&mut self, chunks: &mut Split<'_, &str>) -> Option<u16> {
        let chunk = if let Some(c) = chunks.next() { c } else {
            self.error("Expected var (str)".to_string());
            panic!();
        };
        if let Some(var) = self.variables.get(chunk) {
            Some(*var)
        } else {
            self.error(format!("Could not find variable \"{}\"", chunk));
            panic!();
        }
    }

    fn next_u16(&mut self, chunks: &mut Split<'_, &str>) -> Option<u16> {
        let chunk = if let Some(c) = chunks.next() { c } else {
            return None; // TODO: Idk if this breaks anything but it should be like this
            // self.error("Expected u16".to_string());
            // panic!();
        };
        if let Ok(parsed) = chunk.parse::<u32>() {
            if parsed > 65535 {
                self.warning(format!("Number bigger than 65535, got: {}. Truncating", parsed));
            }
            Some((parsed & 0xffff) as u16)
        } else {
            self.error("Expected argument of type u16".to_string());
            panic!();
        }
    }

    fn next_str(&mut self, chunks: &mut Split<'_, &str>) -> Option<String> {
        if let Some(c) = chunks.next() { Some(c.to_string()) } else {
            self.error("Expected str".to_string());
            panic!();
        }
    }

    fn next_var_or_u16(&mut self, chunks: &mut Split<'_, &str>) -> Option<u16> {
        let chunk = if let Some(c) = chunks.next() { c } else {
            self.error("Expected var (str) or u16".to_string());
            panic!();
        };
        if let Ok(parsed) = chunk.parse::<u32>() {
            if parsed > 65535 {
                self.warning(format!("Number bigger than 65535, got: {}. Truncating", parsed));
            }
            Some((parsed & 0xffff) as u16)
        } else {
            if let Some(var) = self.variables.get(chunk) {
                Some(*var)
            } else {
                self.error(format!("Could not find variable \"{}\"", chunk));
                panic!();
            }
        }
    }

    // Used for getting the argument for a instruction
    // Instructions may not have them so u cant use the next_var_or_u16() bcs it reports a error
    fn next_var_or_u16_dont_expect(&mut self, chunks: &mut Split<'_, &str>) -> Option<u16> {
        let chunk = chunks.next()?;
        if let Ok(parsed) = chunk.parse::<u32>() {
            if parsed > 65535 {
                self.warning(format!("Number bigger than 65535, got: {}. Truncating", parsed));
            }
            Some((parsed & 0xffff) as u16)
        } else {
            if let Some(var) = self.variables.get(chunk) {
                Some(*var)
            } else {
                self.error(format!("Could not find variable \"{}\"", chunk));
                panic!();
            }
        }
    }

    fn error(&self, message: String) {
        eprintln!("./{}:{}:1: {ERROR} {}", self.path, self.line, message);
    }

    fn warning(&self, message: String) {
        eprintln!("./{}:{}:1: {WARNING} {}", self.path, self.line, message);
    }
}

pub struct IntThing {
    pub a: u16,
    pub b: u16,
    pub c: u16,
    pub bank: u16,
    pub pc: u16,
    pub flags: u16,
}

pub enum Mode {
    User,
    Machine(IntThing)
}

impl Mode {
    fn get_machine(&self) -> Option<&IntThing> {
        if let Mode::Machine(i) = self {
            Some(i)
        } else {
            None
        }
    }
}

pub struct A8 {
    pub a: u16,
    pub b: u16,
    pub c: u16,
    pub bank: u16,
    pub pc: u16,
    /// u2
    pub flags: u16,
    pub vbuf: bool,
    pub memory: Box<[[u16; 65536]; MAX_BANKS as usize]>,
    pub int_table: HashMap<u16, u16>,
    pub mode: Mode,
    pub ep_write: Option<Box<dyn FnMut(&mut A8, u16, u16)>>,
    pub ep_read: Option<Box<dyn FnMut(&mut A8, u16)>>,
}

impl A8 {
    pub fn new_from_file(path: &str) -> Result<A8, ()> {
        let mut state = ParsingState::new(path);
        let file = std::fs::read_to_string(path).unwrap();

        let mut memory = Box::new([[0; 65536]; MAX_BANKS as usize]);
        let lines = file.split("\n");

        let mut counter = 0;
        for line in lines {
            state.line += 1;
            assert!(counter <= 65535, "Counter is more than 65535 which would segfault. Uhh make ur file smaller idk");

            if line == "" || line.starts_with(",") { continue }
            let da_line = line.to_uppercase();
            let mut chunks = da_line.split(" ");
            
            // Instructions and the SET & CONST like stuff 
            // We check above if the line is empty so we can unwrap
            let command = chunks.next().unwrap();

            match command {
                "SET" => {
                    let address: u16 = state.next_u16(&mut chunks).unwrap();
                    let data:    u16 = state.next_u16(&mut chunks).unwrap();
                    let bank:    u16 = state.next_u16(&mut chunks).unwrap_or(0);
                    memory[bank as usize][address as usize] = data;
                    continue
                },
                "CONST" => {
                    let var = state.next_str(&mut chunks).unwrap();

                    if var == "" {
                        state.warning("Variable is empty".to_string());
                    }

                    let data: u16 = state.next_u16(&mut chunks).unwrap();

                    state.variables.insert(var, data);
                    continue
                },
                "HERE" => {
                    memory[0][counter] = state.next_var_or_u16(&mut chunks).unwrap();
                    counter += 1;
                    continue;
                },
                "INT" => {
                    let num = state.next_u16(&mut chunks).unwrap();
                    if num > 2047 {
                        state.error(format!("Number too big. Want: 0 to 2047, got: {}", num));
                        return Err(())
                    }
                    memory[0][counter] = 29 << 11 | num;
                    counter += 1;
                    continue;
                }
                _ => {}
            }

            let inst = if let Some(inst) = astrisc().iter().position(|a| *a == command ) { inst } else {
                state.error(format!("Unknown instruction: {}", command));
                return Err(())
            } as u16;

            let arg = state.next_var_or_u16_dont_expect(&mut chunks).unwrap_or(0);
            if arg > 2047 {
                if inst == 29 { // VBUF aka SYSCALL 0
                    // Syscalls should not truncate as that could case weird behavior
                    // Vbuf shouldnt accpet args anyway so maybe i should just disable args on vbuf or smth
                    state.error(format!("Number too big. Want: 0 to 2047, got: {}", arg));
                    return Err(())
                } else {
                    state.warning(format!("Number too big. Want: 0 to 2047, got: {}. Truncating", arg));
                }
            }
            memory[0][counter] = inst << 11 | (arg & 0b11111111111) as u16;

            counter += 1;
        }
        
        Ok(A8 {
            a: 0,
            b: 0,
            c: 0,
            bank: 0,
            pc: 0,
            flags: 0,
            vbuf: false,
            memory,
            int_table: HashMap::new(),
            mode: Mode::User,
            ep_write: None,
            ep_read: None
        })
    }

    #[inline(always)]
    fn write(&mut self, b: u16, i: u16, v: u16) {
        self.memory[b as usize][i as usize] = v;
        if b == 1 && i >= 53500 && i <= 53544 {
            if let Some(mut func) = self.ep_write.take() {
                func(self, i - 53500, v);
                self.ep_write = Some(func); // Rust is dumb
            }
        }
    }

    #[inline(always)]
    fn read(&mut self, b: u16, i: u16) -> u16 {
        if b == 1 && i >= 53500 && i <= 53544 {
            if let Some(mut func) = self.ep_read.take() {
                func(self, i - 53500);
                self.ep_read = Some(func);
            }
        }
        self.memory[b as usize][i as usize]
    }

    pub fn step(&mut self) {
        let instruction = Instruction::from_u16(self.memory[0][self.pc as usize] >> 11);
        let data = self.memory[0][self.pc as usize] & 0b11111111111;
        self.pc = self.pc.wrapping_add(1);
        let mut bus: i32;

        match instruction {
            Instruction::NOP  => {},
            Instruction::AIN  => { self.a = self.memory[self.bank as usize][data as usize] },
            Instruction::BIN  => { self.b = self.memory[self.bank as usize][data as usize] },
            Instruction::CIN  => { self.c = self.memory[self.bank as usize][data as usize] },
            Instruction::LDIA => { self.a = data },
            Instruction::LDIB => { self.b = data },
            Instruction::STA  => { self.memory[self.bank as usize][data as usize] = self.a }
            Instruction::ADD  => {
                let result = self.a.overflowing_add(self.b);
                self.a  = result.0 + result.1 as u16;
                self.flags = (result.1 as u16) << 1 | (self.a == 0) as u16;
            },
            Instruction::SUB => {
                bus = self.a as i32 - self.b as i32;
                self.flags |= 0b10;
                self.flags = (self.flags & 0b10) | (bus == 0) as u16;
                if bus < 0 {
                    bus = 65535 - bus;
                    self.flags &= 0b01;
                }
                self.a = bus as u16;
            },
            Instruction::MULT => {
                bus = self.a as i32 * self.b as i32;
                self.flags &= 0b01;
                self.flags = (self.flags & 0b10) | (bus == 0) as u16;
                while bus > 65535 {
                    bus -= 65535;
                    self.flags |= 0b10;
                }
                self.a = bus as u16;
            },
            Instruction::DIV => {
                if self.b != 0 {
                    self.a = self.a / self.b;
                    self.flags = (self.flags & 0b10) | (self.a == 0) as u16;
                } else {
                    self.a = 0;
                    self.flags |= 1;
                }
            },
            Instruction::JMP => { self.pc = self.memory[data as usize][self.pc as usize] },
            Instruction::JMPZ => {
                if self.flags & 1 == 1 {
                    self.pc = self.memory[data as usize][self.pc as usize];
                } else {
                    self.pc = self.pc.wrapping_add(1);
                }
            },
            Instruction::JMPC => {
                if self.flags >> 1 == 1 {
                    self.pc = self.memory[data as usize][self.pc as usize];
                } else {
                    self.pc = self.pc.wrapping_add(1);
                }
            },
            Instruction::JREG => { self.pc = self.a },
            Instruction::LDAIN => { self.a = self.read(self.bank, self.a) },
            Instruction::STAOUT => { self.write(self.bank, self.a, self.b) },
            Instruction::LDLGE => {
                self.a = self.read(data, self.memory[0][self.pc as usize]);
                self.pc = self.pc.wrapping_add(1);
            },
            Instruction::STLGE => {
                self.write(data, self.memory[0][self.pc as usize], self.a);
                self.pc = self.pc.wrapping_add(1);
            },
            Instruction::LDW => {
                self.a = self.memory[data as usize][self.pc as usize];
                self.pc = self.pc.wrapping_add(1);
            },
            Instruction::SWP => {
                self.c = self.a;
                self.a = self.b;
                self.b = self.c;
            },
            Instruction::SWPC => {
                self.b = self.c;
                self.c = self.a;
                self.a = self.b;
            },
            Instruction::PCR => {
                self.a = self.pc - 1;
            },
            Instruction::BSL => {
                bus = (self.a << self.b) as i32;
                self.flags &= 0b01;
                self.flags = (self.flags & 0b10) | (bus == 0) as u16;
                while bus > 65535 {
                    bus -= 65535;
                    self.flags |= 0b10;
                }
                self.a = bus as u16;
            },
            Instruction::BSR => {
                self.a = self.a >> self.b;
                self.flags &= 0b01;
                self.flags = (self.flags & 0b10) | (self.a == 0) as u16;
            }
            Instruction::AND => {
                self.a = self.a & self.b;
                self.flags &= 0b01;
                self.flags = (self.flags & 0b10) | (self.a == 0) as u16;
            },
            Instruction::OR => {
                self.a = self.a | self.b;
                self.flags &= 0b01;
                self.flags = (self.flags & 0b10) | (self.a == 0) as u16;
            },
            Instruction::NOT => {
                self.a = !self.a;
                self.flags &= 0b01;
                self.flags = (self.flags & 0b10) | (self.a == 0) as u16;
            },
            Instruction::BNK => {
                if data == 5  {
                    println!("{} {} {}", self.a, self.b, self.c);
                }
                self.bank = data;
            },
            Instruction::INT => {
                match data {
                    0 => self.vbuf = true,
                    1 => {
                        self.int_table.insert(self.a, self.b);
                    },
                    2 => {
                        assert!(std::mem::discriminant(&self.mode) == std::mem::discriminant(&Mode::User), "Interupts in machine mode not allowed");
                        self.mode = Mode::Machine(IntThing {
                            a: self.a,
                            b: self.b,
                            c: self.c,
                            bank: self.bank,
                            pc: self.pc,
                            flags: self.flags
                        });
                        self.pc = *self.int_table.get(&self.a).expect(format!("Interupt {} was not found", self.a).as_str());
                    },
                    3 => {
                        let int_thing = self.mode.get_machine().expect("Not in machine mode");
                        self.memory[self.bank as usize][self.a as usize + 0] = int_thing.a;
                        self.memory[self.bank as usize][self.a as usize + 1] = int_thing.b;
                        self.memory[self.bank as usize][self.a as usize + 2] = int_thing.c;
                        self.memory[self.bank as usize][self.a as usize + 3] = int_thing.bank;
                        self.memory[self.bank as usize][self.a as usize + 4] = int_thing.pc;
                        self.memory[self.bank as usize][self.a as usize + 5] = int_thing.flags;
                    },
                    4 => {
                        panic!("PC: {} A: {} B: {} C: {} F: {} BNK: {} V: {}", self.pc - 1, self.a, self.b, self.c, self.flags, self.bank, self.vbuf)
                    },
                    5 => {
                        let loc = self.a as usize;
                        let bank = self.bank as usize;
                        self.a     = self.memory[bank][loc + 0];
                        self.b     = self.memory[bank][loc + 1];
                        self.c     = self.memory[bank][loc + 2];
                        self.bank  = self.memory[bank][loc + 3];
                        self.pc    = self.memory[bank][loc + 4];
                        self.flags = self.memory[bank][loc + 5];
                        self.mode = Mode::User;
                    }
                    _ => {
                        panic!("Invalid special instruction type {}", data);
                    }
                }
            },
            Instruction::BNKC => { self.bank = self.c % MAX_BANKS },
            Instruction::LDWB => {
                self.b = self.memory[data as usize][self.pc as usize];
                self.pc = self.pc.wrapping_add(1);
            }
        }
    }

    pub fn fire_periodic_interupt(&mut self) {
        if let Some(pc) = self.int_table.get(&0) {
            assert!(std::mem::discriminant(&self.mode) == std::mem::discriminant(&Mode::User), "Interupts in machine mode not allowed");
            self.mode = Mode::Machine(IntThing {
                a: self.a,
                b: self.b,
                c: self.c,
                bank: self.bank,
                pc: self.pc,
                flags: self.flags
            });
            self.pc = *pc;
        }
    }
}
