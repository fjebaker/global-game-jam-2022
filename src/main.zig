const state = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");

var game_state: state.State = state.State.IN_MENU;

export fn update() void {
    switch (game_state) {
        .IN_MENU => mainmenu.drawMenu(),
        else => {}
    }
}
