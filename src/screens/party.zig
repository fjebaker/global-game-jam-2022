const prompts = @import("../components/prompt.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");
const statemachine = @import("../state-machine.zig");
const std = @import("std");
const Situation = @import("../components/situation.zig").Situation;

var prompt: prompts.Prompt = undefined;

// temporary party prompt
const situ: Situation = .{ .prompt = "TEST PROMPT", .options = [3][]const u8{ "OPTION A", "OPTION B", "OPTION C" } };


pub const PartyState = struct {
    prompt: prompts.Prompt,
    choices: std.ArrayListAligned(u8, null),
    round: u8 = 0,

    pub fn reset(self: *@This()) void {
        for (self.choices) |*i| {
            i.* = 0;
        }
        self.round = 0;
    }

    pub fn init(allocator: std.mem.Allocator) PartyState {
        return PartyState{
            // pass temporary situation
            .prompt = prompts.buttonPrompt(situ),
            // allocate the memory for the choices made so far
            .choices = std.ArrayList(u8).initCapacity(allocator, 3) catch {
                // it wont fail (~; 
                return undefined;
            }
        };
    }

    pub fn update(self: * @This(), _: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        self.handleInput(pl);
        self.prompt.draw();
    }

    fn handleInput(self: * @This(), pl: *const gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_DOWN)) {
            self.prompt.incSelection();
        }
        if (pl.isPressed(w4.BUTTON_UP)) {
            self.prompt.decSelection();
        }
    }
};