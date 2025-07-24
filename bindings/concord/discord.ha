use types::c;

export @symbol("discord_init") fn init(
		token: *c::char
) *discord;

export @symbol("discord_run") fn run(
		client: *discord
) CCORDcode;