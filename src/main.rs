#![allow(unused)]

mod a8;
mod raylib;
mod render;

use std::{ffi::{c_uint, c_void, CString}, time::Instant};
use a8::A8;
use raylib::{BeginDrawing, ClearBackground, CloseWindow, Color, ConfigFlags, DrawFPS, DrawTextureEx, EndDrawing, InitWindow, LoadRenderTexture, SetConfigFlags, SetTargetFPS, UpdateTexture, Vector2, WindowShouldClose, WHITE};
use clap::Parser;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// File path to the asm file
    #[arg(short, long)]
    file: String,

    /// Fps the emulator should run at. If its 0 (default) it will run as fast as possible
    #[arg(long, default_value_t = 0)]
    fps: i32,

    #[arg(short, long, default_value_t = false)]
    exit: bool,

    #[arg(short, long, default_value_t = 8)]
    scale: usize
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
