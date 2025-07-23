use types::c;

export @symbol("discord_init") fn discord_init(
	token: *c::char
) *discord;