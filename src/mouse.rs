use std::ffi::c_int;

use crate::{raylib::{GetMouseX, GetMouseY, IsMouseButtonDown, IsMouseButtonReleased, MouseButton}, Emulator};

/// Idk a good name for this
pub unsafe fn handle_mouse(em: &Emulator, idk: u16) -> u16 {
    let mut idk = idk;
    let ax = GetMouseX();
    let ay = GetMouseY();
    if ax >= 0 && ax < 108 * em.scale && ay >= 0 && ay < 108 * em.scale {
        let x: u16 = (ax / em.scale) as u16;
        let y: u16 = (ay / em.scale) as u16;
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