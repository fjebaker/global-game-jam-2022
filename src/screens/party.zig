const prompts = @import("../components/prompt.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");
const statemachine = @import("../state-machine.zig");
const std = @import("std");
const Situation = @import("../components/situation.zig").Situation;

const all_situations = @import("../assets/party-situations.zig").all_party_situations;

var prompt: prompts.Prompt = undefined;

pub const PartyState = struct {
    prompt: prompts.Prompt,
    round_situations: std.ArrayListAligned(u8, null),
    choices: std.ArrayListAligned(u8, null),
    round: u8 = 0,

    pub fn reset(self: *@This()) void {
        for (self.choices) |*i| {
            i.* = 0;
        }
        self.round = 0;
    }

    pub fn init(allocator: std.mem.Allocator) PartyState {
        var ps = PartyState{
            // pass temporary situation
            .prompt = prompts.buttonPrompt(allocator),
            // allocate the memory for the choices made so far
            .round_situations = std.ArrayList(u8).initCapacity(allocator, 3) catch {
                // it wont fail (~;
                return undefined;
            },
            .choices = std.ArrayList(u8).initCapacity(allocator, 3) catch {
                // it wont fail (~;
                return undefined;
            },
        };

        ps.prompt.setSituation(all_situations[0]);
        return ps;
    }

    pub fn update(self: *@This(), _: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        self.handleInput(pl);
        self.prompt.update();
    }

    fn handleInput(self: *@This(), pl: *const gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_DOWN)) {
            self.prompt.incSelection();
        }
        if (pl.isPressed(w4.BUTTON_UP)) {
            self.prompt.decSelection();
        }
    }
};
