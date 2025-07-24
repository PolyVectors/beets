use types::c;

export type premium_types = enum {
        DISCORD_PREMIUM_NONE,
        DISCORD_PREMIUM_NITRO_CLASSIC,
        DISCORD_PREMIUM_NITRO,
};

export type user = struct {
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
        premium_types: premium_types,
        public_flags: u64bitmask,
};