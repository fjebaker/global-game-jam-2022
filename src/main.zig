const w4 = @import("wasm4.zig");
const statemachine = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const titletheme = @import("music/title-theme.zig");
const party = @import("screens/party.zig");
const startscreen = @import("screens/start-screen.zig");
const gamepad = @import("gamepad.zig");
const std = @import("std");

const artsandbox = @import("screens/art-sandbox.zig");

// allocation buffer
//var buffer: [1028]u8 = undefined;
//var allocator: std.mem.Allocator = undefined;

var player = gamepad.GamePad{};

// game states
var state: statemachine.StateMachine = undefined;
var partystate: party.PartyState = undefined;
var menustate: mainmenu.MenuState = undefined;

export fn start() void {
    w4.PALETTE.* = .{
        // XRGB
        0x00DDDDDD,
        0x00000000,
        0x009E9E9E,
        0x00FFFFFF,
    };

    // init the allocation buffer
    // var fba = std.heap.FixedBufferAllocator.init(&buffer);
    // allocator = fba.allocator();
    // allocate all needed game memory
    state = statemachine.StateMachine.init();
    partystate = party.PartyState.init();
}

export fn update() void {
    switch (state.screen) {
        .IN_MENU => menustate.update(&state, &player),
        .AT_PARTY => partystate.update(&state, &player),
        .ART_SANDBOX => artsandbox.update(),
        .START_SCREEN => startscreen.update(),
        else => {},
    }
    titletheme.mainMenuMusic();
    player.update();
}
