const w4 = @import("../wasm4.zig");
const boris = @import("../assets/boris.zig");
const flag = @import("../assets/flag.zig");
const press = @import("../assets/press.zig");

var art_ticks: u32 = 0;

pub fn update() void {
    var xOff: u32 = 0;
    if (art_ticks % 20 > 10) {
        xOff = 16;
    }

    w4.DRAW_COLORS.* = 0x4320;
    w4.blitSub(
        &boris.data,
        72, 72, // x, y
        boris.height, boris.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        boris.width, // Assumes stride and width are equal
        boris.flags
    );

    w4.DRAW_COLORS.* = 0x2430;
    w4.blitSub(
        &flag.data,
        90, 72, // x, y
        flag.height, flag.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        flag.width, // Assumes stride and width are equal
        flag.flags
    );

    for ([_]i32{1, 2, 3, 4}) |i| {
        w4.blitSub(
            &press.data,
            30 + i * 20, 40, // x, y
            press.height, press.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            press.width, // Assumes stride and width are equal
            press.flags
        );
    }

    art_ticks += 1;
}
