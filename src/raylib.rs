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
    pub fn IsFileDropped() -> bool;
    pub fn LoadDroppedFiles() -> FilePathList;
    pub fn UnloadDroppedFiles(files: FilePathList);
    pub fn SetWindowSize(width: c_int, height: c_int);
    pub fn SetWindowOpacity(opacity: f32);
    pub fn IsKeyPressed(key: c_int) -> bool;
    pub fn DrawText(text: *const c_char, posX: c_int, posY: c_int, fontSize: c_int, color: Color);
    pub fn GetMouseX() -> c_int;
    pub fn GetMouseY() -> c_int;
    pub fn IsMouseButtonDown(button: c_int) -> bool;
    pub fn IsMouseButtonReleased(button: c_int) -> bool;
    pub fn IsKeyDown(key: c_int) -> bool;
    pub fn IsKeyReleased(key: c_int) -> bool;
    pub fn IsKeyUp(key: c_int) -> bool;
    pub fn GetKeyPressed() -> c_int;
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
#[derive(Clone, Copy, Debug)]
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

#[repr(C)]
#[derive(Clone, Copy)]
pub struct FilePathList {
    pub capacity: c_uint,
    pub count: c_uint,
    pub paths: *const *const c_char
}

#[repr(C)]
#[derive(Clone, Copy)]
pub enum MouseButton {
    MouseButtonLeft    = 0,
    MouseButtonRight   = 1,
    MouseButtonMiddle  = 2,
    MouseButtonSide    = 3,
    MouseButtonExtra   = 4,
    MouseButtonForward = 5,
    MouseButtonBack    = 6
}

#[repr(C)]
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Key {
    Null           = 0,

    Apostrophe     = 39,
    Comma          = 44,
    Minus          = 45,
    Period         = 46,
    Slash          = 47,
    Zero           = 48,
    One            = 49,
    Two            = 50,
    Three          = 51,
    Four           = 52,
    Five           = 53,
    Six            = 54,
    Seven          = 55,
    Eight          = 56,
    Nine           = 57,
    Semicolon      = 59,
    Equal          = 61,
    A              = 65,
    B              = 66,
    C              = 67,
    D              = 68,
    E              = 69,
    F              = 70,
    G              = 71,
    H              = 72,
    I              = 73,
    J              = 74,
    K              = 75,
    L              = 76,
    M              = 77,
    N              = 78,
    O              = 79,
    P              = 80,
    Q              = 81,
    R              = 82,
    S              = 83,
    T              = 84,
    U              = 85,
    V              = 86,
    W              = 87,
    X              = 88,
    Y              = 89,
    Z              = 90,
    LeftBracket    = 91,
    Backslash      = 92,
    RightBracket   = 93,
    Grave          = 96,

    Space          = 32,
    Escape         = 256,
    Enter          = 257,
    Tab            = 258,
    Backspace      = 259,
    Insert         = 260,
    Delete         = 261,
    Right          = 262,
    Left           = 263,
    Down           = 264,
    Up             = 265,
    PageUp         = 266,
    PageDown       = 267,
    Home           = 268,
    End            = 269,
    CapsLock       = 280,
    ScrollLock     = 281,
    NumLock        = 282,
    PrintScreen    = 283,
    Pause          = 284,
    F1             = 290,
    F2             = 291,
    F3             = 292,
    F4             = 293,
    F5             = 294,
    F6             = 295,
    F7             = 296,
    F8             = 297,
    F9             = 298,
    F10            = 299,
    F11            = 300,
    F12            = 301,
    LeftShift      = 340,
    LeftControl    = 341,
    LeftAlt        = 342,
    LeftSuper      = 343,
    RightShift     = 344,
    RightControl   = 345,
    RightAlt       = 346,
    RightSuper     = 347,
    KbMenu         = 348,

    Kp0            = 320,
    Kp1            = 321,
    Kp2            = 322,
    Kp3            = 323,
    Kp4            = 324,
    Kp5            = 325,
    Kp6            = 326,
    Kp7            = 327,
    Kp8            = 328,
    Kp9            = 329,
    KpDecimal      = 330,
    KpDivide       = 331,
    KpMultiply     = 332,
    KpSubtract     = 333,
    KpAdd          = 334,
    KpEnter        = 335,
    KpEqual        = 336,

    Back           = 4,
    Menu           = 5,
    VolumeUp       = 24,
    VolumeDown     = 25
}