const tone = @import("tone.zig");
const tune = @import("tune.zig");
const note = @import("note.zig");
const music = @import("music.zig");

const c5 = note.getFreq("C 5".*);
const c4 = note.getFreq("C 4".*);
const c3 = note.getFreq("C 3".*);
const d3 = note.getFreq("D 3".*);
const e3 = note.getFreq("E 3".*);
const f3 = note.getFreq("F 3".*);
const f4 = note.getFreq("F 4".*);
const e4 = note.getFreq("E 4".*);
const g4 = note.getFreq("G 4".*);
const g3 = note.getFreq("G 3".*);
const a3 = note.getFreq("A 3".*);
const d4 = note.getFreq("D 4".*);
const a4 = note.getFreq("A 4".*);
const e5 = note.getFreq("E 5".*);
const b4 = note.getFreq("B 4".*);
const b3 = note.getFreq("B 3".*);

const kick = note.getFreq("B 2".*);

var melodyTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 2 };
var harmonyTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 1 };
var drumTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 3, .release = 10, .volume = 5, .mode = 3, .attack = 1 };

var melodyNotes = [_]note.Note{
    note.Note{ .sfreq = c3, .efreq = c3, .length = 150 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 150 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 150 },
    note.Note{ .sfreq = f3, .efreq = f3, .length = 150 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 150 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 150, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 15 }, // Marker bar 1
    note.Note{ .sfreq = e3, .efreq = e3, .length = 15 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 15 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 15 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 15 }, // Marker bar 2
    note.Note{ .sfreq = f3, .efreq = f3, .length = 15 },
    note.Note{ .sfreq = a3, .efreq = a3, .length = 15 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 15 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 15 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 15 },
    note.Note{ .sfreq = a3, .efreq = a3, .length = 15 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 15 }, // Marker bar 3
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 15 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 15 },
    note.Note{ .sfreq = f3, .efreq = f3, .length = 15 }, // Marker bar 4
    note.Note{ .sfreq = a3, .efreq = a3, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 15 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 15 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 15 },
};
var harmonyNotes = [_]note.Note{
    note.Note{ .sfreq = c5, .efreq = c5, .length = 60 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 90 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 60 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 90 },
    note.Note{ .sfreq = e5, .efreq = e5, .length = 60 },
    note.Note{ .sfreq = b4, .efreq = b4, .length = 90 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 90 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 150 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 150, .on = false },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 60 }, // Marker loop 1
    note.Note{ .sfreq = g4, .efreq = g4, .length = 90 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 60 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 90 },
    note.Note{ .sfreq = e5, .efreq = e5, .length = 60 },
    note.Note{ .sfreq = b4, .efreq = b4, .length = 90 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 90 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 30, .on = false },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 60 }, // Marker loop 2
    note.Note{ .sfreq = g4, .efreq = g4, .length = 90 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 60 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 90 },
    note.Note{ .sfreq = e5, .efreq = e5, .length = 60 },
    note.Note{ .sfreq = b4, .efreq = b4, .length = 90 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 90 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 30, .on = false },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 60 }, // Marker loop 3
    note.Note{ .sfreq = g4, .efreq = g4, .length = 90 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 60 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 90 },
    note.Note{ .sfreq = e5, .efreq = e5, .length = 60 },
    note.Note{ .sfreq = b4, .efreq = b4, .length = 90 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 90 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 30, .on = false },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 60 }, // Marker loop 4
    note.Note{ .sfreq = g4, .efreq = g4, .length = 90 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 60 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 90 },
    note.Note{ .sfreq = e5, .efreq = e5, .length = 60 },
    note.Note{ .sfreq = b4, .efreq = b4, .length = 90 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 90 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 30, .on = false },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 60 }, // Marker loop 5
    note.Note{ .sfreq = g4, .efreq = g4, .length = 90 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 60 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 90 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 90 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 30, .on = false },
};
var drumNotes = [_]note.Note{
    note.Note{ .sfreq = g3, .efreq = g3, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = 440, .length = 90 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = 440, .length = 90 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = 440, .length = 90 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 60 },
    note.Note{ .sfreq = c5, .efreq = 440, .length = 90 },
    note.Note{ .sfreq = c5, .efreq = 440, .length = 150 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = c5, .efreq = 440, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 15 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 30 },
    note.Note{ .sfreq = kick, .efreq = kick, .length = 30 },
};

var melody = tune.Tune{ .notes = &melodyNotes, .numNotes = melodyNotes.len, .tone = &melodyTone, .introEndNote = 6 };
var harmony = tune.Tune{ .notes = &harmonyNotes, .numNotes = harmonyNotes.len, .tone = &harmonyTone, .introEndNote = 10 };
var drums = tune.Tune{ .notes = &drumNotes, .numNotes = drumNotes.len, .tone = &drumTone, .introEndNote = 15 };

pub const parliamentMusic = music.Music{ .part1 = &melody, .part2 = &harmony, .part3 = &drums };
