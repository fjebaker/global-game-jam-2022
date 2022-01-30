const std = @import("std");
const statemachine = @import("../state-machine.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");

const statusbar = @import("../components/status-bar.zig");
const projectile = @import("../components/projectile.zig");

const Facing = projectile.Facing;
const Projectile = projectile.Projectile;

const sprites = @import("../assets/sprites.zig");

const SIDE_PADDING: u8 = 4;
const SCREEN_SIZE: u8 = 160;
const SURVIVE_TIME: u32 = 1000;
const ACTION_COOLDOWN: u32 = 1 * 30;

pub const Parliament = struct {
    px: u8 = SCREEN_SIZE / 2,
    py: u8 = SCREEN_SIZE / 2,
    buzzing: u32 = 0,
    confidence: u32 = 0,
    rnd: *std.rand.Random,
    ticker: u32 = 0,
    sample_rate: u8 = 1, // how often do we move?
    velocity: u8 = 1,
    inverted: bool = false,
    cooldown: u32 = 0,
    facing: Facing = .UP,

    // static array for keeping all of the projectiles
    projectiles: [128] Projectile = undefined,
    // stack pointer (points to top)
    proj_index: u32 = 0, // index for keeping track of the projectile stack 

    timebar: statusbar.StatusBar = undefined,

    pub fn init(rnd: *std.rand.Random) Parliament {
        return Parliament{ .rnd = rnd, .timebar = statusbar.StatusBar{
            .value = SURVIVE_TIME,
            .maximum_value = SURVIVE_TIME,
            .locy = 8,
        } };
    }

    fn reset(self: *@This()) void {
        self.timebar.value = SURVIVE_TIME;
        self.ticker = 0;
        self.px = SCREEN_SIZE / 2;
        self.py = SCREEN_SIZE / 2;
    }

    pub fn update(self: *@This(), state: *statemachine.StateMachine, pl: *gamepad.GamePad) void {
        w4.DRAW_COLORS.* = 0x24;
        w4.text("PARLIAMENT", 0, 0);
        w4.text("TIME", SCREEN_SIZE - (4 * 8), 0);

        if (self.ticker % self.sample_rate == 0) {
            self.handleInput(state, pl);
        }
        // update time
        if (self.ticker % 60 == 0 and self.timebar.value > 0) {
            self.timebar.value -= 1;
        }
        self.timebar.draw();
        self.draw();

        if (self.timebar.value == 0) {
            // reset states
            self.reset();
            // go back to the party
            state.screen = .ROUND_DONE;
        }
    }

    fn draw(self: *@This()) void {
        var xOff: u32 = 0;
        if (self.ticker % 20 > 10) {
            xOff = 16;
        }

        w4.DRAW_COLORS.* = 0x2430;
        w4.blitSub(sprites.boris.data, @intCast(i32, self.px) - @divTrunc(sprites.boris.width, 2), @intCast(i32, self.py), // x, y
            sprites.boris.height, sprites.boris.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            sprites.boris.width, // Assumes stride and width are equal
            sprites.boris.flags);

        // draw all of the projectiles
        if (self.proj_index != 0) {
            for (self.projectiles) |proj, i| {
                if (i == self.proj_index) { // points to top of stack
                    break;
                } else {
                    proj.draw();
                }
            }
        }

        self.ticker += 1;
        // reduce cooldown if we can
        if (self.cooldown != 0) {
            self.cooldown -= 1;
        }
    }

    fn buttonDown(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            self.facing = .DOWN;
            return pl.isHeld(w4.BUTTON_DOWN);
        } else {
            self.facing = .UP;
            return pl.isHeld(w4.BUTTON_UP);
        }
    }
    fn buttonUp(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            self.facing = .UP;
            return pl.isHeld(w4.BUTTON_UP);
        } else {
            self.facing = .DOWN;
            return pl.isHeld(w4.BUTTON_DOWN);
        }
    }
    fn buttonRight(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            self.facing = .RIGHT;
            return pl.isHeld(w4.BUTTON_RIGHT);
        } else {
            self.facing = .LEFT;
            return pl.isHeld(w4.BUTTON_LEFT);
        }
    }
    fn buttonLeft(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            self.facing = .LEFT;
            return pl.isHeld(w4.BUTTON_LEFT);
        } else {
            self.facing = .RIGHT;
            return pl.isHeld(w4.BUTTON_RIGHT);
        }
    }

    fn handleInput(self: *@This(), _: *statemachine.StateMachine, pl: *const gamepad.GamePad) void {
        var button_pressed = false;

        // bounds check
        if (self.py <= SCREEN_SIZE - SIDE_PADDING - (sprites.boris.height)) {
            if (self.buttonDown(pl) and !button_pressed) {
                self.py += self.velocity;
                button_pressed = true;
            }
        }
        if (self.py >= SIDE_PADDING) {
            if (self.buttonUp(pl) and !button_pressed) {
                self.py -= self.velocity;
                button_pressed = true;
            }
        }
        if (self.px <= SCREEN_SIZE - SIDE_PADDING) {
            if (self.buttonRight(pl) and !button_pressed) {
                self.px += self.velocity;
                button_pressed = true;
            }
        }
        if (self.px >= SIDE_PADDING + (sprites.boris.width / 2)) {
            if (self.buttonLeft(pl) and !button_pressed) {
                self.px -= self.velocity;
                button_pressed = true;
            }
        }

        if (pl.isPressed(w4.BUTTON_1) and self.cooldown == 0) {
            w4.trace("THROW");
            self.cooldown = ACTION_COOLDOWN;
            self.throw();
        }
    }

    fn pushProjectile(self: * @This(), p: Projectile) void {
        self.projectiles[self.proj_index] = p;
        self.proj_index += 1;
    }

    fn popProjectile(self: *@This()) Projectile {
        if (self.proj_index >= 1) {
            self.proj_index -= 1;
            return self.projectiles[self.proj_index + 1];
        } else {
            return undefined;
        }
    }

    fn throw(self: *@This()) void {
        const p = Projectile.init(sprites.flag, self.px, self.py);
        self.pushProjectile(p);
        
    }
};
