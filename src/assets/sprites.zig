pub const Image = struct {
    width: i32,
    height: i32,
    flags: u32,
    data: [*]u8,
};

// flag
var flag_bits = [_]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x40, 0x01, 0x40, 0x10, 0x01, 0x50, 0x00, 0x16, 0xd4, 0x07, 0x90, 0x14, 0x16, 0x64, 0x14, 0x15, 0x79, 0x5d, 0x64, 0x15, 0x7e, 0x6d, 0x54, 0x1f, 0x9a, 0x66, 0xf4, 0x19, 0x5a, 0x6d, 0x64, 0x19, 0x6a, 0x69, 0x64, 0x1f, 0xe9, 0x5a, 0xf4, 0x16, 0x96, 0x66, 0x94, 0x16, 0x96, 0x66, 0x94, 0x1f, 0x69, 0x5a, 0xe4, 0x19, 0x6a, 0x69, 0x64, 0x19, 0xba, 0x69, 0xf4, 0x1f, 0x9e, 0x6a, 0xf4, 0x15, 0x7e, 0x6f, 0x64, 0x19, 0x6d, 0x5d, 0x64, 0x14, 0x1a, 0x6d, 0x54, 0x16, 0x94, 0x07, 0x94, 0x10, 0x06, 0x64, 0x14, 0x11, 0x40, 0x01, 0x50, 0x10, 0x01, 0x50, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00 };
pub const flag = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &flag_bits,
};
// title
var title_bits = [_]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x55, 0x55, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x55, 0x55, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xaa, 0xaa, 0x45, 0x55, 0x50, 0x15, 0x55, 0x01, 0x55, 0x54, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0x55, 0x55, 0x40, 0x00, 0x01, 0xaa, 0xaa, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1a, 0xaa, 0xaa, 0x56, 0xaa, 0x94, 0x1a, 0xa9, 0x41, 0xaa, 0xa5, 0x1a, 0xaa, 0x95, 0xa9, 0x5a, 0x95, 0xa5, 0x6a, 0xaa, 0x40, 0x00, 0x01, 0xaa, 0xaa, 0xa4, 0x15, 0x55, 0x45, 0x55, 0x54, 0x55, 0x55, 0x55, 0x51, 0x55, 0x00, 0x1a, 0xaa, 0x55, 0x5a, 0xaa, 0xa5, 0x5a, 0xaa, 0x55, 0xa6, 0xa9, 0x5a, 0xaa, 0xa6, 0x6a, 0x66, 0xa6, 0xa5, 0xaa, 0xaa, 0x40, 0x00, 0x01, 0xaa, 0x96, 0xa5, 0x5a, 0xaa, 0x55, 0xaa, 0xa5, 0x5a, 0xaa, 0x96, 0xa5, 0xa9, 0x00, 0x1a, 0xaa, 0x40, 0x1a, 0x95, 0x69, 0xaa, 0x56, 0x9a, 0xa5, 0x55, 0x6a, 0x96, 0x96, 0x6a, 0x66, 0xa6, 0xa6, 0xa9, 0x5a, 0x40, 0x00, 0x01, 0xaa, 0x96, 0xa5, 0xaa, 0x56, 0x9a, 0xa5, 0x69, 0x6a, 0xaa, 0x96, 0xa9, 0xa9, 0x00, 0x1a, 0xa9, 0x40, 0x1a, 0x95, 0xa9, 0xaa, 0x56, 0x9a, 0xaa, 0xa9, 0x6a, 0xa5, 0x56, 0xaa, 0x6a, 0xaa, 0xa6, 0xa9, 0x55, 0x40, 0x00, 0x01, 0xaa, 0x96, 0xa5, 0xaa, 0x56, 0x9a, 0xa5, 0x69, 0x56, 0xa9, 0x55, 0xaa, 0xa5, 0x00, 0x1a, 0xa9, 0x00, 0x1a, 0xaa, 0x95, 0xaa, 0x56, 0x96, 0xaa, 0xaa, 0x5a, 0xaa, 0xa6, 0xaa, 0x6a, 0xaa, 0xa6, 0xa9, 0x6a, 0x40, 0x00, 0x01, 0xaa, 0xaa, 0xa5, 0xaa, 0xaa, 0x9a, 0xaa, 0xa5, 0x06, 0xa9, 0x01, 0x6a, 0x94, 0x00, 0x1a, 0xa9, 0x55, 0x5a, 0xaa, 0xa5, 0xaa, 0x56, 0x95, 0x55, 0xaa, 0x55, 0x56, 0xa6, 0xaa, 0x6a, 0xa6, 0xa6, 0xa9, 0x5a, 0x40, 0x00, 0x01, 0xaa, 0xaa, 0x95, 0xaa, 0x6a, 0x9a, 0xaa, 0xa5, 0x06, 0xa9, 0x00, 0x5a, 0x90, 0x00, 0x1a, 0xaa, 0xaa, 0x5a, 0xa6, 0xa9, 0xaa, 0xaa, 0x9a, 0xaa, 0x6a, 0x6a, 0xa6, 0xa6, 0xaa, 0x6a, 0xa6, 0xa6, 0xaa, 0xaa, 0x40, 0x00, 0x01, 0xaa, 0x95, 0x51, 0xaa, 0x5a, 0x9a, 0xa5, 0xa9, 0x06, 0xa9, 0x00, 0x1a, 0x90, 0x00, 0x1a, 0xaa, 0xae, 0x5a, 0xa5, 0xa9, 0xaa, 0xae, 0x5a, 0xaa, 0xa9, 0x6a, 0xaa, 0x96, 0xaa, 0x6a, 0xa6, 0xa5, 0xaa, 0xba, 0x40, 0x00, 0x01, 0xab, 0x90, 0x01, 0xae, 0x5a, 0x9a, 0xa5, 0x69, 0x06, 0xb9, 0x00, 0x1b, 0x90, 0x00, 0x16, 0xaa, 0xaa, 0x56, 0x95, 0x65, 0x6a, 0xaa, 0x56, 0xaa, 0xa5, 0x5a, 0xaa, 0x55, 0xa9, 0x5a, 0x96, 0xa5, 0x6a, 0xa9, 0x40, 0x00, 0x01, 0xaa, 0x90, 0x01, 0xaa, 0x56, 0x96, 0xa4, 0x55, 0x05, 0xa9, 0x00, 0x1a, 0x90, 0x00, 0x05, 0x55, 0x55, 0x45, 0x50, 0x54, 0x55, 0x55, 0x45, 0x55, 0x54, 0x55, 0x55, 0x51, 0x55, 0x15, 0x55, 0x55, 0x55, 0x55, 0x00, 0x00, 0x01, 0x55, 0x50, 0x01, 0x55, 0x15, 0x55, 0x54, 0x00, 0x01, 0x55, 0x00, 0x15, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x55, 0x55, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x6a, 0xaa, 0xaa, 0x95, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x95, 0x6a, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x95, 0x6a, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x15, 0x55, 0x55, 0x40, 0x00, 0x55, 0x55, 0x55, 0x00, 0x01, 0x55, 0x40, 0x00, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x50, 0x00, 0x05, 0x55, 0x55, 0x55, 0x55, 0x55, 0x50, 0x1a, 0x96, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x1a, 0xaa, 0xaa, 0x40, 0x00, 0x6a, 0xaa, 0xa9, 0x00, 0x01, 0xaa, 0x40, 0x00, 0x6a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x00, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x1a, 0x96, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x1a, 0xaa, 0xaa, 0x40, 0x00, 0x6a, 0xaa, 0xa9, 0x00, 0x01, 0xaa, 0x40, 0x00, 0x6a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x00, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x1a, 0x96, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x5a, 0xaa, 0xaa, 0x54, 0x05, 0x6a, 0xaa, 0xa9, 0x40, 0x15, 0xaa, 0x55, 0x15, 0x6a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x95, 0x00, 0x6a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x94, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x69, 0x55, 0xaa, 0xa4, 0x06, 0xa5, 0x5a, 0xaa, 0x40, 0x1a, 0xaa, 0xa9, 0x1a, 0x95, 0x5a, 0xaa, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x6a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x69, 0x55, 0xaa, 0xa4, 0x06, 0xa5, 0x5a, 0xaa, 0x40, 0x1a, 0xaa, 0xa9, 0x1a, 0x95, 0x5a, 0xaa, 0xaa, 0xaa, 0xab, 0xf9, 0x01, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x69, 0x6a, 0xaa, 0xa4, 0x06, 0xa6, 0xaa, 0xaa, 0x40, 0x1a, 0xaa, 0xa9, 0x1a, 0x95, 0xaa, 0xaa, 0xaa, 0xaa, 0xab, 0xa9, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xbf, 0x94, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x69, 0x6a, 0xaa, 0xa4, 0x06, 0xa6, 0xaa, 0xaa, 0x55, 0x1a, 0xaa, 0xa9, 0x1a, 0x95, 0xaa, 0xaa, 0xaa, 0xaa, 0xbf, 0x95, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xa4, 0x06, 0xaa, 0xaa, 0xaa, 0xa9, 0x1a, 0xaa, 0xa9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xa5, 0x55, 0x55, 0x50, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xa4, 0x06, 0xaa, 0xaa, 0xaa, 0xa9, 0x5a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0x95, 0x55, 0x55, 0x50, 0x06, 0xaa, 0xaa, 0xaa, 0x95, 0x55, 0x55, 0x50, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0x95, 0x55, 0x55, 0x50, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x95, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x94, 0x1a, 0xaa, 0xaa, 0xaa, 0xb9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa9, 0x05, 0x5a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xb9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xb9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xa4, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaf, 0xe9, 0x00, 0x15, 0x55, 0x55, 0x55, 0xaa, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xa4, 0x06, 0xaa, 0xaa, 0xaa, 0x56, 0xaa, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x95, 0x00, 0x15, 0x55, 0x55, 0x55, 0x6a, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x6a, 0xaa, 0xaa, 0xa4, 0x06, 0xaa, 0xaa, 0xaa, 0x45, 0x5a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0x95, 0x55, 0x55, 0x50, 0x00, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xa9, 0x55, 0x55, 0x54, 0x00, 0x6a, 0xaa, 0xaa, 0xa4, 0x06, 0xaa, 0xaa, 0xaa, 0x40, 0x1a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0x95, 0x55, 0x55, 0x50, 0x05, 0x5a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x00, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xaa, 0x40, 0x1a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xe4, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x00, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xaa, 0x40, 0x1a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xe4, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa5, 0x40, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xae, 0x40, 0x1a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x95, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xe4, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x40, 0x6a, 0xaa, 0xab, 0xe4, 0x06, 0xaa, 0xaa, 0xae, 0x40, 0x1a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa9, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xe4, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xae, 0x40, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xae, 0x40, 0x1a, 0xaa, 0xb9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xb9, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xe4, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xbe, 0x40, 0x6a, 0xaa, 0xaa, 0xe4, 0x06, 0xaa, 0xaa, 0xae, 0x40, 0x1a, 0xaa, 0xf9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xab, 0xf9, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xa4, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x40, 0x6a, 0xaa, 0xae, 0xa4, 0x06, 0xaa, 0xaa, 0xaa, 0x40, 0x1a, 0xaa, 0xa9, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xab, 0xa9, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0x94, 0x15, 0x6a, 0xaa, 0xaa, 0xaa, 0xbf, 0xff, 0xe5, 0x40, 0x5a, 0xaa, 0xbe, 0x54, 0x05, 0x6a, 0xbf, 0xe9, 0x40, 0x15, 0xae, 0x55, 0x15, 0x6a, 0xaa, 0xaa, 0xbf, 0xff, 0xff, 0x95, 0x05, 0x5a, 0xaa, 0xaa, 0xaa, 0xaf, 0xe5, 0x50, 0x00, 0x6a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x00, 0x1a, 0xaa, 0xaa, 0x40, 0x00, 0x6a, 0xaa, 0xa9, 0x00, 0x01, 0xaa, 0x40, 0x00, 0x6a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x00, 0x1a, 0xaa, 0xaa, 0xaa, 0xaa, 0xa4, 0x00, 0x00, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0x00, 0x15, 0x55, 0x55, 0x40, 0x00, 0x55, 0x55, 0x55, 0x00, 0x01, 0x55, 0x40, 0x00, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x50, 0x00, 0x15, 0x55, 0x55, 0x55, 0x55, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
pub const title = Image{
    .width = 148,
    .height = 54,
    .flags = 1, // BLIT_2BPP
    .data = &title_bits,
};
// pab
var pab_bits = [_]u8{ 0x1e, 0x79, 0xe7, 0x9e, 0x07, 0x22, 0x88, 0x11, 0x45, 0x08, 0x20, 0x08, 0xb2, 0x50, 0x1e, 0x79, 0xc7, 0x1c, 0x0f, 0xaa, 0x20, 0x10, 0x49, 0x00, 0x82, 0x08, 0xa6, 0x20, 0x10, 0x45, 0xef, 0x3c, 0x08, 0xa2, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x8b, 0xef, 0x9c, 0x88, 0x00, 0x00, 0x22, 0x88, 0x82, 0x22, 0xc8, 0x00, 0x00, 0x3c, 0x88, 0x82, 0x22, 0xa8, 0x00, 0x00, 0x22, 0x88, 0x82, 0x22, 0x98, 0x00, 0x00, 0x3c, 0x70, 0x82, 0x1c, 0x88, 0x00 };
pub const pab = Image{
    .width = 56,
    .height = 12,
    .flags = 0, // BLIT_1BPP
    .data = &pab_bits,
};
// guest
var guest_bits = [_]u8{ 0x01, 0x55, 0x55, 0x40, 0x00, 0x00, 0x00, 0x00, 0x06, 0xbf, 0xff, 0xd0, 0x01, 0x55, 0x55, 0x40, 0x16, 0xff, 0xff, 0xd4, 0x06, 0xbf, 0xff, 0xd0, 0x1f, 0xff, 0xff, 0xf4, 0x16, 0xff, 0xff, 0xd4, 0x1f, 0xea, 0xea, 0xf4, 0x1f, 0xff, 0xff, 0xf4, 0x2a, 0xf7, 0xf7, 0xa8, 0x1f, 0xea, 0xea, 0xf4, 0x1e, 0xaa, 0xaa, 0xb4, 0x2a, 0xf7, 0xf7, 0xa8, 0x07, 0xaa, 0xaa, 0xd0, 0x1e, 0xaa, 0xaa, 0xb4, 0x0a, 0xaa, 0xaa, 0xa0, 0x07, 0xaa, 0xaa, 0xd0, 0x01, 0x55, 0x55, 0x50, 0x0a, 0xaa, 0xaa, 0xa0, 0x01, 0xab, 0xba, 0x90, 0x01, 0x55, 0x55, 0x50, 0x01, 0x9b, 0xb9, 0x90, 0x01, 0xab, 0xba, 0x90, 0x01, 0x9b, 0xf9, 0x90, 0x01, 0x9b, 0xf9, 0x90, 0x01, 0x95, 0x55, 0x90, 0x01, 0x95, 0x55, 0x90, 0x00, 0x5a, 0xa9, 0x40, 0x00, 0x5a, 0xa9, 0x40, 0x00, 0x69, 0x59, 0x00, 0x00, 0x69, 0x59, 0x00 };
pub const guest = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &guest_bits,
};
// pavement
var pavement_bits = [_]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
pub const pavement = Image{
    .width = 32,
    .height = 32,
    .flags = 1, // BLIT_2BPP
    .data = &pavement_bits,
};
// house
var house_bits = [_]u8{ 0x01, 0x59, 0x96, 0x69, 0x69, 0xa6, 0x9a, 0x40, 0x0a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x0a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0x1f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf4, 0x2f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf8, 0x2a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa8, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x0a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xbf, 0xff, 0xff, 0xfe, 0xaa, 0x90, 0x0a, 0xaa, 0xae, 0xaa, 0xaa, 0xba, 0xaa, 0xa0, 0x06, 0xff, 0xee, 0xaa, 0xaa, 0xbb, 0xff, 0x90, 0x06, 0xcc, 0xee, 0xaa, 0xaa, 0xbb, 0x33, 0x90, 0x0a, 0xff, 0xee, 0xaa, 0xaa, 0xbb, 0xff, 0x90, 0x06, 0xcc, 0xef, 0xff, 0xff, 0xfb, 0x33, 0xa0, 0x0a, 0xff, 0xed, 0x55, 0x55, 0x7b, 0xff, 0x90, 0x0a, 0xc0, 0xed, 0x55, 0x55, 0x7b, 0x03, 0x90, 0x06, 0xc0, 0xed, 0x55, 0x55, 0x7b, 0x03, 0xa0, 0x06, 0xff, 0xed, 0x55, 0x55, 0x7b, 0xff, 0xa0, 0x06, 0xaa, 0xad, 0x55, 0x55, 0x7a, 0xaa, 0x90, 0x0a, 0xaa, 0xad, 0x55, 0x55, 0x7a, 0xaa, 0xa0, 0x55, 0x55, 0x5d, 0x55, 0x55, 0x75, 0x55, 0x55, 0x46, 0x66, 0x6d, 0x5a, 0xa5, 0x79, 0x99, 0x91, 0x46, 0x66, 0x6d, 0x55, 0x55, 0x79, 0x99, 0x91, 0x46, 0x66, 0x6d, 0x55, 0x55, 0x79, 0x99, 0x91, 0x46, 0x66, 0x6d, 0x55, 0x55, 0x79, 0x99, 0x91, 0x55, 0x55, 0x5d, 0xaa, 0xaa, 0x75, 0x55, 0x55 };
pub const house = Image{
    .width = 32,
    .height = 32,
    .flags = 1, // BLIT_2BPP
    .data = &house_bits,
};
// boris
var boris_bits = [_]u8{ 0x01, 0xa9, 0x59, 0x40, 0x00, 0x00, 0x00, 0x00, 0x06, 0x56, 0x65, 0x90, 0x01, 0xa5, 0x59, 0x40, 0x15, 0x59, 0x66, 0x50, 0x06, 0x56, 0x65, 0x90, 0x06, 0x69, 0xaa, 0x94, 0x15, 0x59, 0x66, 0x50, 0x3a, 0x96, 0x96, 0x6c, 0x06, 0x69, 0xaa, 0x94, 0x3a, 0xae, 0xae, 0xac, 0x3a, 0x96, 0x96, 0x6c, 0x3e, 0xaa, 0xaa, 0xac, 0x3a, 0xae, 0xae, 0xac, 0x0e, 0xaf, 0xfe, 0xb0, 0x3e, 0xaa, 0xaa, 0xac, 0x0f, 0xaa, 0xaa, 0xb0, 0x0e, 0xaf, 0xfe, 0xb0, 0x03, 0xff, 0xff, 0xf0, 0x0f, 0xaa, 0xaa, 0xb0, 0x03, 0x56, 0x65, 0x70, 0x03, 0xff, 0xff, 0xf0, 0x03, 0x76, 0x67, 0x70, 0x03, 0x56, 0x65, 0x70, 0x03, 0x76, 0xa7, 0x70, 0x03, 0x76, 0xa7, 0x70, 0x03, 0x7f, 0xff, 0x70, 0x03, 0x7f, 0xff, 0x70, 0x00, 0xf5, 0x57, 0xc0, 0x00, 0xf5, 0x57, 0xc0, 0x00, 0xd7, 0xf7, 0x00, 0x00, 0xd7, 0xf7, 0x00 };
pub const boris = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &boris_bits,
};
// noten
var noten_bits = [_]u8{ 0x01, 0x59, 0x96, 0x69, 0x69, 0xa6, 0x9a, 0x40, 0x0a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x06, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x0a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x90, 0x15, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0x1f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf4, 0x2f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf8, 0x2a, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa8, 0x06, 0xa9, 0x55, 0xaa, 0xaa, 0x55, 0x6a, 0x90, 0x06, 0xa5, 0x55, 0x59, 0x65, 0x55, 0x5a, 0x90, 0x06, 0x95, 0xaa, 0x57, 0xd5, 0xaa, 0x56, 0xa0, 0x06, 0xa6, 0xaa, 0xa7, 0xda, 0xaa, 0x9a, 0x90, 0x0a, 0xa6, 0xea, 0xa5, 0x5a, 0xab, 0x9a, 0x90, 0x06, 0xa6, 0xbf, 0xfd, 0x7f, 0xfe, 0x9a, 0x90, 0x0a, 0xa6, 0xad, 0x5a, 0xa5, 0x7a, 0x9a, 0xa0, 0x06, 0xf7, 0xed, 0xef, 0xfb, 0x7b, 0xdf, 0x90, 0x06, 0xc4, 0xed, 0xb5, 0x5e, 0x7b, 0x13, 0x90, 0x0a, 0xf7, 0xed, 0xd7, 0xd7, 0x7b, 0xdf, 0x90, 0x06, 0xc4, 0xef, 0xff, 0xff, 0xfb, 0x13, 0xa0, 0x0a, 0xf7, 0xed, 0x55, 0x55, 0x7b, 0xdf, 0x90, 0x0a, 0xc4, 0xed, 0x55, 0x55, 0x7b, 0x13, 0x90, 0x06, 0xc4, 0xed, 0x7d, 0xfd, 0x7b, 0x13, 0xa0, 0x06, 0xf7, 0xed, 0x5d, 0xdd, 0x7b, 0xdf, 0xa0, 0x06, 0xa6, 0xad, 0x5d, 0xdd, 0x7a, 0x9a, 0x90, 0x0a, 0xa6, 0xad, 0x5d, 0xfd, 0x7a, 0x9a, 0xa0, 0x55, 0x55, 0x5d, 0x55, 0x55, 0x75, 0x55, 0x55, 0x46, 0x66, 0x6d, 0x5a, 0xa5, 0x79, 0x99, 0x91, 0x46, 0x66, 0x6d, 0x55, 0x55, 0x79, 0x99, 0x91, 0x46, 0x66, 0x6d, 0x55, 0x55, 0x79, 0x99, 0x91, 0x46, 0x66, 0x6d, 0x55, 0x55, 0x79, 0x99, 0x91, 0x55, 0x55, 0x5d, 0xaa, 0xaa, 0x75, 0x55, 0x55 };
pub const noten = Image{
    .width = 32,
    .height = 32,
    .flags = 1, // BLIT_2BPP
    .data = &noten_bits,
};
// press
var press_bits = [_]u8{ 0x01, 0x55, 0x55, 0x40, 0x00, 0x00, 0x00, 0x00, 0x06, 0xbf, 0xff, 0xd0, 0x01, 0x55, 0x55, 0x40, 0x16, 0xff, 0xff, 0xd4, 0x06, 0xbf, 0xff, 0xd0, 0x1f, 0xff, 0xff, 0xf4, 0x16, 0xff, 0xff, 0xd4, 0x1f, 0xea, 0xea, 0xf4, 0x1f, 0xff, 0xff, 0xf4, 0x2a, 0xf7, 0xf7, 0xa8, 0x1f, 0xea, 0xea, 0xf4, 0x1e, 0xaa, 0xaa, 0xb4, 0x2a, 0xf7, 0xf7, 0xa8, 0x07, 0xad, 0x77, 0xf8, 0x1e, 0xa9, 0x66, 0xb4, 0x0a, 0xa5, 0x55, 0x54, 0x07, 0xa5, 0x55, 0x54, 0x01, 0x55, 0x69, 0x65, 0x0a, 0xa5, 0x7d, 0x65, 0x01, 0xa5, 0xae, 0x75, 0x01, 0x55, 0xff, 0x75, 0x01, 0x95, 0xaa, 0x65, 0x01, 0x95, 0xff, 0x65, 0x01, 0xa5, 0x69, 0x65, 0x01, 0xa5, 0x7d, 0x65, 0x01, 0x55, 0x55, 0x55, 0x01, 0x55, 0x55, 0x55, 0x00, 0x59, 0x55, 0x54, 0x00, 0x59, 0x55, 0x54, 0x00, 0x69, 0x69, 0x00, 0x00, 0x69, 0x69, 0x00 };
pub const press = Image{
    .width = 32,
    .height = 16,
    .flags = 1, // BLIT_2BPP
    .data = &press_bits,
};
