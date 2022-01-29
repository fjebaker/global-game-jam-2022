const w4 = @import("../wasm4.zig");
const buttons = @import("../components/button.zig");
const Situation = @import("../components/situation.zig").Situation;
const std = @import("std");
const textWrap = @import("../components/wrapping-text.zig").textWrap;
const gamepad = @import("../gamepad.zig");
const statemachine = @import("../state-machine.zig");

const sprites = @import("../assets/sprites.zig");
const boris = sprites.boris;
const flag = sprites.flag;

const MENU_HEIGHT: u8 = 50;
const SCREEN_SIZE: u8 = 160;
const X_OFFSET: u8 = 2;

pub const menu_options = [_]Situation{Situation{ .menu = "Party/nLines", .options = [3][]const u8{ "start", "Tutorialial", "Credits" } }};

pub const Menu = struct {
    selection: u8 = 0,
    buttons: [2]buttons.Button = [_]buttons.Button{ buttons.Button{ .text = "Start" }, buttons.Button{ .text = "Tutorial" } },
    art_ticks: u32 = 0,

    pub fn init() Menu {
        return Menu{};
    }

    pub fn draw(self: *@This()) void {
        // set draw colour for the buttons

        w4.DRAW_COLORS.* = 0x42;
        w4.text("Crossing Party\nLines", 20, 10);
        w4.DRAW_COLORS.* = 0x24;

        var i: u8 = 0;
        for (self.buttons) |btn, index| {
            i = @intCast(u8, index);
            btn.draw(
            // button location fixed for now
            X_OFFSET * 4, MENU_HEIGHT + i * 17 + X_OFFSET * 4, i == self.selection);
        }

        var xOff: u32 = 0;
        if (self.art_ticks % 20 > 10) {
            xOff = 16;
        }

        w4.DRAW_COLORS.* = 0x4320;
        w4.blitSub(boris.data, 100, 32, // x, y
            boris.height, boris.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            boris.width, // Assumes stride and width are equal
            boris.flags);

        w4.DRAW_COLORS.* = 0x2430;
        w4.blitSub(flag.data, 120, 32, // x, y
            flag.height, flag.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            flag.width, // Assumes stride and width are equal
            flag.flags);

        self.art_ticks += 1;
    }

    pub fn update(self: *@This(), _: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        self.handleInput(pl);
        self.draw();
    }

    fn handleInput(self: *@This(), pl: *const gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_DOWN)) {
            if (self.selection >= 1) {
                // do nothing
            } else {
                self.selection += 1;
            }
        }
        if (pl.isPressed(w4.BUTTON_UP)) {
            if (self.selection <= 0) {
                // do nothing
            } else {
                self.selection -= 1;
            }
        }
    }
};
