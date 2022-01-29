const w4 = @import("../wasm4.zig");
const buttons = @import("button.zig");
const Situation = @import("../components/situation.zig").Situation;
const std = @import("std");

const Xoshiro256 = std.rand.Xoshiro256;

const textWrap = @import("wrapping-text.zig").textWrap;

const PROMPT_HEIGHT: u8 = 100;
const SCREEN_SIZE: u8 = 160;
const X_OFFSET: u8 = 2;

pub const Prompt = struct {
    selection: u8 = 0,
    buttons: [3]buttons.Button = [_]buttons.Button{ buttons.Button{}, buttons.Button{}, buttons.Button{} },
    order: [3]u8 = [_]u8{ 0, 1, 2 },
    situation: *const Situation = undefined,
    disallow: u8 = 0,

    pub fn update(self: *@This()) void {
        // sanity
        if (self.selection == self.disallow) {
            self.selection += 1;
        }
        // draw colour for the outline of the prompt
        w4.DRAW_COLORS.* = 0x42;
        w4.rect(X_OFFSET, PROMPT_HEIGHT, SCREEN_SIZE - 2 * X_OFFSET, PROMPT_HEIGHT);

        textWrap(self.situation.prompt, X_OFFSET, PROMPT_HEIGHT - 5);

        var i: u8 = 0;
        for (self.order) |btn_index, index| {
            i = @intCast(u8, index);

            // set draw colour for the buttons
            if (i == self.disallow) {
                w4.DRAW_COLORS.* = 0x23;
            } else {
                w4.DRAW_COLORS.* = 0x24;
            }

            self.buttons[btn_index].draw(
            // button location fixed for now
            X_OFFSET * 4, PROMPT_HEIGHT + i * 17 + X_OFFSET * 4, i == self.selection);
        }
    }

    pub fn shuffleOrder(self: *@This(), rnd: *std.rand.Random) void {
        rnd.shuffle(u8, &self.order);
    }

    pub fn getSelection(self: *const @This()) u8 {
        return self.order[self.selection];
    }

    pub fn setSituation(self: *@This(), situation: *const Situation) void {
        for (situation.options) |s, i| {
            self.buttons[i] = buttons.Button{ .text = s };
        }
        self.situation = situation;
    }

    pub fn incSelection(self: *@This()) void {
        if (self.selection >= 2) { // maximum buttons magic
            // do nothing
        } else {
            if (self.selection + 1 == self.disallow) {
                if (self.selection + 2 < 3) {
                    self.selection += 2;
                } // else do nothing
            } else {
                self.selection += 1;
            }
        }
    }

    pub fn decSelection(self: *@This()) void {
        if (self.selection <= 0) {
            // do nothing
        } else {
            if (self.selection - 1 == self.disallow) {
                if (self.selection - 2 >= 0 and self.selection - 2 != 255) {
                    self.selection -= 2;
                } // else do nothing
            } else {
                self.selection -= 1;
            }
        }
    }
};

pub fn buttonPrompt() Prompt {
    return Prompt{};
}
