use types::c;

export type interaction_type = enum {
	PING = 1,
	APPLICATION_COMMAND = 2,
	MESSAGE_COMPONENT = 3,
	APPLICATION_COMMAND_AUTOCOMPLETE = 4,
	MODAL_SUBMIT = 5,
};

export type interaction_callback_type = enum {
	PONG = 1,
	CHANNEL_MESSAGE_WITH_SOURCE = 4,
	DEFERRED_CHANNEL_MESSAGE_WITH_SOURCE = 5,
	DEFERRED_UPDATE_MESSAGE = 6,
	UPDATE_MESSAGE = 7,
	APPLICATION_COMMAND_AUTOCOMPLETE_RESULT = 8,
	MODAL = 9
};

export type interaction_data = struct {
	id: u64snowflake,
	name: *c::char
	// enum discord_application_command_types type;
	// struct discord_resolved_data * resolved;
	// struct discord_application_command_interaction_data_options * options;
	// char * custom_id;
	// enum discord_component_types component_type;
	// struct strings * values;
	// u64snowflake target_id;
	// struct discord_components * components;
};

export type interaction_callback_data = struct {
    components: nullable *components,
    tts: bool,
    content: *c::char,
    embeds: nullable *embeds,
    flags: u64bitmask,
    attachments: nullable *attachments,
    choices: nullable *application_command_option_choices,

    custom_id: nullable *c::char,
    title: nullable *c::char,
};

export type interaction = struct {
	id: u64snowflake,
	application_id: u64snowflake,
	interaction_type: interaction_type,
	data: *interaction_data,
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

export type interaction_response = struct {
	callback_type: interaction_callback_type,
	data: *interaction_callback_data,
};