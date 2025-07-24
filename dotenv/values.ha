use fs;
use os;
use io;
use fmt;
use math;
use strings;
use strconv;

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

        for (let entry .. strings::split(env, "\n")!) {
                let key_values = strings::split(entry, "=")!;

                let env_key = 0z;
                for (env_key < len(key_values); env_key += 2) {
                        if (key_values[env_key] == key) {
                                if (strings::toutf8(key_values[env_key + 1])[0] == '\"') {
                                        return strings::dup(strings::sub(key_values[env_key + 1], 1, len(key_values[env_key + 1]) - 1))!;
                                } else {
                                        return math::absi64(strconv::stoi64(key_values[env_key + 1])!);
                                };
                        };
                };
        };

        fmt::fatalf("Error getting value for key \"{}\" as it doesn't exist in the .env file", key);
};