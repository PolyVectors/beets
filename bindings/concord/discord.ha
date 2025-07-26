use types::c;

export type timer = struct {
	id: u32,
};

export @symbol("discord_init") fn init(token: *c::char) *discord;
export @symbol("discord_run") fn run(client: *discord) CCORDcode;