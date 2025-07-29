export type discord_timer_flags = enum {
	DISCORD_TIMER_MILLISECONDS = 0,
	DISCORD_TIMER_MICROSECONDS = 1 << 0,
	DISCORD_TIMER_DELETE = 1 << 1,
	DISCORD_TIMER_DELETE_AUTO = 1 << 2,
	DISCORD_TIMER_CANCELED = 1 << 3,
	DISCORD_TIMER_TICK = 1 << 4,
	DISCORD_TIMER_GET = 1 << 5,
	DISCORD_TIMER_INTERVAL_FIXED = 1 << 6,
};

export type discord_timer = struct {
	id: u32,
	flags: discord_timer_flags,
	on_tick: discord_ev_timer,
	on_status_changed: discord_ev_timer,
	data: *opaque,
	delay: i64,
	interval: i64,
	repeat: i64,
};