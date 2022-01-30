const w4 = @import("../wasm4.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");
const statemachine = @import("../state-machine.zig");


const SCREEN_SIZE: u8 = 160;
const TIMEOUT = 60;

const SueGrayReport = struct {

    ticker: u32 = 0,


    pub fn init() SueGrayReport {
        return SueGrayReport{

        };
    }

    pub fn update(self : *@This(), state: * statemachine.StateMachine, pl: * gamepad.GamePad) void {
        self.ticker += 1;
        if (self.ticker > TIMEOUT) {
            self.handleInput(state, pl);
        }

        self.draw(state);
    }

    fn draw(self: * const @This(), state: * const statemachine.StateMachine) void {
        
    }

    fn handleInput(self: * const @This(), state: * statemachine.StateMachine, pl: * gamepad.GamePad) void {

    }
};