const prompts = @import("../components/prompt.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");
const statemachine = @import("../state-machine.zig");
const std = @import("std");
const Situation = @import("../components/situation.zig").Situation;

const RndGen = std.rand.DefaultPrng;
const Xoshiro256 = std.rand.Xoshiro256;

const all_situations = @import("../assets/party-situations.zig").all_party_situations;

var prompt: prompts.Prompt = undefined;

pub const PartyState = struct {
    prompt: prompts.Prompt,
    situation_history: [3]u8 = [_]u8{ 0, 0, 0 },
    choices: [3]u8 = [_]u8{ 0, 0, 0 },
    round: u8 = 0,
    rnd: *Xoshiro256,

    pub fn reset(self: *@This()) void {
        for (self.choices) |*i| {
            i.* = 0;
        }
        self.round = 0;
    }

    pub fn init() PartyState {
        var ps = PartyState{
            // pass temporary situation
            .prompt = prompts.buttonPrompt(),
            .rnd = &RndGen.init(1),
        };

        ps.setRandomSituation();
        return ps;
    }

    pub fn setSituationByIndex(self: *@This(), i: u8) void {
        self.prompt.setSituation(&all_situations[i]);
        self.prompt.shuffleOrder(self.rnd);
        // self.situation_history[self.round] = i;
    }

    pub fn update(self: *@This(), _: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        self.handleInput(pl);
        self.prompt.update();
    }

    pub fn setRandomSituation(self: *@This()) void {
        const i = self.newRandomSituationIndex();
        self.setSituationByIndex(i);
    }

    fn newRandomSituationIndex(self: *@This()) u8 {
        //var next_i: u8 = self.situation_history[0];
        //for (self.situation_history) |h, index| {
        //    if (index > self.round) {
        //        break;
        //    }
        //    if (h == next_i) {
        //
        //    } else {
        //        break;
        //    }
        //}

        const next_i = self.rnd.random().intRangeLessThan(u8, 0, all_situations.len);
        w4.tracef("%d", next_i);
        return next_i;
    }

    fn handleInput(self: *@This(), pl: *const gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_DOWN)) {
            self.prompt.incSelection();
        }
        if (pl.isPressed(w4.BUTTON_UP)) {
            self.prompt.decSelection();
        }
        if (pl.isPressed(w4.BUTTON_1)) {
            // save choice
            // self.choices[self.round] = self.prompt.getSelection();
            // update round
            //self.round += 1;
            // new situation
            self.setRandomSituation();
        }
    }
};
