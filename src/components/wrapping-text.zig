const w4 = @import("../wasm4.zig");

// how much to roll back if the text overloads
const TEXT_HEIGHT = 8;
const MAX_LENGTH = 18;

pub fn textWrap(str: []const u8, x: i32, y: i32) void {
    if (str.len > MAX_LENGTH) {
        w4.text(str[0..MAX_LENGTH], x, y - TEXT_HEIGHT);
    }
    // draw the rest
    if (str[MAX_LENGTH] == ' ') {
        w4.text(str[MAX_LENGTH + 1 .. str.len], x, y);
    } else {
        w4.text(str[MAX_LENGTH..str.len], x, y);
    }
}
