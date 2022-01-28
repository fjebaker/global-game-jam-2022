const state = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const party = @import("screens/party.zig");
const gamepad = @import("./gamepad.zig");

var game_state: state.State = state.State.AT_PARTY;
var player = gamepad.GamePad{};

export fn update() void {
    switch (game_state) {
        .IN_MENU => mainmenu.drawMenu(),
        .AT_PARTY => party.doRound(&player),
        else => {}
    }
}
