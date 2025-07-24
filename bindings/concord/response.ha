export type response = struct {
        data: *opaque,
        keep: const *opaque,
        code: CCORDcode,
};

export type ret_application_command = struct {
        data: *opaque,
        on_cleanup: *fn(*discord, *opaque) void,
        keep: const *opaque,
        high_priority: bool,
        on_fail: *fn(*discord, *response) void,
        on_done: *fn(*discord, *response, const *application_command) void,
        sync: *application_command
};