const w4 = @import("../wasm4.zig");
const boris = @import("../assets/boris.zig");

var art_ticks: u32 = 0;

pub fn update() void {
    const xPos: i32 = 72;
    const yPos: i32 = 72;

    var xOff: u32 = 0;
    if (art_ticks % 20 > 10) {
        xOff = 16;
    }

    w4.DRAW_COLORS.* = 0x4320;
    w4.blitSub(
        &boris.data,
        xPos, yPos, // x, y
        boris.height, boris.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        boris.width, // Assumes stride and width are equal
        boris.flags
    );

    art_ticks += 1;
}
