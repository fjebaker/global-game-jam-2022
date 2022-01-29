const std = @import("std");
const statemachine = @import("../state-machine.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");

const sprites = @import("../assets/sprites.zig");

const SIDE_PADDING: u8 = 4;
const SCREEN_SIZE: u8 = 160;

pub const Parliament = struct {
    px: u8 = SCREEN_SIZE / 2,
    py: u8 = SCREEN_SIZE / 2,
    buzzing: u32 = 0,
    confidence: u32 = 0,
    rnd: *std.rand.Random,
    ticker: u32 = 0,
    sample_rate: u8 = 1, // how often do we move?
    velocity: u8 = 1,
    inverted: bool = false,

    pub fn init(rnd: *std.rand.Random) Parliament {
        return Parliament{ .rnd = rnd };
    }

    pub fn update(self: *@This(), state: *statemachine.StateMachine, pl: *gamepad.GamePad) void {
        w4.DRAW_COLORS.* = 0x24;
        w4.text("PARLIAMENT", 0, 0);

        if (self.ticker % self.sample_rate == 0) {
            self.handleInput(state, pl);
        }
        self.draw();
    }

    fn draw(self: *@This()) void {
        var xOff: u32 = 0;
        if (self.ticker % 20 > 10) {
            xOff = 16;
        }

        w4.DRAW_COLORS.* = 0x2430;
        w4.blitSub(sprites.boris.data, self.px - (sprites.boris.width / 2), self.py, // x, y
            sprites.boris.height, sprites.boris.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            sprites.boris.width, // Assumes stride and width are equal
            sprites.boris.flags);

        self.ticker += 1;
    }

    fn buttonDown(self: *const @This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            return pl.isHeld(w4.BUTTON_DOWN);
        } else {
            return pl.isHeld(w4.BUTTON_UP);
        }
    }
    fn buttonUp(self: *const @This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            return pl.isHeld(w4.BUTTON_UP);
        } else {
            return pl.isHeld(w4.BUTTON_DOWN);
        }
    }
    fn buttonRight(self: *const @This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            return pl.isHeld(w4.BUTTON_RIGHT);
        } else {
            return pl.isHeld(w4.BUTTON_LEFT);
        }
    }
    fn buttonLeft(self: *const @This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            return pl.isHeld(w4.BUTTON_LEFT);
        } else {
            return pl.isHeld(w4.BUTTON_RIGHT);
        }
    }

    fn handleInput(self: * @This(), _: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        var button_pressed = false;

        // bounds check
        if (self.py <= SCREEN_SIZE - SIDE_PADDING - (sprites.boris.height)) {
            if (self.buttonDown(pl) and !button_pressed) {
                self.py += self.velocity;
                button_pressed = true;
            }
        }
        if (self.py >= SIDE_PADDING) {
            if (self.buttonUp(pl) and !button_pressed) {
                self.py -= self.velocity;
                button_pressed = true;
            }
        }
        if (self.px <= SCREEN_SIZE - SIDE_PADDING) {
            if (self.buttonRight(pl) and !button_pressed) {
                self.px += self.velocity;
                button_pressed = true;
            }
        }
        if (self.px >= SIDE_PADDING + (sprites.boris.width / 2)) {
            if (self.buttonLeft(pl) and !button_pressed) {
                self.px -= self.velocity;
                button_pressed = true;
            }
        }
    }
};
