const w4 = @import("../wasm4.zig");

const menus = @import("../components/menu.zig");
const gamepad = @import("../gamepad.zig");
const statemachine = @import("../state-machine.zig");
const std = @import("std");
const Option = @import("../components/option.zig").Option;
const all_options = @import("../assets/menu-options.zig").menu_options;



var menu: menus.Menu = undefined;

pub const MenuState = struct {
    menu: menus.Menu,
    round_options: std.ArrayListAligned(u8, null),
    choices: std.ArrayListAligned(u8, null),
    round: u8 = 0,

    pub fn reset(self: *@This()) void {
        for (self.choices) |*i| {
            i.* = 0;
        }
        self.round = 0;
    }

    pub fn init(allocator: std.mem.Allocator) MenuState {
        var ms = MenuState{
            // pass temporary option
            .menu = menus.buttonMenu(allocator),
            // allocate the memory for the choices made so far
            .round_options = std.ArrayList(u8).initCapacity(allocator, 3) catch {
                // it wont fail (~;
                return undefined;
            },
            .choices = std.ArrayList(u8).initCapacity(allocator, 3) catch {
                // it wont fail (~;
                return undefined;
            },
        };

        ms.menu.setOption(all_options[0]);
        return ms;
    }

    pub fn update(self: *@This(), _: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        self.handleInput(pl);
        self.menu.update();
    }

    fn handleInput(self: *@This(), pl: *const gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_DOWN)) {
            self.menu.incSelection();
        }
        if (pl.isPressed(w4.BUTTON_UP)) {
            self.menu.decSelection();
        }
    }
};
