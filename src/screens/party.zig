const prompts = @import("../assets/prompt.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");

const temp = [_][] const u8 {"Hello", "World", "Boris"};
var prompt: prompts.Prompt = prompts.buttonPrompt(temp);

pub fn doRound(pl: * gamepad.GamePad) void {
    if (pl.isPressed(w4.BUTTON_DOWN)) {
        prompt.incSelection();
    }
    if (pl.isPressed(w4.BUTTON_UP)) {
        prompt.decSelection();
    }
    prompt.draw();
}