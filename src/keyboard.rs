use std::{collections::HashMap, ptr::addr_of_mut};

use crate::{raylib::{IsKeyDown, IsKeyReleased, Key}, Emulator};

/// Implementation of sams keyboard thing

#[derive(PartialEq, Clone, Copy, Debug)]
pub struct KeyPress {
    pub key: i32,
    pub down: bool,
    pub uses: usize,
}

pub static mut RAYLIB_TO_SDCII: Option<HashMap<i32, u16>> = None;
pub static mut SDCII_TO_ASCII: Option<HashMap<u16, char>> = None;

pub fn init_keydict() {
    unsafe { assert!((&mut *addr_of_mut!(RAYLIB_TO_SDCII)).is_none()); }
    unsafe { assert!((&mut *addr_of_mut!(SDCII_TO_ASCII)).is_none());  }
    let mut raylib_to_sdcii = HashMap::new();
    let mut sdcii_to_ascii = HashMap::new();
    raylib_to_sdcii.insert(' ' as i32, 0);             sdcii_to_ascii.insert(0, ' ');
    raylib_to_sdcii.insert(Key::KpAdd as i32, 3);      sdcii_to_ascii.insert(3, '+');
    raylib_to_sdcii.insert('-' as i32, 4);             sdcii_to_ascii.insert(4, '-');
    raylib_to_sdcii.insert('*' as i32, 5);             sdcii_to_ascii.insert(5, '*');
    raylib_to_sdcii.insert(Key::KpMultiply as i32, 5);
    raylib_to_sdcii.insert('/' as i32, 6);             sdcii_to_ascii.insert(6, '/');
    raylib_to_sdcii.insert('_' as i32, 8);             sdcii_to_ascii.insert(8, '_');
    raylib_to_sdcii.insert('<' as i32, 9);             sdcii_to_ascii.insert(9, '<');
    raylib_to_sdcii.insert('>' as i32, 10);            sdcii_to_ascii.insert(10, '>');
    raylib_to_sdcii.insert('|' as i32, 11);            sdcii_to_ascii.insert(11, '|');
    raylib_to_sdcii.insert('A' as i32, 13);            sdcii_to_ascii.insert(13, 'A');
    raylib_to_sdcii.insert('B' as i32, 14);            sdcii_to_ascii.insert(14, 'B');
    raylib_to_sdcii.insert('C' as i32, 15);            sdcii_to_ascii.insert(15, 'C');
    raylib_to_sdcii.insert('D' as i32, 16);            sdcii_to_ascii.insert(16, 'D');
    raylib_to_sdcii.insert('E' as i32, 17);            sdcii_to_ascii.insert(17, 'E');
    raylib_to_sdcii.insert('F' as i32, 18);            sdcii_to_ascii.insert(18, 'F');
    raylib_to_sdcii.insert('G' as i32, 19);            sdcii_to_ascii.insert(19, 'G');
    raylib_to_sdcii.insert('H' as i32, 20);            sdcii_to_ascii.insert(20, 'H');
    raylib_to_sdcii.insert('I' as i32, 21);            sdcii_to_ascii.insert(21, 'I');
    raylib_to_sdcii.insert('J' as i32, 22);            sdcii_to_ascii.insert(22, 'J');
    raylib_to_sdcii.insert('K' as i32, 23);            sdcii_to_ascii.insert(23, 'K');
    raylib_to_sdcii.insert('L' as i32, 24);            sdcii_to_ascii.insert(24, 'L');
    raylib_to_sdcii.insert('M' as i32, 25);            sdcii_to_ascii.insert(25, 'M');
    raylib_to_sdcii.insert('N' as i32, 26);            sdcii_to_ascii.insert(26, 'N');
    raylib_to_sdcii.insert('O' as i32, 27);            sdcii_to_ascii.insert(27, 'O');
    raylib_to_sdcii.insert('P' as i32, 28);            sdcii_to_ascii.insert(28, 'P');
    raylib_to_sdcii.insert('Q' as i32, 29);            sdcii_to_ascii.insert(29, 'Q');
    raylib_to_sdcii.insert('R' as i32, 30);            sdcii_to_ascii.insert(30, 'R');
    raylib_to_sdcii.insert('S' as i32, 31);            sdcii_to_ascii.insert(31, 'S');
    raylib_to_sdcii.insert('T' as i32, 32);            sdcii_to_ascii.insert(32, 'T');
    raylib_to_sdcii.insert('U' as i32, 33);            sdcii_to_ascii.insert(33, 'U');
    raylib_to_sdcii.insert('V' as i32, 34);            sdcii_to_ascii.insert(34, 'V');
    raylib_to_sdcii.insert('W' as i32, 35);            sdcii_to_ascii.insert(35, 'W');
    raylib_to_sdcii.insert('X' as i32, 36);            sdcii_to_ascii.insert(36, 'X');
    raylib_to_sdcii.insert('Y' as i32, 37);            sdcii_to_ascii.insert(37, 'Y');
    raylib_to_sdcii.insert('Z' as i32, 38);            sdcii_to_ascii.insert(38, 'Z');
    raylib_to_sdcii.insert('?' as i32, 49);            sdcii_to_ascii.insert(49, '?');
    raylib_to_sdcii.insert('!' as i32, 50);            sdcii_to_ascii.insert(50, '!');
    raylib_to_sdcii.insert('#' as i32, 51);            sdcii_to_ascii.insert(51, '#');
    raylib_to_sdcii.insert('$' as i32, 52);            sdcii_to_ascii.insert(52, '$');
    raylib_to_sdcii.insert('%' as i32, 53);            sdcii_to_ascii.insert(53, '%');
    raylib_to_sdcii.insert('.' as i32, 54);            sdcii_to_ascii.insert(54, '.');
    raylib_to_sdcii.insert(',' as i32, 55);            sdcii_to_ascii.insert(55, ',');
    raylib_to_sdcii.insert(':' as i32, 56);            sdcii_to_ascii.insert(56, ':');
    raylib_to_sdcii.insert(';' as i32, 57);            sdcii_to_ascii.insert(57, ';');
    raylib_to_sdcii.insert('(' as i32, 58);            sdcii_to_ascii.insert(58, '(');
    raylib_to_sdcii.insert(')' as i32, 59);            sdcii_to_ascii.insert(59, ')');
    raylib_to_sdcii.insert('[' as i32, 60);            sdcii_to_ascii.insert(60, '[');
    raylib_to_sdcii.insert(']' as i32, 61);            sdcii_to_ascii.insert(61, ']');
    raylib_to_sdcii.insert('{' as i32, 62);            sdcii_to_ascii.insert(62, '{');
    raylib_to_sdcii.insert('}' as i32, 63);            sdcii_to_ascii.insert(63, '}');
    raylib_to_sdcii.insert('"' as i32, 64);            sdcii_to_ascii.insert(64, '"');
    raylib_to_sdcii.insert('\'' as i32, 65);           sdcii_to_ascii.insert(65, '\'');
    raylib_to_sdcii.insert('*' as i32, 66);            sdcii_to_ascii.insert(66, '*');
    raylib_to_sdcii.insert(Key::KpMultiply as i32, 66);
    raylib_to_sdcii.insert('^' as i32, 67);            sdcii_to_ascii.insert(67, '^');
    raylib_to_sdcii.insert('=' as i32, 6);             sdcii_to_ascii.insert(6, '=');
    raylib_to_sdcii.insert(Key::KpEqual as i32, 6);
    raylib_to_sdcii.insert('0' as i32, 39);            sdcii_to_ascii.insert(39, '0');
    raylib_to_sdcii.insert('1' as i32, 40);            sdcii_to_ascii.insert(40, '1');
    raylib_to_sdcii.insert('2' as i32, 41);            sdcii_to_ascii.insert(41, '2');
    raylib_to_sdcii.insert('3' as i32, 42);            sdcii_to_ascii.insert(42, '3');
    raylib_to_sdcii.insert('4' as i32, 43);            sdcii_to_ascii.insert(43, '4');
    raylib_to_sdcii.insert('5' as i32, 44);            sdcii_to_ascii.insert(44, '5');
    raylib_to_sdcii.insert('6' as i32, 45);            sdcii_to_ascii.insert(45, '6');
    raylib_to_sdcii.insert('7' as i32, 46);            sdcii_to_ascii.insert(46, '7');
    raylib_to_sdcii.insert('8' as i32, 47);            sdcii_to_ascii.insert(47, '8');
    raylib_to_sdcii.insert('9' as i32, 48);            sdcii_to_ascii.insert(48, '9');
    raylib_to_sdcii.insert(Key::Kp0 as i32, 39);
    raylib_to_sdcii.insert(Key::Kp1 as i32, 40);
    raylib_to_sdcii.insert(Key::Kp2 as i32, 41);
    raylib_to_sdcii.insert(Key::Kp3 as i32, 42);
    raylib_to_sdcii.insert(Key::Kp4 as i32, 43);
    raylib_to_sdcii.insert(Key::Kp5 as i32, 44);
    raylib_to_sdcii.insert(Key::Kp6 as i32, 45);
    raylib_to_sdcii.insert(Key::Kp7 as i32, 46);
    raylib_to_sdcii.insert(Key::Kp8 as i32, 47);
    raylib_to_sdcii.insert(Key::Kp9 as i32, 48);
    raylib_to_sdcii.insert(Key::Enter as i32, 85);     sdcii_to_ascii.insert(85, '\n');
    // Backspace
    raylib_to_sdcii.insert(259, 70); sdcii_to_ascii.insert(70, 0x08 as char);

    // Arros keys in wasd order
    raylib_to_sdcii.insert(265, 71); sdcii_to_ascii.insert(71, '\u{109}');
    raylib_to_sdcii.insert(263, 9); sdcii_to_ascii.insert(9, '\u{107}');
    raylib_to_sdcii.insert(264, 72); sdcii_to_ascii.insert(72, '\u{108}');
    raylib_to_sdcii.insert(262, 10); sdcii_to_ascii.insert(10, '\u{106}');

    unsafe {
        RAYLIB_TO_SDCII = Some(raylib_to_sdcii);
        SDCII_TO_ASCII = Some(sdcii_to_ascii);
    }
}

impl KeyPress {
    pub fn new(key: i32, down: bool) -> KeyPress {
        KeyPress { key, down, uses: 2 }
    }

    #[inline(always)]
    pub fn to_sdcii(&self) -> u16 {
        // You cant cast in a match so i had to make a hashmap
        // This function is only ran whenever you press a button so it shouldnt affect the performance that much
        let dict = unsafe { (&mut *addr_of_mut!(RAYLIB_TO_SDCII)).as_mut().unwrap() };
        *dict.get(&self.key).expect("Unknown sdcii key")
    }
}

/// Idk a good name for this
pub unsafe fn handle_keypresses(em: &mut Emulator) -> u16 {
    for k in [
        Key::Apostrophe as i32,
        Key::Comma as i32,
        Key::Minus as i32,
        Key::Period as i32,
        Key::Slash as i32,
        Key::Zero as i32,
        Key::One as i32,
        Key::Two as i32,
        Key::Three as i32,
        Key::Four as i32,
        Key::Five as i32,
        Key::Six as i32,
        Key::Seven as i32,
        Key::Eight as i32,
        Key::Nine as i32,
        Key::Semicolon as i32,
        Key::Equal as i32,
        Key::A as i32,
        Key::B as i32,
        Key::C as i32,
        Key::D as i32,
        Key::E as i32,
        Key::F as i32,
        Key::G as i32,
        Key::H as i32,
        Key::I as i32,
        Key::J as i32,
        Key::K as i32,
        Key::L as i32,
        Key::M as i32,
        Key::N as i32,
        Key::O as i32,
        Key::P as i32,
        Key::Q as i32,
        Key::R as i32,
        Key::S as i32,
        Key::T as i32,
        Key::U as i32,
        Key::V as i32,
        Key::W as i32,
        Key::X as i32,
        Key::Y as i32,
        Key::Z as i32,
        Key::LeftBracket as i32,
        Key::Backslash as i32,
        Key::RightBracket as i32,
        Key::Space as i32,
        Key::Enter as i32,
        Key::Backspace as i32,
        Key::Right as i32,
        Key::Left as i32,
        Key::Down as i32,
        Key::Up as i32,
        Key::F1 as i32,
        Key::F2 as i32,
        Key::F3 as i32,
        Key::Kp0 as i32,
        Key::Kp1 as i32,
        Key::Kp2 as i32,
        Key::Kp3 as i32,
        Key::Kp4 as i32,
        Key::Kp5 as i32,
        Key::Kp6 as i32,
        Key::Kp7 as i32,
        Key::Kp8 as i32,
        Key::Kp9 as i32,
        Key::KpDecimal as i32,
        Key::KpDivide as i32,
        Key::KpMultiply as i32,
        Key::KpSubtract as i32,
        Key::KpAdd as i32,
        Key::KpEnter as i32,
        Key::KpEqual as i32,
        '_' as i32,
    ] {
        let mut key = KeyPress::new(k, false);
        if IsKeyDown(k as i32) {
            if em.pressed_keys[k as usize] == true {
                continue
            }
            key.down = true;
            if !em.keys.contains(&key) {
                em.keys.push(key);
                em.pressed_keys[k as usize] = true;
            }
        } else if IsKeyReleased(k as i32) {
            if em.pressed_keys[k as usize] == false {
                continue
            }
            if !em.keys.contains(&key) {
                em.keys.push(key);
                em.pressed_keys[k as usize] = false;
            }
        }
    }

    let mut ret = 168;
    if em.keys.len() > 0 {
        ret = em.keys[0].to_sdcii() | ((em.keys[0].down as u16) << 15);
        em.keys[0].uses -= 1;
        if em.keys[0].uses == 0 {
            em.keys.remove(0);
        } else {
            em.keys.push(em.keys[0]);
            em.keys.remove(0);
        }
    }

    ret
}