// Get the current date and time
var current_datetime = date_current_datetime();


// Extract the current second
global.swap_cooldown = date_get_second(current_datetime);

// Set the active character
global.active_character = obj_pcSlime;

// Initialize positions
global.slime_x = 64;
global.slime_y = 128;
global.remnant_x = 96;
global.remnant_y = 128;