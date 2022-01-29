const w4 = @import("wasm4.zig");
const state = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const titletheme = @import("music/title-theme.zig");
const party = @import("screens/party.zig");
const gamepad = @import("./gamepad.zig");
const artsandbox = @import("screens/art-sandbox.zig");

var player = gamepad.GamePad{};
var game_state: state.State = undefined;

export fn start() void {
    w4.PALETTE.* = .{
        // XRGB
        0x00DDDDDD,
        0x00FFFF00,
        0x00222222,
        0x00999999,
    };
    game_state = .AT_PARTY;
}

export fn update() void {
    switch (game_state) {
        .IN_MENU => {
            mainmenu.update();
            titletheme.mainMenuMusic();
        },
        .ART_SANDBOX => {
            artsandbox.update();
            titletheme.mainMenuMusic();
        },
        .IN_MENU => {
            mainmenu.update();
            titletheme.mainMenuMusic();
        },
        .AT_PARTY => {
            party.doRound(&player);
            titletheme.mainMenuMusic();
        },
        .ART_SANDBOX => {
            artsandbox.update();
            titletheme.mainMenuMusic();
        },
        else => {}
    }
    player.update();
}
