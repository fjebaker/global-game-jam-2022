const Situation = @import("../components/situation.zig").Situation;

pub const all_party_situations = [_]Situation{
    Situation{ .prompt = "You are invited to conga", .options = [3][]const u8{ "BACK", "MIDDLE", "FRONT" } },
    Situation{ .prompt = "You are offered wine", .options = [3][]const u8{ "SIP", "DRINK", "DOWN BOTTLE" } },
    Situation{ .prompt = "Never have I ever starts", .options = [3][]const u8{ "LISTEN IN", "ASK QUESTION", "PLAY ALONG" } },
    Situation{ .prompt = "You are offered cake", .options = [3][]const u8{ "NIBBLE", "EAT SLICE", "EAT ALL" } },
    Situation{ .prompt = "A round of shots starts", .options = [3][]const u8{ "TAKE ONE", "TAKE TWO", "TAKE SIX" } },
    Situation{ .prompt = "Things get rowdy", .options = [3][]const u8{ "JEER", "TUSSLE", "FIGHT" } },
    Situation{ .prompt = "Karaoke starts", .options = [3][]const u8{ "HUM ALONG", "HUM & DANCE", "SING" } },
    Situation{ .prompt = "Someone passes out", .options = [3][]const u8{ "LAUGH", "TAKE PHOTO", "DRAW ON FACE" } },
    Situation{ .prompt = "Someone's wearing a mask", .options = [3][]const u8{ "POINT & LAUGH", "COUGH ON THEM", "YANK IT OFF" } },
};

//pub const all_party_situations = [_]Situation{
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQR", .options = [3][]const u8{ "ABC", "BC", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRS", .options = [3][]const u8{ "ABC", "BC", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRST", .options = [3][]const u8{ "ABC", "BC", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRSTU", .options = [3][]const u8{ "ABC", "BC", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRSTUV", .options = [3][]const u8{ "ABC", "BC", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRSTUVW", .options = [3][]const u8{ "ABC", "BC", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRSTUVWX", .options = [3][]const u8{ "A", "B", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRSTUVWXY", .options = [3][]const u8{ "A", "B", "C" } },
//    Situation{ .prompt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", .options = [3][]const u8{ "A", "B", "C" } },
//};
