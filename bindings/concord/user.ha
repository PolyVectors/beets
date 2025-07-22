use types::c;

export type discord_premium_types = enum {
    DISCORD_PREMIUM_NONE,
    DISCORD_PREMIUM_NITRO_CLASSIC,
    DISCORD_PREMIUM_NITRO,
};

// struct discord_user {
//     u64snowflake id;
//     char * username;
//     char * discriminator;
//     char * avatar;
//     bool bot;
//     bool System;
//     bool mfa_enabled;
//     char * banner;
//     int accent_color;
//     char * locale;
//     bool verified;
//     char * email;
//     u64bitmask flags;
//     enum discord_premium_types premium_type;
//     u64bitmask public_flags;
// };
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
    premium_types: discord_premium_types,
    public_flags: u64bitmask,
};