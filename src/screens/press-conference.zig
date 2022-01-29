const PressState = struct {
    round: u8 = 0,

    pub fn reset(self: *@This()) void {
        self.round = 0;
    }
};
