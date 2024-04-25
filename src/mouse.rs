use std::ffi::c_int;

use crate::{raylib::{GetMouseX, GetMouseY, IsMouseButtonDown, IsMouseButtonReleased, MouseButton}, Emulator};

/// Idk a good name for this
pub unsafe fn handle_mouse(em: &Emulator, idk: u16) -> u16 {
    let mut idk = idk;
    let ax = GetMouseX();
    let ay = GetMouseY();
    let offset = if em.ui { 108 * em.xscale } else { 0 };
    if ax >= offset && ax < 108 * em.xscale && ay >= 0 && ay < 108 * em.yscale {
        let x: u16 = (ax / em.xscale) as u16;
        let y: u16 = (ay / em.yscale) as u16;
        idk = ((x << 7) | y) | (idk & 0b1100000000000000);
    }

    if IsMouseButtonDown(MouseButton::MouseButtonLeft as c_int) {
        idk = 16384 | idk;
    } else if IsMouseButtonDown(MouseButton::MouseButtonRight as c_int) {
        idk = 32768 | idk;
    } else if IsMouseButtonReleased(MouseButton::MouseButtonLeft as c_int) {
        idk = 16384 ^ idk;
    } else if IsMouseButtonReleased(MouseButton::MouseButtonRight as c_int) {
        idk = 32768 ^ idk;
    }

    idk
}