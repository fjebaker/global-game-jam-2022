const w4 = @import("../wasm4.zig");
const sprites = @import("../assets/sprites.zig");
const projectile = @import("projectile.zig");
const std = @import("std");

const Projectile = projectile.Projectile;
const Facing = projectile.Facing;

const SCREEN_SIZE: u8 = 160;

pub fn randomGavel(rnd: *std.rand.Random) Projectile {
    // select a random edge
    const edge = rnd.intRangeLessThan(u8, 0, 4);
    // 0 is left, 1 is top, 2 is right, 3 is bottom

    // select a random starting location
    const pos = rnd.intRangeLessThan(u8, 0, SCREEN_SIZE);

    w4.tracef("%d %d", edge, pos);

    return switch (edge) {
        0 => Projectile.init(sprites.gavel, 0, pos, .RIGHT),
        1 => Projectile.init(sprites.gavel, pos, 0, .DOWN),
        2 => Projectile.init(sprites.gavel, 0, pos, .RIGHT),
        else => Projectile.init(sprites.gavel, pos, 0, .UP),
    };
}
