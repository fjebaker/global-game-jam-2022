const w4 = @import("../wasm4.zig");
const boris = @import("../assets/boris.zig");
const flag = @import("../assets/flag.zig");

var art_ticks: u32 = 0;

pub fn update() void {
    const bxPos: i32 = 72;
    const byPos: i32 = 72;
    const fxPos: i32 = 90;
    const fyPos: i32 = 72;

    var xOff: u32 = 0;
    if (art_ticks % 20 > 10) {
        xOff = 16;
    }

    w4.DRAW_COLORS.* = 0x4320;
    w4.blitSub(
        &boris.data,
        bxPos, byPos, // x, y
        boris.height, boris.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        boris.width, // Assumes stride and width are equal
        boris.flags
    );

     w4.DRAW_COLORS.* = 0x2430;
    w4.blitSub(
        &flag.data,
        fxPos, fyPos, // x, y
        flag.height, flag.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        flag.width, // Assumes stride and width are equal
        flag.flags
    );

    art_ticks += 1;
}
