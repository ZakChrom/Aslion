use std::collections::HashMap;

use crate::{raylib::{IsKeyDown, IsKeyReleased, Key}, Emulator};

/// Implementation of sams keyboard thing

#[derive(PartialEq, Clone, Copy, Debug)]
pub struct KeyPress {
    pub key: i32,
    pub down: bool,
    pub uses: usize,
}

impl KeyPress {
    pub fn new(key: i32, down: bool) -> KeyPress {
        KeyPress { key, down, uses: 2 }
    }

    pub fn to_sdcii(&self) -> u16 {
        // You cant cast in a match so i had to make a hashmap
        // This function is only ran whenever you press a button so it shouldnt affect the performance that much
        let mut dict: HashMap<i32, u16> = HashMap::new();
        dict.insert(Key::Space as i32, 0);
        dict.insert(Key::KpAdd as i32, 3);
        dict.insert(Key::Minus as i32, 4);
        dict.insert(Key::KpMultiply as i32, 5);
        dict.insert(Key::Slash as i32, 6);
        dict.insert('_' as i32, 8);
        dict.insert('<' as i32, 9);
        dict.insert('>' as i32, 10);
        dict.insert('|' as i32, 11);
        dict.insert(Key::A as i32, 13);
        dict.insert(Key::B as i32, 14);
        dict.insert(Key::C as i32, 15);
        dict.insert(Key::D as i32, 16);
        dict.insert(Key::E as i32, 17);
        dict.insert(Key::F as i32, 18);
        dict.insert(Key::G as i32, 19);
        dict.insert(Key::H as i32, 20);
        dict.insert(Key::I as i32, 21);
        dict.insert(Key::J as i32, 22);
        dict.insert(Key::K as i32, 23);
        dict.insert(Key::L as i32, 24);
        dict.insert(Key::M as i32, 25);
        dict.insert(Key::N as i32, 26);
        dict.insert(Key::O as i32, 27);
        dict.insert(Key::P as i32, 28);
        dict.insert(Key::Q as i32, 29);
        dict.insert(Key::R as i32, 30);
        dict.insert(Key::S as i32, 31);
        dict.insert(Key::T as i32, 32);
        dict.insert(Key::U as i32, 33);
        dict.insert(Key::V as i32, 34);
        dict.insert(Key::W as i32, 35);
        dict.insert(Key::X as i32, 36);
        dict.insert(Key::Y as i32, 37);
        dict.insert(Key::Z as i32, 38);
        dict.insert('?' as i32, 49);
        dict.insert('!' as i32, 50);
        dict.insert('#' as i32, 51);
        dict.insert('$' as i32, 52);
        dict.insert('%' as i32, 53);
        dict.insert(Key::Period as i32, 54);
        dict.insert(Key::Comma as i32, 55);
        dict.insert(':' as i32, 56);
        dict.insert(Key::Semicolon as i32, 57);
        dict.insert('(' as i32, 58);
        dict.insert(')' as i32, 59);
        dict.insert(Key::LeftBracket as i32, 60);
        dict.insert(Key::RightBracket as i32, 61);
        dict.insert('{' as i32, 62);
        dict.insert('}' as i32, 63);
        dict.insert('"' as i32, 64);
        dict.insert(Key::Apostrophe as i32, 65);
        dict.insert(Key::KpMultiply as i32, 66);
        dict.insert('^' as i32, 67);
        dict.insert(Key::Equal as i32, 6);
        dict.insert(Key::KpEqual as i32, 6);
        dict.insert('0' as i32, 39);
        dict.insert('1' as i32, 40);
        dict.insert('2' as i32, 41);
        dict.insert('3' as i32, 42);
        dict.insert('4' as i32, 43);
        dict.insert('5' as i32, 44);
        dict.insert('6' as i32, 45);
        dict.insert('7' as i32, 46);
        dict.insert('8' as i32, 47);
        dict.insert('9' as i32, 48);
        dict.insert(Key::Kp0 as i32, 39);
        dict.insert(Key::Kp1 as i32, 40);
        dict.insert(Key::Kp2 as i32, 41);
        dict.insert(Key::Kp3 as i32, 42);
        dict.insert(Key::Kp4 as i32, 43);
        dict.insert(Key::Kp5 as i32, 44);
        dict.insert(Key::Kp6 as i32, 45);
        dict.insert(Key::Kp7 as i32, 46);
        dict.insert(Key::Kp8 as i32, 47);
        dict.insert(Key::Kp9 as i32, 48);
        dict.insert(Key::Enter as i32, 85);
        dict.insert(259, 70); // Backspace
        *dict.get(&self.key).expect("Invalid sdcii key")
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