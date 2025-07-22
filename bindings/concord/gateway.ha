use types::c;

// struct discord_ready {
//     int v;
//     struct discord_user * user;
//     struct discord_guilds * guilds;
//     char * session_id;
//     struct integers * shard;
//     struct discord_application * application;
// };

export type discord_ready = struct {
    v: i32,
    user: *discord_user,
    guilds: *opaque,
    session_id: *c::char,
    integers: *opaque,
    application: *opaque,
};