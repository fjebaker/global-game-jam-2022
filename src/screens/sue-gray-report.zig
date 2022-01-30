const w4 = @import("../wasm4.zig");
const gamepad = @import("../gamepad.zig");
const statemachine = @import("../state-machine.zig");

const SCREEN_SIZE: u8 = 160;
const TIMEOUT = 60;

pub const SueGrayReport = struct {

    ticker: u32 = 0,


    pub fn init() SueGrayReport {
        return SueGrayReport{

        };
    }

    pub fn update(self : *@This(), state: * statemachine.StateMachine, pl: * gamepad.GamePad) void {
        self.ticker += 1;
        if (self.ticker > TIMEOUT) {
            self.handleInput(state, pl);

            w4.DRAW_COLORS.* = 0x04;
            w4.text("Press X to continue", 3, 140);
        }

        self.draw(state);
    }

    fn draw(_: * const @This(), _: * const statemachine.StateMachine) void {
        w4.DRAW_COLORS.* = 0x02;
        w4.text("SUE GRAY REPORT", 20, 5);
        w4.DRAW_COLORS.* = 0x03;
        w4.text("On the 5th of Jan,\nBohnson was found\npartying in 10\nDowning Street. He\nwas:", 5, 20);
        w4.text("Now has a Vote of\nConfidence of", 5, 80);

        w4.DRAW_COLORS.* = 0x42;
        w4.text("100", 15, 65); 
        w4.text("100", 15, 105);
        
        w4.DRAW_COLORS.* = 0x02;
        w4.text("%Feckless", 40, 65);
        w4.text("%Confidence", 40, 105);
    }

    fn handleInput(_: * const @This(), state: * statemachine.StateMachine, pl: * gamepad.GamePad) void {
        if (pl.isPressed(w4.BUTTON_1)) {
            state.change(.AT_PARTY);
        }
    }
};