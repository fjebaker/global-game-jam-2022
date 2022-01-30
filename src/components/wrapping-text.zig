const std = @import("std");
const w4 = @import("../wasm4.zig");

// how much to roll back if the text overloads
const TEXT_HEIGHT = 8;
const MAX_LENGTH = 18;

pub fn textWrap(text: []const u8, x: i8, y: i8) void {
    if (text.len > MAX_LENGTH) {
        var line_y = y - TEXT_HEIGHT;
        var start: usize = 0;
        var stride: usize = 0;
        var words = std.mem.split(u8, text, " ");
        while (words.next()) |word| {
            if ((stride + word.len + 1) < MAX_LENGTH) {
                stride += word.len + 1;
            } else {
                const end = @minimum(start + stride - 1, text.len);
                w4.text(text[start..end], x, line_y);
                start += stride;
                line_y += TEXT_HEIGHT;
            }
        }
        if (stride > 0) {
            w4.text(text[start..text.len], x, line_y);
        }
    } else {
        w4.text(text, x, y);
    }
}
