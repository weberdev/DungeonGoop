// Declare movement variables
var moveSpeed = 4;
var hMove = 0;
var vMove = 0;

// Check for horizontal movement
if (keyboard_check(vk_left)) {
    hMove = -1;
} else if (keyboard_check(vk_right)) {
    hMove = 1;
}

// Check for vertical movement
if (keyboard_check(vk_up)) {
    vMove = -1;
} else if (keyboard_check(vk_down)) {
    vMove = 1;
}

// Normalize movement vector
var moveLength = point_distance(0, 0, hMove, vMove);
if (moveLength != 0) {
    hMove = (hMove / moveLength) * moveSpeed;
    vMove = (vMove / moveLength) * moveSpeed;
}

// Apply movement with collision checking
if (place_meeting(x + hMove, y, obj_wall)) {
    hMove = 0;
}
if (place_meeting(x, y + vMove, obj_wall)) {
    vMove = 0;
}

x += hMove;
y += vMove;

// Character swap logic
if (keyboard_check_pressed(vk_space)) {
    // Save current position of Slime
    global.slime_x = x;
    global.slime_y = y;
    
    // Ensure obj_RemnantPC is defined and exists
    if (object_exists(obj_RemnantPC)) {
        // Swap to Remnant and change room
        global.active_character = obj_RemnantPC;
        room_goto(room_remnant);
    } else {
        show_debug_message("Error: obj_RemnantPC does not exist.");
    }
}
