// Partially auto-generated using generate.rb

use types::c;
use posix;

export type discord_timers = struct {
	q: *priority_queue,
	io: *io_poller,
	active: struct {
		is_active: bool,
		thread: posix::pthread_t,
		timer: *discord_timer,
		skip_update_phase: bool,
	},
	lock: posix::pthread_mutex_t,
	cond: posix::pthread_cond_t,
};

export type discord_ratelimiter = struct {
	conf: logconf,
	length: i32,
	capacity: i32,
	routes: *_discord_route,
	none: *discord_bucket,
	miss: *discord_bucket,
	global_wait_tstamp: *u64unix_ms,
	queues: struct {
		pending: *opaque, // TODO: queues
	},
};

export type discord_bucket = struct {
	hash: c::char,
	limit: i64,
	remaining: i64,
	reset_tstamp: u64unix_ms,
	busy_req: *discord_request,
	queues: struct {
		next: *opaque, // TODO: queues
	},
	entry: *opaque, // TODO: queues
};

export type discord_ret_dispatch = struct {
	data: *opaque,
	cleanup: *fn(*discord, *opaque) void,
	keep: const *opaque,
	high_priority: bool,
	fail: *fn(*discord, *discord_response) void,
	has_type: bool,
	finished: union {
		typed: *fn(*discord, *discord_response, const *opaque) void,
		typeless: *fn(*discord, *discord_response) void,
	},
	sync: *opaque,
};

export type discord_ret_response = struct {
	data: *opaque,
	length: size,
	init: *fn(*opaque) void,
	from_json: *fn(const *c::char, size, *opaque) size,
	cleanup: *fn(*opaque) void,
};

export type discord_attributes = struct {
	dispatch: *discord_ret_dispatch,
	response: *discord_ret_response,
	attachments: *discord_attachments,
	reason: *c::char,
};

export type discord_request = struct {
	dispatch: *discord_ret_dispatch,
	response: *discord_ret_response,
	attachments: *discord_attachments,
	reason: *c::char,

	b: *discord_bucket,
	body: ccord_szbuf_reusable,
	method: http_method,
	endpoint: c::char,
	key: c::char,
	conn: *ua_conn,
	code: CCORDcode,
	retry_attempt: i32,
	cond: *pthread_cond_t,
	entry: *opaque, // TODO: queues
};

export type discord_requestor = struct {
	conf: logconf,
	ua: *user_agent,
	mhandle: *CURLM,
	ratelimiter: discord_ratelimiter,
	retry_limit: i32,
	queues: *struct {
		recycling: *opaque,
		pending: *opaque,
		finished: *opaque,
	},
	qlocks: *struct {
		recycling: posix::pthread_mutex_t,
		pending: posix::pthread_mutex_t,
		finished: posix::pthread_mutex_t,
	},
};

export type discord_rest = struct {
	conf: logconf,
	requestor: discord_requestor,
	timers: discord_timers,
	io_poller: *io_poller,
	tpool: *threadpool_t,
};

export type discord_gateway_session = struct {
	is_ready: bool,
	id: c::char,
	shards: i32,
	base_url: c::char,
	resume_url: c::char,
	start_limit: discord_session_start_limit,
	concurrent: i32,
	event_count: i32,
	status: u32,
	retry: struct {
		enable: bool,
		attempt: i32,
		limit: i32,
	},
};

export type discord_gateway_payload = struct {
	json: struct {
		start: *c::char,
		length: size,
		tokens: *jsmntok_t,
		ntokens: u32,
		pairs: *jsmnf_pair,
		npairs: u32,
	},
	opcode: discord_gateway_opcodes,
	seq: i32,
	name: c::char,
	event: discord_gateway_events,
	data: *jsmnf_pair,
};

export type discord_gateway = struct {
	conf: logconf,
	ws: *websockets,
	mhandle: *CURLM,
	timer: *struct {
		hbeat_interval: i64,
		hbeat_acknowledged: bool,
		now: u64unix_ms,
		hbeat_last: u64unix_ms,
		identify_last: u64unix_ms,
		event: u64unix_ms,
		hbeat_timer: u32,
		ping_ms: i32,
		rwlock: pthread_rwlock_t,
	},
	id: discord_identify,
	session: *discord_gateway_session,
	payload: discord_gateway_payload,
	cbs: discord_ev_event,
	scheduler: discord_ev_scheduler,
};

export type discord_refcounter = struct {
	conf: logconf,
	length: i32,
	capacity: i32,
	refs: *_discord_ref,
	g_lock: *posix::pthread_mutex_t,
};

export type discord_message_commands = struct {
	conf: logconf,
	prefix: ccord_szbuf,
	fallback: discord_ev_message,
	length: i32,
	capacity: i32,
	entries: *_discord_message_commands_entry,
};

export type discord_cache = struct {
	data: *_discord_cache_data,
	cleanup: *fn(*discord) void,

	on_shard_disconnected: *fn(*discord, *discord_identify, bool) void,
	on_shard_resumed: *fn(*discord, *discord_identify) void,
	on_shard_reconnected: *fn(*discord, *discord_identify) void,
};

export type discord = struct {
	conf: logconf,
	is_original: bool,
	token: *c::char,
	io_poller: *io_poller,
	commands: discord_message_commands,
	refcounter: discord_refcounter,
	rest: discord_rest,
	gw: discord_gateway,
	self: discord_user,
	cache: discord_cache,
	shutdown_fd: i32,
	timers: struct {
		internal: discord_timers,
		user: discord_timers,
	},
	wakeup_timer: struct {
		cb: *fn(*discord) void,
		id: u32,
	},
	on_idle: *fn(*discord) void,
	on_cycle: *fn(*discord) void,
	data: *opaque,
	workers: *struct {
		count: i32,
		lock: posix::pthread_mutex_t,
		cond: posix::pthread_cond_t,
	},
	vcs: *discord_voice,
	voice_cbs: discord_voice_evcallbacks,
};