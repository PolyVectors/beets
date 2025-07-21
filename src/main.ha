use fmt;
use types::c;

use bindings::concord;

export fn main() void = {
	let params = concord::discord_create_guild_application_command {
		name = c::nulstr("play\0"),
		description = c::nulstr("play some music (from youtube)\0"),
	};
	
	fmt::println("Hello, world!")!;
};
