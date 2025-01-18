#![allow(unused)]

use std::{ffi::{c_char, c_double, c_float, c_int, c_short, c_uchar, c_uint, c_void}, fmt::Display, ops::{Add, AddAssign, Div, Mul, Sub, SubAssign}};

#[link(name = "raylib")]
extern "C" {
    pub fn InitWindow(width: c_int, height: c_int, title: *const c_char);
    pub fn CloseWindow();
    pub fn WindowShouldClose() -> bool;
    pub fn BeginDrawing();
    pub fn EndDrawing();
    pub fn ClearBackground(color: Color);
    pub fn GetFrameTime() -> f32;
    pub fn SetTargetFPS(fps: c_int);
    pub fn DrawFPS(pos_x: c_int, pos_y: c_int);
    pub fn GetCurrentMonitor() -> c_int;
    pub fn GetMonitorRefreshRate(monitor: c_int) -> c_int;
    pub fn SetConfigFlags(flags: c_uint);
    pub fn DrawTextureEx(texture: Texture, position: Vector2, rotation: f32, scale: f32, tint: Color);
    pub fn UpdateTexture(texture: Texture, pixels: *const c_void);
    pub fn IsFileDropped() -> bool;
    pub fn LoadDroppedFiles() -> FilePathList;
    pub fn UnloadDroppedFiles(files: FilePathList);
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
    pub fn SetTraceLogLevel(logLevel: i32);
    pub fn SetShaderValue(shader: Shader, locIndex: c_int, value: *const c_void, uniformType: c_int);
    pub fn GetShaderLocation(shader: Shader, uniformName: *const c_char) -> c_int;
    pub fn GetTime() -> c_double;
    pub fn DrawRectangleLinesEx(rec: Rectangle, lineThick: f32, color: Color); 
    pub fn LoadShaderFromMemory(vsCode: *const c_char, fsCode: *const c_char) -> Shader;
    pub fn BeginShaderMode(shader: Shader);
    pub fn EndShaderMode();
    pub fn UnloadShader(shader: Shader);
    pub fn UnloadTexture(texture: Texture);
    pub fn SetShaderValueTexture(shader: Shader, locIndex: c_int, texture: Texture);
    pub fn LoadTextureFromImage(image: Image) -> Texture;
    pub fn IsShaderReady(shader: Shader) -> bool;
    pub fn GetScreenHeight() -> c_int;
    pub fn DrawRectangleV(position: Vector2, size: Vector2, color: Color);
}

pub const WHITE: Color = Color { r: 255, g: 255, b: 255, a: 255 };
pub const BLACK: Color = Color { r: 0, g: 0, b: 0, a: 255 };
pub const VEC3ZERO: Vector3 = Vector3 { x: 0.0, y: 0.0, z: 0.0 };

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
    VsyncHint              = 0x00000040,
    FullscreenMode         = 0x00000002,
    WindowResizable        = 0x00000004,
    WindowUndecorated      = 0x00000008,
    WindowHidden           = 0x00000080,
    WindowMinimized        = 0x00000200,
    WindowMaximized        = 0x00000400,
    WindowUnfocused        = 0x00000800,
    WindowTopmost          = 0x00001000,
    WindowAlwaysRun        = 0x00000100,
    WindowTransparent      = 0x00000010,
    WindowHighdpi          = 0x00002000,
    WindowMousePassthrough = 0x00004000,
    BorderlessWindowedMode = 0x00008000,
    Msaa4xHint             = 0x00000020,
    InterlacedHint         = 0x00010000
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

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Mesh {
    pub vertex_count: c_int,
    pub triangle_count: c_int,

    pub vertices: *mut Vector3,
    pub texcoords: *mut f32,
    pub texcoords2: *mut f32,
    pub normals: *mut Vector3,
    pub tangents: *mut f32,
    pub colors: *mut c_uchar,
    pub indices: *mut c_short,

    pub anim_vertices: *mut f32,
    pub anim_normals: *mut f32,
    pub bone_ids: *mut c_uchar,
    pub bone_weights: *mut f32,

    pub vao_id: c_uint,
    pub vbo_id: *mut c_uint
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Matrix {
    pub m0: f32, pub m4: f32, pub m8:  f32, pub m12: f32,
    pub m1: f32, pub m5: f32, pub m9:  f32, pub m13: f32,
    pub m2: f32, pub m6: f32, pub m10: f32, pub m14: f32,
    pub m3: f32, pub m7: f32, pub m11: f32, pub m15: f32
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct MaterialMap {
    pub texture: Texture,
    pub color: Color,
    pub value: f32
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Material {
    pub shader: Shader,
    pub maps: *mut MaterialMap,
    pub params: [f32; 4]
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Shader {
    pub id: c_uint,
    pub locs: *mut c_int
}

#[repr(C)]
#[derive(Clone, Copy)]
pub enum CameraUpdateMode {
    Custom      = 0,
    Free        = 1,
    Orbital     = 2,
    FirstPerson = 3,
    ThirdPerson = 4
}


#[repr(C)]
#[derive(Clone, Copy)]
pub enum ShaderUniformDataType {
    Float     = 0,
    Vec2      = 1,
    Vec3      = 2,
    Vec4      = 3,
    Int       = 4,
    Ivec2     = 5,
    Ivec3     = 6,
    Ivec4     = 7,
    Sampler2d = 8
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct Rectangle {
    pub x: c_float,
    pub y: c_float,
    pub w: c_float,
    pub h: c_float
}

#[repr(C)]
#[derive(Clone, Copy)]
pub enum PixelFormat {
    UncompressedGrayscale = 1,
    UncompressedGrayAlpha,
    UncompressedR5G6B5,
    UncompressedR8G8B8,
    UncompressedR5G5b5A1,
    UncompressedR4G4B4A4,
    UncompressedR8G8B8A8,
    UncompressedR32,
    UncompressedR32G32B32,
    UncompressedR32G32B32A32,
    UncompressedR16,
    UncompressedR16G16B16,
    UncompressedR16G16B16A16,
    CompressedDxt1Rgb,
    CompressedDxt1Rgba,
    CompressedDxt3Rgba,
    CompressedDxt5Rgba,
    CompressedEtc1Rgb,
    CompressedEtc2Rgb,
    CompressedEtc2EacRgba,
    CompressedPvrtRgb,
    CompressedPvrtRgba,
    CompressedAstc4x4Rgba,
    CompressedAstc8x8Rgba,
}


#[repr(C)]
#[derive(Clone, Copy)]
pub struct Image {
    pub data: *mut c_void,
    pub width: c_int,
    pub height: c_int,
    pub mipmaps: c_int,
    pub format: c_int,
}
