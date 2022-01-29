const std = @import("std");

// add global variables representing what state the game is in
pub const Screens = enum {
    IN_MENU,
    AT_PARTY,
    AT_PRESS_CONFERENCE,
    AT_HOUSE_OF_COMMONS,
    SUE_GRAY,
    PAUSED_SCREEN,
    START_SCREEN,
    // XXX: debug stuff
    ART_SANDBOX,
};

pub const StateMachine = struct {
    screen: Screens = .START_SCREEN,

    // player state
    buzzing: u32 = 0,
    confidence: u32 = 0,
    totalscore: u32 = 0,

    // screen states

    pub fn reset(self: *@This()) void {
        self.buzzing = 0;
        self.confidence = 0;
        self.totalscore = 0;

        self.screen = .START_SCREEN;
    }

    pub fn init() StateMachine {
        return StateMachine{ .buzzing = 0 };
    }
};
