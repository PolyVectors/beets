use types::c;

export def LOGCONF_ID_LEN: size = 64 + 1;

export type logconf_field = struct {
	start: const *c::char,
	length: size,
};

export type logconf_szbuf = struct {
	start: *c::char,
	length: size,
};

export type logconf = struct {
	id: [LOGCONF_ID_LEN]c::char,
	pid: u32,
	is_branch: bool,
	is_disabled: bool,
	file: logconf_szbuf,
	counter: *i32,
	L: *log_Logger,
	logger: *struct {
		fname: *c::char,
		f: *FILE,
	},
	http: *struct {
		fname: *c::char,
		f: *FILE,
	},
	disable_modules: struct {
		length: size,
		ids: **c::char,
	},
};

export type loginfo = struct {
	counter: size,
	tstamp_ms: u64,
};