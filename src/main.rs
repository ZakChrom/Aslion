#![feature(duration_constants)]
#![allow(unused)]

mod a8;
mod raylib;
mod render;
mod keyboard;
mod mouse;
mod chars_editor;

use std::{collections::HashMap, ffi::{c_char, c_int, c_uint, c_void, CStr, CString}, time::{Duration, Instant}};
use a8::A8;
use keyboard::{handle_keypresses, KeyPress};
use mouse::handle_mouse;
use raylib::{BeginDrawing, ClearBackground, CloseWindow, Color, ConfigFlags, DrawFPS, DrawText, DrawTextureEx, EndDrawing, InitWindow, IsFileDropped, IsKeyPressed, LoadDroppedFiles, LoadRenderTexture, SetConfigFlags, SetTargetFPS, SetTraceLogLevel, SetWindowOpacity, SetWindowSize, UnloadDroppedFiles, UpdateTexture, Vector2, WindowShouldClose, WHITE};
use clap::Parser;

use crate::raylib::{GetKeyPressed, GetMouseX, GetMouseY, IsKeyDown, IsKeyReleased, IsKeyUp, IsMouseButtonDown, IsMouseButtonReleased, Key, MouseButton};

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// File path to the asm file
    #[arg(short, long, default_value_t = ("".to_string()))]
    file: String,

    /// Fps the emulator should run at. If its 0 it will run as fast as possible
    #[arg(long, default_value_t = 0)]
    fps: i32,

    // clap doesnt add the default thing at the end of the message here for some reason so i added it mannually
    /// When the program calls the VBUF instruction it will exit [default: false]
    #[arg(short, long, default_value_t = false)]
    exit: bool,

    /// The scale of the screen (the emulator one not program one)
    #[arg(short, long, default_value_t = 8)]
    scale: usize,

    // Raylib log level
    #[arg(short, long, default_value_t = 4)]
    log_level: i32,

    #[arg(short, long, default_value_t = false)]
    chars_editor: bool,
}

// ChatGPT go brrr
unsafe fn unsafe_convert_to_strings(arr_ptr: *const *const c_char) -> Vec<&'static str> {
    let mut result = Vec::new();

    // Safety: Ensure that the provided pointer is not null
    if !arr_ptr.is_null() {
        let mut idx = 0;
        loop {
            let item_ptr = *arr_ptr.offset(idx);
            if item_ptr.is_null() {
                break;
            }
            let c_str = CStr::from_ptr(item_ptr);
            let str_slice = c_str.to_str().expect("Failed to convert to string");
            result.push(str_slice);
            idx += 1;
        }
    }
    result
}

struct Emulator {
    ui: bool,
    scale: i32,
    keys: Vec<KeyPress>,
    pressed_keys: Vec<bool>,
}

fn main() { unsafe {
    let args = Args::parse();
    if args.fps < 0 || args.log_level < 0 {
        panic!("why")
    }

    if args.chars_editor {
        chars_editor::editor();
        return
    }

    if args.file == "" {
        println!("File is not provided :sad:");
        return
    }

    let mut a8 = A8::new_from_file(&args.file).unwrap();
    let mut em = Emulator {
        ui: false,
        scale: args.scale as i32,
        keys: Vec::new(),
        pressed_keys: vec![false; 512]
    };

    InitWindow(108 * args.scale as c_int, 108 * args.scale as c_int, c"Aslion".as_ptr());
    if args.fps != 0 {
        SetTargetFPS(args.fps);
    }
    SetTraceLogLevel(args.log_level);

    let rtexture = LoadRenderTexture(108, 108);
    let mut pixels = vec![0 as u32; 108*108];
    
    let mut instructions = 0;
    let mut timer = Instant::now();
    let mut mhz: u128 = 0;

    while !WindowShouldClose() {
        if IsFileDropped() {
            let files = LoadDroppedFiles();
            assert!(files.count == 1, "You dropped too many files (or 0 somehow). Idk how i would handle this");
            let paths = unsafe_convert_to_strings(files.paths);
            a8 = A8::new_from_file(paths[0]).unwrap();
            UnloadDroppedFiles(files);
        }

        while !a8.vbuf {
            a8.step();
            instructions += 1;
        }

        if args.exit { return }
        a8.vbuf = false;

        let time = timer.elapsed();
        if time >= Duration::SECOND {
            // 1000000000 is ns per second
            mhz = (instructions / (time.as_nanos() / 1000000000) / 1024) / 1024;
            instructions = 0;
            timer = Instant::now();
        }

        // Tab key
        if IsKeyPressed(258) {
            em.ui = !em.ui;
        }
        
        render::draw(&a8, &mut pixels);
        UpdateTexture(rtexture.texture, pixels.as_ptr() as *const c_void);

        a8.memory[1][53501] = handle_mouse(&em, a8.memory[1][53501]);
        a8.memory[1][53500] = handle_keypresses(&mut em);


        BeginDrawing();
            ClearBackground(Color { r: 0x18, g: 0x18, b: 0x18, a: 255 });
            DrawTextureEx(
                rtexture.texture,
                Vector2 {
                    x: 0.0,
                    y: 0.0
                },
                0.0,
                em.scale as f32,
                WHITE
            );
            if em.ui {
                DrawFPS(0, 0);
                let text = CString::new(format!("{}mhz", mhz)).unwrap();
                DrawText(text.as_ptr(), 0, 22, 20, WHITE);
            }
        EndDrawing();
    }
    CloseWindow();
}}
