use types::c;

export type guild = struct {
	id: u64snowflake,
	name: *c::char,
	icon: *c::char,
	icon_hash: *c::char,

	splash: *c::char,
	discovery_splash: *c::char,
	owner: bool,
	owner_id: u64snowflake,
	permissions: u64bitmask,

	afk_channel_id: u64snowflake,
	afk_timeout: i32,
	widget_enabled: bool,
	widget_channel_id: u64snowflake,
	//  enum discord_verification_level verification_level;
	//  enum discord_message_notification_level default_message_notifications;
	//  enum discord_explicit_content_filter_level explicit_content_filter;
	//  struct discord_roles * roles;
	//  struct discord_emojis * emojis;
	//  struct strings * features;
	//  enum discord_mfa_level mfa_level;
	application_id: u64,
	system_channel_id: u64snowflake,
	system_channel_flags: u64bitmask,
	rules_channel_id: u64snowflake,
	joined_at: u64unix_ms,

	// bool large;
	// bool unavailable;
	// int member_count;
	// struct discord_voice_states * voice_states;

	// struct discord_guild_members * members;

	// struct discord_channels * channels;

	// struct discord_channels * threads;

	// struct discord_presence_updates * presences;

	// int max_presences;

	// int max_members;

	// char * vanity_url_code;
	// char * description;
	// char * banner;
	// enum discord_premium_tier premium_tier;
	// int premium_subscription_count;
	// char * preferred_locale;
	// u64snowflake public_updates_channel_id;
	// int max_video_channel_users;

	// int approximate_member_count;

	// int approximate_presence_count;

	// struct discord_welcome_screen * welcome_screen;

	// enum discord_guild_nsfw_level nsfw_level;
	// struct discord_stage_instances * stage_instances;

	// struct discord_stickers * stickers;

	// struct discord_guild_scheduled_events * guild_scheduled_events;

	// bool premium_progress_bar_enabled;
};

export type guilds = struct {
    guild_size: i32,
    array: *guild,
    realsize: i32,
};