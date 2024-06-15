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
    /// SYSCALL 0 is VBUF
    /// SYSCALL 1 is task add
    /// SYSCALL 2 is task ret
    SYSCALL,
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
            29 => Instruction::SYSCALL,
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
            self.error("Expected u16".to_string());
            panic!();
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

// TODO: I dont like the name
// They arent really tasks more like just functions that can return or smth
pub struct Task {
    pub a: u16,
    pub b: u16,
    pub c: u16,
    pub bank: u16,
    pub pc: u16,
    pub flags: u16
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
    pub task_stack: Vec<Task>
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
                    memory[0][counter] = state.next_u16(&mut chunks).unwrap();
                    counter += 1;
                    continue;
                },
                "SYSCALL" => {
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
            task_stack: vec![]
        })
    }

    pub fn task_add(&mut self) {
        assert!(self.task_stack.len() <= 64, "Task stack limit reached (64). This limit is completly arbitrary so if u dont like it complain to Calion :thubm_up:");
        self.task_stack.push(Task {
            a: self.a,
            b: self.b,
            c: self.c,
            bank: self.bank,
            pc: self.pc,
            flags: self.flags
        });
    }

    pub fn task_ret(&mut self) {
        let task = self.task_stack.pop().unwrap();
        self.a = task.a;
        self.b = task.b;
        self.c = task.c;
        self.bank = task.bank;
        self.pc = task.pc;
        self.flags = task.flags;
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
            Instruction::LDAIN => { self.a = self.memory[self.bank as usize][self.a as usize] },
            Instruction::STAOUT => { self.memory[self.bank as usize][self.a as usize] = self.b },
            Instruction::LDLGE => {
                self.a = self.memory[data as usize][self.memory[0][self.pc as usize] as usize];
                self.pc = self.pc.wrapping_add(1);
            },
            Instruction::STLGE => {
                self.memory[data as usize][self.memory[0][self.pc as usize] as usize] = self.a;
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
            Instruction::SYSCALL => {
                match data {
                    0 => self.vbuf = true,
                    1 => self.task_add(),
                    2 => self.task_ret(),
                    _ => {
                        panic!("Invalid syscall {}", data);
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
}