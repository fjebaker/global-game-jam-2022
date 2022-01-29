const note = @import("note.zig");
const tone = @import("tone.zig");

pub const Tune = struct {
    notes: [*]note.Note,
    numNotes: u16,
    tone: *tone.Tone,
    frame: u16 = 0,
    currLength: u8 = 0,
    currIndex: u16 = 0,

    pub fn play(self: *Tune) void {
        if(self.frame == self.currLength) {
            self.currIndex += 1;
            self.currIndex = self.currIndex % self.numNotes;
            const newNote = self.notes[self.currIndex];
            self.currLength = newNote.length;
            self.tone.*.sfreq = newNote.sfreq;
            self.tone.*.efreq = newNote.efreq;
            self.tone.*.play();
            self.frame = 0;
        }
        self.frame += 1;
    }
};