// Placeholder implementation - not complete
const tone = @import("tone.zig");
const tune = @import("tune.zig");
const note = @import("note.zig");

var mTone = tone.Tone{ .sfreq = 523, .efreq = 523 };
var mNotes = [_]note.Note{
    note.Note{ .sfreq = 523, .efreq = 523, .length = 60 },
    note.Note{ .sfreq = 392, .efreq = 392, .length = 60 },
    note.Note{ .sfreq = 440, .efreq = 440, .length = 60 },
    note.Note{ .sfreq = 294, .efreq = 294, .length = 60 },
    note.Note{ .sfreq = 330, .efreq = 330, .length = 120 },
    note.Note{ .sfreq = 307, .efreq = 287, .length = 60 },
    note.Note{ .sfreq = 294, .efreq = 255, .length = 240 },
};
var mTune = tune.Tune{ .notes = &mNotes, .numNotes = mNotes.len, .tone = &mTone };

pub fn mainMenuMusic() void {
    mTune.play();
}
