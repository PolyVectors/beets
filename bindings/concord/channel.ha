use types::c;

export type embed = struct {
	title: *c::char,
	embed_type: *c::char,
	description: *c::char,
	url: *c::char,
	timestamp: u64unix_ms,

	// int color;
	// struct discord_embed_footer * footer;

	// struct discord_embed_image * image;

	// struct discord_embed_thumbnail * thumbnail;

	// struct discord_embed_video * video;


	// struct discord_embed_provider * provider;


	// struct discord_embed_author * author;


	// struct discord_embed_fields * fields;
};

export type embeds = struct {
	length: i32,
	array: *embed,
};

export type attachment = struct {
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
	flags: u64bitmask
};

export type attachments = struct {
	length: i32,
	array: *attachment
};