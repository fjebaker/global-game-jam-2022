const w4 = @import("wasm4.zig");

pub const GamePad = struct {

    last_gamepad: u8 = 0,

    pub fn isPressed(self: * const @This(), key: u8) bool {
        const gamepad: u8 = w4.GAMEPAD1.*;
        const just_pressed = self.last_gamepad == key;
        return !just_pressed and gamepad & key != 0;
    }

    pub fn isHeld(self: * const @This(), key: u8) bool {
        return gamepad & key != 0;
    }

    pub fn update(self: *@This()) void {
        const gamepad: u8 = w4.GAMEPAD1.*;
        self.last_gamepad = gamepad;
    }
};