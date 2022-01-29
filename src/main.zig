const w4 = @import("wasm4.zig");
const statemachine = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const titletheme = @import("music/title-theme.zig");
const party = @import("screens/party.zig");
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

export fn start() void {
    w4.PALETTE.* = .{
        // XRGB
        0x00DDDDDD,
        0x00FFFF00,
        0x00222222,
        0x00999999,
    };

    // init the allocation buffer
    // var fba = std.heap.FixedBufferAllocator.init(&buffer);
    // allocator = fba.allocator();
    // allocate all needed game memory
    state = statemachine.StateMachine.init();
    partystate = party.PartyState.init();

    // set the first scren
    state.screen = .AT_PARTY;
}

export fn update() void {
    switch (state.screen) {
        .IN_MENU => mainmenu.update(),
        .AT_PARTY => partystate.update(&state, &player),
        .ART_SANDBOX => artsandbox.update(),
        else => {},
    }
    titletheme.mainMenuMusic();
    player.update();
}
