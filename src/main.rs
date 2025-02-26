#![feature(duration_constants)]
#![allow(unused)]

// Extensions:
//     16755 - 26755 of bank 5 (both inclusive) are reserved for Aslion
//     Please dont use them :)
// 
//     AslionInterupts;
//         Docs at Instruction::INT
//     AslionTime:
//         16755 of bank 5 is seconds since boot
//         16756 of bank 5 is ms since boot
//         16757 of bank 5 is ns since boot
//         For performance reasons it gets updated every 1000 instructions for now (same as timer interupt)

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
use raylib::{BeginDrawing, BeginShaderMode, ClearBackground, CloseWindow, Color, ConfigFlags, DrawFPS, DrawText, DrawTextureEx, EndDrawing, EndShaderMode, GetShaderLocation, GetTime, Image, InitWindow, IsFileDropped, IsKeyPressed, IsShaderReady, LoadDroppedFiles, LoadShaderFromMemory, LoadTextureFromImage, PixelFormat, SetConfigFlags, SetShaderValue, SetShaderValueTexture, SetTargetFPS, SetTraceLogLevel, Shader, Texture, UnloadDroppedFiles, UnloadShader, UnloadTexture, UpdateTexture, Vector2, WindowShouldClose, WHITE};
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

    // Amount of crt distortion thing. 0.05 is the best but default is 0 because yes
    #[arg(long, default_value_t = 0.0)]
    crt: f32,
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

#[allow(non_upper_case_globals)]
static mut shader: Shader = Shader { id: 0, locs: std::ptr::null_mut() };
#[allow(non_upper_case_globals)]
static mut font_loc: i32 = 0;
#[allow(non_upper_case_globals)]
static mut time_loc: i32 = 0;
#[allow(non_upper_case_globals)]
static mut crt_loc: i32 = 0;

unsafe fn load_shader() -> bool {
    let shader_code = CString::new(std::fs::read("shader.fs").unwrap_or_else(|_| std::fs::read("src/shader.fs").unwrap())).unwrap();
    let newshader = LoadShaderFromMemory(std::ptr::null(), shader_code.as_ptr());
    if IsShaderReady(newshader) {
        UnloadShader(shader);
        shader = newshader;
        font_loc = GetShaderLocation(shader, c"font".as_ptr());
        time_loc = GetShaderLocation(shader, c"time".as_ptr());
        crt_loc = GetShaderLocation(shader, c"crt_thing".as_ptr());
        println!("Reloaded shaders");
        return true
    } else {
        println!("Shader borked");
        return false
    }
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

    let ptr = &mut a8 as *mut A8 as usize;
    let default_panic_hook = std::panic::take_hook();
    std::panic::set_hook(Box::new(move |info| {
        let state = &mut *(ptr as *mut A8); // Not like the program will function after this anyway so ill just use raw pointer
        eprintln!("Panic: PC: {} A: {} B: {} C: {} F: {} BNK: {} V: {}", state.pc - 1, state.a, state.b, state.c, state.flags, state.bank, state.vbuf);
        default_panic_hook(info);
    }));

    SetConfigFlags(ConfigFlags::Msaa4xHint as u32);
    InitWindow(108 * args.scale as c_int, 108 * args.scale as c_int, c"Aslion".as_ptr());
    if args.fps != 0 {
        SetTargetFPS(args.fps);
    }
    SetTraceLogLevel(args.log_level);
    
    // TODO: Nothing but rgb888 doesnt work. It doesnt update the texture data on the gpu
    let texture = LoadTextureFromImage(Image {
        data: std::ptr::null_mut(),
        width: 108,
        height: 108,
        mipmaps: 1,
        format: PixelFormat::UncompressedR8G8B8A8 as c_int
    });

    let font_stuff = render::font().clone().iter().map(|e| if *e { u32::MAX } else { 0 }).collect::<Vec<u32>>();
    let font_len = font_stuff.len();
    let font_texture = LoadTextureFromImage(Image {
        data: font_stuff.as_ptr() as *mut c_void,
        width: font_stuff.len() as i32,
        height: 1,
        mipmaps: 1,
        format: PixelFormat::UncompressedR8G8B8A8 as c_int
    });
    drop(font_stuff);

    if !load_shader() { panic!("Cant start with invalid shader") };
    
    let mut instructions: u64 = 0;
    let mut total_instructions: u64 = 0;
    let mut time = Instant::now();
    let mut mhz_timer = Instant::now();
    let mut mhz: f64 = 0.0;

    while !WindowShouldClose() {
        if IsFileDropped() {
            let files = LoadDroppedFiles();
            assert!(files.count == 1, "You dropped too many files (or 0 somehow). Idk how i would handle this");
            let paths = unsafe_convert_to_strings(files.paths);
            a8 = A8::new_from_file(paths[0]).unwrap();
            UnloadDroppedFiles(files);
        }

        while !a8.vbuf {
            if total_instructions % 10000 == 9999 {
                if a8.interupt_saved_state.is_none() {
                    a8.fire_periodic_interupt();
                }
            }
            if total_instructions % 100 == 99 {
                let thing = time.elapsed();
                a8.memory[5][16755] = thing.as_secs() as u16;
                a8.memory[5][16756] = thing.as_millis() as u16;
                a8.memory[5][16757] = thing.as_nanos() as u16;
            }
            a8.step();
            instructions += 1;
            total_instructions += 1;
        }

        if args.exit { return }
        a8.vbuf = false;

        let mhz_time = mhz_timer.elapsed();
        
        if mhz_time >= Duration::SECOND {
            mhz = (instructions as f64 / mhz_time.as_secs_f64() / 1024.0) / 1024.0;
            instructions = 0;
            mhz_timer = Instant::now();
        }

        // Tab key
        if IsKeyPressed(258) {
            em.ui = !em.ui;
        }

        a8.memory[1][53501] = handle_mouse(&em, a8.memory[1][53501]);
        a8.memory[1][53500] = handle_keypresses(&mut em);

        let mut pixels = render::put_pixels_and_chars_into_u32(
            &a8.memory[1][53870..53870 + (108*108)],
            &a8.memory[1][53546..53546 + (18*18)]
        );
        UpdateTexture(texture, pixels.as_ptr() as *const c_void);

        // TODO: Better keybind
        if IsKeyPressed(Key::KbMenu as i32) {
            load_shader();
        }

        BeginDrawing();
            ClearBackground(Color { r: 0x18, g: 0x18, b: 0x18, a: 255 });

            BeginShaderMode(shader);
                let time = GetTime() as f32;
                SetShaderValue(shader, time_loc, &time as *const f32 as *const c_void, 0);
                SetShaderValue(shader, crt_loc, &args.crt as *const f32 as *const c_void, 0);
                SetShaderValueTexture(shader, font_loc, font_texture);
                
                DrawTextureEx(
                    texture,
                    Vector2 {
                        x: 0.0,
                        y: 0.0
                    },
                    0.0,
                    em.scale as f32,
                    WHITE
                );
            EndShaderMode();

            if em.ui {
                DrawFPS(0, 0);
                let text = CString::new(format!("{:.4}mhz", mhz)).unwrap();
                DrawText(text.as_ptr(), 0, 22, 20, WHITE);
            }
            
        EndDrawing();
    }
    UnloadShader(shader);
    UnloadTexture(texture);
    UnloadTexture(font_texture);
    CloseWindow();
}}
