const w4 = @import("../wasm4.zig");

const OUTLINE_WIDTH = 1;
const SCREEN_SIZE: u8 = 160;

pub const StatusBar = struct {
    value: u32,
    maximum_value: u32 = 100,

    height: u8 = 10,
    locx: u8 = 0,
    locy: u8 = 0,

    pub fn draw(self: * @This()) void {
        w4.DRAW_COLORS.* = 0x2340;
        w4.rect(self.locx, self.locy, SCREEN_SIZE, self.height);
        // interior bar
        const x_amount: u32 = SCREEN_SIZE - ((self.value * SCREEN_SIZE) / self.maximum_value);
        w4.DRAW_COLORS.* = 0x02;
        w4.rect(
            self.locx + OUTLINE_WIDTH, self.locy + OUTLINE_WIDTH,
            SCREEN_SIZE - 2 * OUTLINE_WIDTH - x_amount, self.height - 2 * OUTLINE_WIDTH  
        );
    }
};