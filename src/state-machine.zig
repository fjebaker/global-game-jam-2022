// add global variables representing what state the game is in
pub const Screens = enum {
    IN_MENU,
    AT_PARTY,
    AT_PRESS_CONFERENCE,
    AT_HOUSE_OF_COMMONS,
    SUE_GRAY,
    PAUSED_SCREEN,
    // XXX: debug stuff
    ART_SANDBOX,
};

pub const ChoicePrompt = struct { prompt: []const u8 = "", options: [3][]const u8 = undefined };

const PartyState = struct {
    prompt: ChoicePrompt = .{},
    choices: [3]u8 = undefined,
    round: u8 = 0,

    pub fn reset(self: *@This()) void {
        for (self.choices) |*i| {
            i.* = 0;
        }
        self.round = 0;
    }
};

const PressState = struct {
    round: u8 = 0,

    pub fn reset(self: *@This()) void {
        self.round = 0;
    }
};

pub const StateMachine = struct {
    screen: Screens = .IN_MENU,

    // player state
    buzzing: u32 = 0,
    confidence: u32 = 0,
    totalscore: u32 = 0,

    // screen states

    party: PartyState = .{},

    press: PressState = .{},

    pub fn reset(self: *@This()) void {
        self.buzzing = 0;
        self.confidence = 0;
        self.totalscore = 0;

        self.party.reset();
        self.press.reset();

        self.screen = .IN_MENU;
    }
};
