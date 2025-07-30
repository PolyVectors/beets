use types::c;

export type discord_premium_types = enum {
	DISCORD_PREMIUM_NONE = 0,
	DISCORD_PREMIUM_NITRO_CLASSIC = 1,
	DISCORD_PREMIUM_NITRO = 2
};

export type discord_user = struct {
	id: u64snowflake,
	username: *c::char,
	discriminator: *c::char,
	avatar: *c::char,
	bot: bool,
	System: bool,
	mfa_enabled: bool,
	banner: *c::char,
	accent_color: i32,
	locale: *c::char,
	verified: bool,
	email: *c::char,
	flags: u64bitmask,
	premium_type: discord_premium_types,
	public_flags: u64bitmask,
};

export type discord_verification_level = enum {
	DISCORD_VERIFICATION_NONE = 0,
	DISCORD_VERIFICATION_LOW = 1,
	DISCORD_VERIFICATION_MEDIUM = 2,
	DISCORD_VERIFICATION_HIGH = 3,
	DISCORD_VERIFICATION_VERY_HIGH = 4
};

export type discord_message_notification_level = enum {
	DISCORD_MESSAGE_NOTIFICATION_ALL_MESSAGES = 0,
	DISCORD_MESSAGE_NOTIFICATION_ONLY_MESSAGES = 1
};

export type discord_explicit_content_filter_level = enum {
	DISCORD_EXPLICIT_CONTENT_DISABLED = 0,
	DISCORD_EXPLICIT_CONTENT_MEMBERS_WITHOUT_ROLES = 1,
	DISCORD_MESSAGE_NOTIFICATION_ALL_MEMBERS = 2
};

export type discord_mfa_level = enum {
	DISCORD_MFA_NONE = 0,
	DISCORD_MFA_ELEVATED = 1
};

export type discord_role_tag = struct {
	bot_id: u64snowflake,
	integration_id: u64snowflake,
	premium_subscribe: bool,
};

export type discord_role = struct {
	id: u64snowflake,
	name: *c::char,
	color: i32,
	hoist: bool,
	icon: *c::char,
	unicode_emoji: *c::char,
	position: i32,
	permissions: u64bitmask,
	managed: bool,
	mentionable: bool,
	tags: *discord_role_tag,
};

export type discord_roles = struct {
	length: i32,
	array: *discord_role,
	realsize: i32,
};

export type snowflakes = struct {
	length: i32,
	array: *u64snowflake,
};

export type discord_emoji = struct {
	id: u64snowflake,
	name: *c::char,
	roles: snowflakes,
	user: discord_user,
	require_colons: bool,
	managed: bool,
	animated: bool,
	available: bool,
};

export type discord_emojis = struct {
	length: i32,
	array: *discord_emoji,
	realsize: i32,
};

export type discord_premium_tier = enum {
	DISCORD_PREMIUM_TIER_NONE = 0,
	DISCORD_PREMIUM_TIER_1 = 1,
	DISCORD_PREMIUM_TIER_2 = 2,
	DISCORD_PREMIUM_TIER_3 = 3
};

export type discord_guild_nsfw_level = enum {
	DISCORD_GUILD_NSFW_DEFAULT = 0,
	DISCORD_GUILD_NSFW_EXPLICIT = 1,
	DISCORD_GUILD_NSFW_SAFE = 2,
	DISCORD_GUILD_NSFW_AGE_RESTRICTED = 3
};

export type discord_guild_member = struct {
	user: discord_user,
	nick: *c::char,
	avatar: *c::char,
	roles: snowflakes,
	joined_at: u64unix_ms,
	premium_since: u64unix_ms,
	deaf: bool,
	muted: bool,
	pending: bool,
	permissions: u64bitmask,
	communication_disabled_until: u64unix_ms,
	guild_id: u64snowflake,
};

export type discord_privacy_level = enum {
	DISCORD_PRIVACY_PUBLIC = 1,
	DISCORD_PRIVACY_GUILD_ONLY = 2
};

export type discord_voice_state = struct {
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	user_id: u64snowflake,
	member: discord_guild_member,
	session_id: *c::char,
	deaf: bool,
	mute: bool,
	self_deaf: bool,
	self_mute: bool,
	self_stream: bool,
	self_video: bool,
	suppress: bool,
	request_to_speak_timestamp: u64unix_ms,
};

export type discord_voice_states = struct {
	length: i32,
	array: *discord_voice_state,
	realsize: i32,
};

export type discord_stage_instance = struct {
	id: u64snowflake,
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	topic: *c::char,
	privacy_level: discord_privacy_level,
	discoverable_disabled: bool,
};

export type discord_stage_instances = struct {
	length: i32,
	array: *discord_stage_instance,
	realsize: i32,
};

export type discord_guild = struct {
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
	verification_level: discord_verification_level,
	default_message_notifications: discord_message_notification_level,
	explicit_content_filter: discord_explicit_content_filter_level,
	roles: *discord_roles,
	emojis: *discord_emojis,
	features: *strings,
	mfa_level: discord_mfa_level,
	application_id: u64snowflake,
	system_channel_id: u64snowflake,
	system_channel_flags: u64bitmask,
	rules_channel_id: u64snowflake,

	joined_at: u64unix_ms,

	large: bool,
	unavailable: bool,
	member_count: i32,

	voice_states: *discord_voice_states,
	members: *discord_guild_members,
	channels: *discord_channels,
	threads: *discord_channels,
	presences: *discord_presence_updates,

	max_presences: i32,
	max_members: i32,

	vanity_url_code: *c::char,
	description: *c::char,
	banner: *c::char,
	premium_tier: discord_premium_tier,
	premium_subscription_count: i32,
	preferred_locale: *c::char,
	public_updates_channel_id: u64snowflake,

	max_video_channel_users: i32,
	approximate_member_count: i32,
	approximate_presence_count: i32,

	welcome_screen: *discord_welcome_screen,

	nsfw_level: discord_guild_nsfw_level,

	stage_instances: *discord_stage_instances,

	stickers: *discord_stickers,

	guild_scheduled_events: *discord_guild_scheduled_events,
	premium_progress_bar_enabled: bool,
};

export type discord_guilds = struct {
	length: i32,
	array: *discord_guild,
	realsize: i32,
};

export type discord_ready = struct {
	v: i32,
	user: *discord_user,
	guilds: *discord_guilds,
	session_id: *c::char,
	shard: *integers,
	application: *discord_application,
};