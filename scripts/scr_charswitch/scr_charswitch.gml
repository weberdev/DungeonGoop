// Define the function in a global script or at the start of the object
function switch_character() {
	// Get the current date and time
var current_datetime = date_current_datetime();

    if(current_datetime> global.swap_cooldown)
	{if (global.active_character == obj_pcSlime) {
        global.active_character = obj_pcRemnant;					
		audio_play_sound(snd_ghostTransition, .75, false);
		
		
    } else if (global.active_character == obj_pcRemnant) {
        global.active_character = obj_pcSlime;
    }
	global.swap_cooldown = current_datetime;
	show_debug_message("switch character check in function")
	show_debug_message(global.active_character)
	}
	
	// Update the view settings based on the active character
        if (global.active_character == obj_pcSlime) {
            // Configure view settings for Slime
			
            view_xview[0] = global.active_character.x - view_wview[0] / 2;
            view_yview[0] = global.active_character.y - view_hview[0] / 2;
            view_visible[0] = true; // Enable viewport 0
            view_visible[1] = false; // Disable viewport 1
        } else if (global.active_character == obj_pcRemnant) {
            // Configure view settings for Remnant
            view_xview[1] = global.active_character.x - view_wview[1] / 2;
            view_yview[1] = global.active_character.y - view_hview[1] / 2;
            view_visible[0] = false; // Disable viewport 0
            view_visible[1] = true; // Enable viewport 1
        }
}
