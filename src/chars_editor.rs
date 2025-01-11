use crate::raylib::{BeginDrawing, ClearBackground, CloseWindow, Color, DrawRectangleLinesEx, DrawRectangleV, EndDrawing, GetScreenHeight, InitWindow, IsKeyPressed, Rectangle, Vector2, WindowShouldClose, BLACK, WHITE};

pub unsafe fn editor() {
    let mut curr_char: usize = 0;
    let mut pos_x: usize = 0;
    let mut pos_y: usize = 0;

    let mut current = crate::render::font().clone();

    InitWindow(600, 600, c"Character editor".as_ptr());
    while !WindowShouldClose() {
        let size = GetScreenHeight() as f32 / 6.0;
        if IsKeyPressed('Z' as i32) {
            curr_char = curr_char.wrapping_sub(1);
        }
        if IsKeyPressed('X' as i32) {
            curr_char = curr_char.wrapping_add(1);
        }
        if IsKeyPressed(262) {
            pos_x = (pos_x + 1) % 6;
        }
        if IsKeyPressed(263) {
            if pos_x == 0 { pos_x = 6; }
            pos_x = (pos_x - 1) % 6;
        }
        if IsKeyPressed(264) {
            pos_y = (pos_y + 1) % 6;
        }
        if IsKeyPressed(265) {
            if pos_y == 0 { pos_y = 6; }
            pos_y = (pos_y - 1) % 6;
        }
        if IsKeyPressed(' ' as i32) {
            current[((curr_char & 0b11111111) * 64) as usize + (pos_y * 8) + pos_x] = !current[((curr_char & 0b11111111) * 64) as usize + (pos_y * 8) + pos_x]
        }
        if IsKeyPressed('S' as i32) {
            let stuff: String = current.iter().map(|e| if *e { '1' } else { '0' }).collect();
            std::fs::write("char_set_memtape", stuff).unwrap();
        }

        BeginDrawing();
            ClearBackground(WHITE);
            for y in 0..6 {
                for x in 0..6 {
                    let a = current[((curr_char & 0b11111111) * 64) as usize + (y * 8) + x];
                    DrawRectangleV(
                        Vector2 {
                            x: x as f32 * size,
                            y: y as f32 * size
                        },
                        Vector2 {
                            x: size,
                            y: size
                        },
                        if a { WHITE } else { BLACK }
                    );
                }
            }
            DrawRectangleLinesEx(
                Rectangle {
                    x: pos_x as f32 * size,
                    y: pos_y as f32 * size,
                    w: size,
                    h: size
                },
                size / 15.0,
                Color { r: 255, g: 0, b: 255, a: 255 }
            );
        EndDrawing();
    }
    CloseWindow();
}