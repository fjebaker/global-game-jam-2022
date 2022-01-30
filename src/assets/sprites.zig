pub const Image = struct {
    width: i32,
    height: i32,
    flags: u32,
    data: [*]u8,
};

// boris
var boris_bits = [_]u8{ 0xfd, 0xa9, 0x59, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xf6, 0x56, 0x65, 0x9f, 0xfd, 0xa5, 0x59, 0x7f, 0xd5, 0x59, 0x66, 0x5f, 0xf6, 0x56, 0x65, 0x9f, 0xf6, 0x69, 0xaa, 0x97, 0xd5, 0x59, 0x66, 0x5f, 0xca, 0x96, 0x96, 0x63, 0xf6, 0x69, 0xaa, 0x97, 0xca, 0xa2, 0xa2, 0xa3, 0xca, 0x96, 0x96, 0x63, 0xc2, 0xaa, 0xaa, 0xa3, 0xca, 0xa2, 0xa2, 0xa3, 0xf2, 0xa0, 0x02, 0x8f, 0xc2, 0xaa, 0xaa, 0xa3, 0xf0, 0xaa, 0xaa, 0x8f, 0xf2, 0xa0, 0x02, 0x8f, 0xfc, 0x00, 0x00, 0x0f, 0xf0, 0xaa, 0xaa, 0x8f, 0xfc, 0x56, 0x65, 0x4f, 0xfc, 0x00, 0x00, 0x0f, 0xfc, 0x46, 0x64, 0x4f, 0xfc, 0x56, 0x65, 0x4f, 0xfc, 0x46, 0xa4, 0x4f, 0xfc, 0x46, 0xa4, 0x4f, 0xfc, 0x40, 0x00, 0x4f, 0xfc, 0x40, 0x00, 0x4f, 0xff, 0x05, 0x54, 0x3f, 0xff, 0x05, 0x54, 0x3f, 0xff, 0x14, 0x04, 0xff, 0xff, 0x14, 0x04, 0xff };
pub const boris = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &boris_bits,
};

// flag
var flag_bits = [_]u8{ 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xcc, 0x3f, 0xfc, 0x3f, 0xcf, 0xfc, 0x0f, 0xff, 0xc1, 0x83, 0xf2, 0x4f, 0xc3, 0xc1, 0x13, 0xc3, 0xc0, 0x24, 0x08, 0x13, 0xc0, 0x29, 0x18, 0x03, 0xca, 0x45, 0x11, 0xa3, 0xc4, 0x05, 0x18, 0x13, 0xc4, 0x15, 0x14, 0x13, 0xca, 0x94, 0x05, 0xa3, 0xc1, 0x41, 0x11, 0x43, 0xc1, 0x41, 0x11, 0x43, 0xca, 0x14, 0x05, 0x93, 0xc4, 0x15, 0x14, 0x13, 0xc4, 0x65, 0x14, 0xa3, 0xca, 0x49, 0x15, 0xa3, 0xc0, 0x29, 0x1a, 0x13, 0xc4, 0x18, 0x08, 0x13, 0xc3, 0xc5, 0x18, 0x03, 0xc1, 0x43, 0xf2, 0x43, 0xcf, 0xf1, 0x13, 0xc3, 0xcc, 0x3f, 0xfc, 0x0f, 0xcf, 0xfc, 0x0f, 0xff, 0xcf, 0xff, 0xff, 0xff, 0xcf, 0xff, 0xff, 0xff, 0xcf, 0xff, 0xff, 0xff, 0xcf, 0xff, 0xff, 0xff, 0xcf, 0xff, 0xff, 0xff, 0xcf, 0xff, 0xff, 0xff, 0xcf, 0xff, 0xff, 0xff };
pub const flag = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &flag_bits,
};

// gavel
var gavel_bits = [_]u8{ 0xff, 0xff, 0xff, 0xff, 0xfe, 0x00, 0x80, 0xbf, 0xf8, 0x95, 0x65, 0x6f, 0xe0, 0x25, 0x59, 0x5b, 0xe0, 0x25, 0x59, 0x5b, 0xf8, 0x95, 0x65, 0x6f, 0xfe, 0x00, 0x80, 0xbf, 0xff, 0xfc, 0x4f, 0xff, 0xff, 0xfc, 0x4f, 0xff, 0xff, 0xfc, 0x4f, 0xff, 0xff, 0xfc, 0x4f, 0xff, 0xff, 0xfc, 0x4f, 0xff, 0xff, 0xfc, 0x4f, 0xff, 0xff, 0xfc, 0x8f, 0xff, 0xff, 0xfc, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xff };
pub const gavel = Image{
    .width = 16,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &gavel_bits,
};

// guest
var guest_bits = [_]u8{ 0xfc, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xf1, 0x6a, 0xaa, 0x8f, 0xfc, 0x00, 0x00, 0x3f, 0xc1, 0xaa, 0xaa, 0x83, 0xf1, 0x6a, 0xaa, 0x8f, 0xca, 0xaa, 0xaa, 0xa3, 0xc1, 0xaa, 0xaa, 0x83, 0xca, 0x95, 0x95, 0xa3, 0xca, 0xaa, 0xaa, 0xa3, 0xd5, 0xa2, 0xa2, 0x57, 0xca, 0x95, 0x95, 0xa3, 0xc9, 0x55, 0x55, 0x63, 0xd5, 0xa2, 0xa2, 0x57, 0xf2, 0x55, 0x55, 0x8f, 0xc9, 0x55, 0x55, 0x63, 0xf5, 0x55, 0x55, 0x5f, 0xf2, 0x55, 0x55, 0x8f, 0xfc, 0x00, 0x00, 0x0f, 0xf5, 0x55, 0x55, 0x5f, 0xfc, 0x56, 0x65, 0x4f, 0xfc, 0x00, 0x00, 0x0f, 0xfc, 0x46, 0x64, 0x4f, 0xfc, 0x56, 0x65, 0x4f, 0xfc, 0x46, 0xa4, 0x4f, 0xfc, 0x46, 0xa4, 0x4f, 0xfc, 0x40, 0x00, 0x4f, 0xfc, 0x40, 0x00, 0x4f, 0xff, 0x05, 0x54, 0x3f, 0xff, 0x05, 0x54, 0x3f, 0xff, 0x14, 0x04, 0xff, 0xff, 0x14, 0x04, 0xff };
pub const guest = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &guest_bits,
};

// house
var house_bits = [_]u8{ 0xfc, 0x04, 0x41, 0x14, 0x14, 0x51, 0x45, 0x3f, 0xf5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x5f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xca, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa3, 0xda, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa7, 0xd5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x57, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x5f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x6a, 0xaa, 0xaa, 0xa9, 0x55, 0x4f, 0xf5, 0x55, 0x59, 0x55, 0x55, 0x65, 0x55, 0x5f, 0xf1, 0xaa, 0x99, 0x55, 0x55, 0x66, 0xaa, 0x4f, 0xf1, 0xbb, 0x99, 0x55, 0x55, 0x66, 0xee, 0x4f, 0xf5, 0xaa, 0x99, 0x55, 0x55, 0x66, 0xaa, 0x4f, 0xf1, 0xbb, 0x9a, 0xaa, 0xaa, 0xa6, 0xee, 0x5f, 0xf5, 0xaa, 0x98, 0x00, 0x00, 0x26, 0xaa, 0x4f, 0xf5, 0xbf, 0x98, 0x00, 0x00, 0x26, 0xfe, 0x4f, 0xf1, 0xbf, 0x98, 0x00, 0x00, 0x26, 0xfe, 0x5f, 0xf1, 0xaa, 0x98, 0x00, 0x00, 0x26, 0xaa, 0x5f, 0xf1, 0x55, 0x58, 0x00, 0x00, 0x25, 0x55, 0x4f, 0xf5, 0x55, 0x58, 0x00, 0x00, 0x25, 0x55, 0x5f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x20, 0x00, 0x00, 0x31, 0x11, 0x18, 0x05, 0x50, 0x24, 0x44, 0x4c, 0x31, 0x11, 0x18, 0x00, 0x00, 0x24, 0x44, 0x4c, 0x31, 0x11, 0x18, 0x00, 0x00, 0x24, 0x44, 0x4c, 0x31, 0x11, 0x18, 0x00, 0x00, 0x24, 0x44, 0x4c, 0x00, 0x00, 0x08, 0x55, 0x55, 0x20, 0x00, 0x00 };
pub const house = Image{
    .width = 32,
    .height = 32,
    .flags = 1, // BLIT_2BPP
    .data = &house_bits,
};

// nhs
var nhs_bits = [_]u8{ 0xf5, 0x55, 0x55, 0x5f, 0xd5, 0x55, 0x55, 0x57, 0x55, 0x55, 0x55, 0x55, 0x65, 0x66, 0x59, 0xa9, 0x65, 0x66, 0x59, 0x95, 0x69, 0x66, 0x59, 0x95, 0x66, 0x66, 0xa9, 0xa9, 0x65, 0xa6, 0x59, 0x59, 0x65, 0x66, 0x59, 0x59, 0x65, 0x66, 0x59, 0xa9, 0x55, 0x55, 0x55, 0x55, 0x40, 0x00, 0x00, 0x01, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0xd5, 0x55, 0x55, 0x57, 0xf5, 0x55, 0x55, 0x5f };
pub const nhs = Image{
    .width = 16,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &nhs_bits,
};

// noten
var noten_bits = [_]u8{ 0xfc, 0x04, 0x41, 0x14, 0x14, 0x51, 0x45, 0x3f, 0xf5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x5f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xca, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa3, 0xda, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa7, 0xd5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x57, 0xf1, 0x54, 0x00, 0x55, 0x55, 0x00, 0x15, 0x4f, 0xf1, 0x50, 0x00, 0x04, 0x10, 0x00, 0x05, 0x4f, 0xf1, 0x40, 0x55, 0x02, 0x80, 0x55, 0x01, 0x5f, 0xf1, 0x51, 0x55, 0x52, 0x85, 0x55, 0x45, 0x4f, 0xf5, 0x51, 0x95, 0x50, 0x05, 0x56, 0x45, 0x4f, 0xf1, 0x51, 0x6a, 0xa8, 0x2a, 0xa9, 0x45, 0x4f, 0xf5, 0x51, 0x58, 0x05, 0x50, 0x25, 0x45, 0x5f, 0xf1, 0xa2, 0x98, 0x9a, 0xa6, 0x26, 0x8a, 0x4f, 0xf1, 0xb3, 0x98, 0x60, 0x09, 0x26, 0xce, 0x4f, 0xf5, 0xa2, 0x98, 0x82, 0x82, 0x26, 0x8a, 0x4f, 0xf1, 0xb3, 0x9a, 0xaa, 0xaa, 0xa6, 0xce, 0x5f, 0xf5, 0xa2, 0x98, 0x00, 0x00, 0x26, 0x8a, 0x4f, 0xf5, 0xb3, 0x98, 0x00, 0x00, 0x26, 0xce, 0x4f, 0xf1, 0xb3, 0x98, 0x28, 0xa8, 0x26, 0xce, 0x5f, 0xf1, 0xa2, 0x98, 0x08, 0x88, 0x26, 0x8a, 0x5f, 0xf1, 0x51, 0x58, 0x08, 0x88, 0x25, 0x45, 0x4f, 0xf5, 0x51, 0x58, 0x08, 0xa8, 0x25, 0x45, 0x5f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x20, 0x00, 0x00, 0x31, 0x11, 0x18, 0x05, 0x50, 0x24, 0x44, 0x4c, 0x31, 0x11, 0x18, 0x00, 0x00, 0x24, 0x44, 0x4c, 0x31, 0x11, 0x18, 0x00, 0x00, 0x24, 0x44, 0x4c, 0x31, 0x11, 0x18, 0x00, 0x00, 0x24, 0x44, 0x4c, 0x00, 0x00, 0x08, 0x55, 0x55, 0x20, 0x00, 0x00 };
pub const noten = Image{
    .width = 32,
    .height = 32,
    .flags = 1, // BLIT_2BPP
    .data = &noten_bits,
};

// pab
var pab_bits = [_]u8{ 0x54, 0x01, 0x40, 0x14, 0x01, 0x40, 0x14, 0x01, 0x55, 0x40, 0x51, 0x51, 0x15, 0x15, 0x54, 0x54, 0x45, 0x44, 0x55, 0x15, 0x51, 0x55, 0x55, 0x15, 0x10, 0x51, 0x44, 0x55, 0x54, 0x01, 0x40, 0x14, 0x05, 0x40, 0x54, 0x05, 0x55, 0x00, 0x11, 0x11, 0x51, 0x55, 0x54, 0x55, 0x45, 0x14, 0x55, 0x55, 0x15, 0x51, 0x55, 0x15, 0x11, 0x41, 0x51, 0x55, 0x54, 0x55, 0x45, 0x44, 0x01, 0x00, 0x50, 0x05, 0x55, 0x15, 0x11, 0x51, 0x51, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x50, 0x05, 0x15, 0x10, 0x01, 0x00, 0x14, 0x05, 0x15, 0x15, 0x55, 0x55, 0x55, 0x55, 0x51, 0x51, 0x15, 0x15, 0x15, 0x51, 0x51, 0x51, 0x05, 0x15, 0x55, 0x55, 0x55, 0x55, 0x50, 0x05, 0x15, 0x15, 0x15, 0x51, 0x51, 0x51, 0x11, 0x15, 0x55, 0x55, 0x55, 0x55, 0x51, 0x51, 0x15, 0x15, 0x15, 0x51, 0x51, 0x51, 0x14, 0x15, 0x55, 0x55, 0x55, 0x55, 0x50, 0x05, 0x40, 0x55, 0x15, 0x51, 0x54, 0x05, 0x15, 0x15, 0x55, 0x55 };
pub const pab = Image{
    .width = 56,
    .height = 12,
    .flags = 1, // BLIT_2BPP
    .data = &pab_bits,
};

// pavement
var pavement_bits = [_]u8{ 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
pub const pavement = Image{
    .width = 32,
    .height = 32,
    .flags = 1, // BLIT_2BPP
    .data = &pavement_bits,
};

// press
var press_bits = [_]u8{ 0xfc, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xf1, 0x6a, 0xaa, 0x8f, 0xfc, 0x00, 0x00, 0x3f, 0xc1, 0xaa, 0xaa, 0x83, 0xf1, 0x6a, 0xaa, 0x8f, 0xca, 0xaa, 0xaa, 0xa3, 0xc1, 0xaa, 0xaa, 0x83, 0xca, 0x95, 0x95, 0xa3, 0xca, 0xaa, 0xaa, 0xa3, 0xd5, 0xa2, 0xa2, 0x57, 0xca, 0x95, 0x95, 0xa3, 0xc9, 0x55, 0x55, 0x63, 0xd5, 0xa2, 0xa2, 0x57, 0xf2, 0x58, 0x22, 0xa7, 0xc9, 0x54, 0x11, 0x63, 0xf5, 0x50, 0x00, 0x03, 0xf2, 0x50, 0x00, 0x03, 0xfc, 0x00, 0x14, 0x10, 0xf5, 0x50, 0x28, 0x10, 0xfc, 0x50, 0x59, 0x20, 0xfc, 0x00, 0xaa, 0x20, 0xfc, 0x40, 0x55, 0x10, 0xfc, 0x40, 0xaa, 0x10, 0xfc, 0x50, 0x14, 0x10, 0xfc, 0x50, 0x28, 0x10, 0xfc, 0x00, 0x00, 0x00, 0xfc, 0x00, 0x00, 0x00, 0xff, 0x04, 0x00, 0x03, 0xff, 0x04, 0x00, 0x03, 0xff, 0x14, 0x14, 0xff, 0xff, 0x14, 0x14, 0xff };
pub const press = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &press_bits,
};

// title
var title_bits = [_]u8{ 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf0, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfc, 0x00, 0x00, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xc1, 0x55, 0x55, 0x30, 0x00, 0x0f, 0xc0, 0x00, 0xfc, 0x00, 0x03, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x3f, 0xff, 0xfc, 0x55, 0x55, 0x43, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xc5, 0x55, 0x55, 0x01, 0x55, 0x43, 0xc5, 0x54, 0x3c, 0x55, 0x50, 0xc5, 0x55, 0x40, 0x54, 0x05, 0x40, 0x50, 0x15, 0x55, 0x3f, 0xff, 0xfc, 0x55, 0x55, 0x53, 0xc0, 0x00, 0x30, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0c, 0x00, 0xff, 0xc5, 0x55, 0x00, 0x05, 0x55, 0x50, 0x05, 0x55, 0x00, 0x51, 0x54, 0x05, 0x55, 0x51, 0x15, 0x11, 0x51, 0x50, 0x55, 0x55, 0x3f, 0xff, 0xfc, 0x55, 0x41, 0x50, 0x05, 0x55, 0x00, 0x55, 0x50, 0x05, 0x55, 0x41, 0x50, 0x54, 0xff, 0xc5, 0x55, 0x3f, 0xc5, 0x40, 0x14, 0x55, 0x01, 0x45, 0x50, 0x00, 0x15, 0x41, 0x41, 0x15, 0x11, 0x51, 0x51, 0x54, 0x05, 0x3f, 0xff, 0xfc, 0x55, 0x41, 0x50, 0x55, 0x01, 0x45, 0x50, 0x14, 0x15, 0x55, 0x41, 0x54, 0x54, 0xff, 0xc5, 0x54, 0x3f, 0xc5, 0x40, 0x54, 0x55, 0x01, 0x45, 0x55, 0x54, 0x15, 0x50, 0x01, 0x55, 0x15, 0x55, 0x51, 0x54, 0x00, 0x3f, 0xff, 0xfc, 0x55, 0x41, 0x50, 0x55, 0x01, 0x45, 0x50, 0x14, 0x01, 0x54, 0x00, 0x55, 0x50, 0xff, 0xc5, 0x54, 0xff, 0xc5, 0x55, 0x40, 0x55, 0x01, 0x41, 0x55, 0x55, 0x05, 0x55, 0x51, 0x55, 0x15, 0x55, 0x51, 0x54, 0x15, 0x3f, 0xff, 0xfc, 0x55, 0x55, 0x50, 0x55, 0x55, 0x45, 0x55, 0x50, 0xf1, 0x54, 0xfc, 0x15, 0x43, 0xff, 0xc5, 0x54, 0x00, 0x05, 0x55, 0x50, 0x55, 0x01, 0x40, 0x00, 0x55, 0x00, 0x01, 0x51, 0x55, 0x15, 0x51, 0x51, 0x54, 0x05, 0x3f, 0xff, 0xfc, 0x55, 0x55, 0x40, 0x55, 0x15, 0x45, 0x55, 0x50, 0xf1, 0x54, 0xff, 0x05, 0x4f, 0xff, 0xc5, 0x55, 0x55, 0x05, 0x51, 0x54, 0x55, 0x55, 0x45, 0x55, 0x15, 0x15, 0x51, 0x51, 0x55, 0x15, 0x51, 0x51, 0x55, 0x55, 0x3f, 0xff, 0xfc, 0x55, 0x40, 0x0c, 0x55, 0x05, 0x45, 0x50, 0x54, 0xf1, 0x54, 0xff, 0xc5, 0x4f, 0xff, 0xc5, 0x55, 0x59, 0x05, 0x50, 0x54, 0x55, 0x59, 0x05, 0x55, 0x54, 0x15, 0x55, 0x41, 0x55, 0x15, 0x51, 0x50, 0x55, 0x65, 0x3f, 0xff, 0xfc, 0x56, 0x4f, 0xfc, 0x59, 0x05, 0x45, 0x50, 0x14, 0xf1, 0x64, 0xff, 0xc6, 0x4f, 0xff, 0xc1, 0x55, 0x55, 0x01, 0x40, 0x10, 0x15, 0x55, 0x01, 0x55, 0x50, 0x05, 0x55, 0x00, 0x54, 0x05, 0x41, 0x50, 0x15, 0x54, 0x3f, 0xff, 0xfc, 0x55, 0x4f, 0xfc, 0x55, 0x01, 0x41, 0x53, 0x00, 0xf0, 0x54, 0xff, 0xc5, 0x4f, 0xff, 0xf0, 0x00, 0x00, 0x30, 0x0f, 0x03, 0x00, 0x00, 0x30, 0x00, 0x03, 0x00, 0x00, 0x0c, 0x00, 0xc0, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xfc, 0x00, 0x0f, 0xfc, 0x00, 0xc0, 0x00, 0x03, 0xff, 0xfc, 0x00, 0xff, 0xc0, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x4f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xc0, 0x15, 0x55, 0x55, 0x40, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xc5, 0x40, 0x15, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xc5, 0x40, 0x15, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0xc0, 0x00, 0x00, 0x3f, 0xff, 0x00, 0x00, 0x00, 0xff, 0xfc, 0x00, 0x3f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0xc5, 0x41, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0xc5, 0x55, 0x55, 0x3f, 0xff, 0x15, 0x55, 0x54, 0xff, 0xfc, 0x55, 0x3f, 0xff, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xff, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xc5, 0x41, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0xc5, 0x55, 0x55, 0x3f, 0xff, 0x15, 0x55, 0x54, 0xff, 0xfc, 0x55, 0x3f, 0xff, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xff, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xc5, 0x41, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x05, 0x55, 0x55, 0x03, 0xf0, 0x15, 0x55, 0x54, 0x3f, 0xc0, 0x55, 0x00, 0xc0, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x40, 0xff, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x43, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x14, 0x00, 0x55, 0x53, 0xf1, 0x50, 0x05, 0x55, 0x3f, 0xc5, 0x55, 0x54, 0xc5, 0x40, 0x05, 0x55, 0x55, 0x55, 0x55, 0x54, 0xff, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x14, 0x00, 0x55, 0x53, 0xf1, 0x50, 0x05, 0x55, 0x3f, 0xc5, 0x55, 0x54, 0xc5, 0x40, 0x05, 0x55, 0x55, 0x55, 0x56, 0xa4, 0xfc, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x14, 0x15, 0x55, 0x53, 0xf1, 0x51, 0x55, 0x55, 0x3f, 0xc5, 0x55, 0x54, 0xc5, 0x40, 0x55, 0x55, 0x55, 0x55, 0x56, 0x54, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x6a, 0x43, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x14, 0x15, 0x55, 0x53, 0xf1, 0x51, 0x55, 0x55, 0x00, 0xc5, 0x55, 0x54, 0xc5, 0x40, 0x55, 0x55, 0x55, 0x55, 0x6a, 0x40, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x53, 0xf1, 0x55, 0x55, 0x55, 0x54, 0xc5, 0x55, 0x54, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x50, 0x00, 0x00, 0x0f, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x53, 0xf1, 0x55, 0x55, 0x55, 0x54, 0x05, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x40, 0x00, 0x00, 0x0f, 0xf1, 0x55, 0x55, 0x55, 0x40, 0x00, 0x00, 0x0f, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x40, 0x00, 0x00, 0x0f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x40, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x43, 0xc5, 0x55, 0x55, 0x55, 0x64, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0xf0, 0x05, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x64, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0xff, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x64, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x53, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x5a, 0x94, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x55, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x53, 0xf1, 0x55, 0x55, 0x55, 0x01, 0x55, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x40, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x15, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x54, 0xff, 0xff, 0xff, 0xff, 0x15, 0x55, 0x55, 0x53, 0xf1, 0x55, 0x55, 0x55, 0x30, 0x05, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x40, 0x00, 0x00, 0x0f, 0xff, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x54, 0x00, 0x00, 0x03, 0xff, 0x15, 0x55, 0x55, 0x53, 0xf1, 0x55, 0x55, 0x55, 0x3f, 0xc5, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x40, 0x00, 0x00, 0x0f, 0xf0, 0x05, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xff, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x55, 0x3f, 0xc5, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x93, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xff, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x55, 0x3f, 0xc5, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x93, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x50, 0x3f, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x59, 0x3f, 0xc5, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x40, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x93, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x3f, 0x15, 0x55, 0x56, 0x93, 0xf1, 0x55, 0x55, 0x59, 0x3f, 0xc5, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x93, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x59, 0x3f, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x59, 0x3f, 0xc5, 0x55, 0x64, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x64, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x93, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x69, 0x3f, 0x15, 0x55, 0x55, 0x93, 0xf1, 0x55, 0x55, 0x59, 0x3f, 0xc5, 0x55, 0xa4, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x56, 0xa4, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0xaa, 0x53, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x3f, 0x15, 0x55, 0x59, 0x53, 0xf1, 0x55, 0x55, 0x55, 0x3f, 0xc5, 0x55, 0x54, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x55, 0x56, 0x54, 0xf1, 0x55, 0x55, 0x55, 0x55, 0x55, 0x95, 0x43, 0xc0, 0x15, 0x55, 0x55, 0x55, 0x6a, 0xaa, 0x90, 0x3f, 0x05, 0x55, 0x69, 0x03, 0xf0, 0x15, 0x6a, 0x94, 0x3f, 0xc0, 0x59, 0x00, 0xc0, 0x15, 0x55, 0x55, 0x6a, 0xaa, 0xaa, 0x40, 0xf0, 0x05, 0x55, 0x55, 0x55, 0x5a, 0x90, 0x0f, 0xff, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x53, 0xff, 0xc5, 0x55, 0x55, 0x3f, 0xff, 0x15, 0x55, 0x54, 0xff, 0xfc, 0x55, 0x3f, 0xff, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x4f, 0xff, 0xc5, 0x55, 0x55, 0x55, 0x55, 0x53, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0xc0, 0x00, 0x00, 0x3f, 0xff, 0x00, 0x00, 0x00, 0xff, 0xfc, 0x00, 0x3f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
pub const title = Image{
    .width = 148,
    .height = 54,
    .flags = 1, // BLIT_2BPP
    .data = &title_bits,
};

// vax
var vax_bits = [_]u8{ 0xff, 0x00, 0x03, 0xff, 0xff, 0xf2, 0x3f, 0xff, 0xff, 0xf2, 0x3f, 0xff, 0xf3, 0xf2, 0x3f, 0x3f, 0xf0, 0x00, 0x00, 0x3f, 0xf3, 0xcf, 0xcf, 0x3f, 0xff, 0xc5, 0x0f, 0xff, 0xff, 0xc5, 0x4f, 0xff, 0xff, 0xc5, 0x0f, 0xff, 0xff, 0xc5, 0x4f, 0xff, 0xff, 0xc5, 0x0f, 0xff, 0xff, 0xc5, 0x4f, 0xff, 0xff, 0xf1, 0x3f, 0xff, 0xff, 0xf0, 0x3f, 0xff, 0xff, 0xfd, 0xff, 0xff, 0xff, 0xfd, 0xff, 0xff };
pub const vax = Image{
    .width = 16,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &vax_bits,
};
