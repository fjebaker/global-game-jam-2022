const Option = @import("../components/option.zig").Option;

pub const menu_options = [_]Option{
    Option{ .menu = "Party/nLines", .options = [3][]const u8{ "start","Tutorialial", "Credits" }}
};