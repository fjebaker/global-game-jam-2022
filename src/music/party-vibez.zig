const tone = @import("tone.zig");
const tune = @import("tune.zig");
const note = @import("note.zig");
const music = @import("music.zig");

const c5 = note.getFreq("C 5".*);
const c4 = note.getFreq("C 4".*);
const c3 = note.getFreq("C 3".*);
const e4 = note.getFreq("E 4".*);
const e5 = note.getFreq("E 5".*);
const ds5 = note.getFreq("D#5".*);
const d5 = note.getFreq("D 5".*);
const d4 = note.getFreq("D 4".*);
const g4 = note.getFreq("G 4".*);
const f4 = note.getFreq("F 4".*);
const b3 = note.getFreq("B 3".*);
const a4 = note.getFreq("A 4".*);
const fs3 = note.getFreq("F#3".*);
const es3 = note.getFreq("E#3".*);
const d3 = note.getFreq("D 3".*);
const e3 = note.getFreq("E 3".*);
const f3 = note.getFreq("F 3".*);
const g3 = note.getFreq("G 3".*);
const a3 = note.getFreq("A 3".*);
const d2 = note.getFreq("D 2".*);
const g2 = note.getFreq("G 2".*);
const a2 = note.getFreq("A 2".*);
const c2 = note.getFreq("C 2".*);
const b2 = note.getFreq("B 2".*);
const b1 = note.getFreq("B 1".*);

// Half sharps
const bhs2 = note.getFreqHalfSharp("B 2".*);
const ehs3 = note.getFreqHalfSharp("E 3".*);
const fds3 = note.getFreqHalfSharp("F#3".*);

var melodyTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 1, .mode = 2, .volume = 30 };
var drumTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 3, .release = 10, .volume = 25, .mode = 3 };
var bassTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 2, .volume = 100 };

var melodyNotes = [_]note.Note{
    note.Note{ .sfreq = e4, .efreq = e5, .length = 30 },
    note.Note{ .sfreq = e4, .efreq = ds5, .length = 30 },
    note.Note{ .sfreq = d4, .efreq = d5, .length = 30 },
    note.Note{ .sfreq = g4, .efreq = d4, .length = 30 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 8 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 30, .on = false },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 8 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 45, .on = false },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 135 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 240 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 240 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 8 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 30, .on = false },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 8 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 30, .on = false },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 8 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15, .on = false },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 120 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 8 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 30, .on = false },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 8 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = c4, .length = 30, .on = false },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 8 },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15, .on = false },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 120 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 8 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = c4, .length = 30, .on = false },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 60 },
    note.Note{ .sfreq = d4, .efreq = c4, .length = 15, .on = false },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 8 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = c4, .length = 30, .on = false },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 60 },
    note.Note{ .sfreq = d4, .efreq = c4, .length = 15, .on = false },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 8 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 30, .on = false },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 8 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = c4, .length = 30, .on = false },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 8 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 15, .on = false },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 120 },
};
var drumNotes = [_]note.Note{
    note.Note{ .sfreq = c5, .efreq = c5, .length = 240, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 20, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 20, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 12, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c4, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c4, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 12, .on = false },
    note.Note{ .sfreq = c3, .efreq = c4, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c4, .length = 13, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c4, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c4, .length = 5, .on = false },
};
var bassNotes = [_]note.Note{
    note.Note{ .sfreq = c5, .efreq = c5, .length = 120, .on = false },
    note.Note{ .sfreq = fs3, .efreq = fs3, .length = 8 },
    note.Note{ .sfreq = fs3, .efreq = fs3, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 30, .on = false },
    note.Note{ .sfreq = fs3, .efreq = fs3, .length = 8 },
    note.Note{ .sfreq = fs3, .efreq = fs3, .length = 7 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 45, .on = false },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 135 },
    note.Note{ .sfreq = d2, .efreq = d2, .length = 10 }, // Marker bar 1
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 8 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = bhs2, .efreq = bhs2, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d2, .efreq = d2, .length = 10 }, // Marker bar 2
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c2, .efreq = c2, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 7 },
    note.Note{ .sfreq = c2, .efreq = c2, .length = 8 },
    note.Note{ .sfreq = b1, .efreq = b1, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = b2, .efreq = b2, .length = 7 },
    note.Note{ .sfreq = b2, .efreq = bhs2, .length = 8 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d2, .efreq = d2, .length = 10 }, // Marker bar 3
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 8 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = bhs2, .efreq = bhs2, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 8 }, // Marker bar 4
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 8 },
    note.Note{ .sfreq = a3, .efreq = a3, .length = 7 },
    note.Note{ .sfreq = es3, .efreq = es3, .length = 8 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 15 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 15 },
    note.Note{ .sfreq = b2, .efreq = b2, .length = 15 },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 7 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 15 },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 10 }, // Marker bar 5
    note.Note{ .sfreq = g3, .efreq = g3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = e3, .efreq = ehs3, .length = 8 },
    note.Note{ .sfreq = es3, .efreq = es3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = es3, .efreq = es3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 8 }, // Marker bar 6
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 8 },
    note.Note{ .sfreq = a3, .efreq = a3, .length = 7 },
    note.Note{ .sfreq = es3, .efreq = es3, .length = 8 },
    note.Note{ .sfreq = fs3, .efreq = fs3, .length = 15 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 15 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 15 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8 },
    note.Note{ .sfreq = es3, .efreq = es3, .length = 7 },
    note.Note{ .sfreq = d2, .efreq = d2, .length = 10 }, // Marker bar 7
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 8 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = bhs2, .efreq = bhs2, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d2, .efreq = d2, .length = 10 }, // Marker bar 8
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 8 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = bhs2, .efreq = bhs2, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 10 }, // Marker bar 9
    note.Note{ .sfreq = a3, .efreq = a3, .length = 5, .on = false },
    note.Note{ .sfreq = a3, .efreq = a3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 8 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 7 },
    note.Note{ .sfreq = fs3, .efreq = fds3, .length = 8 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 7 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = a3, .efreq = a3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 10 }, // Marker bar 10
    note.Note{ .sfreq = g3, .efreq = g3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = ehs3, .efreq = ehs3, .length = 8 },
    note.Note{ .sfreq = f3, .efreq = f3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = f3, .efreq = f3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d2, .efreq = d2, .length = 10 }, // Marker bar 11
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g2, .efreq = g2, .length = 8 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = bhs2, .efreq = bhs2, .length = 8 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8, .on = false },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 8 }, // Marker bar 12
    note.Note{ .sfreq = d4, .efreq = d4, .length = 7 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = b3, .efreq = b3, .length = 10 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 5, .on = false },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 8 },
    note.Note{ .sfreq = a3, .efreq = a3, .length = 7 },
    note.Note{ .sfreq = es3, .efreq = es3, .length = 8 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8 },
    note.Note{ .sfreq = a2, .efreq = a2, .length = 7 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 8 },
    note.Note{ .sfreq = d3, .efreq = d3, .length = 7 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 8 },
    note.Note{ .sfreq = d3, .efreq = f3, .length = 7 },
};

var melody = tune.Tune{ .notes = &melodyNotes, .numNotes = melodyNotes.len, .tone = &melodyTone, .introEndNote = 13 };
var drums = tune.Tune{ .notes = &drumNotes, .numNotes = drumNotes.len, .tone = &drumTone, .introEndNote = 12 };
var bass = tune.Tune{ .notes = &bassNotes, .numNotes = bassNotes.len, .tone = &bassTone, .introEndNote = 8 };

pub const partyVibezMusic = music.Music { .part1 = &melody, .part2 = &drums, .part3 = &bass };
