const prompts = @import("../assets/prompt.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");
const statemachine = @import("../state-machine.zig");

var prompt: prompts.Prompt = undefined;

fn handleInput(pl: *const gamepad.GamePad) void {
    if (pl.isPressed(w4.BUTTON_DOWN)) {
        prompt.incSelection();
    }
    if (pl.isPressed(w4.BUTTON_UP)) {
        prompt.decSelection();
    }
}

pub fn update(_: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
    handleInput(pl);
    prompt.draw();
}
