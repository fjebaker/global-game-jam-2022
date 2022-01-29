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
    situation_history: [3]u8 = [3]u8{ 0, 0, 0 },
    choices: [3]u8 = [3]u8{ 0, 0, 0 },
    weights: [3]u8 = [3]u8{ 0, 0, 0 },
    round: u8 = 0,
    rnd: *std.rand.Random,

    pub fn reset(self: *@This()) void {
        for (self.choices) |*i| {
            i.* = 0;
        }
        self.round = 0;
    }

    pub fn init(rnd: *std.rand.Random) PartyState {
        var ps = PartyState{
            // pass temporary situation
            .prompt = prompts.buttonPrompt(),
            .rnd = rnd,
        };

        ps.setRandomSituation();
        return ps;
    }

    pub fn setSituationByIndex(self: *@This(), i: u8) void {
        self.prompt.setSituation(&all_situations[i]);
        self.prompt.shuffleOrder(self.rnd);
        self.newRandomWeights();

        self.prompt.selection = 0;
        //self.situation_history[self.round] = i;
    }

    pub fn update(self: *@This(), state: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        self.handleInput(state, pl);
        self.prompt.update();
    }

    pub fn setRandomSituation(self: *@This()) void {
        const i = self.newRandomSituationIndex();
        self.setSituationByIndex(i);
    }

    fn newRandomWeights(self: *@This()) void {
        // generate low weight 5-10
        self.weights[0] =
            self.rnd.intRangeLessThan(u8, 5, 11);
        // genereate medium weight 10-30
        self.weights[1] =
            self.rnd.intRangeLessThan(u8, 10, 31);
        // generate high weight 30-50
        self.weights[2] = self.rnd.intRangeLessThan(u8, 30, 51);
    }

    fn newRandomSituationIndex(self: *@This()) u8 {
        return self.rnd.intRangeLessThan(u8, 0, all_situations.len);
    }

    fn handleInput(self: *@This(), state: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_DOWN)) {
            self.prompt.incSelection();
        }
        if (pl.isPressed(w4.BUTTON_UP)) {
            self.prompt.decSelection();
        }
        if (pl.isPressed(w4.BUTTON_1)) {
            // save choice
            var choice = self.prompt.getSelection();
            self.choices[self.round] = choice;

            // update buzzing score
            state.buzzing += self.weights[choice];

            // update round
            self.round += 1;

            if (self.round >= 3) {
                state.screen = .AT_PRESS_CONFERENCE;
            } else {
                // new situation
                self.setRandomSituation();
            }
        }
    }
};
