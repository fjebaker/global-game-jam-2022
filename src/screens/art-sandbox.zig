const w4 = @import("../wasm4.zig");
const sprites = @import("../assets/sprites.zig");

var art_ticks: u32 = 0;

pub fn update() void {
    var xOff: u32 = 0;
    if (art_ticks % 20 > 10) {
        xOff = 16;
    }

    // WTF is boris in a different order???
    w4.DRAW_COLORS.* = 0x2430;
    w4.blitSub(&sprites.boris_bits, 72, 72, // x, y
        sprites.boris.height, sprites.boris.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.boris.width, // Assumes stride and width are equal
        sprites.boris.flags);

    w4.DRAW_COLORS.* = 0x4320;
    w4.blitSub(&sprites.flag_bits, 90, 72, // x, y
        sprites.flag.height, sprites.flag.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.flag.width, // Assumes stride and width are equal
        sprites.flag.flags);

    for ([_]i32{ 1, 2, 3, 4 }) |i| {
        w4.blitSub(&sprites.press_bits, 30 + i * 20, 40, // x, y
            sprites.press.height, sprites.press.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            sprites.press.width, // Assumes stride and width are equal
            sprites.press.flags);
    }

    for ([_]i32{ 1, 2, 3, 4 }) |i| {
        w4.blitSub(&sprites.guest_bits, 30 + i * 20, 100, // x, y
            sprites.guest.height, sprites.guest.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            sprites.guest.width, // Assumes stride and width are equal
            sprites.guest.flags);
    }

    art_ticks += 1;
}
