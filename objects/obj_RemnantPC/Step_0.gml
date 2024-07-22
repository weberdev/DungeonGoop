// Declare movement variables
var tile_size = 64; // Size of each tile
var hMove = 0;
var vMove = 0;

// Check for horizontal movement
if (!isMoving) {
    if (keyboard_check_pressed(vk_left)) {
        hMove = -tile_size;
    } else if (keyboard_check_pressed(vk_right)) {
        hMove = tile_size;
    }

    // Check for vertical movement
    if (keyboard_check_pressed(vk_up)) {
        vMove = -tile_size;
    } else if (keyboard_check_pressed(vk_down)) {
        vMove = tile_size;
    }

    // Check if movement is attempted
    if (hMove != 0 || vMove != 0) {
        var newX = x + hMove;
        var newY = y + vMove;

        // Apply movement with collision checking
        if (!place_meeting(newX, y, obj_wall)) {
            x = newX;
        }
        if (!place_meeting(x, newY, obj_wall)) {
            y = newY;
        }
    }
}

// Function to handle digestion
function digest() {
    show_debug_message("digested");
}


// Character swap logic
if (keyboard_check_pressed(vk_space)) {
    // Save current position of Remnant
    global.remnant_x = x;
    global.remnant_y = y;
    
    // Ensure obj_SlimePC is defined and exists
    if (object_exists(obj_SlimePC)) {
        // Swap to Slime and change room
        global.active_character = obj_SlimePC;
        room_goto(room_slime);
    } else {
        show_debug_message("Error: obj_SlimePC does not exist.");
    }
}
