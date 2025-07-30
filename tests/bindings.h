/**
 * @brief The Discord client handler
 *
 * Used to access/perform public functions from discord.h
 * @see discord_init(), discord_config_init(), discord_cleanup()
 */
struct discord {
    /** `DISCORD` logging module */
    struct logconf conf;
    /** whether this is the original client or a clone */
    bool is_original;
    /** the bot token */
    char *token;
    /** the io poller for listening to file descriptors */
    struct io_poller *io_poller;

    /** the user's message commands @see discord_set_on_command() */
    struct discord_message_commands commands;
    /** user's data reference counter for automatic cleanup */
    struct discord_refcounter refcounter;

    /** the handle for interfacing with Discord's REST API */
    struct discord_rest rest;
    /** the handle for interfacing with Discord's Gateway API */
    struct discord_gateway gw;
    /** the client's user structure */
    struct discord_user self;
    /** the handle for registering and retrieving Discord data */
    struct discord_cache cache;

    /** fd that gets triggered when ccord_shutdown_async is called */
    int shutdown_fd;

    struct {
        struct discord_timers internal;
        struct discord_timers user;
    } timers;

    /** wakeup timer handle */
    struct {
        /** callback to be triggered on timer's timeout */
        void (*cb)(struct discord *client);
        /** the id of the wake timer */
        unsigned id;
    } wakeup_timer;

    /** triggers when idle */
    void (*on_idle)(struct discord *client);
    /** triggers once per loop cycle */
    void (*on_cycle)(struct discord *client);

    /** user arbitrary data @see discord_set_data() */
    void *data;

    /** keep tab of amount of worker threads being used by client */
    struct {
        /** amount of worker-threads currently being used by client */
        int count;
        /** synchronize `count` between workers */
        pthread_mutex_t lock;
        /** notify of `count` decrement */
        pthread_cond_t cond;
    } * workers;

#ifdef CCORD_VOICE
    struct discord_voice *vcs;
    struct discord_voice_evcallbacks voice_cbs;
#endif /* CCORD_VOICE */
};

enum discord_voice_status {
    DISCORD_VOICE_ERROR = 0,
    DISCORD_VOICE_JOINED,
    DISCORD_VOICE_EXHAUST_CAPACITY,
    DISCORD_VOICE_ALREADY_JOINED
};