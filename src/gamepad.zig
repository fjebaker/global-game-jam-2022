const w4 = @import("wasm4.zig");

pub const GamePad = struct {
    last_pressed: u8 = 0,

    pub fn isPressed(self: * @This(), key: u8) bool {
        const gamepad = w4.GAMEPAD1.*;
        // check if already pressed
        const pressed_this_frame = gamepad & (gamepad ^ self.last_pressed);
        // update state
        self.last_pressed = gamepad;

        return pressed_this_frame & key != 0;
    }
};