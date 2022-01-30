const tune = @import("tune.zig");

// Convenience struct for 3 part music
pub const Music = struct {
    parts: [3]tune.Tune,

    pub fn play(self: *Music) void {
        parts[0].play()
        parts[1].play()
        parts[2].play()
    }

    pub fn reset(self: *Music) void {
        parts[0].reset()
        parts[1].reset()
        parts[2].reset()
    }
};