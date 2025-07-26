// ???
export type log_LogFn = *opaque;
export type log_LockFn = *opaque;

export type log_Callback = struct {
	callback: log_LogFn,
	udata: *opaque,
	level: i32
};

export type log_Logger = struct {
	udata: *opaque,
	lock: log_LockFn,
	level: i32,
	quiet: bool,
	callbacks: [32]log_Callback
};