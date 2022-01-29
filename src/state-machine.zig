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
};

pub const StateMachine = struct {
    screen: Screens = .IN_MENU,

    // player state
    buzzing: u32 = 0,
    confidence: u32 = 0,
    totalscore: u32 = 0,

    // screen states

    pub fn reset(self: *@This()) void {
        self.buzzing = 0;
        self.confidence = 0;
        self.totalscore = 0;

        self.screen = .IN_MENU;
    }

    pub fn init() StateMachine {
        return StateMachine{ .buzzing = 0 };
    }
};
