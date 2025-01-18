#![allow(unused)]

use std::sync::OnceLock;

use crate::a8::A8;

const WIDTH: usize = 108;
const HEIGHT: usize = 108;
const CHAR_WIDTH: usize = 6;
const CHAR_HEIGHT: usize = 6;

pub fn font() -> &'static Vec<bool> {
    static FONT: OnceLock<Vec<bool>> = OnceLock::new();
    FONT.get_or_init(|| {
        let file = include_str!("../char_set_memtape");
        let mut font = Vec::new();
        let mut i = 0;
        for c in file.chars() {
            if i == 6084 { break; } // Char set memtape contains more data than in the font image
            font.push(c == '1');
            i += 1;
        }
        font
    })
}

// Alpha is 255
fn col_from_parts(r: u8, g: u8, b: u8) -> u32 {
    0xff000000 | ((b as u32) << 16) | ((g as u32) << 8) | r as u32
}

fn get_col_from_char_and_pixel(char: u16, pixel: u16, char_x: usize, char_y: usize) -> u32 {
    let font = font();
    let char_in_the_way = font[((char & 0b11111111) * 64) as usize + (char_y * 8) + char_x];
    let mut color_value = (char >> 8) & 0b11111111;
    if char_in_the_way {
        // Backwards compatability 
        if color_value == 0 {
            color_value = 0b11111111;
        } else if color_value == 0b11111111 {
            color_value = 0;
        }

        return col_from_parts(
            (((color_value >> 5) & 0b111) * 36 + 0b11) as u8,
            (((color_value >> 2) & 0b111) * 36 + 0b11) as u8,
            ((color_value & 0b11) * 85) as u8,
        );
    }
    return col_from_parts(
        (((pixel >> 10) & 0b11111) * 8) as u8,
        (((pixel >> 5) & 0b11111) * 8) as u8,
        ((pixel & 0b11111) * 8) as u8,
    );
}

// Cpu draw. Not used anymore
pub fn draw(a8: &A8, pixels: &mut Vec<u32>) {
    for y in 0..108 {
        for x in 0..108 {
            pixels[y * WIDTH + x] = get_col_from_char_and_pixel(
                a8.memory[1][53546 + (y / 6) * 18 + (x / 6)],
                a8.memory[1][53870 + (y * WIDTH + x)],
                x % 6,
                y % 6
            );
        }
    }
}

pub fn put_pixels_and_chars_into_u32(pixels: &[u16], chars: &[u16]) -> [u32; 108*108] {
    let mut out = [0u32; 108*108];

    for y in 0..108 {
        for x in 0..108 {
            out[y * 108 + x] = ((chars[(y / 6) * 18 + (x / 6)] as u32) << 16) | pixels[y * 108 + x] as u32;
        }
    }

    out
}