const prompts = @import("../assets/prompt.zig");

pub fn doround() void {
    var temp = [_][] const u8 {"Hello", "World", "Boris"};
    var t = prompts.buttonPrompt(temp);
    t.draw();
}