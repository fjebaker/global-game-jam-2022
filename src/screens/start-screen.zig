const w4 = @import("../wasm4.zig");
const boris = @import("../assets/boris.zig");
const flag = @import("../assets/flag.zig");
const press = @import("../assets/press.zig");
const noten = @import("../assets/no_10.zig");
const house = @import("../assets/house.zig");
const pavement = @import("../assets/pavement.zig");
const title = @import("../assets/title.zig");
const pab = @import("../assets/press_any_button.zig");

var start_ticks: u32 = 0;

pub fn update() void {
    var xOff: u32 = 0;
    if (start_ticks % 20 > 10) {
        xOff = 16;
    }

    w4.DRAW_COLORS.* = 0x2430;
    w4.blit(&title.data, 7, 0, // x, y
        title.width, title.height, // w, h; Assumes square
        title.flags);

    w4.DRAW_COLORS.* = 0x2430;
    w4.blitSub(&flag.data, 79, 72 - (32 / 2), // x, y
        flag.height, flag.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        flag.width, // Assumes stride and width are equal
        flag.flags);

    w4.DRAW_COLORS.* = 0x2430;
    for ([_]i32{ 0, 1, 3, 4 }) |i| {
        w4.blit(&house.data, i * (32), 72, house.height, house.height, // w, h; Assumes square
        // house.width, // Assumes stride and width are equal
            house.flags);
    }

    for ([_]i32{ 0, 1, 2, 3, 4 }) |i| {
        w4.blit(&pavement.data, i * (32), 100, pavement.height, pavement.height, // w, h; Assumes square
        // pavement.width, // Assumes stride and width are equal
            pavement.flags);
    }

    w4.DRAW_COLORS.* = 0x2430;
    w4.blit(&noten.data, 72 - (noten.width / 4), 72, // x, y
        noten.height, noten.height, // w, h; Assumes square
        noten.flags);

    w4.DRAW_COLORS.* = 0x4320;
    w4.blitSub(&boris.data, 45, 78 + (32 / 2), // x, y
        boris.height, boris.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        boris.width, // Assumes stride and width are equal
        boris.flags);

    //    for ([_]i32{1, 2, 3, 4}) |i| {
    //        w4.blitSub(
    //            &press.data,
    //            30 + i * 20, 40, // x, y
    //            press.height, press.height, // w, h; Assumes square
    //            xOff, 0, // src_x, src_y
    //            press.width, // Assumes stride and width are equal
    //            press.flags
    //        );
    //    }

    w4.DRAW_COLORS.* = 0x2430;
    w4.blit(&pab.data, 53, 140, // x, y
        pab.width, pab.height, // w, h; Assumes square
        pab.flags);

    start_ticks += 1;
}
