const w4 = @import("wasm4.zig");
const statemachine = @import("state-machine.zig");
const mainmenu = @import("screens/main-menu.zig");
const party = @import("screens/party.zig");
const gamepad = @import("./gamepad.zig");

const artsandbox = @import("screens/art-sandbox.zig");

var player = gamepad.GamePad{};
var state = statemachine.StateMachine{
    // set initial state
    .screen = .IN_MENU,
};

export fn start() void {
    w4.PALETTE.* = .{
        // XRGB
        0x00DDDDDD,
        0x00FFFF00,
        0x00222222,
        0x00999999,
    };
}

// temporary party prompt
const pp: statemachine.ChoicePrompt = .{ .prompt = "TEST PROMPT", .options = [3][]const u8{ "OPTION A", "OPTION B", "OPTION C" } };

export fn update() void {
    switch (state.screen) {
        .IN_MENU => mainmenu.update(),
        .AT_PARTY => party.update(&state, &player),
        .ART_SANDBOX => artsandbox.update(),
        else => {},
    }
    player.update();
}
