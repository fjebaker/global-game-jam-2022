
const all_party_situations = [_] Situation {
    Situation{ .prompt = "You are offered wine", .options = [3][]const u8{ "SIP", "DRINK", "DOWN BOTTLE" } },
    Situation{ .prompt = "You are offered cake", .options = [3][]const u8{ "NIBBLE", "EAT SLICE", "EAT ALL" } },
    Situation{ .prompt = "You are invited to conga", .options = [3][]const u8{ "BACK", "MIDDLE", "FRONT" } },
    Situation{ .prompt = "Things get rowdy", .options = [3][]const u8{ "JEER", "TUSSLE", "FIGHT" } },
    Situation{ .prompt = "A round of shots starts", .options = [3][]const u8{ "TAKE ONE", "TAKE TWO", "TAKE SIX" } },
    Situation{ .prompt = "Karaoke starts", .options = [3][]const u8{ "HUM ALONG,HUM & DANCE", "SING" } },
    Situation{ .prompt = "Never have I ever starts", .options = [3][]const u8{ "LISTEN IN", "ASK QUESTION", "PLAY ALONG" } },
    Situation{ .prompt = "Someone passes out", .options = [3][]const u8{ "LAUGH", "TAKE PHOTO", "DRAW ON FACE" } },
    Situation{ .prompt = "Someone's wearing a mask", .options = [3][]const u8{ "POINT & LAUGH", "COUGH ON THEM", "YANK IT OFF" } },
};
