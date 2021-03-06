const std = @import("std");
const music = @import("music/music.zig");

// add global variables representing what state the game is in
pub const Screens = enum { IN_MENU, AT_PARTY, AT_PRESS_CONFERENCE, AT_HOUSE_OF_COMMONS, SUE_GRAY, PAUSED_SCREEN, START_SCREEN, ROUND_DONE, FROM_COMMONS_TRANSITION, TO_COMMONS_TRANSITION, TO_PRESS_CONFERENCE };

pub const StateMachine = struct {
    screen: Screens = undefined,
    music: *const music.Music = undefined,

    // player state
    buzzing: u32 = 0,
    confidence: u32 = 0,
    totalscore: u32 = 0,

    // screen states

    pub fn change(self: *@This(), state: Screens) void {
        self.screen = state;
        const newMusic = music.musicForScreen(state);
        if(newMusic != self.music) {
            newMusic.reset();
            self.music = newMusic;
        }
    }

    pub fn reset(self: *@This()) void {
        self.buzzing = 0;
        self.confidence = 0;
        self.totalscore = 0;

        self.change(.IN_MENU);
    }

    pub fn init() StateMachine {
        return StateMachine{ .screen = .START_SCREEN, .music = music.musicForScreen(.START_SCREEN)};
    }

    pub fn playMusic(self: *@This()) void {
        self.music.*.play();
    }
};
