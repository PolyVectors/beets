use fmt;
use strings;
use types::c;

use dotenv;
use bindings::concord;

fn on_ready(client: *concord::discord, event: const *concord::ready) void = {
	let params = concord::create_guild_application_command_params {
		name = c::nulstr("play\0"),
		description = c::nulstr("play some music (from youtube)\0"),
	};

	let guild_id = dotenv::get_value("GUILD_ID") as u64;
	concord::create_guild_application_command(client, event.application.id,
		guild_id, &params, null);
};

fn on_interaction(
	client: *concord::discord,
	event: const *concord::interaction
) void = {
	if (event.interaction_type != concord::interaction_type::APPLICATION_COMMAND)
		return;
};

export fn main() void = {
	let bot_token = dotenv::get_value("BOT_TOKEN") as str;
	defer free(bot_token);

	let client: *concord::discord = concord::init(
		c::nulstr(strings::concat(bot_token, "\0")!));

	concord::set_on_ready(client, &on_ready);
	concord::set_on_interaction_create(client, &on_interaction);
	// concord::run(client);
};