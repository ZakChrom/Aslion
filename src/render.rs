#![allow(unused)]

use std::sync::OnceLock;

use crate::a8::A8;

const WIDTH: usize = 108;
const HEIGHT: usize = 108;
const CHAR_WIDTH: usize = 6;
const CHAR_HEIGHT: usize = 6;

fn font() -> &'static Vec<bool> {
    static FONT: OnceLock<Vec<bool>> = OnceLock::new();
    FONT.get_or_init(|| {
        let file = include_str!("../char_set_memtape");
        let mut font = vec![false; 65536];
        let mut i: usize = 0;
        for c in file.chars() {
            font[i] = c == '1';
            i += 1;
        }
        font
    })
}


pub fn draw(a8: &A8, pixels: &mut Vec<u32>) {
    let font = font();
    
    let mut char_index: usize = 0;
    let mut char_x: usize = 0;
    let mut char_y: usize = 0;
    let mut x: usize = 0;
    let mut y: usize = 0;
    loop {
        let char = a8.memory[1][53546 + char_index];
        let p = font[((char & 0b11111111) * 64) as usize + (char_y * 8) + char_x];
        let mut color_value = (char >> 8) & 0b11111111;
        let mut r: u8 = 0;
        let mut g: u8 = 0;
        let mut b: u8 = 0;
        if p {
            if color_value == 0 {
                color_value = 0b11111111;
            } else if color_value == 0b11111111 {
                color_value = 0;
            }

            r = (((color_value >> 5) & 0b111) * 36 + 0b11) as u8;
            g = (((color_value >> 2) & 0b111) * 36 + 0b11) as u8;
            b = ((color_value & 0b11) * 85) as u8;
        } else {
            let col = a8.memory[1][53870 + (y * WIDTH + x)];
            r = (((col >> 10) & 0b11111) * 8) as u8;
            g = (((col >> 5) & 0b11111) * 8) as u8;
            b = ((col & 0b11111) * 8) as u8;
        }

        pixels[y * WIDTH + x] = 0xff000000 | ((b as u32) << 16) | ((g as u32) << 8) | r as u32;
        //pixels[y * WIDTH + x] = ((r as u32) << 24) | ((g as u32) << 16) | ((b as u32) << 8) | 0xff;
        
        x += 1;
        char_x += 1;
        if char_x == 6 {
            char_x = 0;
            char_index += 1;
        }

        if x == 108 {
            y += 1;
            char_y += 1;
            char_x = 0;
            x = 0;

            if char_y < 6 { char_index -= 18 }
        }

        if char_y == 6 {
            char_y = 0;
        }

        if y == 108 {
            break
        }

    }
}