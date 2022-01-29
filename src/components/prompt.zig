const w4 = @import("../wasm4.zig");
const buttons = @import("button.zig");
const Situation = @import("../components/situation.zig").Situation;

const PROMPT_HEIGHT: u8 = 100;
const SCREEN_SIZE: u8 = 160;
const X_OFFSET: u8 = 2;

pub const Prompt = struct {
    selection: u8 = 0,
    buttons: []const buttons.Button,
    num_buttons: u8,

    pub fn draw(self: *const @This()) void {
        // draw colour for the outline of the prompt
        w4.DRAW_COLORS.* = 0x42;
        w4.rect(X_OFFSET, PROMPT_HEIGHT, SCREEN_SIZE - 2 * X_OFFSET, PROMPT_HEIGHT);

        // set draw colour for the buttons
        w4.DRAW_COLORS.* = 0x24;

        var i: u8 = 0;
        for (self.buttons) |btn, index| {
            i = @intCast(u8, index);
            btn.draw(
            // button location fixed for now
            X_OFFSET * 2, PROMPT_HEIGHT + i * 17 + X_OFFSET * 2, i == self.selection);
        }
    }

    pub fn incSelection(self: *@This()) void {
        if (self.selection >= self.num_buttons - 1) {
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

pub fn buttonPrompt(situ: Situation) Prompt {
    var btns: [3]buttons.Button = undefined;
    for (situ.options) |opt, i| {
        btns[i] = buttons.Button{ .text = opt };
    }
    return Prompt{ .buttons = &btns, .num_buttons = 3 };
}
