const w4 = @import("../wasm4.zig");
const sprites = @import("../assets/sprites.zig");
const std = @import("std");

pub const Facing = enum { UP, DOWN, LEFT, RIGHT };
const SCREEN_SIZE: u8 = 160;

pub const Projectile = struct {
    sprite: sprites.Image,
    x: u32,
    y: u32,
    xOff: u32 = 0,
    colors: u16 = 0x0432,

    velocity: u32 = 2,
    facing: Facing = .UP,
    player_targetable: bool = false,
    other_targetable: bool = false,

    pub fn init(sprite: sprites.Image, x: u32, y: u32, dir: Facing) Projectile {
        return Projectile{ .sprite = sprite, .x = x, .y = y, .facing = dir };
    }

    pub fn update(self: *@This()) void {
        //self.draw();
        self.move();
    }

    

    pub fn draw(self: *const @This()) void {
        var flags: u32 = switch(self.facing) {
            .UP => 0x4,
            .DOWN => 0x0,
            .LEFT => 0b1100,
            .RIGHT => 0x8,
        };
        w4.blitSub(self.sprite.data, @intCast(i32, self.x) - @divTrunc(self.sprite.width, 2), @intCast(i32, self.y), // x, y
            self.sprite.height, self.sprite.height, // w, h; Assumes square
            self.xOff, 0, // src_x, src_y
            self.sprite.width, // Assumes stride and width are equal
            self.sprite.flags|flags);
    }

    pub fn move(self: *@This()) void {
        w4.DRAW_COLORS.* = self.colors;
        switch (self.facing) {
            .UP => {
                self.y -= self.velocity;
            },
            .DOWN => {
                self.y += self.velocity;
            },
            .LEFT => {
                self.x -= self.velocity;
            },
            .RIGHT => {
                self.x += self.velocity;
            },
        }
    }

    pub fn inBounds(_: *const @This()) void {
        return true;
    }

    pub fn onScreen(self: *const @This()) bool {
        const y_good = self.y > 0 and self.y < SCREEN_SIZE;
        const x_good = self.x > 0 and self.x < SCREEN_SIZE;

        return y_good and x_good;
    }

    pub fn inArea(self: *const @This(), x: u8, y: u8, radius: u32) bool {
        const sqx: u32 = @intCast(u32, std.math.pow(i16, (@intCast(i16, x) - @intCast(i16, self.x)), 2));
        const sqy: u32 = @intCast(u32, std.math.pow(i16, (@intCast(i16, y) - @intCast(i16, self.y)), 2));

        return std.math.sqrt(sqx ^ 2 + sqy ^ 2) < radius;
    }
};
