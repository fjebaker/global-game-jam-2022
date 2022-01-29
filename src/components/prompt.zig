const w4 = @import("../wasm4.zig");
const buttons = @import("button.zig");
const Situation = @import("../components/situation.zig").Situation;
const std = @import("std");
const textWrap = @import("wrapping-text.zig").textWrap;

const PROMPT_HEIGHT: u8 = 100;
const SCREEN_SIZE: u8 = 160;
const X_OFFSET: u8 = 2;

pub const Prompt = struct {
    selection: u8 = 0,
    buttons: std.ArrayListAligned(buttons.Button, null),
    situation: Situation = .{},

    pub fn update(self: *const @This()) void {
        // draw colour for the outline of the prompt
        w4.DRAW_COLORS.* = 0x42;
        w4.rect(X_OFFSET, PROMPT_HEIGHT, SCREEN_SIZE - 2 * X_OFFSET, PROMPT_HEIGHT);

        textWrap(self.situation.prompt, X_OFFSET, PROMPT_HEIGHT - 5);

        // set draw colour for the buttons
        w4.DRAW_COLORS.* = 0x24;

        var i: u8 = 0;
        for (self.buttons.items) |btn, index| {
            i = @intCast(u8, index);
            btn.draw(
            // button location fixed for now
            X_OFFSET * 4, PROMPT_HEIGHT + i * 17 + X_OFFSET * 4, i == self.selection);
        }
    }

    pub fn setSituation(self: *@This(), situation: Situation) void {
        for (situation.options) |s, i| {
            self.buttons.items[i] = buttons.Button{ .text = s };
        }
        self.situation = situation;
    }

    pub fn incSelection(self: *@This()) void {
        if (self.selection >= self.buttons.capacity - 1) {
            // do nothing
        } else {
            self.selection += 1;
        }
    }

    pub fn decSelection(self: *@This()) void {
        if (self.selection <= 0) {
            // do nothing
        } else {
            self.selection -= 1;
        }
    }
};

pub fn buttonPrompt(allocator: std.mem.Allocator) Prompt {
    var btns = std.ArrayList(buttons.Button).initCapacity(allocator, 3) catch {
        // it wont fail (~;
        return undefined;
    };

    // init state
    btns.append(.{}) catch {};
    btns.append(.{}) catch {};
    btns.append(.{}) catch {};

    return Prompt{ .buttons = btns };
}
