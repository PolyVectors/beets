struct test {
    bool test_bool;
    int *test_int;
    char test_char;
    char *test_string;
    char test_buf[16];
};

// ruby bindings/generate.rb tests/bindings/test.h tests/bindings/test.ha
// Expected result:

// export type test = struct {
// 	test_bool: bool,
// 	test_int: *i32,
// 	test_char: c::char,
// 	test_string: *c::char,
// 	test_buf: [16]c::char,
// };