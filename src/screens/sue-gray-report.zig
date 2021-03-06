const w4 = @import("../wasm4.zig");
const gamepad = @import("../gamepad.zig");
const statemachine = @import("../state-machine.zig");
const std = @import("std");

const SCREEN_SIZE: u8 = 160;
const TIMEOUT = 60;

fn toString(score: u32, buf: []u8) void {
    // fixed size buffer of 4
    _ = std.fmt.bufPrint(buf, "{d}", .{score}) catch {};
}

pub const SueGrayReport = struct {
    ticker: u32 = 0,

    pub fn init() SueGrayReport {
        return SueGrayReport{};
    }

    pub fn update(self: *@This(), state: *statemachine.StateMachine, pl: *gamepad.GamePad) void {
        w4.DRAW_COLORS.* = 0x42;  
        var buf: [4]u8 = undefined;
        toString(state.confidence, &buf);
        w4.text(&buf, 15, 105);
        
        if (self.ticker > TIMEOUT) {
            self.handleInput(state, pl);

            w4.DRAW_COLORS.* = 0x04;
            w4.text("Press X to continue", 3, 140);
        } else {
            self.ticker += 1;
        }

        self.draw(state);
    }

    fn draw(_: *const @This(), state: *const statemachine.StateMachine) void {
        w4.DRAW_COLORS.* = 0x42;
        var buf: [4]u8 = undefined;
        toString(state.buzzing, &buf);
        w4.text(&buf, 15, 65);
        
        w4.DRAW_COLORS.* = 0x02;
        w4.text("SUE GRAY REPORT", 20, 5);
        w4.DRAW_COLORS.* = 0x03;
        w4.text("On the 5th of Jan,\nBohnson was found\npartying in 10\nDowning Street. He\nwas:", 5, 20);
        w4.text("Now has a Vote of\nConfidence of", 5, 80);
        w4.DRAW_COLORS.* = 0x02;
        w4.text("%Feckless", 43, 65);
        w4.text("%Confidence", 43, 105);
    }

    fn handleInput(self: *@This(), state: *statemachine.StateMachine, pl: *gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_1)) {
            state.change(.AT_PARTY);
            self.ticker = 0;
        }
    }
};
