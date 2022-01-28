const state = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const party = @import("screens/party.zig");

var game_state: state.State = state.State.AT_PARTY;

export fn update() void {
    switch (game_state) {
        .IN_MENU => mainmenu.drawMenu(),
        .AT_PARTY => party.doround(),
        else => {}
    }
}
