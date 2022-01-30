const tune = @import("tune.zig");

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
