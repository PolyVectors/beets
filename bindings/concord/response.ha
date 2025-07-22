export type discord_response = struct {
    data: *opaque,
    keep: const *opaque,
    code: CCORDcode,
};

export type discord_ret_application_command = struct {
    data: *opaque,
    on_cleanup: *fn(*discord, *opaque) void,
    keep: const *opaque,
    high_priority: bool,
    on_fail: *fn(*discord, *discord_response) void,
    on_done: *fn(*discord, *discord_response, const *discord_application_command) void,
    sync: *discord_application_command
};