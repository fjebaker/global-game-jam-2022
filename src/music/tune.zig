const note = @import("note.zig");
const tone = @import("tone.zig");

pub const Tune = struct {
    notes: [*]note.Note,
    numNotes: u16,
    tone: *tone.Tone,
    introEndNote: u16,
    frame: u16 = 0,
    currLength: u8 = 0,
    currIndex: u16 = 0,

    pub fn play(self: *Tune) void {
        if (self.frame == self.currLength) {
            if(self.currIndex == self.numNotes) {
                self.currIndex = self.introEndNote;
            }
            const newNote = self.notes[self.currIndex];
            self.currLength = newNote.length;
            self.tone.*.sfreq = newNote.sfreq;
            self.tone.*.efreq = newNote.efreq;
            self.tone.*.sustain = if (newNote.length > self.tone.*.release) newNote.length - self.tone.*.release else 0;
            self.tone.*.play();
            self.frame = 0;
            self.currIndex += 1;
        }
        self.frame += 1;
    }
};
