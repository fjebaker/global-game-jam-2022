const c4 = 261.63;
const twelfthRootOfTwo = 1.05946309436;

// Models a single note sustained for a fixed amount of time
pub const Note = struct { sfreq: u16, efreq: u16, length: u8 };

fn getEqualTemperamentFreq(toneOffset: i16, semitoneMod: i16, octave: u8) u16 {
    var freq: f16 = c4;
    // Traverse the relevant number of semitones

    var totalSemitoneDiff = toneOffset + semitoneMod;
    while (totalSemitoneDiff < 0) {
        freq /= twelfthRootOfTwo;
        totalSemitoneDiff += 1;
    }
    while (totalSemitoneDiff > 0) {
        freq *= twelfthRootOfTwo;
        totalSemitoneDiff -= 1;
    }
    // Go to the relevant octave
    var currOctave: u8 = 4;
    while (currOctave < octave) {
        currOctave += 1;
        freq *= 2;
    }
    while (currOctave > octave) {
        currOctave -= 1;
        freq /= 2;
    }
    // Round to the nearest u16
    return @floatToInt(u16, freq);
}

// Takes a note id such as 'C 4', 'F#5' or 'Bb3'
pub fn getFreq(noteId: [3]u8) u16 {
    const toneDiff: i16 = switch (noteId[0]) {
        'C' => 0,
        'D' => 2,
        'E' => 4,
        'F' => 5,
        'G' => 7,
        'A' => 9,
        'B' => 11,
        else => 0,
    };
    const semitoneMod: i16 = switch (noteId[1]) {
        '#' => 1,
        'b' => -1,
        else => 0,
    };
    const octave: u8 = switch (noteId[2]) {
        '0' => 0,
        '1' => 1,
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9,
        else => 4,
    };
    return getEqualTemperamentFreq(toneDiff, semitoneMod, octave);
}
