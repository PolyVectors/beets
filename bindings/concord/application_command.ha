use types::c;

export type discord_create_guild_application_command = struct {
	name: const *c::char,
	description: const *c::char,
};
