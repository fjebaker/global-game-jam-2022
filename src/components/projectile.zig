const w4 = @import("../wasm4.zig");
const sprites = @import("../assets/sprites.zig");

pub const Facing = enum { UP, DOWN, LEFT, RIGHT };

pub const Projectile = struct {
    sprite: sprites.Image,
    x: u32,
    y: u32,
    xOff: u32 = 0,

    velocity: u32 = 2,
    facing: Facing = .UP,

    pub fn init(sprite: sprites.Image, x: u32, y: u32) Projectile {
        return Projectile{
            .sprite = sprite,
            .x = x,
            .y = y
        };
    }

    pub fn update(_: *const @This()) bool {
        //self.draw();
    }

    pub fn draw(self: *const @This()) void {
        w4.blitSub(self.sprite.data, @intCast(i32, self.x) - @divTrunc(self.sprite.width, 2), @intCast(i32, self.y), // x, y
            self.sprite.height, self.sprite.height, // w, h; Assumes square
            self.xOff, 0, // src_x, src_y
            self.sprite.width, // Assumes stride and width are equal
            self.sprite.flags);
    }

    pub fn inBounds(_: *const @This()) void {
        return true;
    }
};
