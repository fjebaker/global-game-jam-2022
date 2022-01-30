const w4 = @import("../wasm4.zig");
const sprites = @import("../assets/sprites.zig");
const gamepad = @import("../gamepad.zig");
const statemachine = @import("../state-machine.zig");

var start_ticks: u32 = 0;
pub fn handleInput(state: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
    if (pl.isPressed(w4.BUTTON_DOWN) or pl.isPressed(w4.BUTTON_UP) or pl.isPressed(w4.BUTTON_LEFT) or pl.isPressed(w4.BUTTON_RIGHT) or pl.isPressed(w4.BUTTON_1) or pl.isPressed(w4.BUTTON_2)) {
        state.change(.AT_PARTY);
    }
}

pub fn update(state: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
    handleInput(state, pl);
    var xOff: u32 = 0;
    if (start_ticks % 20 > 10) {
        xOff = 16;
    }

    w4.DRAW_COLORS.* = 0x0432;
    w4.blit(sprites.title.data, 7, 0, // x, y
        sprites.title.width, sprites.title.height, sprites.title.flags);

    for ([_]i32{ 0, 1, 2, 3, 4 }) |i| {
        w4.blit(sprites.pavement.data, i * (32), 100, sprites.pavement.height, sprites.pavement.height, sprites.pavement.flags);
    }

    w4.blitSub(sprites.flag.data, 79, 72 - (32 / 2), // x, y
        sprites.flag.height, sprites.flag.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.flag.width, // Assumes stride and width are equal
        sprites.flag.flags);

    for ([_]i32{ 0, 1, 3, 4 }) |i| {
        w4.blit(sprites.house.data, i * (32), 72, sprites.house.width, sprites.house.height, sprites.house.flags);
    }

    w4.blit(sprites.noten.data, 72 - (sprites.noten.width / 4), 72, // x, y
        sprites.noten.width, sprites.noten.height, sprites.noten.flags);

    w4.blitSub(sprites.boris.data, 45, 78 + (32 / 2), // x, y
        sprites.boris.height, sprites.boris.height, // w, h; Assumes square
        xOff, 0, // src_x, src_y
        sprites.boris.width, // Assumes stride and width are equal
        sprites.boris.flags);

    // The text is 1bpp, so it gets its own palette
    w4.DRAW_COLORS.* = 0x0002;
    w4.blit(sprites.pab.data, 53, 140, // x, y
        sprites.pab.width, sprites.pab.height, sprites.pab.flags);

    start_ticks += 1;
}
