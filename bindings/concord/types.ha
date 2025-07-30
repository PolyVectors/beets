use types::c;

export type u64bitmask = u64;
export type u64unix_ms = u64;
export type u64snowflake = u64;

export type json_char = c::char;

export type ccord_szbuf = struct {
	start: *c::char,
	length: size,
};

export type ccord_szbuf_readonly = struct {
	start: *const c::char,
	length: size,
};

export type ccord_szbuf_reusable = struct {
	start: *c::char,
	length: size,
	realsize: size,
};