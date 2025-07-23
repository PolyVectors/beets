use fs;
use os;
use io;
use fmt;
use math;
use strings;

export fn get_value(key: str) (str | u64) = {
    const handle = match(os::open(".env")) {
        case let file: io::file =>
            yield file;
        case let err: fs::error =>
            fmt::fatalf("Error opening .env file: {}", fs::strerror(err));
    };
    defer io::close(handle)!;

    const buffer = io::drain(handle)!;
    defer free(buffer);
    const env = strings::fromutf8(buffer)!;
    
    fmt::println(env)!;

    return 0;
};