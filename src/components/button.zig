const w4 = @import("../wasm4.zig");

const OFFSET = 10;

pub const Button = struct {
    text: []const u8,

    pub fn draw(self: *const @This(), x: u8, y: u8, selected: bool) void {
        w4.text(self.text, x + OFFSET, y);
        if (selected) {
            w4.text(">", x, y);
        } else {
            w4.text("-", x, y);
        }
    }
};
