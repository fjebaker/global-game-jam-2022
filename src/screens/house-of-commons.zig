const std = @import("std");
const statemachine = @import("../state-machine.zig");
const gamepad = @import("../gamepad.zig");
const w4 = @import("../wasm4.zig");

const statusbar = @import("../components/status-bar.zig");
const projectile = @import("../components/projectile.zig");
const gavels = @import("../components/gavel.zig");

const Facing = projectile.Facing;
const Projectile = projectile.Projectile;

const sprites = @import("../assets/sprites.zig");

const SIDE_PADDING: u8 = 4;
const SCREEN_SIZE: u8 = 160;
const SURVIVE_TIME: u32 = 1000;
const ACTION_COOLDOWN: u32 = 1 * 10;
const GAVEL_SPAWN_CHANCE: u8 = 245;

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
    hit: bool = false,

    // static array for keeping all of the projectiles
    projectiles: [128]Projectile = undefined,
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
        self.proj_index = 0;
    }

    pub fn update(self: *@This(), state: *statemachine.StateMachine, pl: *gamepad.GamePad) void {
        // background
        drawCommons();

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


        // projectiles
        self.randomGavelSpawn();
        self.updateProjectiles();
        self.draw();

        self.checkCollisions();

        if (self.timebar.value == 0) {
            // reset states
            self.reset();
            // go back to the party
            state.change(.ROUND_DONE);
        }
    }

    fn updateProjectiles(self: *@This()) void {
        // draw all of the projectiles
        if (self.proj_index != 0) {
            for (self.projectiles) |*proj, i| {
                // TODO: do we need to check if objects are off screen?
                if (i == self.proj_index) {
                    break;
                }
                proj.update();
                proj.draw();
            }
        }
    }

    fn draw(self: *@This()) void {
        var xOff: u32 = 0;
        if (self.ticker % 20 > 10) {
            xOff = 16;
        }

        w4.DRAW_COLORS.* = 0x0432;
        w4.blitSub(sprites.boris.data, @intCast(i32, self.px) - @divTrunc(sprites.boris.width, 2), @intCast(i32, self.py), // x, y
            sprites.boris.height, sprites.boris.height, // w, h; Assumes square
            xOff, 0, // src_x, src_y
            sprites.boris.width, // Assumes stride and width are equal
            sprites.boris.flags);

        self.ticker += 1;
        // reduce cooldown if we can
        if (self.cooldown != 0) {
            self.cooldown -= 1;
        }
    }

    fn buttonDown(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            if (pl.isHeld(w4.BUTTON_DOWN)) {
                self.facing = .DOWN;
                return true;
            }
        } else {
            if (pl.isHeld(w4.BUTTON_UP)) {
                self.facing = .UP;
                return true;
            }
        }
        return false;
    }
    fn buttonUp(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            if (pl.isHeld(w4.BUTTON_UP)) {
                self.facing = .UP;
                return true;
            }
        } else {
            if (pl.isHeld(w4.BUTTON_DOWN)) {
                self.facing = .DOWN;
                return true;
            }
        }
        return false;
    }
    fn buttonRight(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            if (pl.isHeld(w4.BUTTON_RIGHT)) {
                self.facing = .RIGHT;
                return true;
            }
        } else {
            if (pl.isHeld(w4.BUTTON_LEFT)) {
                self.facing = .LEFT;
                return true;
            }
        }
        return false;
    }
    fn buttonLeft(self: *@This(), pl: *const gamepad.GamePad) bool {
        if (!self.inverted) {
            if (pl.isHeld(w4.BUTTON_LEFT)) {
                self.facing = .LEFT;
                return true;
            }
        } else {
            if (pl.isHeld(w4.BUTTON_RIGHT)) {
                self.facing = .RIGHT;
                return true;
            }
        }
        return false;
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
            self.cooldown = ACTION_COOLDOWN;
            self.throw();
        }
    }

    fn pushProjectile(self: *@This(), p: Projectile) void {
        self.projectiles[self.proj_index] = p;
        // if we reach end, circle around
        self.proj_index += 1;
        if (self.proj_index >= 128) {
            self.proj_index = 0;
        }
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
        const p = Projectile.init(sprites.vax, self.px, self.py, self.facing);
        self.pushProjectile(p);

        // please NEVER delete
        w4.tracef("%d", self.rnd.int(u32));
    }

    fn randomGavelSpawn(self: *@This()) void {
        const ri = self.rnd.int(u8); 
        if ( ri > GAVEL_SPAWN_CHANCE ) {
            var g = gavels.randomGavel(self.rnd);
            g.player_targetable = true;
            self.pushProjectile(g);
        }
    }

    fn checkCollisions(self: *@This()) void {
        for (self.projectiles) |*proj| {
            // check if any gavels have collided with player
            if (proj.player_targetable and proj.onScreen()) {
                if (proj.inArea(self.px, self.py, 4)) {
                    self.hit = true;
                    w4.trace("HIT");
                }
            }
        }
    }
};


fn drawCommons() void {
        w4.DRAW_COLORS.* = 0x0432;
        w4.blit(sprites.commons.data, 0, 0, // x, y
            sprites.commons.width, sprites.commons.height, sprites.commons.flags);

        // XXX: Hack the benches in. This will need to change.
        const b_width = sprites.bench.width;
        const b_height = sprites.bench.height;
        const x_flip = 0x2;
        const xs = .{ 17, 17 * 2 + b_width, 160 - 17 * 2 - b_width * 2, 160 - 17 - b_width };
        const ys = .{ 160 - 17 - b_height, 160 - 17 * 2 - b_height * 2 };
        w4.blit(sprites.bench.data, xs[0], ys[0], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags);
        w4.blit(sprites.bench.data, xs[1], ys[0], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags);
        w4.blit(sprites.bench.data, xs[0], ys[1], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags);
        w4.blit(sprites.bench.data, xs[1], ys[1], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags);

        w4.blit(sprites.bench.data, xs[2], ys[0], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags | x_flip);
        w4.blit(sprites.bench.data, xs[3], ys[0], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags | x_flip);
        w4.blit(sprites.bench.data, xs[2], ys[1], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags | x_flip);
        w4.blit(sprites.bench.data, xs[3], ys[1], // x, y
            sprites.bench.width, sprites.bench.height, sprites.bench.flags | x_flip);
}