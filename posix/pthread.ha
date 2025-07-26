export type pthread_t = i64;

export type pthread_mutex_t = struct {
	lock: u32,
	owner_id: u32,
	cnt: u32,
	shpid: i32,
	mutex_type: i32,
	flags: union {
		reserved: [2]u32,
		pointer_aligned: *opaque
	}
};

// https://elixir.bootlin.com/glibc/glibc-2.41.9000/source/sysdeps/htl/bits/types/struct___pthread_cond.h#L25
export type pthread_cond_t = struct {
	lock: i32,
	queue: *opaque, // TODO
	attr: *opaque, // TODO
	wrefs: u32,
	data: *opaque
};