use types::c;

export type application_command = struct {
	id: u64snowflake
	// enum discord_application_command_types type;
	// u64snowflake application_id;
	// u64snowflake guild_id;
	// char * name;
	// char * description;
	// struct discord_application_command_options * options;
	// u64bitmask default_member_permissions;
	// bool dm_permission;
	// bool default_permission;
	// u64snowflake version;
};

export type create_guild_application_command_params = struct {
	name: const *c::char,
	description: const *c::char,
};

export @symbol("discord_create_guild_application_command") fn create_guild_application_command(
	client: *discord,
	application_id: u64,
	guild_id: u64,
	params: *create_guild_application_command_params,
	ret: nullable *ret_application_command,
) CCORDcode;