const w4 = @import("wasm4.zig");
const statemachine = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const titletheme = @import("music/title-theme.zig");
const party = @import("screens/party.zig");
const presscon = @import("screens/press-conference.zig");
const startscreen = @import("screens/start-screen.zig");
const houseofcommons = @import("screens/house-of-commons.zig");

const gamepad = @import("gamepad.zig");
const std = @import("std");

const RndGen = std.rand.DefaultPrng;

var player = gamepad.GamePad{};

// game states
var state: statemachine.StateMachine = undefined;
var partystate: party.PartyState = undefined;
var pressconstate: presscon.PressState = undefined;
var menustate: mainmenu.Menu = undefined;
var parliament: houseofcommons.Parliament = undefined;

var rnd: std.rand.Random = undefined;

export fn start() void {
    w4.PALETTE.* = .{
        // XRGB
        0x00DDDDDD,
        0x00000000,
        0x009E9E9E,
        0x00FFFFFF,
    };

    rnd = RndGen.init(2).random();

    // init the allocation buffer
    state = statemachine.StateMachine.init();
    partystate = party.PartyState.init(&rnd);
    pressconstate = presscon.PressState.init(&rnd);
    menustate = mainmenu.Menu.init();
    parliament = houseofcommons.Parliament.init(&rnd);

    state.screen = .AT_HOUSE_OF_COMMONS;
}

export fn update() void {
    switch (state.screen) {
        .IN_MENU => menustate.update(&state, &player),
        .AT_PARTY => partystate.update(&state, &player),
        .AT_PRESS_CONFERENCE => pressconstate.update(&state, &player, &partystate.choices),
        .AT_HOUSE_OF_COMMONS => parliament.update(&state, &player),
        .START_SCREEN => startscreen.update(&state, &player),
        .ROUND_DONE => {
            // tally score
            // reset state and go again
            state.screen = .AT_PARTY;
        },
        else => {},
    }
    titletheme.mainMenuMusic();
    player.update();
}
