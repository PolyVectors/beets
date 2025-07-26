use types::c;

def LOGCONF_ID_LEN: size = 64 + 1;

export type logconf_szbuf = struct {
	start: *c::char,
	length: size
};

export type logconf = struct {
	id: [LOGCONF_ID_LEN]c::char,
	pid: u32,
	is_branch: bool,
	is_disabled: bool,
	file: logconf_szbuf,

	counter: *i32,
	L: *log_Logger

	// struct {
	// 	char *fname;
	// 	FILE *f;
	// } * logger, *http;

	// struct {
	// 	size_t size;
	// 	char **ids;
	// } disable_modules;
};