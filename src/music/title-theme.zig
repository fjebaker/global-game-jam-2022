// Placeholder implementation - not complete
const tone = @import("tone.zig");
const tune = @import("tune.zig");
const note = @import("note.zig");

const c5 = note.getFreq("C 5".*);
const g4 = note.getFreq("G 4".*);
const a4 = note.getFreq("A 4".*);
const d4 = note.getFreq("D 4".*);
const e4 = note.getFreq("E 4".*);

var mTone = tone.Tone{ .sfreq = c5, .efreq = c5 };
var mNotes = [_]note.Note{
    note.Note{ .sfreq = c5, .efreq = c5, .length = 60 },
    note.Note{ .sfreq = g4, .efreq = g4, .length = 60 },
    note.Note{ .sfreq = a4, .efreq = a4, .length = 60 },
    note.Note{ .sfreq = d4, .efreq = d4, .length = 60 },
    note.Note{ .sfreq = e4, .efreq = e4, .length = 120 },
    note.Note{ .sfreq = 307, .efreq = 287, .length = 120 },
    note.Note{ .sfreq = 294, .efreq = 255, .length = 240 },
};
var mTune = tune.Tune{ .notes = &mNotes, .numNotes = mNotes.len, .tone = &mTone };

pub fn mainMenuMusic() void {
    mTune.play();
}
