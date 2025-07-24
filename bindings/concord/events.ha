export @symbol("discord_set_on_ready") fn set_on_ready(
        client: *discord,
        callback: *fn(*discord, *ready) void
) void;

export @symbol("discord_set_on_interaction_create") fn set_on_interaction_create(
        client: *discord,
        callback: *fn(*discord, *interaction) void
) void;