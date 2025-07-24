use types::c;

export type ready = struct {
	v: i32,
	user: *user,
	// struct discord_guilds * guilds;
	session_id: *c::char,
	// struct integers * shard;
	application: *application
};