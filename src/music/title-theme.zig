const tone = @import("tone.zig");
const tune = @import("tune.zig");
const note = @import("note.zig");

const c4 = note.getFreq("C 4".*);
const c5 = note.getFreq("C 5".*);
const g4 = note.getFreq("G 4".*);
const a4 = note.getFreq("A 4".*);
const d4 = note.getFreq("D 4".*);
const e4 = note.getFreq("E 4".*);
const e3 = note.getFreq("E 3".*);
const eb3 = note.getFreq("Eb3".*);
const g3 = note.getFreq("G 3".*);
const gb3 = note.getFreq("Gb3".*);
const c3 = note.getFreq("C 3".*);
const f3 = note.getFreq("F 3".*);
const f4 = note.getFreq("F 4".*);
const gb4 = note.getFreq("Gb4".*);
const bb2 = note.getFreq("Bb2".*);
const a2 = note.getFreq("A 2".*);
const g2 = note.getFreq("G 2".*);

var melodyTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 1 };
var drumTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 3, .release = 60, .volume = 25, .mode = 2 };
var bassTone = tone.Tone{ .sfreq = c5, .efreq = c5, .channel = 2 };

var melodyNotes = [_]note.Note{
    note.Note{ .sfreq = c5, .efreq = c5, .length = 45 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 45 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 45 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 45 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 90 },
    note.Note{ .sfreq = 307, .efreq = 287, .length = 90 },
    note.Note{ .sfreq = 294, .efreq = 255, .length = 180 },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 45, .on = false },
    note.Note{ .sfreq = c4, .efreq = c4, .length = 45 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 45 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 45 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 22, .on = false },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 45 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 23 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 45 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 45 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 22 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 23 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 22 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 23 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 90 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 90 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 90 },
    note.Note{ .sfreq = c5, .efreq = c5, .length = 45 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 45 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 45 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 45 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 22, .on = false },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 45 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 23 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 45 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 45 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 22 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 23 },
    note.Note{ .sfreq = f4, .efreq = f4, .length = 22 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 23 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 22 },
    note.Note{ .sfreq = e4, .efreq = f4, .length = 45 },
    note.Note{ .sfreq = e4, .efreq = g4, .length = 45 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 45 },
    note.Note{ .sfreq = d4, .efreq = e4, .length = 45 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 45 },
    note.Note{ .sfreq = gb4, .efreq = gb4, .length = 23 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 45 },
    note.Note{ .sfreq = 307, .efreq = 287, .length = 45 },
    note.Note{ .sfreq = 294, .efreq = 255, .length = 90 },
};
var drumNotes = [_]note.Note{
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = eb3, .efreq = eb3, .length = 45 },
    note.Note{ .sfreq = gb3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = eb3, .efreq = eb3, .length = 45 },
    note.Note{ .sfreq = gb3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = 1, .efreq = 1, .length = 45 },
    note.Note{ .sfreq = 1, .efreq = 1, .length = 45 },
    note.Note{ .sfreq = 1, .efreq = 1, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 22, .on = false },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 23 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 45 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 35 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 35 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 20 },
};
var bassNotes = [_]note.Note{
    note.Note{ .sfreq = c3, .efreq = c3, .length = 90 },
    note.Note{ .sfreq = e3, .efreq = e3, .length = 90 },
    note.Note{ .sfreq = g3, .efreq = g3, .length = 90 },
    note.Note{ .sfreq = gb3, .efreq = gb3, .length = 90 },
    note.Note{ .sfreq = f3, .efreq = g3, .length = 180 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 90 },
    note.Note{ .sfreq = bb2, .efreq = c3, .length = 90 },
    note.Note{ .sfreq = c3, .efreq = c3, .length = 90 },
    note.Note{ .sfreq = bb2, .efreq = c3, .length = 22, .on = false },
    note.Note{ .sfreq = bb2, .efreq = c3, .length = 68 },
};

var melody = tune.Tune{ .notes = &melodyNotes, .numNotes = melodyNotes.len, .tone = &melodyTone, .introEndNote = 7 };
var drums = tune.Tune{ .notes = &drumNotes, .numNotes = drumNotes.len, .tone = &drumTone, .introEndNote = 12 };
var bass = tune.Tune{ .notes = &bassNotes, .numNotes = bassNotes.len, .tone = &bassTone, .introEndNote = 5 };

pub fn mainMenuMusic() void {
    melody.play();
    drums.play();
    bass.play();
}
