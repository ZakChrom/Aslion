#![allow(unused)]

use std::{ffi::{c_char, c_int, c_uchar, c_uint, c_void}, fmt::Display, ops::{Add, AddAssign, Div, Mul, Sub, SubAssign}};

#[link(name = "raylib")]
extern "C" {
    pub fn InitWindow(width: c_int, height: c_int, title: *const c_char);
    pub fn CloseWindow();
    pub fn WindowShouldClose() -> bool;
    pub fn BeginDrawing();
    pub fn EndDrawing();
    pub fn ClearBackground(color: Color);
    pub fn BeginMode3D(camera: Camera);
    pub fn EndMode3D();
    pub fn DrawSphere(center_pos: Vector3, radius: f32, color: Color);
    pub fn GetFrameTime() -> f32;
    pub fn SetTargetFPS(fps: c_int);
    pub fn DrawFPS(pos_x: c_int, pos_y: c_int);
    pub fn GetCurrentMonitor() -> c_int;
    pub fn GetMonitorRefreshRate(monitor: c_int) -> c_int;
    pub fn SetConfigFlags(flags: c_uint);
    pub fn DrawCircle(center_x: c_int, center_y: c_int, radius: f32, color: Color);
    pub fn DrawCircleV(center: Vector2, radius: f32, color: Color);
    pub fn GetMouseWheelMove() -> f32;
    pub fn LoadRenderTexture(width: c_int, height: c_int) -> RenderTexture;
    pub fn DrawTextureEx(texture: Texture, position: Vector2, rotation: f32, scale: f32, tint: Color);
    pub fn BeginTextureMode(target: RenderTexture);
    pub fn EndTextureMode();
    pub fn UpdateTexture(texture: Texture, pixels: *const c_void);
}

pub const WHITE: Color = Color { r: 255, g: 255, b: 255, a: 255 };

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Color {
    pub r: c_uchar,
    pub g: c_uchar,
    pub b: c_uchar,
    pub a: c_uchar
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Vector3 {
    pub x: f32,
    pub y: f32,
    pub z: f32
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Camera {
    pub position: Vector3,
    pub target: Vector3,
    pub up: Vector3,
    pub fovy: f32,
    pub projection: CameraProjection,
}

#[repr(C)]
#[derive(Clone, Copy)]
pub enum CameraProjection {
    Perspective,
    Orthographic
}

#[repr(C)]
#[derive(Clone, Copy)]
pub enum ConfigFlags {
    VsyncHint         = 0x00000040,
    FullscreenMode    = 0x00000002,
    WindowResizable   = 0x00000004,
    WindowUndecorated = 0x00000008,
    WindowHidden      = 0x00000080,
    WindowMinimized   = 0x00000200,
    WindowMaximized   = 0x00000400,
    WindowUnfocused   = 0x00000800,
    WindowTopmost     = 0x00001000,
    WindowAlwaysRun   = 0x00000100,
    WindowTransparent = 0x00000010,
    WindowHighdpi     = 0x00002000,
    WindowMousePassthrough = 0x00004000,
    BorderlessWindowedMode = 0x00008000,
    Msaa4xHint        = 0x00000020,
    InterlacedHint    = 0x00010000
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Vector2 {
    pub x: f32,
    pub y: f32
}

impl PartialEq for Vector2 {
    fn eq(&self, other: &Self) -> bool {
        self.x == other.x && self.y == other.y
    }
}

impl Add for Vector2 {
    type Output = Vector2;
    fn add(self, rhs: Self) -> Self::Output {
        Vector2 { x: self.x + rhs.x, y: self.y + rhs.y }
    }
}

impl AddAssign for Vector2 {
    fn add_assign(&mut self, rhs: Self) {
        self.x += rhs.x; self.y += rhs.y;
    }
}

impl Sub for Vector2 {
    type Output = Vector2;
    fn sub(self, rhs: Self) -> Self::Output {
        Vector2 { x: self.x - rhs.x, y: self.y - rhs.y }
    }
}

impl SubAssign for Vector2 {
    fn sub_assign(&mut self, rhs: Self) {
        self.x -= rhs.x; self.y -= rhs.y;
    }
}

impl Mul for Vector2 {
    type Output = Vector2;
    fn mul(self, rhs: Self) -> Self::Output {
        Vector2 { x: self.x * rhs.x, y: self.y * rhs.y }
    }
}

impl Div for Vector2 {
    type Output = Vector2;
    fn div(self, rhs: Self) -> Self::Output {
        Vector2 { x: self.x / rhs.x, y: self.y / rhs.y }
    }
}

impl Display for Vector2 {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{} {}", self.x, self.y)
    }
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Texture {
    pub id: c_uint,
    pub width: c_int,
    pub height: c_int,
    pub mipmaps: c_int,
    pub format: c_int
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct RenderTexture {
    pub id: c_uint,
    pub texture: Texture,
    pub depth: Texture
}