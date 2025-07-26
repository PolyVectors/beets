use types::c;
use posix;

export type message_commands = struct {
	conf: logconf,
	// struct ccord_szbuf prefix;
	// discord_ev_message fallback;
	// int length;
	// int capacity;
	// struct _discord_message_commands_entry *entries;
};

export type timers = struct {
	q: *opaque,
	io: *io_poller,
	active: struct {
		is_active: bool,
		thread: posix::pthread_t,
		timer: *timer,
		skip_update_phase: bool
	},
	lock: posix::pthread_mutex_t,
	cond: posix::pthread_cond_t,
};

export type discord = struct {
	conf: logconf,
	is_original: bool,
	token: *c::char,
	io_poller: *io_poller,

	commands: message_commands,
// 	/** user's data reference counter for automatic cleanup */
// 	struct discord_refcounter refcounter;

// 	/** the handle for interfacing with Discord's REST API */
// 	struct discord_rest rest;
// 	/** the handle for interfacing with Discord's Gateway API */
// 	struct discord_gateway gw;
// 	/** the client's user structure */
// 	struct discord_user self;
// 	/** the handle for registering and retrieving Discord data */
// 	struct discord_cache cache;

// 	/** fd that gets triggered when ccord_shutdown_async is called */
// 	int shutdown_fd;

	timers: struct {
		internal: timers,
		user: timers
	},

// 	/** wakeup timer handle */
// 	struct {
// 		/** callback to be triggered on timer's timeout */
// 		void (*cb)(struct discord *client);
// 		/** the id of the wake timer */
// 		unsigned id;
// 	} wakeup_timer;

	on_idle: *fn(*discord) void,
	on_cycle: *fn(*discord) void,

// 	/** user arbitrary data @see discord_set_data() */
// 	void *data;

// 	/** keep tab of amount of worker threads being used by client */
// 	struct {
// 		/** amount of worker-threads currently being used by client */
// 		int count;
// 		/** synchronize `count` between workers */
// 		pthread_mutex_t lock;
// 		/** notify of `count` decrement */
// 		pthread_cond_t cond;
// 	} * workers;

// 	struct discord_voice *vcs;
// 	struct discord_voice_evcallbacks voice_cbs;
};