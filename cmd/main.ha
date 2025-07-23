use fmt;
use types::c;

use dotenv;
use bindings::concord;

fn on_ready(client: *concord::discord, event: const *concord::discord_ready) void = {
	let params = concord::discord_create_guild_application_command_params {
		name = c::nulstr("play\0"),
		description = c::nulstr("play some music (from youtube)\0"),
	};
	concord::discord_create_guild_application_command(client, event.application.id, 0, &params, null);
};

export fn main() void = {
	let bot_token = dotenv::get_value("BOT_TOKEN");
	let client: *concord::discord = concord::discord_init(c::nulstr("\0"));
};
