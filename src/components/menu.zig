const w4 = @import("../wasm4.zig");
const buttons = @import("button.zig");
const Option = @import("../components/option.zig").Option;
const std = @import("std");
const textWrap = @import("wrapping-text.zig").textWrap;


const boris = @import("../assets/boris.zig");
const flag = @import("../assets/flag.zig");


const MENU_HEIGHT: u8 = 50;
const SCREEN_SIZE: u8 = 160;
const X_OFFSET: u8 = 2;
var art_ticks: u32 = 0;

pub const Menu = struct {
    selection: u8 = 0,
    buttons: std.ArrayListAligned(buttons.Button, null),
    option: Option= .{},
    

    pub fn update(self: *const @This()) void {
        // draw colour for the outline of the menu
        // w4.DRAW_COLORS.* = 0x42;
        // w4.rect(X_OFFSET, MENU_HEIGHT, SCREEN_SIZE - 2 * X_OFFSET, MENU_HEIGHT);
        // textWrap(self.option.menu, X_OFFSET, MENU_HEIGHT - 5);

        // set draw colour for the buttons

        w4.DRAW_COLORS.* = 0x42;
        w4.text("Crossing Party\nLines", 20 , 10);
        w4.DRAW_COLORS.* = 0x24;

        var i: u8 = 0;
        for (self.buttons.items) |btn, index| {
            i = @intCast(u8, index);
            btn.draw(
            // button location fixed for now
            X_OFFSET * 4, MENU_HEIGHT + i * 17 + X_OFFSET * 4, i == self.selection);
        }

        var xOff: u32 = 0;
        if (art_ticks % 20 > 10) {
                xOff = 16;
            }

        w4.DRAW_COLORS.* = 0x4320;
        w4.blitSub(&boris.data, 100, 32, // x, y
            boris.height, boris.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            boris.width, // Assumes stride and width are equal
            boris.flags);


        w4.DRAW_COLORS.* = 0x2430;
        w4.blitSub(&flag.data, 120, 32  , // x, y
            flag.height, flag.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            flag.width, // Assumes stride and width are equal
            flag.flags);

        art_ticks += 1;
    }

    // used for menu options 
    // made seperate so doesnt mess with gameplay
    pub fn setOption(self: *@This(), option: Option) void {
        for (option.options) |s, i| {
            self.buttons.items[i] = buttons.Button{ .text = s };
        }
        self.option = option;
    }

    pub fn incSelection(self: *@This()) void {
        if (self.selection >= self.buttons.capacity - 1) {
            // do nothing
        } else {
            self.selection += 1;
        }
    }

    pub fn decSelection(self: *@This()) void {
        if (self.selection <= 0) {
            // do nothing
        } else {
            self.selection -= 1;
        }
    }
};

pub fn buttonMenu(allocator: std.mem.Allocator) Menu {
    var btns = std.ArrayList(buttons.Button).initCapacity(allocator, 3) catch {
        // it wont fail (~;
        return undefined;
    };

    // init state
    btns.append(.{}) catch {};
    btns.append(.{}) catch {};
    btns.append(.{}) catch {};

    return Menu{ .buttons = btns };
}
