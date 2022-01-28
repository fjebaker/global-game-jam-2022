const w4 = @import("../wasm4.zig");
const buttons = @import("button.zig");

const PROMPT_HEIGHT: u8 = 100;
const SCREEN_SIZE: u8 = 160;
const X_OFFSET: u8 = 2;

pub const Prompt = struct {
    selection : u8 = 0,
    buttons : [] const buttons.Button,

    pub fn draw(self: * const @This()) void {
        // draw colour for the outline of the prompt
        w4.DRAW_COLORS.* = 0x42;
        w4.rect(X_OFFSET, PROMPT_HEIGHT, SCREEN_SIZE - 2*X_OFFSET, PROMPT_HEIGHT);

        // set draw colour for the buttons
        w4.DRAW_COLORS.* = 0x24;

        var i: u8 = 0;
        for (self.buttons) |btn, index| {
            i = @intCast(u8, index);
            btn.draw(
                // button location fixed for now
                X_OFFSET * 2, 
                PROMPT_HEIGHT + i*17 + X_OFFSET * 2, 
                i == self.selection
            );
        }
    }
};

pub fn buttonPrompt(options: [3][] const u8) Prompt {
    var btns: [3]buttons.Button = undefined;
    for (options) |opt, i| {
        btns[i] = buttons.Button{.text = opt};
    }
    return Prompt{
        .buttons = &btns
    };
}

pub fn drawPrompt(options: [2][] const u8) void {
    w4.DRAW_COLORS.* = 0x42;
    w4.rect(
        X_OFFSET, 
        PROMPT_HEIGHT, 
        SCREEN_SIZE - 2 * X_OFFSET, 
        PROMPT_HEIGHT - 2 * X_OFFSET
    );

    w4.DRAW_COLORS.* = 0x24;
    for (options) |opt| {
        w4.text(">", X_OFFSET, PROMPT_HEIGHT);
        w4.text(opt, X_OFFSET + 10, PROMPT_HEIGHT);
    }
}

