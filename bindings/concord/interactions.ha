export type interaction_type = enum {
	PING = 1,
	APPLICATION_COMMAND = 2,
	MESSAGE_COMPONENT = 3,
	APPLICATION_COMMAND_AUTOCOMPLETE = 4,
	MODAL_SUBMIT = 5,
};

export type interaction_data = struct {
	id: u64snowflake,
	// char * name;
	// enum discord_application_command_types type;
	// struct discord_resolved_data * resolved;
	// struct discord_application_command_interaction_data_options * options;
	// char * custom_id;
	// enum discord_component_types component_type;
	// struct strings * values;
	// u64snowflake target_id;
	// struct discord_components * components;
};

export type interaction = struct {
	id: u64snowflake,
	application_id: u64snowflake,
	interaction_type: interaction_type,
	// struct discord_interaction_data * data;
	// u64snowflake guild_id;
	// u64snowflake channel_id;
	// struct discord_guild_member * member;
	// struct discord_user * user;
	// char * token;
	// int version;
	// struct discord_message * message;
	// char * locale;
	// char * guild_locale;
};