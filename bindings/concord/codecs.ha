use types::c;

export type strings = struct {
	length: i32,
	array: **c::char,
	realsize: i32,
};

export type json_values = struct {
	length: i32,
	array: **json_char,
	realsize: i32,
};

export type snowflakes = struct {
	length: i32,
	array: *u64snowflake,
	realsize: i32,
};

export type bitmasks = struct {
	length: i32,
	array: *u64bitmask,
	realsize: i32,
};

export type integers = struct {
	length: i32,
	array: *i32,
	realsize: i32,
};

export def DISCORD_APPLICATION_GATEWAY_PRESENCE: u64 = 1 << 12;
export def DISCORD_APPLICATION_GATEWAY_PRESENCE_LIMITED: u64 = 1 << 13;
export def DISCORD_APPLICATION_GATEWAY_GUILD_MEMBERS: u64 = 1 << 14;
export def DISCORD_APPLICATION_GATEWAY_GUILD_MEMBERS_LIMITED: u64 = 1 << 15;
export def DISCORD_APPLICATION_VERIFICATION_PENDING_GUILD_LIMIT: u64 = 1 << 16;
export def DISCORD_APPLICATION_EMBEDDED: u64 = 1 << 17;
export def DISCORD_APPLICATION_GATEWAY_MESSAGE_CONTENT: u64 = 1 << 18;
export def DISCORD_APPLICATION_GATEWAY_MESSAGE_CONTENT_LIMITED: u64 = 1 << 19;

export type discord_application = struct {
	id: u64snowflake,
	name: *c::char,
	icon: *c::char,
	description: *c::char,
	rpc_origins: *strings,
	bot_public: bool,
	bot_require_code_grant: bool,
	terms_of_service_url: *c::char,
	privacy_policy_url: *c::char,
	owner: *discord_user,
	summary: *c::char,
	verify_key: *c::char,
	team: *discord_team,
	guild_id: u64snowflake,
	primary_sku_id: u64snowflake,
	slug: *c::char,
	cover_image: *c::char,
	flags: u64bitmask,
};

export type discord_install_params = struct {
	scopes: *strings,
	permissions: u64bitmask,
};

export type discord_audit_log_events = enum {
	DISCORD_AUDIT_LOG_GUILD_UPDATE = 1,
	DISCORD_AUDIT_LOG_CHANNEL_CREATE = 10,
	DISCORD_AUDIT_LOG_CHANNEL_UPDATE = 11,
	DISCORD_AUDIT_LOG_CHANNEL_DELETE = 12,
	DISCORD_AUDIT_LOG_CHANNEL_OVERWRITE_CREATE = 13,
	DISCORD_AUDIT_LOG_CHANNEL_OVERWRITE_UPDATE = 14,
	DISCORD_AUDIT_LOG_CHANNEL_OVERWRITE_DELETE = 15,
	DISCORD_AUDIT_LOG_MEMBER_KICK = 20,
	DISCORD_AUDIT_LOG_MEMBER_PRUNE = 21,
	DISCORD_AUDIT_LOG_MEMBER_BAN_ADD = 22,
	DISCORD_AUDIT_LOG_MEMBER_BAN_REMOVE = 23,
	DISCORD_AUDIT_LOG_MEMBER_UPDATE = 24,
	DISCORD_AUDIT_LOG_MEMBER_ROLE_UPDATE = 25,
	DISCORD_AUDIT_LOG_MEMBER_MOVE = 26,
	DISCORD_AUDIT_LOG_MEMBER_DISCONNECT = 27,
	DISCORD_AUDIT_LOG_BOT_ADD = 28,
	DISCORD_AUDIT_LOG_ROLE_CREATE = 30,
	DISCORD_AUDIT_LOG_ROLE_UPDATE = 31,
	DISCORD_AUDIT_LOG_ROLE_DELETE = 32,
	DISCORD_AUDIT_LOG_INVITE_CREATE = 40,
	DISCORD_AUDIT_LOG_INVITE_UPDATE = 41,
	DISCORD_AUDIT_LOG_INVITE_DELETE = 42,
	DISCORD_AUDIT_LOG_WEBHOOK_CREATE = 50,
	DISCORD_AUDIT_LOG_WEBHOOK_UPDATE = 51,
	DISCORD_AUDIT_LOG_WEBHOOK_DELETE = 52,
	DISCORD_AUDIT_LOG_EMOJI_CREATE = 60,
	DISCORD_AUDIT_LOG_EMOJI_UPDATE = 61,
	DISCORD_AUDIT_LOG_EMOJI_DELETE = 62,
	DISCORD_AUDIT_LOG_MESSAGE_DELETE = 72,
	DISCORD_AUDIT_LOG_MESSAGE_BULK_DELETE = 73,
	DISCORD_AUDIT_LOG_MESSAGE_PIN = 74,
	DISCORD_AUDIT_LOG_MESSAGE_UNPIN = 75,
	DISCORD_AUDIT_LOG_INTEGRATION_CREATE = 80,
	DISCORD_AUDIT_LOG_INTEGRATION_UPDATE = 81,
	DISCORD_AUDIT_LOG_INTEGRATION_DELETE = 82,
	DISCORD_AUDIT_LOG_STAGE_INSTANCE_CREATE = 83,
	DISCORD_AUDIT_LOG_STAGE_INSTANCE_UPDATE = 84,
	DISCORD_AUDIT_LOG_STAGE_INSTANCE_DELETE = 85,
	DISCORD_AUDIT_LOG_STICKER_CREATE = 90,
	DISCORD_AUDIT_LOG_STICKER_UPDATE = 91,
	DISCORD_AUDIT_LOG_STICKER_DELETE = 92,
	DISCORD_AUDIT_LOG_GUILD_SCHEDULED_EVENT_CREATE = 100,
	DISCORD_AUDIT_LOG_GUILD_SCHEDULED_EVENT_UPDATE = 101,
	DISCORD_AUDIT_LOG_GUILD_SCHEDULED_EVENT_DELETE = 102,
	DISCORD_AUDIT_LOG_THREAD_CREATE = 110,
	DISCORD_AUDIT_LOG_THREAD_UPDATE = 111,
	DISCORD_AUDIT_LOG_THREAD_DELETE = 112,
	DISCORD_AUDIT_LOG_APPLICATION_COMMAND_PERMISSION_UPDATE = 121,
	DISCORD_AUDIT_LOG_AUTO_MODERATION_RULE_CREATE = 140,
	DISCORD_AUDIT_LOG_AUTO_MODERATION_RULE_UPDATE = 141,
	DISCORD_AUDIT_LOG_AUTO_MODERATION_RULE_DELETE = 142,
	DISCORD_AUDIT_LOG_AUTO_MODERATION_BLOCK_MESSAGE = 143
};

export type discord_audit_log = struct {
	audit_log_entries: *discord_audit_log_entries,
	guild_scheduled_events: *discord_guild_scheduled_events,
	integrations: *discord_integrations,
	threads: *discord_channels,
	users: *discord_users,
	webhooks: *discord_webhooks,
};

export type discord_audit_log_entry = struct {
	target_id: u64snowflake,
	changes: *discord_audit_log_changes,
	user_id: u64snowflake,
	id: u64snowflake,
	action_type: discord_audit_log_events,
	options: *discord_optional_audit_entry_infos,
	reason: *c::char,
};

export type discord_audit_log_entries = struct {
	length: i32,
	array: *discord_audit_log_entry,
	realsize: i32,
};

export type discord_optional_audit_entry_info = struct {
	channel_id: u64snowflake,
	count: *c::char,
	delete_member_days: *c::char,
	id: u64snowflake,
	members_removed: *c::char,
	message_id: u64snowflake,
	role_name: *c::char,
	discord_optional_audit_entry_info_type: *c::char,
};

export type discord_optional_audit_entry_infos = struct {
	length: i32,
	array: *discord_audit_log_entry,
	realsize: i32,
};

export type discord_audit_log_change = struct {
	new_value: *json_char,
	old_value: *json_char,
	key: *c::char,
};

export type discord_audit_log_changes = struct {
	length: i32,
	array: *discord_audit_log_change,
	realsize: i32,
};

export type discord_get_guild_audit_log = struct {
	user_id: u64snowflake,
	action_type: i32,
	before: u64snowflake,
	limit: i32,
};

export type discord_auto_moderation_trigger_types = enum {
	DISCORD_AUTO_MODERATION_KEYWORD = 1,
	DISCORD_AUTO_MODERATION_HARMFUL_LINK = 2,
	DISCORD_AUTO_MODERATION_SPAM = 3,
	DISCORD_AUTO_MODERATION_KEYWORD_PRESET = 4
};

export type discord_auto_moderation_keyword_preset_types = enum {
	DISCORD_AUTO_MODERATION_PROFANITY = 1,
	DISCORD_AUTO_MODERATION_SEXUAL_CONTENT = 2,
	DISCORD_AUTO_MODERATION_SLURS = 3
};

export type discord_auto_moderation_event_types = enum {
	DISCORD_AUTO_MODERATION_MESSAGE_SEND = 1
};

export type discord_auto_moderation_action_types = enum {
	DISCORD_AUTO_MODERATION_ACTION_BLOCK_MESSAGE = 1,
	DISCORD_AUTO_MODERATION_ACTION_SEND_ALERT_MESSAGE = 2,
	DISCORD_AUTO_MODERATION_ACTION_TIMEOUT = 3
};

export type discord_auto_moderation_trigger_metadata = struct {
	keyword_filter: *strings,
	presets: *integers,
};

export type discord_auto_moderation_action = struct {
	auto_moderation_action_type: discord_auto_moderation_action_types,
	metadata: *discord_auto_moderation_action_metadata,
};

export type discord_auto_moderation_actions = struct {
	length: i32,
	array: *discord_auto_moderation_action,
	realsize: i32,
};

export type discord_auto_moderation_action_metadata = struct {
	channel_id: u64snowflake,
	duration_seconds: i32,
};

export type discord_auto_moderation_rule = struct {
	id: u64snowflake,
	guild_id: u64snowflake,
	name: *c::char,
	creator_id: u64snowflake,
	event_type: discord_auto_moderation_event_types,
	trigger_type: discord_auto_moderation_trigger_types,
	actions: *discord_auto_moderation_actions,
	trigger_metadata: *discord_auto_moderation_trigger_metadata,
	enabled: bool,
	exempt_roles: *snowflakes,
	exempt_channels: *snowflakes,
};

export type discord_auto_moderation_rules = struct {
	length: i32,
	array: *discord_auto_moderation_rule,
	realsize: i32,
};

export type discord_create_auto_moderation_rule = struct {
	reason: *c::char,
	name: *c::char,
	event_type: discord_auto_moderation_event_types,
	trigger_type: discord_auto_moderation_trigger_types,
	actions: *discord_auto_moderation_actions,
	trigger_metadata: *discord_auto_moderation_trigger_metadata,
	enabled: bool,
	exempt_roles: *snowflakes,
	exempt_channels: *snowflakes,
};

export type discord_modify_auto_moderation_rule = struct {
	reason: *c::char,
	name: *c::char,
	event_type: discord_auto_moderation_event_types,
	trigger_metadata: *discord_auto_moderation_trigger_metadata,
	actions: *discord_auto_moderation_actions,
	enabled: bool,
	exempt_roles: *snowflakes,
	exempt_channels: *snowflakes,
};

export type discord_delete_auto_moderation_rule = struct {
	reason: *c::char,
};

export type discord_invite_target_types = enum {
	DISCORD_INVITE_TARGET_STREAM = 1,
	DISCORD_INVITE_TARGET_EMBEDDED_APPLICATION = 2
};

export type discord_invite = struct {
	code: *c::char,
	guild: *discord_guild,
	channel: *discord_channel,
	inviter: *discord_user,
	target_type: discord_invite_target_types,
	target_user: *discord_user,
	target_application: *discord_application,
	approximate_presence_count: i32,
	approximate_member_count: i32,
	expires_at: u64unix_ms,
	stage_instance: *discord_invite_stage_instance,
	guild_scheduled_event: *discord_guild_scheduled_event,
};

export type discord_invites = struct {
	length: i32,
	array: *discord_invite,
	realsize: i32,
};

export type discord_invite_metadata = struct {
	uses: i32,
	max_uses: i32,
	max_age: i32,
	temporary: bool,
	created_at: u64unix_ms,
};

export type discord_invite_stage_instance = struct {
	members: *discord_guild_members,
	participant_count: i32,
	speaker_count: i32,
	topic: *c::char,
};

export type discord_get_invite = struct {
	with_counts: bool,
	with_expiration: bool,
	guild_scheduled_event_id: u64snowflake,
};

export type discord_delete_invite = struct {
	reason: *c::char,
};

export type discord_channel_types = enum {
	DISCORD_CHANNEL_GUILD_TEXT = 0,
	DISCORD_CHANNEL_DM = 1,
	DISCORD_CHANNEL_GUILD_VOICE = 2,
	DISCORD_CHANNEL_GROUP_DM = 3,
	DISCORD_CHANNEL_GUILD_CATEGORY = 4,
	DISCORD_CHANNEL_GUILD_ANNOUNCEMENT = 5,
	DISCORD_CHANNEL_GUILD_NEWS = DISCORD_CHANNEL_GUILD_ANNOUNCEMENT,
	DISCORD_CHANNEL_GUILD_STORE = 6,
	DISCORD_CHANNEL_ANNOUNCEMENT_THREAD = 10,
	DISCORD_CHANNEL_GUILD_NEWS_THREAD = DISCORD_CHANNEL_ANNOUNCEMENT_THREAD,
	DISCORD_CHANNEL_GUILD_PUBLIC_THREAD = 11,
	DISCORD_CHANNEL_GUILD_PRIVATE_THREAD = 12,
	DISCORD_CHANNEL_GUILD_STAGE_VOICE = 13,
	DISCORD_CHANNEL_GUILD_DIRECTORY = 14,
	DISCORD_CHANNEL_GUILD_FORUM = 15,
	DISCORD_CHANNEL_GUILD_MEDIA = 16
};

export type discord_video_quality_modes = enum {
	DISCORD_VIDEO_QUALITY_AUTO = 1,
	DISCORD_VIDEO_QUALITY_FULL = 2
};

export type discord_sort_order_types = enum {
	DISCORD_SORT_ORDER_LATEST_ACTIVITY = 0,
	DISCORD_SORT_ORDER_CREATION_DATE = 1
};

export type discord_forum_layout_types = enum {
	DISCORD_FORUM_LAYOUT_NOT_SET = 0,
	DISCORD_FORUM_LAYOUT_LIST_VIEW = 1,
	DISCORD_FORUM_LAYOUT_GALLERY_VIEW = 1
};

export type discord_channel = struct {
	id: u64snowflake,
	discord_channel_type: discord_channel_types,
	guild_id: u64snowflake,
	position: i32,
	permission_overwrites: *discord_overwrites,
	name: *c::char,
	topic: *c::char,
	nsfw: bool,
	last_message_id: u64snowflake,
	bitrate: i32,
	user_limit: i32,
	rate_limit_per_user: i32,
	recipients: *discord_users,
	icon: *c::char,
	owner_id: u64snowflake,
	application_id: u64snowflake,
	managed: bool,
	parent_id: u64snowflake,
	last_pin_timestamp: u64unix_ms,
	rtc_region: *c::char,
	voice_quality_mode: i32,
	message_count: i32,
	member_count: i32,
	thread_metadata: *discord_thread_metadata,
	member: *discord_thread_member,
	default_auto_archive_duration: i32,
	permissions: u64bitmask,
	flags: u64bitmask,
	total_message_sent: i32,
	available_tags: *discord_thread_tags,
	applied_tags: *snowflakes,
	default_reaction_emoji: *discord_thread_default_reaction,
	default_thread_rate_limit_per_user: i32,
	default_sort_order: discord_sort_order_types,
	default_forum_layout: discord_forum_layout_types,
};

export type discord_channels = struct {
	length: i32,
	array: *discord_channel,
	realsize: i32,
};

export type discord_message_types = enum {
	DISCORD_MESSAGE_DEFAULT = 0,
	DISCORD_MESSAGE_RECIPIENT_ADD = 1,
	DISCORD_MESSAGE_RECIPIENT_REMOVE = 2,
	DISCORD_MESSAGE_CALL = 3,
	DISCORD_MESSAGE_CHANNEL_NAME_CHANGE = 4,
	DISCORD_MESSAGE_CHANNEL_ICON_CHANGE = 5,
	DISCORD_MESSAGE_CHANNEL_PINNED_MESSAGE = 6,
	DISCORD_MESSAGE_GUILD_MEMBER_JOIN = 7,
	DISCORD_MESSAGE_USER_PREMIUM_GUILD_SUBSCRIPTION = 8,
	DISCORD_MESSAGE_USER_PREMIUM_GUILD_SUBSCRIPTION_TIER_1 = 9,
	DISCORD_MESSAGE_USER_PREMIUM_GUILD_SUBSCRIPTION_TIER_2 = 10,
	DISCORD_MESSAGE_USER_PREMIUM_GUILD_SUBSCRIPTION_TIER_3 = 11,
	DISCORD_MESSAGE_CHANNEL_FOLLOW_ADD = 12,
	DISCORD_MESSAGE_GUILD_DISCOVERY_DISQUALIFIED = 14,
	DISCORD_MESSAGE_GUILD_DISCOVERY_REQUALIFIED = 15,
	DISCORD_MESSAGE_GUILD_DISCOVERY_GRACE_PERIOD_INITIAL_WARNING = 16,
	DISCORD_MESSAGE_GUILD_DISCOVERY_GRACE_PERIOD_FINAL_WARNING = 17,
	DISCORD_MESSAGE_THREAD_CREATED = 18,
	DISCORD_MESSAGE_REPLY = 19,
	DISCORD_MESSAGE_CHAT_INPUT_COMMAND = 20,
	DISCORD_MESSAGE_THREAD_STARTER_MESSAGE = 21,
	DISCORD_MESSAGE_GUILD_INVITE_REMINDER = 22,
	DISCORD_MESSAGE_CONTEXT_MENU_COMMAND = 23,
	DISCORD_MESSAGE_AUTO_MODERATION_ACTION = 24,
	DISCORD_MESSAGE_ROLE_SUBSCRIPTION_PURCHASE = 25,
	DISCORD_MESSAGE_INTERACTION_PREMIUM_UPSELL = 26,
	DISCORD_MESSAGE_STAGE_START = 27,
	DISCORD_MESSAGE_STAGE_END = 28,
	DISCORD_MESSAGE_STAGE_SPEAKER = 29,
	DISCORD_MESSAGE_STAGE_TOPIC = 31,
	DISCORD_MESSAGE_GUILD_APPLICATION_PREMIUM_SUBSCRIPTION = 32
};

export type discord_message_activity_types = enum {
	DISCORD_MESSAGE_ACTIVITY_JOIN = 1,
	DISCORD_MESSAGE_ACTIVITY_SPECTATE = 2,
	DISCORD_MESSAGE_ACTIVITY_LISTEN = 3,
	DISCORD_MESSAGE_ACTIVITY_JOIN_REQUEST = 5
};

export type discord_message_activity = struct {
	discord_message_activity_type: discord_message_activity_types,
	party_id: *c::char,
};

export type discord_message_reference = struct {
	message_id: u64snowflake,
	channel_id: u64snowflake,
	guild_id: u64snowflake,
	fail_if_not_exists: bool,
};

export type discord_message = struct {
	id: u64snowflake,
	channel_id: u64snowflake,
	guild_id: u64snowflake,
	author: *discord_user,
	member: *discord_guild_member,
	content: *c::char,
	timestamp: u64unix_ms,
	edited_timestamp: u64unix_ms,
	tts: bool,
	mention_everyone: bool,
	mentions: *discord_users,
	mention_roles: *snowflakes,
	mention_channels: *discord_channels,
	attachments: *discord_attachments,
	embeds: *discord_embeds,
	reactions: *discord_reactions,
	nonce: *json_char,
	pinned: bool,
	webhook_id: u64snowflake,
	discord_message_type: discord_message_types,
	activity: *discord_message_activity,
	application: *discord_application,
	application_id: u64snowflake,
	message_reference: *discord_message_reference,
	flags: u64bitmask,
	referenced_message: *discord_message,
	interaction: *discord_message_interaction,
	thread: *discord_channel,
	components: *discord_components,
	sticker_items: *discord_sticker_items,
	stickers: *discord_stickers,
	position: i32,
	role_subscription_data: *discord_role_subscription_data,
	resolved: *discord_resolved_data,
};

export type discord_messages = struct {
	length: i32,
	array: *discord_message,
	realsize: i32,
};

export type discord_followed_channel = struct {
	channel_id: u64snowflake,
	webhook_id: u64snowflake,
};

export type discord_reaction_count_details = struct {
	burst: i32,
	normal: i32,
};

export type discord_reaction = struct {
	count: i32,
	count_details: *discord_reaction_count_details,
	me: bool,
	me_burst: bool,
	emoji: *discord_emoji,
	burst_colors: *c::char,
};

export type discord_reactions = struct {
	length: i32,
	array: *discord_reaction,
	realsize: i32,
};

export type discord_overwrite = struct {
	id: u64snowflake,
	discord_overwrite_type: i32,
	allow: u64bitmask,
	deny: u64bitmask,
};

export type discord_overwrites = struct {
	length: i32,
	array: *discord_overwrite,
	realsize: i32,
};

export type discord_thread_metadata = struct {
	archived: bool,
	auto_archive_duration: i32,
	archive_timestamp: u64unix_ms,
	locked: bool,
	invitable: bool,
	create_timestamp: u64unix_ms,
};

export type discord_thread_member = struct {
	id: u64snowflake,
	user_id: u64snowflake,
	join_timestamp: u64unix_ms,
	flags: u64bitmask,
	member: *discord_guild_member,
	guild_id: u64snowflake,
};

export type discord_thread_members = struct {
	length: i32,
	array: *discord_thread_member,
	realsize: i32,
};

export type discord_thread_default_reaction = struct {
	emoji_id: u64snowflake,
	emoji_name: *c::char,
};

export type discord_thread_tag = struct {
	id: u64snowflake,
	name: *c::char,
	moderated: bool,
	emoji_id: u64snowflake,
	emoji_name: *c::char,
};

export type discord_thread_tags = struct {
	length: i32,
	array: *discord_thread_tag,
	realsize: i32,
};

export type discord_embed_thumbnail = struct {
	url: *c::char,
	proxy_url: *c::char,
	height: i32,
	width: i32,
};

export type discord_embed_video = struct {
	url: *c::char,
	proxy_url: *c::char,
	height: i32,
	width: i32,
};

export type discord_embed_image = struct {
	url: *c::char,
	proxy_url: *c::char,
	height: i32,
	width: i32,
};

export type discord_embed_provider = struct {
	name: *c::char,
	url: *c::char,
};

export type discord_embed_author = struct {
	name: *c::char,
	url: *c::char,
	icon_url: *c::char,
	proxy_icon_url: *c::char,
};

export type discord_embed_footer = struct {
	text: *c::char,
	icon_url: *c::char,
	proxy_icon_url: *c::char,
};

export type discord_embed_field = struct {
	name: *c::char,
	value: *c::char,
	Inline: bool,
};

export type discord_embed_fields = struct {
	length: i32,
	array: *discord_embed_field,
	realsize: i32,
};

export type discord_embed = struct {
	title: *c::char,
	discord_embed_type: *c::char,
	description: *c::char,
	url: *c::char,
	timestamp: u64unix_ms,
	color: i32,
	footer: *discord_embed_footer,
	image: *discord_embed_image,
	thumbnail: *discord_embed_thumbnail,
	video: *discord_embed_video,
	provider: *discord_embed_provider,
	author: *discord_embed_author,
	fields: *discord_embed_fields,
};

export type discord_embeds = struct {
	length: i32,
	array: *discord_embed,
	realsize: i32,
};

export def DISCORD_ATTACHMENT_IS_REMIX: u64 = 1 << 2;

export type discord_attachment = struct {
	content: *c::char,
	id: u64snowflake,
	filename: *c::char,
	description: *c::char,
	content_type: *c::char,
	length: size,
	url: *c::char,
	proxy_url: *c::char,
	height: i32,
	width: i32,
	ephemeral: bool,
	duration_secs: i32,
	waveform: *c::char,
	flags: u64bitmask,
};

export type discord_attachments = struct {
	length: i32,
	array: *discord_attachment,
	realsize: i32,
};

export type discord_channel_mention = struct {
	id: u64snowflake,
	guild_id: u64snowflake,
	channel_mention_type: discord_channel_types,
	name: *c::char,
};

export type discord_allowed_mention = struct {
	parse: *strings,
	roles: *snowflakes,
	users: *snowflakes,
	replied_user: bool,
};

export type discord_role_subscription_data = struct {
	role_subscription_listing_id: u64snowflake,
	tier_name: *c::char,
	total_months_subscribed: i32,
	is_renewal: bool,
};

export type discord_thread_response_body = struct {
	threads: *discord_channels,
	members: *discord_thread_members,
	has_more: bool,
};

export type discord_modify_channel = struct {
	reason: *c::char,
	name: *c::char,
	discord_modify_channel_type: discord_channel_types,
	position: i32,
	topic: *c::char,
	nsfw: bool,
	rate_limit_per_user: i32,
	user_limit: i32,
	permission_overwrites: *discord_overwrites,
	parent_id: u64snowflake,
	rtc_region: *c::char,
	video_quality_mode: i32,
	default_auto_archive_duration: i32,
	archived: bool,
	auto_archive_duration: i32,
	locked: bool,
	invitable: bool,
};

export type discord_delete_channel = struct {
	reason: *c::char,
};

export type discord_get_channel_messages = struct {
	around: u64snowflake,
	before: u64snowflake,
	after: u64snowflake,
	limit: i32,
};

export type discord_create_message = struct {
	content: *c::char,
	tts: bool,
	embeds: *discord_embeds,
	allowed_mentions: *discord_allowed_mention,
	message_reference: *discord_message_reference,
	components: *discord_components,
	sticker_ids: *snowflakes,
	attachments: *discord_attachments,
	flags: u64bitmask,
	enforce_nonce: bool,
};

export type discord_get_reactions = struct {
	after: u64snowflake,
	limit: i32,
};

export type discord_edit_message = struct {
	content: *c::char,
	embeds: *discord_embeds,
	flags: u64bitmask,
	allowed_mentions: *discord_allowed_mention,
	components: *discord_components,
	attachments: *discord_attachments,
};

export type discord_delete_message = struct {
	reason: *c::char,
};

export type discord_bulk_delete_messages = struct {
	reason: *c::char,
	messages: *snowflakes,
};

export type discord_edit_channel_permissions = struct {
	reason: *c::char,
	allow: u64bitmask,
	deny: u64bitmask,
	discord_edit_channel_permissions_type: i32,
};

export type discord_create_channel_invite = struct {
	reason: *c::char,
	max_age: i32,
	max_uses: i32,
	temporary: bool,
	unique: bool,
	target_type: discord_invite_target_types,
	target_user_id: u64snowflake,
	target_application_id: u64snowflake,
};

export type discord_delete_channel_permission = struct {
	reason: *c::char,
};

export type discord_follow_news_channel = struct {
	webhook_channel_id: u64snowflake,
};

export type discord_pin_message = struct {
	reason: *c::char,
};

export type discord_unpin_message = struct {
	reason: *c::char,
};

export type discord_group_dm_add_recipient = struct {
	access_token: *c::char,
	nick: *c::char,
};

export type discord_start_thread_with_message = struct {
	reason: *c::char,
	name: *c::char,
	auto_archive_duration: i32,
	rate_limit_per_user: i32,
};

export type discord_start_thread_without_message = struct {
	reason: *c::char,
	name: *c::char,
	auto_archive_duration: i32,
	discord_start_thread_without_message_type: discord_channel_types,
	invitable: bool,
	rate_limit_per_user: i32,
};

export type discord_list_active_threads = struct {
	threads: *discord_channels,
	members: *discord_thread_members,
	has_more: bool,
};

export type discord_emoji = struct {
	id: u64snowflake,
	name: *c::char,
	roles: *snowflakes,
	user: *discord_user,
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

export type discord_create_guild_emoji = struct {
	reason: *c::char,
	name: *c::char,
	image: *c::char,
	roles: *snowflakes,
};

export type discord_modify_guild_emoji = struct {
	reason: *c::char,
	name: *c::char,
	image: *c::char,
	roles: *snowflakes,
};

export type discord_delete_guild_emoji = struct {
	reason: *c::char,
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

export type discord_verification_level = enum {
	DISCORD_VERIFICATION_NONE = 0,
	DISCORD_VERIFICATION_LOW = 1,
	DISCORD_VERIFICATION_MEDIUM = 2,
	DISCORD_VERIFICATION_HIGH = 3,
	DISCORD_VERIFICATION_VERY_HIGH = 4
};

export type discord_guild_nsfw_level = enum {
	DISCORD_GUILD_NSFW_DEFAULT = 0,
	DISCORD_GUILD_NSFW_EXPLICIT = 1,
	DISCORD_GUILD_NSFW_SAFE = 2,
	DISCORD_GUILD_NSFW_AGE_RESTRICTED = 3
};

export type discord_premium_tier = enum {
	DISCORD_PREMIUM_TIER_NONE = 0,
	DISCORD_PREMIUM_TIER_1 = 1,
	DISCORD_PREMIUM_TIER_2 = 2,
	DISCORD_PREMIUM_TIER_3 = 3
};

export type discord_integration_expire_behaviors = enum {
	DISCORD_INTEGRATION_REMOVE_ROLE = 0,
	DISCORD_INTEGRATION_KICK = 1
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

export type discord_guild_preview = struct {
	id: u64snowflake,
	name: *c::char,
	icon: *c::char,
	splash: *c::char,
	discovery_splash: *c::char,
	emojis: *discord_emojis,
	features: *strings,
	approximate_member_count: i32,
	approximate_presence_count: i32,
	description: *c::char,
	stickers: *discord_stickers,
};

export type discord_guild_widget_settings = struct {
	reason: *c::char,
	enabled: bool,
	channel_id: u64snowflake,
};

export type discord_guild_widget = struct {
	id: u64snowflake,
	name: *c::char,
	instant_invite: *c::char,
	channels: *discord_channels,
	members: *discord_users,
	presence_count: i32,
};

export type discord_guild_member = struct {
	user: *discord_user,
	nick: *c::char,
	avatar: *c::char,
	roles: *snowflakes,
	joined_at: u64unix_ms,
	premium_since: u64unix_ms,
	deaf: bool,
	muted: bool,
	pending: bool,
	permissions: u64bitmask,
	communication_disabled_until: u64unix_ms,
	guild_id: u64snowflake,
};

export type discord_guild_members = struct {
	length: i32,
	array: *discord_guild_member,
	realsize: i32,
};

export type discord_integration = struct {
	id: u64snowflake,
	name: *c::char,
	discord_integration_type: *c::char,
	enabled: bool,
	syncing: bool,
	role_id: u64snowflake,
	enable_emoticons: bool,
	expire_behavior: discord_integration_expire_behaviors,
	expire_grace_period: i32,
	user: *discord_user,
	account: *discord_integration_account,
	synced_at: u64unix_ms,
	subscriber_count: i32,
	revoked: bool,
	application: *discord_integration_application,
	guild_id: u64snowflake,
};

export type discord_integrations = struct {
	length: i32,
	array: *discord_integration,
	realsize: i32,
};

export type discord_integration_account = struct {
	id: *c::char,
	name: *c::char,
};

export type discord_integration_application = struct {
	id: u64snowflake,
	name: *c::char,
	icon: *c::char,
	description: *c::char,
	summary: *c::char,
	bot: *discord_user,
};

export type discord_ban = struct {
	reason: *c::char,
	user: *discord_user,
};

export type discord_bans = struct {
	length: i32,
	array: *discord_ban,
	realsize: i32,
};

export type discord_welcome_screen = struct {
	description: *c::char,
	welcome_channels: *discord_welcome_screen_channels,
};

export type discord_welcome_screen_channel = struct {
	channel_id: u64snowflake,
	description: *c::char,
	emoji_id: u64snowflake,
	emoji_name: *c::char,
};

export type discord_welcome_screen_channels = struct {
	length: i32,
	array: *discord_welcome_screen_channel,
	realsize: i32,
};

export type discord_prune_count = struct {
	pruned: i32,
};

export type discord_create_guild = struct {
	reason: *c::char,
	name: *c::char,
	region: *c::char,
	icon: *c::char,
	verification_level: discord_verification_level,
	default_message_notifications: discord_message_notification_level,
	explicit_content_filter: discord_explicit_content_filter_level,
	roles: *discord_roles,
	channels: *discord_channels,
	afk_channel_id: u64snowflake,
	afk_timeout: i32,
	system_channel_id: u64snowflake,
	system_channel_flags: u64bitmask,
};

export type discord_modify_guild = struct {
	reason: *c::char,
	name: *c::char,
	verification_level: discord_verification_level,
	default_message_notifications: discord_message_notification_level,
	explicit_content_filter: discord_explicit_content_filter_level,
	afk_channel_id: u64snowflake,
	afk_timeout: i32,
	icon: *c::char,
	owner_id: u64snowflake,
	splash: *c::char,
	discovery_splash: *c::char,
	banner: *c::char,
	system_channel_id: u64snowflake,
	system_channel_flags: u64bitmask,
	rules_channel_id: u64snowflake,
	public_updates_channel_id: u64snowflake,
	preferred_locale: *c::char,
	features: *strings,
	description: *c::char,
	premium_progress_bar_enabled: bool,
};

export type discord_create_guild_channel = struct {
	reason: *c::char,
	name: *c::char,
	discord_create_guild_channel_type: discord_channel_types,
	topic: *c::char,
	bitrate: i32,
	user_limit: i32,
	rate_limit_per_user: i32,
	position: i32,
	permission_overwrites: *discord_overwrites,
	parent_id: u64snowflake,
	nsfw: bool,
};

export type discord_modify_guild_channel_position = struct {
	id: u64snowflake,
	position: i32,
	lock_category: bool,
	parent_id: u64snowflake,
};

export type discord_modify_guild_channel_positions = struct {
	length: i32,
	array: *discord_modify_guild_channel_position,
	realsize: i32,
};

export type discord_list_active_guild_threads = struct {
	threads: *discord_channels,
	members: *discord_thread_members,
};

export type discord_list_guild_members = struct {
	limit: i32,
	after: u64snowflake,
};

export type discord_search_guild_members = struct {
	query: *c::char,
	limit: i32,
};

export type discord_add_guild_member = struct {
	access_token: *c::char,
	nick: *c::char,
	roles: *snowflakes,
	mute: bool,
	deaf: bool,
};

export type discord_modify_guild_member = struct {
	reason: *c::char,
	nick: *c::char,
	roles: *snowflakes,
	mute: bool,
	deaf: bool,
	channel_id: u64snowflake,
	communication_disabled_until: u64unix_ms,
};

export type discord_modify_current_member = struct {
	reason: *c::char,
	nick: *c::char,
};

export type discord_modify_current_user_nick = struct {
	reason: *c::char,
	nick: *c::char,
};

export type discord_add_guild_member_role = struct {
	reason: *c::char,
};

export type discord_remove_guild_member_role = struct {
	reason: *c::char,
};

export type discord_remove_guild_member = struct {
	reason: *c::char,
};

export type discord_create_guild_ban = struct {
	reason: *c::char,
	delete_message_days: i32,
};

export type discord_remove_guild_ban = struct {
	reason: *c::char,
};

export type discord_create_guild_role = struct {
	reason: *c::char,
	name: *c::char,
	permissions: u64bitmask,
	color: i32,
	hoist: bool,
	icon: *c::char,
	unicode_emoji: *c::char,
	mentionable: bool,
};

export type discord_modify_guild_role_position = struct {
	id: u64snowflake,
	position: i32,
};

export type discord_modify_guild_role_positions = struct {
	length: i32,
	array: *discord_modify_guild_channel_position,
	realsize: i32,
};

export type discord_modify_guild_role = struct {
	reason: *c::char,
	name: *c::char,
	permissions: u64bitmask,
	color: i32,
	hoist: bool,
	icon: *c::char,
	unicode_emoji: *c::char,
	mentionable: bool,
};

export type discord_delete_guild_role = struct {
	reason: *c::char,
};

export type discord_get_guild_prune_count = struct {
	days: i32,
	include_roles: *snowflakes,
};

export type discord_begin_guild_prune = struct {
	reason: *c::char,
	days: i32,
	compute_prune_count: bool,
	include_roles: *snowflakes,
};

export type discord_delete_guild_integrations = struct {
	reason: *c::char,
	days: i32,
	include_roles: *snowflakes,
};

export type discord_get_guild_widget_image = struct {
	style: *c::char,
};

export type discord_modify_guild_welcome_screen = struct {
	reason: *c::char,
	enabled: bool,
	welcome_channels: *discord_welcome_screen_channels,
	description: *c::char,
};

export type discord_modify_current_user_voice_state = struct {
	channel_id: u64snowflake,
	suppress: bool,
	request_to_speak_timestamp: u64unix_ms,
};

export type discord_modify_user_voice_state = struct {
	channel_id: u64snowflake,
	suppress: bool,
};

export type discord_guild_scheduled_event_privacy_level = enum {
	DISCORD_GUILD_SCHEDULED_EVENT_GUILD_ONLY = 2
};

export type discord_guild_scheduled_event_entity_types = enum {
	DISCORD_GUILD_SCHEDULED_EVENT_ENTITY_STAGE_INSTANCE = 1,
	DISCORD_GUILD_SCHEDULED_EVENT_ENTITY_VOICE = 2,
	DISCORD_GUILD_SCHEDULED_EVENT_ENTITY_EXTERNAL = 3
};

export type discord_guild_scheduled_event_status = enum {
	DISCORD_GUILD_SCHEDULED_EVENT_SCHEDULED = 1,
	DISCORD_GUILD_SCHEDULED_EVENT_ACTIVE = 2,
	DISCORD_GUILD_SCHEDULED_EVENT_COMPLETED = 3,
	DISCORD_GUILD_SCHEDULED_EVENT_CANCELED = 4
};

export type discord_guild_scheduled_event = struct {
	id: u64snowflake,
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	creator_id: u64snowflake,
	name: *c::char,
	description: *c::char,
	scheduled_start_time: u64unix_ms,
	scheduled_end_time: u64unix_ms,
	privacy_level: discord_guild_scheduled_event_privacy_level,
	status: discord_guild_scheduled_event_status,
	entity_type: discord_guild_scheduled_event_entity_types,
	entity_id: u64snowflake,
	entity_metadata: *discord_guild_scheduled_event_entity_metadata,
	creator: *discord_user,
	user_count: i32,
	image: *c::char,
};

export type discord_guild_scheduled_event_entity_metadata = struct {
	location: *c::char,
};

export type discord_guild_scheduled_events = struct {
	length: i32,
	array: *discord_guild_scheduled_event,
	realsize: i32,
};

export type discord_guild_scheduled_event_user = struct {
	guild_scheduled_event_id: u64snowflake,
	user: *discord_user,
	member: *discord_guild_member,
};

export type discord_guild_scheduled_event_users = struct {
	length: i32,
	array: *discord_guild_scheduled_event_user,
	realsize: i32,
};

export type discord_list_guild_scheduled_events = struct {
	with_user_count: bool,
};

export type discord_create_guild_scheduled_event = struct {
	reason: *c::char,
	channel_id: u64snowflake,
	entity_metadata: *discord_guild_scheduled_event_entity_metadata,
	name: *c::char,
	privacy_level: discord_guild_scheduled_event_privacy_level,
	scheduled_start_time: u64unix_ms,
	scheduled_end_time: u64unix_ms,
	description: *c::char,
	entity_type: discord_guild_scheduled_event_entity_types,
	image: *c::char,
};

export type discord_get_guild_scheduled_event = struct {
	with_user_count: bool,
};

export type discord_modify_guild_scheduled_event = struct {
	reason: *c::char,
	channel_id: u64snowflake,
	entity_metadata: *discord_guild_scheduled_event_entity_metadata,
	name: *c::char,
	scheduled_start_time: u64unix_ms,
	scheduled_end_time: u64unix_ms,
	description: *c::char,
	entity_type: discord_guild_scheduled_event_entity_types,
	status: discord_guild_scheduled_event_status,
	image: *c::char,
};

export type discord_get_guild_scheduled_event_users = struct {
	limit: i32,
	with_member: bool,
	before: u64snowflake,
	after: u64snowflake,
};

export type discord_guild_template = struct {
	code: *c::char,
	name: *c::char,
	description: *c::char,
	usage_count: i32,
	creator_id: u64snowflake,
	creator: *discord_user,
	created_at: u64unix_ms,
	updated_at: u64unix_ms,
	source_guild_id: u64snowflake,
	serialized_source_guild: *discord_guild,
	is_dirty: bool,
};

export type discord_guild_templates = struct {
	length: i32,
	array: *discord_guild_template,
	realsize: i32,
};

export type discord_create_guild_from_guild_template = struct {
	name: *c::char,
	icon: *c::char,
};

export type discord_create_guild_template = struct {
	name: *c::char,
	description: *c::char,
};

export type discord_modify_guild_template = struct {
	name: *c::char,
	description: *c::char,
};

export type discord_privacy_level = enum {
	DISCORD_PRIVACY_PUBLIC = 1,
	DISCORD_PRIVACY_GUILD_ONLY = 2
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

export type discord_create_stage_instance = struct {
	reason: *c::char,
	channel_id: u64snowflake,
	topic: *c::char,
	privacy_level: discord_privacy_level,
};

export type discord_modify_stage_instance = struct {
	reason: *c::char,
	topic: *c::char,
	privacy_level: discord_privacy_level,
};

export type discord_delete_stage_instance = struct {
	reason: *c::char,
};

export type discord_sticker_types = enum {
	DISCORD_STICKER_STANDARD = 1,
	DISCORD_STICKER_GUILD = 2
};

export type discord_sticker_format_types = enum {
	DISCORD_STICKER_FORMAT_PNG = 1,
	DISCORD_STICKER_FORMAT_APNG = 2,
	DISCORD_STICKER_FORMAT_LOTTIE = 3
};

export type discord_sticker = struct {
	id: u64snowflake,
	pack_id: u64snowflake,
	name: *c::char,
	description: *c::char,
	tags: *c::char,
	discord_sticker_type: discord_sticker_types,
	format_type: discord_sticker_format_types,
	available: bool,
	guild_id: u64snowflake,
	user: *discord_user,
	sort_value: i32,
};

export type discord_stickers = struct {
	length: i32,
	array: *discord_sticker,
	realsize: i32,
};

export type discord_sticker_item = struct {
	id: u64snowflake,
	name: *c::char,
	format_type: discord_sticker_format_types,
};

export type discord_sticker_items = struct {
	length: i32,
	array: *discord_sticker_item,
	realsize: i32,
};

export type discord_sticker_pack = struct {
	id: u64snowflake,
	stickers: *discord_stickers,
	name: *c::char,
	sku_id: u64snowflake,
	cover_sticker_id: u64snowflake,
	description: *c::char,
	banner_asset_id: u64snowflake,
};

export type discord_sticker_packs = struct {
	length: i32,
	array: *discord_sticker_pack,
	realsize: i32,
};

export type discord_list_nitro_sticker_packs = struct {
	sticker_packs: *discord_sticker_packs,
};

export type discord_create_guild_sticker = struct {
	reason: *c::char,
	name: *c::char,
	description: *c::char,
	tags: *c::char,
	file: *discord_attachment,
};

export type discord_modify_guild_sticker = struct {
	name: *c::char,
	description: *c::char,
	tags: *c::char,
};

export type discord_delete_guild_sticker = struct {
	reason: *c::char,
};

export type discord_premium_types = enum {
	DISCORD_PREMIUM_NONE = 0,
	DISCORD_PREMIUM_NITRO_CLASSIC = 1,
	DISCORD_PREMIUM_NITRO = 2
};

export type discord_visibility_types = enum {
	DISCORD_VISIBILITY_NONE = 0,
	DISCORD_VISIBILITY_EVERYONE = 1
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

export type discord_users = struct {
	length: i32,
	array: *discord_user,
	realsize: i32,
};

export type discord_connection = struct {
	id: u64snowflake,
	name: *c::char,
	discord_connection_type: *c::char,
	revoked: bool,
	integrations: *discord_integrations,
	verified: bool,
	friend_sync: bool,
	show_activity: bool,
	visibility: discord_visibility_types,
};

export type discord_connections = struct {
	length: i32,
	array: *discord_user,
	realsize: i32,
};

export type discord_modify_current_user = struct {
	username: *c::char,
	avatar: *c::char,
};

export type discord_get_current_user_guilds = struct {
	before: u64snowflake,
	after: u64snowflake,
	limit: i32,
};

export type discord_create_dm = struct {
	recipient_id: u64snowflake,
};

export type discord_create_group_dm = struct {
	access_tokens: *snowflakes,
	nicks: *strings,
};

export type discord_voice_state = struct {
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	user_id: u64snowflake,
	member: *discord_guild_member,
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

export type discord_voice_region = struct {
	id: *c::char,
	name: *c::char,
	optimal: bool,
	deprecated: bool,
	custom: bool,
};

export type discord_voice_regions = struct {
	length: i32,
	array: *discord_voice_region,
	realsize: i32,
};

export type discord_webhook_types = enum {
	DISCORD_WEBHOOK_INCOMING = 1,
	DISCORD_WEBHOOK_CHANNEL_FOLLOWER = 2,
	DISCORD_WEBHOOK_APPLICATION = 3
};

export type discord_webhook = struct {
	id: u64snowflake,
	discord_webhook_type: discord_webhook_types,
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	user: *discord_user,
	name: *c::char,
	token: *c::char,
	application_id: u64snowflake,
	source_channel: *discord_channel,
	url: *c::char,
};

export type discord_webhooks = struct {
	length: i32,
	array: *discord_webhook,
	realsize: i32,
};

export type discord_create_webhook = struct {
	reason: *c::char,
	name: *c::char,
	avatar: *c::char,
};

export type discord_modify_webhook = struct {
	reason: *c::char,
	name: *c::char,
	avatar: *c::char,
	channel_id: u64snowflake,
};

export type discord_delete_webhook = struct {
	reason: *c::char,
};

export type discord_modify_webhook_with_token = struct {
	name: *c::char,
	avatar: *c::char,
};

export type discord_execute_webhook = struct {
	wait: bool,
	thread_id: u64snowflake,
	content: *c::char,
	username: *c::char,
	avatar_url: *c::char,
	tts: bool,
	embeds: *discord_embeds,
	allowed_mentions: *discord_allowed_mention,
	components: *discord_components,
	attachments: *discord_attachments,
	flags: u64bitmask,
};

export type discord_get_webhook_message = struct {
	thread_id: u64snowflake,
};

export type discord_edit_webhook_message = struct {
	thread_id: u64snowflake,
	content: *c::char,
	embeds: *discord_embeds,
	allowed_mentions: *discord_allowed_mention,
	components: *discord_components,
	attachments: *discord_attachments,
};

export type discord_delete_webhook_message = struct {
	thread_id: u64snowflake,
};

export type discord_gateway_close_opcodes = enum {
	DISCORD_GATEWAY_CLOSE_REASON_UNKNOWN_ERROR = 4000,
	DISCORD_GATEWAY_CLOSE_REASON_UNKNOWN_OPCODE = 4001,
	DISCORD_GATEWAY_CLOSE_REASON_DECODE_ERROR = 4002,
	DISCORD_GATEWAY_CLOSE_REASON_NOT_AUTHENTICATED = 4003,
	DISCORD_GATEWAY_CLOSE_REASON_AUTHENTICATION_FAILED = 4004,
	DISCORD_GATEWAY_CLOSE_REASON_ALREADY_AUTHENTICATED = 4005,
	DISCORD_GATEWAY_CLOSE_REASON_INVALID_SEQUENCE = 4007,
	DISCORD_GATEWAY_CLOSE_REASON_RATE_LIMITED = 4008,
	DISCORD_GATEWAY_CLOSE_REASON_SESSION_TIMED_OUT = 4009,
	DISCORD_GATEWAY_CLOSE_REASON_INVALID_SHARD = 4010,
	DISCORD_GATEWAY_CLOSE_REASON_SHARDING_REQUIRED = 4011,
	DISCORD_GATEWAY_CLOSE_REASON_INVALID_API_VERSION = 4012,
	DISCORD_GATEWAY_CLOSE_REASON_INVALID_INTENTS = 4013,
	DISCORD_GATEWAY_CLOSE_REASON_DISALLOWED_INTENTS = 4014,
	DISCORD_GATEWAY_CLOSE_REASON_RECONNECT = 4900
};

export type discord_gateway_opcodes = enum {
	DISCORD_GATEWAY_DISPATCH = 0,
	DISCORD_GATEWAY_HEARTBEAT = 1,
	DISCORD_GATEWAY_IDENTIFY = 2,
	DISCORD_GATEWAY_PRESENCE_UPDATE = 3,
	DISCORD_GATEWAY_VOICE_STATE_UPDATE = 4,
	DISCORD_GATEWAY_RESUME = 6,
	DISCORD_GATEWAY_RECONNECT = 7,
	DISCORD_GATEWAY_REQUEST_GUILD_MEMBERS = 8,
	DISCORD_GATEWAY_INVALID_SESSION = 9,
	DISCORD_GATEWAY_HELLO = 10,
	DISCORD_GATEWAY_HEARTBEAT_ACK = 11
};

export type discord_activity_types = enum {
	DISCORD_ACTIVITY_GAME = 0,
	DISCORD_ACTIVITY_STREAMING = 1,
	DISCORD_ACTIVITY_LISTENING = 2,
	DISCORD_ACTIVITY_WATCHING = 3,
	DISCORD_ACTIVITY_CUSTOM = 4,
	DISCORD_ACTIVITY_COMPETING = 5
};

export type discord_activity = struct {
	name: *c::char,
	discord_activity_type: discord_activity_types,
	url: *c::char,
	created_at: u64unix_ms,
	timestamps: *discord_activity_timestamps,
	application_id: u64snowflake,
	details: *c::char,
	state: *c::char,
	emoji: *discord_activity_emoji,
	party: *discord_activity_party,
	assets: *discord_activity_assets,
	secrets: *discord_activity_secrets,
	instance: bool,
	flags: u64bitmask,
	buttons: *discord_activity_buttons,
};

export type discord_activities = struct {
	length: i32,
	array: *discord_activity,
	realsize: i32,
};

export type discord_activity_timestamps = struct {
	start: u64unix_ms,
	end: u64unix_ms,
};

export type discord_activity_emoji = struct {
	name: *c::char,
	id: u64snowflake,
	animated: bool,
};

export type discord_activity_party = struct {
	id: *c::char,
	length: *integers,
};

export type discord_activity_assets = struct {
	large_image: *c::char,
	large_text: *c::char,
	small_image: *c::char,
	small_text: *c::char,
};

export type discord_activity_secrets = struct {
	join: *c::char,
	spectate: *c::char,
	discord_activity_secrets_match: *c::char,
};

export type discord_activity_button = struct {
	label: *c::char,
	url: *c::char,
};

export type discord_activity_buttons = struct {
	length: i32,
	array: *discord_activity_button,
	realsize: i32,
};

export type discord_presence_update = struct {
	user: *discord_user,
	guild_id: u64snowflake,
	status: *c::char,
	client_status: *discord_client_status,
	activities: *discord_activities,
	since: u64unix_ms,
	afk: bool,
};

export type discord_client_status = struct {
	desktop: *c::char,
	mobile: *c::char,
	web: *c::char,
};

export type discord_presence_updates = struct {
	length: i32,
	array: *discord_presence_update,
	realsize: i32,
};

export type discord_identify = struct {
	token: *c::char,
	properties: *discord_identify_connection,
	compress: bool,
	large_threshold: i32,
	shard: *integers,
	presence: *discord_presence_update,
	intents: u64bitmask,
};

export type discord_identify_connection = struct {
	os: *c::char,
	browser: *c::char,
	device: *c::char,
};

export type discord_resume = struct {
	token: *c::char,
	session_id: *c::char,
	seq: i32,
};

export type discord_request_guild_members = struct {
	guild_id: u64snowflake,
	query: *c::char,
	limit: i32,
	presences: bool,
	user_ids: *snowflakes,
	nonce: *c::char,
};

export type discord_update_voice_state = struct {
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	self_mute: bool,
	self_deaf: bool,
};

export type discord_ready = struct {
	v: i32,
	user: *discord_user,
	guilds: *discord_guilds,
	session_id: *c::char,
	shard: *integers,
	application: *discord_application,
};

export type discord_auto_moderation_action_execution = struct {
	guild_id: u64snowflake,
	action: *discord_auto_moderation_action,
	rule_trigger_type: discord_auto_moderation_trigger_types,
	user_id: u64snowflake,
	channel_id: u64snowflake,
	message_id: u64snowflake,
	alert_system_message_id: u64snowflake,
	content: *c::char,
	matched_keyword: *c::char,
	matched_content: *c::char,
};

export type discord_thread_list_sync = struct {
	guild_id: u64snowflake,
	channel_ids: *snowflakes,
	threads: *discord_channels,
	members: *discord_thread_members,
};

export type discord_thread_members_update = struct {
	id: u64snowflake,
	guild_id: u64snowflake,
	member_count: i32,
	added_members: *discord_thread_members,
	removed_member_ids: *snowflakes,
};

export type discord_channel_pins_update = struct {
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	last_pin_timestamp: u64unix_ms,
};

export type discord_guild_ban_add = struct {
	guild_id: u64snowflake,
	user: *discord_user,
};

export type discord_guild_ban_remove = struct {
	guild_id: u64snowflake,
	user: *discord_user,
};

export type discord_guild_emojis_update = struct {
	guild_id: u64snowflake,
	emojis: *discord_emojis,
};

export type discord_guild_stickers_update = struct {
	guild_id: u64snowflake,
	stickers: *discord_stickers,
};

export type discord_guild_integrations_update = struct {
	guild_id: u64snowflake,
};

export type discord_guild_member_remove = struct {
	guild_id: u64snowflake,
	user: *discord_user,
};

export type discord_guild_member_update = struct {
	guild_id: u64snowflake,
	roles: *snowflakes,
	user: *discord_user,
	nick: *c::char,
	avatar: *c::char,
	joined_at: u64unix_ms,
	premium_since: u64unix_ms,
	deaf: bool,
	mute: bool,
	pending: bool,
	communication_disabled_until: u64unix_ms,
};

export type discord_guild_members_chunk = struct {
	guild_id: u64snowflake,
	members: *discord_guild_members,
	chunk_index: i32,
	chunk_count: i32,
	not_found: *snowflakes,
	presences: *discord_presence_updates,
	nonce: *c::char,
};

export type discord_guild_role_create = struct {
	guild_id: u64snowflake,
	role: *discord_role,
};

export type discord_guild_role_update = struct {
	guild_id: u64snowflake,
	role: *discord_role,
};

export type discord_guild_role_delete = struct {
	guild_id: u64snowflake,
	role_id: u64snowflake,
};

export type discord_guild_scheduled_event_user_add = struct {
	guild_scheduled_event_id: u64snowflake,
	user_id: u64snowflake,
	guild_id: u64snowflake,
};

export type discord_guild_scheduled_event_user_remove = struct {
	guild_scheduled_event_id: u64snowflake,
	user_id: u64snowflake,
	guild_id: u64snowflake,
};

export type discord_integration_delete = struct {
	id: u64snowflake,
	guild_id: u64snowflake,
	application_id: u64snowflake,
};

export type discord_invite_create = struct {
	channel_id: u64snowflake,
	code: *c::char,
	created_at: u64unix_ms,
	guild_id: u64snowflake,
	inviter: *discord_user,
	max_age: i32,
	max_uses: i32,
	target_type: discord_invite_target_types,
	target_user: *discord_user,
	target_application: *discord_application,
	temporary: bool,
	uses: i32,
};

export type discord_invite_delete = struct {
	channel_id: u64snowflake,
	guild_id: u64snowflake,
	code: *c::char,
};

export type discord_message_delete = struct {
	id: u64snowflake,
	channel_id: u64snowflake,
	guild_id: u64snowflake,
};

export type discord_message_delete_bulk = struct {
	ids: *snowflakes,
	channel_id: u64snowflake,
	guild_id: u64snowflake,
};

export type discord_message_reaction_add = struct {
	user_id: u64snowflake,
	channel_id: u64snowflake,
	message_id: u64snowflake,
	guild_id: u64snowflake,
	member: *discord_guild_member,
	emoji: *discord_emoji,
};

export type discord_message_reaction_remove = struct {
	user_id: u64snowflake,
	channel_id: u64snowflake,
	message_id: u64snowflake,
	guild_id: u64snowflake,
	emoji: *discord_emoji,
};

export type discord_message_reaction_remove_all = struct {
	channel_id: u64snowflake,
	message_id: u64snowflake,
	guild_id: u64snowflake,
};

export type discord_message_reaction_remove_emoji = struct {
	channel_id: u64snowflake,
	guild_id: u64snowflake,
	message_id: u64snowflake,
	emoji: *discord_emoji,
};

export type discord_typing_start = struct {
	channel_id: u64snowflake,
	guild_id: u64snowflake,
	user_id: u64snowflake,
	timestamp: u64unix_ms,
	member: *discord_guild_member,
};

export type discord_voice_server_update = struct {
	token: *c::char,
	guild_id: u64snowflake,
	endpoint: *c::char,
};

export type discord_webhooks_update = struct {
	guild_id: u64snowflake,
	channel_id: u64snowflake,
};

export type discord_session_start_limit = struct {
	total: i32,
	remaining: i32,
	reset_after: i32,
	max_concurrency: i32,
};

export type discord_auth_response = struct {
	application: *discord_application,
	scopes: *strings,
	expires: u64unix_ms,
	user: *discord_user,
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

export type discord_role_tag = struct {
	bot_id: u64snowflake,
	integration_id: u64snowflake,
	premium_subscribe: bool,
};

export type discord_membership_state = enum {
	DISCORD_MEMBERSHIP_INVITED = 1,
	DISCORD_MEMBERSHIP_ACCEPTED = 2
};

export type discord_team = struct {
	icon: *c::char,
	id: u64snowflake,
	members: *discord_team_members,
	name: *c::char,
	owner_user_id: u64snowflake,
};

export type discord_team_member = struct {
	membership_state: discord_membership_state,
	permissions: *bitmasks,
	team_id: u64snowflake,
	user: *discord_user,
};

export type discord_team_members = struct {
	length: i32,
	array: *discord_team_member,
	realsize: i32,
};

export def DISCORD_VOICE_MICROPHONE: u64 = 1 << 0;
export def DISCORD_VOICE_SOUNDSHARE: u64 = 1 << 1;
export def DISCORD_VOICE_PRIORITY: u64 = 1 << 2;

export type discord_voice_close_opcodes = enum {
	DISCORD_VOICE_CLOSE_REASON_UNKNOWN_OPCODE = 4001,
	DISCORD_VOICE_CLOSE_REASON_DECODE_ERROR = 4002,
	DISCORD_VOICE_CLOSE_REASON_NOT_AUTHENTICATED = 4003,
	DISCORD_VOICE_CLOSE_REASON_AUTHENTICATION_FAILED = 4004,
	DISCORD_VOICE_CLOSE_REASON_ALREADY_AUTHENTICATED = 4005,
	DISCORD_VOICE_CLOSE_REASON_INVALID_SESSION = 4006,
	DISCORD_VOICE_CLOSE_REASON_SESSION_TIMED_OUT = 4009,
	DISCORD_VOICE_CLOSE_REASON_SERVER_NOT_FOUND = 4011,
	DISCORD_VOICE_CLOSE_REASON_UNKNOWN_PROTOCOL = 4012,
	DISCORD_VOICE_CLOSE_REASON_DISCONNECTED = 4014,
	DISCORD_VOICE_CLOSE_REASON_SERVER_CRASH = 4015,
	DISCORD_VOICE_CLOSE_REASON_UNKNOWN_ENCRYPTION_MODE = 4016
};

export type discord_voice_opcodes = enum {
	DISCORD_VOICE_IDENTIFY = 0,
	DISCORD_VOICE_SELECT_PROTOCOL = 1,
	DISCORD_VOICE_READY = 2,
	DISCORD_VOICE_HEARTBEAT = 3,
	DISCORD_VOICE_SESSION_DESCRIPTION = 4,
	DISCORD_VOICE_SPEAKING = 5,
	DISCORD_VOICE_HEARTBEAT_ACK = 6,
	DISCORD_VOICE_RESUME = 7,
	DISCORD_VOICE_HELLO = 8,
	DISCORD_VOICE_RESUMED = 9,
	DISCORD_VOICE_CLIENT_DISCONNECT = 13,
	DISCORD_VOICE_CODEC = 14
};

export type discord_application_command_types = enum {
	DISCORD_APPLICATION_CHAT_INPUT = 1,
	DISCORD_APPLICATION_USER = 2,
	DISCORD_APPLICATION_MESSAGE = 3
};

export type discord_application_command_option_types = enum {
	DISCORD_APPLICATION_OPTION_SUB_COMMAND = 1,
	DISCORD_APPLICATION_OPTION_SUB_COMMAND_GROUP = 2,
	DISCORD_APPLICATION_OPTION_STRING = 3,
	DISCORD_APPLICATION_OPTION_INTEGER = 4,
	DISCORD_APPLICATION_OPTION_BOOLEAN = 5,
	DISCORD_APPLICATION_OPTION_USER = 6,
	DISCORD_APPLICATION_OPTION_CHANNEL = 7,
	DISCORD_APPLICATION_OPTION_ROLE = 8,
	DISCORD_APPLICATION_OPTION_MENTIONABLE = 9,
	DISCORD_APPLICATION_OPTION_NUMBER = 10,
	DISCORD_APPLICATION_OPTION_ATTACHMENT = 11
};

export type discord_application_command_permission_types = enum {
	DISCORD_APPLICATION_PERMISSION_ROLE = 1,
	DISCORD_APPLICATION_PERMISSION_USER = 2,
	DISCORD_APPLICATION_PERMISSION_CHANNEL = 3
};

export type discord_application_command = struct {
	id: u64snowflake,
	discord_application_command_type: discord_application_command_types,
	application_id: u64snowflake,
	guild_id: u64snowflake,
	name: *c::char,
	description: *c::char,
	options: *discord_application_command_options,
	default_member_permissions: u64bitmask,
	dm_permission: bool,
	default_permission: bool,
	version: u64snowflake,
};

export type discord_application_commands = struct {
	length: i32,
	array: *discord_application_command,
	realsize: i32,
};

export type discord_application_command_option = struct {
	discord_application_command_option_type: discord_application_command_option_types,
	name: *c::char,
	description: *c::char,
	required: bool,
	choices: *discord_application_command_option_choices,
	options: *discord_application_command_options,
	channel_types: *integers,
	min_value: *c::char,
	max_value: *c::char,
	autocomplete: bool,
};

export type discord_application_command_options = struct {
	length: i32,
	array: *discord_application_command_option,
	realsize: i32,
};

export type discord_application_command_option_choice = struct {
	name: *c::char,
	value: *json_char,
};

export type discord_application_command_option_choices = struct {
	length: i32,
	array: *discord_application_command_option_choice,
	realsize: i32,
};

export type discord_application_command_interaction_data_option = struct {
	name: *c::char,
	discord_application_command_interaction_data_option_type: discord_application_command_option_types,
	value: *json_char,
	options: *discord_application_command_interaction_data_options,
	focused: bool,
};

export type discord_application_command_interaction_data_options = struct {
	length: i32,
	array: *discord_application_command_interaction_data_option,
	realsize: i32,
};

export type discord_guild_application_command_permission = struct {
	id: u64snowflake,
	application_id: u64snowflake,
	guild_id: u64snowflake,
	permissions: *discord_application_command_permissions,
};

export type discord_guild_application_command_permissions = struct {
	length: i32,
	array: *discord_guild_application_command_permission,
	realsize: i32,
};

export type discord_application_command_permission = struct {
	id: u64snowflake,
	discord_application_command_permission_type: discord_application_command_permission_types,
	permission: bool,
};

export type discord_application_command_permissions = struct {
	length: i32,
	array: *discord_application_command_permission,
	realsize: i32,
};

export type discord_create_global_application_command = struct {
	name: *c::char,
	description: *c::char,
	options: *discord_application_command_options,
	default_member_permissions: u64bitmask,
	dm_permission: bool,
	default_permission: bool,
	discord_create_global_application_command_type: discord_application_command_types,
};

export type discord_edit_global_application_command = struct {
	name: *c::char,
	description: *c::char,
	options: *discord_application_command_options,
	default_member_permissions: u64bitmask,
	dm_permission: bool,
	default_permission: bool,
};

export type discord_create_guild_application_command = struct {
	name: *c::char,
	description: *c::char,
	options: *discord_application_command_options,
	default_member_permissions: u64bitmask,
	dm_permission: bool,
	default_permission: bool,
	discord_create_guild_application_command_type: discord_application_command_types,
};

export type discord_edit_guild_application_command = struct {
	name: *c::char,
	description: *c::char,
	options: *discord_application_command_options,
	default_member_permissions: u64bitmask,
	default_permission: bool,
};

export type discord_bulk_overwrite_guild_application_commands = struct {
	id: u64snowflake,
	name: *c::char,
	name_localizations: *strings,
	description: *c::char,
	description_localizations: *strings,
	options: *discord_application_command_options,
	default_member_permissions: u64bitmask,
	dm_permission: bool,
	discord_bulk_overwrite_guild_application_commands_type: discord_application_command_types,
};

export type discord_component_types = enum {
	DISCORD_COMPONENT_ACTION_ROW = 1,
	DISCORD_COMPONENT_BUTTON = 2,
	DISCORD_COMPONENT_SELECT_MENU = 3,
	DISCORD_COMPONENT_TEXT_INPUT = 4,
	DISCORD_COMPONENT_USER_SELECT = 5,
	DISCORD_COMPONENT_ROLE_SELECT = 6,
	DISCORD_COMPONENT_MENTION_SELECT = 7,
	DISCORD_COMPONENT_CHANNEL_SELECT = 8,
	DISCORD_COMPONENT_SECTION = 9,
	DISCORD_COMPONENT_TEXT_DISPLAY = 10,
	DISCORD_COMPONENT_THUMBNAIL = 11,
	DISCORD_COMPONENT_MEDIA_GALLERY = 12,
	DISCORD_COMPONENT_FILE = 13,
	DISCORD_COMPONENT_SEPARATOR = 14,
	DISCORD_COMPONENT_CONTENT_INVENTORY_ENTRY = 16,
	DISCORD_COMPONENT_CONTAINER = 17
};

export type discord_component_styles = enum {
	DISCORD_BUTTON_PRIMARY = 1,
	DISCORD_BUTTON_SECONDARY = 2,
	DISCORD_BUTTON_SUCCESS = 3,
	DISCORD_BUTTON_DANGER = 4,
	DISCORD_BUTTON_LINK = 5,
	DISCORD_TEXT_SHORT = 1,
	DISCORD_TEXT_PARAGRAPH = 2
};

export type discord_component_spacing = enum {
	DISCORD_COMPONENT_SPACING_SMALL = 1,
	DISCORD_COMPONENT_SPACING_LARGE = 2
};

export type discord_component = struct {
	id: u64snowflake,
	discord_component_type: discord_component_types,
	custom_id: *c::char,
	sku_id: u64snowflake,
	style: discord_component_styles,
	label: *c::char,
	emoji: *discord_emoji,
	url: *c::char,
	options: *discord_select_options,
	placeholder: *c::char,
	min_values: i32,
	max_values: i32,
	components: *discord_components,
	min_length: i32,
	max_length: i32,
	required: bool,
	value: *c::char,
	disabled: bool,
	accessory: *discord_component,
	media: *discord_component_media,
	content: *c::char,
	description: *c::char,
	spoiler: bool,
	items: *discord_component_items,
	file: *discord_component_media,
	divider: bool,
	spacing: discord_component_spacing,
	color: i32,
};

export type discord_components = struct {
	length: i32,
	array: *discord_component,
	realsize: i32,
};

export type discord_select_option = struct {
	label: *c::char,
	value: *c::char,
	description: *c::char,
	emoji: *discord_emoji,
	Default: bool,
};

export type discord_select_options = struct {
	length: i32,
	array: *discord_select_option,
	realsize: i32,
};

export type discord_component_media = struct {
	url: *c::char,
};

export type discord_component_item = struct {
	media: *discord_component_media,
	description: *c::char,
	spoiler: bool,
};

export type discord_component_items = struct {
	length: i32,
	array: *discord_component_item,
	realsize: i32,
};

export type discord_interaction_types = enum {
	DISCORD_INTERACTION_PING = 1,
	DISCORD_INTERACTION_APPLICATION_COMMAND = 2,
	DISCORD_INTERACTION_MESSAGE_COMPONENT = 3,
	DISCORD_INTERACTION_APPLICATION_COMMAND_AUTOCOMPLETE = 4,
	DISCORD_INTERACTION_MODAL_SUBMIT = 5
};

export type discord_interaction_callback_types = enum {
	DISCORD_INTERACTION_PONG = 1,
	DISCORD_INTERACTION_CHANNEL_MESSAGE_WITH_SOURCE = 4,
	DISCORD_INTERACTION_DEFERRED_CHANNEL_MESSAGE_WITH_SOURCE = 5,
	DISCORD_INTERACTION_DEFERRED_UPDATE_MESSAGE = 6,
	DISCORD_INTERACTION_UPDATE_MESSAGE = 7,
	DISCORD_INTERACTION_APPLICATION_COMMAND_AUTOCOMPLETE_RESULT = 8,
	DISCORD_INTERACTION_MODAL = 9
};

export type discord_interaction = struct {
	id: u64snowflake,
	application_id: u64snowflake,
	discord_interaction_type: discord_interaction_types,
	data: *discord_interaction_data,
	guild_id: u64snowflake,
	channel_id: u64snowflake,
	member: *discord_guild_member,
	user: *discord_user,
	token: *c::char,
	version: i32,
	message: *discord_message,
	locale: *c::char,
	guild_locale: *c::char,
};

export type discord_interaction_data = struct {
	id: u64snowflake,
	name: *c::char,
	discord_interaction_data_type: discord_application_command_types,
	resolved: *discord_resolved_data,
	options: *discord_application_command_interaction_data_options,
	custom_id: *c::char,
	component_type: discord_component_types,
	values: *strings,
	target_id: u64snowflake,
	components: *discord_components,
};

export type discord_resolved_data = struct {
	users: *json_char,
	members: *json_char,
	roles: *json_char,
	channels: *json_char,
	messages: *json_char,
	attachments: *json_char,
};

export type discord_message_interaction = struct {
	id: u64snowflake,
	discord_message_interaction_type: discord_interaction_types,
	name: *c::char,
	user: *discord_user,
	member: *discord_guild_member,
};

export type discord_interaction_response = struct {
	discord_interaction_response_type: discord_interaction_callback_types,
	data: *discord_interaction_callback_data,
};

export type discord_interaction_callback_data = struct {
	components: *discord_components,
	tts: bool,
	content: *c::char,
	embeds: *discord_embeds,
	flags: u64bitmask,
	attachments: *discord_attachments,
	choices: *discord_application_command_option_choices,
	custom_id: *c::char,
	title: *c::char,
};

export type discord_edit_original_interaction_response = struct {
	thread_id: u64snowflake,
	content: *c::char,
	embeds: *discord_embeds,
	allowed_mentions: *discord_allowed_mention,
	components: *discord_components,
	attachments: *discord_attachments,
};

export type discord_create_followup_message = struct {
	wait: bool,
	thread_id: u64snowflake,
	avatar_url: *c::char,
	tts: bool,
	embeds: *discord_embeds,
	allowed_mentions: *discord_allowed_mention,
	components: *discord_components,
	attachments: *discord_attachments,
	flags: u64bitmask,
};

export type discord_edit_followup_message = struct {
	thread_id: u64snowflake,
	content: *c::char,
	embeds: *discord_embeds,
	allowed_mentions: *discord_allowed_mention,
	components: *discord_components,
	attachments: *discord_attachments,
};