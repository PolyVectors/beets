use fmt;
use types::c;

use bindings::concord;

def GUILD_ID: u64 = 850495172700536882;

fn on_ready(client: *concord::discord, event: const *concord::discord_ready) void = {
	let params = concord::discord_create_guild_application_command_params {
		name = c::nulstr("play\0"),
		description = c::nulstr("play some music (from youtube)\0"),
	};
	concord::discord_create_guild_application_command(client, event.application.id, GUILD_ID, &params, null);
};

export fn main() void = {
	fmt::println("Hello, world!")!;
};
