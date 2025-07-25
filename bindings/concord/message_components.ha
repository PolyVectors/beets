export type component = struct {
	id: u64snowflake,
	// enum discord_component_types type;

	// char * custom_id;
	// u64snowflake sku_id;

	// enum discord_component_styles style;

	// char * label;
	// struct discord_emoji * emoji;

	// char * url;
	// struct discord_select_options * options;

	// char * placeholder;
	// int min_values;

	// int max_values;

	// struct discord_components * components;

	// int min_length;
	// int max_length;
	// bool required;
	// char * value;
	// bool disabled;

	// struct discord_component * accessory;

	// struct discord_component_media * media;

	// char * content;

	// char * description;

	// bool spoiler;
	// struct discord_component_items * items;

	// struct discord_component_media * file;

	// bool divider;

	// enum discord_component_spacing spacing;
	// int color;
};

export type components = struct {
	length: i32,
	array: *component,
};