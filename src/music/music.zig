const tune = @import("tune.zig");
const statemachine = @import("../state-machine.zig");
const parliamentmusic = @import("parliament-music.zig");
const partyvibez = @import("party-vibez.zig");
const titletheme = @import("title-theme.zig");

// Convenience struct for 3 part music
pub const Music = struct {
    part1: *tune.Tune,
    part2: *tune.Tune,
    part3: *tune.Tune,

    pub fn play(self: *const Music) void {
        self.part1.*.play();
        self.part2.*.play();
        self.part3.*.play();
    }

    pub fn reset(self: *const Music) void {
        self.part1.*.reset();
        self.part2.*.reset();
        self.part3.*.reset();
    }
};

pub fn musicForScreen(screen: statemachine.Screens) *const Music {
    return switch (screen) {
        .AT_PARTY => &partyvibez.partyVibezMusic,
        .AT_HOUSE_OF_COMMONS => &parliamentmusic.parliamentMusic,
        .TO_COMMONS_TRANSITION => &parliamentmusic.parliamentMusic,
        .FROM_COMMONS_TRANSITION => &partyvibez.partyVibezMusic,
        else => &titletheme.mainMenuMusic,
    };
}
