const Situation = @import("../components/situation.zig").Situation;

pub const all_press_conference_situations = [_]Situation{
    Situation{ .prompt = "Last night location?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "Followed lockdown?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "Social distancing?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "No parties?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "Telling the truth?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "Working from home?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "Quiz happened?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "No birthday celebration?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "Same rules as us?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } },
    Situation{ .prompt = "Out drinking?", .options = [3][]const u8{ "TELL TRUTH", "WAFFLE", "CHANGE TOPIC" } } };
