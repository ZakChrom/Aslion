#![allow(unused)]

mod a8;
mod raylib;
mod render;

use std::{ffi::{c_char, c_uint, c_void, CStr, CString}, time::Instant};
use a8::A8;
use raylib::{BeginDrawing, ClearBackground, CloseWindow, Color, ConfigFlags, DrawFPS, DrawTextureEx, EndDrawing, InitWindow, IsFileDropped, LoadDroppedFiles, LoadRenderTexture, SetConfigFlags, SetTargetFPS, UnloadDroppedFiles, UpdateTexture, Vector2, WindowShouldClose, WHITE};
use clap::Parser;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// File path to the asm file
    #[arg(short, long)]
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
    scale: usize
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

fn main() { unsafe {
    let args = Args::parse();
    if args.fps < 0 {
        panic!("why")
    }

    let mut a8 = A8::new_from_file(&args.file).unwrap();

    let title = CString::new("Aslion").unwrap();
    InitWindow(108 * args.scale as i32, 108 * args.scale as i32, title.as_ptr());
    if args.fps != 0 {
        SetTargetFPS(args.fps);
    }

    let rtexture = LoadRenderTexture(108, 108);
    let mut pixels = vec![0 as u32; 108*108];

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
        }
        a8.vbuf = false;
        
        if args.exit { return }
        
        render::draw(&a8, &mut pixels);
        UpdateTexture(rtexture.texture, pixels.as_ptr() as *const c_void);

        BeginDrawing();
            ClearBackground(Color { r: 0x18, g: 0x18, b: 0x18, a: 255 });
            DrawTextureEx(rtexture.texture, Vector2 { x: 0.0, y: 0.0 }, 0.0, args.scale as f32, WHITE);
            DrawFPS(0, 0);
        EndDrawing();
    }
    CloseWindow();
}}
