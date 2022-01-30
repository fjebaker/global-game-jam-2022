const prompts = @import("../components/prompt.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");
const statemachine = @import("../state-machine.zig");
const std = @import("std");
const Situation = @import("../components/situation.zig").Situation;
const sprites = @import("../assets/sprites.zig");

var start_ticks: u32 = 0;
const all_situations = @import("../assets/presscon-situations.zig").all_press_conference_situations;

pub const PressState = struct {
    prompt: prompts.Prompt,
    situation_history: [3]u8 = [3]u8{ 0, 0, 0 },
    weights: [3]u8 = [3]u8{ 0, 0, 0 },
    round: u8 = 0,
    rnd: *std.rand.Random,

    pub fn reset(self: *@This()) void {
        for (self.situation_history) |*i| {
            i.* = 0;
        }
        self.round = 0;
    }

    pub fn init(rnd: *std.rand.Random) PressState {
        var ps = PressState{
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

    pub fn update(self: *@This(), state: *statemachine.StateMachine, pl: *const gamepad.GamePad, disallowed: []const u8) void {
        w4.DRAW_COLORS.* = 0x24;
        w4.text("PRESS CONFERENCE", 0, 0);
        // set disallowed
        self.prompt.disallow = disallowed[self.round];
        self.handleInput(state, pl);
        self.prompt.update();

        var xOff: u32 = 0;
        if (start_ticks % 20 > 10) {
        xOff = 16;
        }

        w4.DRAW_COLORS.* = 0x0432;
        w4.blitSub(sprites.guest.data, 20, 70, // x, y
        sprites.guest.height, sprites.guest.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.guest.width, // Assumes stride and width are equal
        sprites.guest.flags);

        w4.blitSub(sprites.guest.data, 20, 30, // x, y
        sprites.guest.height, sprites.guest.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.guest.width, // Assumes stride and width are equal
        sprites.guest.flags);

        w4.DRAW_COLORS.* = 0x0432;
        w4.blitSub(sprites.boris.data, 50, 50, // x, y
        sprites.boris.height, sprites.boris.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.boris.width, // Assumes stride and width are equal
        sprites.boris.flags);

        w4.blitSub(sprites.press.data, 80, 30, // x, y
        sprites.press.height, sprites.press.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.press.width, // Assumes stride and width are equal
        sprites.press.flags|0x2);

        w4.blitSub(sprites.press.data, 110, 40, // x, y
        sprites.press.height, sprites.press.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.press.width, // Assumes stride and width are equal
        sprites.press.flags|0x2);

        w4.blitSub(sprites.press.data, 90, 50, // x, y
        sprites.press.height, sprites.press.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.press.width, // Assumes stride and width are equal
        sprites.press.flags|0x2);

        w4.blitSub(sprites.press.data, 110, 60, // x, y
        sprites.press.height, sprites.press.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.press.width, // Assumes stride and width are equal
        sprites.press.flags|0x2);

        w4.blitSub(sprites.press.data, 80, 70, // x, y
        sprites.press.height, sprites.press.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.press.width, // Assumes stride and width are equal
        sprites.press.flags|0x2);

        start_ticks += 1;
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
        } else if (pl.isPressed(w4.BUTTON_UP)) {
            self.prompt.decSelection();
        } else if (pl.isPressed(w4.BUTTON_1)) {
            // save choice
            var choice = self.prompt.getSelection();

            // update confidence score
            state.confidence += self.weights[choice];
            // log it for now

            // update round
            self.round += 1;

            if (self.round >= 3) {
                // reset self
                self.reset();
                state.change(.AT_HOUSE_OF_COMMONS);
            } else {
                // new situation
                self.setRandomSituation();
            }
        }
    }
};
