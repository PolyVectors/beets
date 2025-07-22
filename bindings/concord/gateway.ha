use types::c;

export type discord_ready = struct {
    v: i32,
    user: *discord_user,
//  struct discord_guilds * guilds;
    session_id: *c::char,
//  struct integers * shard;
    application: *discord_application
};