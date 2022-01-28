const w4 = @import("../wasm4.zig");

pub const Tone = struct {
    sfreq: u16, // start frequency
    efreq: u16, // end frequency
    sustain: u8 = 0, // 0 - 255
    release: u8 = 48, // 0 - 255
    decay: u8 = 2, // 0 - 255 
    attack: u8 = 0, // 0 - 255
    volume: u8 = 70, // 0 - 100
    channel: u4 = 0, // 4 channels
    mode: u4 = 0, // 0, 1 are pulses, 2 is triangle, 3 noise
    
    pub fn play(self: *const Tone) void {
        const flags: u32 = (@as(u32, self.mode) << 2) | self.channel;
        const frequency: u32 = (@as(u32, self.efreq) << 16) | self.sfreq;
        const duration: u32 = 
              (@as(u32, self.attack)   << 24) 
            | (@as(u32, self.decay)    << 16) 
            | (@as(u32, self.release)  << 8 ) 
            | self.sustain;
        
        w4.tone(frequency, duration, @as(u32, self.volume), flags);
    }
};