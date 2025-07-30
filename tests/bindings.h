struct test_struct {
    bool test_bool;
    bool *test_bool2;
    int test_int;
    int *test_int2;
    char test_char;
    char *test_string;
    char test_buf[16];
    char *test_buf2[16];
    struct {
        bool test_bool;
        bool *test_bool2;
        int test_int;
        int *test_int2;
        char test_char;
        char *test_string;
        char test_buf[16];
        char *test_buf2[16];
    } test_struct;
};

enum test_enum {
    TEST,
    TEST2,
    TEST3,
    TEST4,
    TEST5 = 100,
};