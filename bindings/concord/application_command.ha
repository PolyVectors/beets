use types::c;

export type discord_create_guild_application_command_params = struct {
	name: const *c::char,
	description: const *c::char,
};

export @symbol("discord_create_guild_application_command") fn discord_create_guild_application_command(
	client: *discord,
	application_id: u64,
	guild_id: u64,
	params: *discord_create_guild_application_command_params,
	ret: nullable *discord_ret_application_command,
) CCORDcode;