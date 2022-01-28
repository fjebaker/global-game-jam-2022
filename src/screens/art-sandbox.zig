const w4 = @import("../wasm4.zig");
const boris_art = @import("../assets/boris.zig");

var art_ticks: u32 = 0;

pub fn update() void {
    var xOff: u32 = 0;
    if (art_ticks % 20 > 10) {
        xOff = 16;
    }

    w4.DRAW_COLORS.* = 0x4320;
    w4.blitSub(
        &boris_art.boris,
        80-8, 80-8,
        16, 16,
        xOff, 0,
        32, boris_art.boris_flags
    );

    art_ticks += 1;
}
