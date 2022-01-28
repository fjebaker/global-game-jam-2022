// add global variables representing what state the game is in
pub const State = enum {
    IN_MENU,
    AT_PARTY,
    AT_PRESS_CONFERENCE,
    AT_HOUSE_OF_COMMONS,
    SUE_GRAY,
    PAUSED_SCREEN,
    // XXX: debug stuff
    ART_SANDBOX,
};

