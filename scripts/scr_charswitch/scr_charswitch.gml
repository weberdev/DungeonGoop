// Define the function in a global script or at the start of the object
function switch_character() {
	// Get the current date and time
var current_datetime = date_current_datetime();

    if(current_datetime> global.swap_cooldown)
	{if (global.active_character == obj_pcSlime) {
        global.active_character = obj_pcRemnant;
		
    } else if (global.active_character == obj_pcRemnant) {
        global.active_character = obj_pcSlime;
    }
	global.swap_cooldown = current_datetime;
	show_debug_message("switch character check in function")
	show_debug_message(global.active_character)
	}
}
