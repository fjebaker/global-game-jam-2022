const w4 = @import("../wasm4.zig");
const sprites = @import("../assets/sprites.zig");

var bb_ticks: u32 = 0;
var bb_offset: u32 = 0;

pub fn update() void {
    if (bb_ticks % 20 > 10) {
        bb_offset = (bb_offset + 16) % 128;
    }

    w4.DRAW_COLORS.* = 0x0432;
    for ([_]i32{ 0, 1, 2, 3, 4 }) |i| {
        w4.blit(sprites.pavement.data, i * (32), 100, sprites.pavement.height, sprites.pavement.height, sprites.pavement.flags);
    }

    w4.blit(sprites.parliament.data, 30, 10, // x, y
        sprites.parliament.width, sprites.parliament.height, sprites.parliament.flags);

    w4.blitSub(sprites.clock.data, 107, 41, // x, y
        sprites.clock.height, sprites.clock.height, // w, h; Assumes square
        bb_offset, 0, // src_x, src_y
        sprites.clock.width, // Assumes stride and width are equal
        sprites.clock.flags);

    bb_ticks += 1;
}
