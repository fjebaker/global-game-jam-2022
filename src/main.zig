const w4 = @import("wasm4.zig");
const state = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const party = @import("screens/party.zig");
const gamepad = @import("./gamepad.zig");

const artsandbox = @import("screens/art-sandbox.zig");

var player = gamepad.GamePad{};
var game_state: state.State = .ART_SANDBOX;

export fn start() void {
    w4.PALETTE.* = .{
        // XRGB
        0x00DDDDDD,
        0x00FFFF00,
        0x00222222,
        0x00999999,
    };
    game_state = .ART_SANDBOX;
}

export fn update() void {
    switch (game_state) {
        .IN_MENU => mainmenu.update(),
        .AT_PARTY => party.doRound(&player),
        .ART_SANDBOX => artsandbox.update(),
        else => {}
    }
}
