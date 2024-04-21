#![allow(unused)]

mod a8;
mod raylib;
mod render;

use std::ffi::{c_void, CString};
use a8::A8;
use raylib::{BeginDrawing, ClearBackground, CloseWindow, Color, DrawFPS, DrawTextureEx, EndDrawing, InitWindow, LoadRenderTexture, SetConfigFlags, SetTargetFPS, UpdateTexture, Vector2, WindowShouldClose, WHITE};

const SCALE: usize = 8;

fn main() { unsafe {
    let mut args = std::env::args();
    _ = args.next().unwrap(); // Program

    let mut a8 = A8::new_from_file(&args.next().unwrap()).unwrap();

    let title = CString::new("Aslion").unwrap();
    InitWindow(108 * SCALE as i32, 108 * SCALE as i32, title.as_ptr());
    //SetConfigFlags(ConfigFlags::VsyncHint as c_uint);
    //SetTargetFPS(144);

    let rtexture = LoadRenderTexture(108, 108);
    let mut pixels = vec![0 as u32; 108*108];

    while !WindowShouldClose() {
        //let step = Instant::now();
        while !a8.vbuf {
            a8.step();
        }
        //let step_end = step.elapsed().as_millis();
        a8.vbuf = false;
        
        //let render = Instant::now();
        render::draw(&a8, &mut pixels);
        //println!("{}ms {}ms", step_end, render.elapsed().as_millis());

        UpdateTexture(rtexture.texture, pixels.as_ptr() as *const c_void);

        BeginDrawing();
            ClearBackground(Color { r: 0x18, g: 0x18, b: 0x18, a: 255 });
            DrawTextureEx(rtexture.texture, Vector2 { x: 0.0, y: 0.0 }, 0.0, SCALE as f32, WHITE);
            DrawFPS(0, 0);
        EndDrawing();
    }
    CloseWindow();
}}
