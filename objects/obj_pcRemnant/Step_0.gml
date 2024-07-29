// Step Event for obj_pcRemnant

// Initialization of facing direction at the start (if needed)
if (facing_x == undefined && facing_y == undefined) {
    facing_x = 1;
    facing_y = 0;
}

if(move_enabled){if (!isMoving && global.active_character == obj_pcRemnant) {
    var hMove = 0;
    var vMove = 0;

    // Check for item pickup
    
    // Check for horizontal movement
    if (keyboard_check_pressed(vk_left)) {
        hMove = -tile_size;
        facing_x = -1;
        facing_y = 0;
    } else if (keyboard_check_pressed(vk_right)) {
        hMove = tile_size;
        facing_x = 1;
        facing_y = 0;
    }

    // Check for vertical movement
    if (keyboard_check_pressed(vk_up)) {
        vMove = -tile_size;
        facing_y = -1;
        facing_x = 0;
    } else if (keyboard_check_pressed(vk_down)) {
        vMove = tile_size;
        facing_y = 1;
        facing_x = 0;
    }

    // Calculate facing tile coordinates
    facing_tile_x = x + (facing_x * tile_size);
    facing_tile_y = y + (facing_y * tile_size);

    // Update last_x and last_y before moving
    if (hMove != 0 || vMove != 0) {
        last_x = x;
        last_y = y;
    }

    // Apply movement with collision checking
    if (hMove != 0 && !place_meeting(x + hMove, y, obj_collidableParent)) {
        moveX = x + hMove;
        isMoving = true;
    }
    if (vMove != 0 && !place_meeting(x, y + vMove, obj_collidableParent)) {
        moveY = y + vMove;
        isMoving = true;
    }
} else {
    // Handle smooth movement towards destination
    if (x < moveX) {
        x += moveSpeed;
        if (x > moveX) x = moveX;  // Correct overshoot
    } else if (x > moveX) {
        x -= moveSpeed;
        if (x < moveX) x = moveX;
    }

    if (y < moveY) {
        y += moveSpeed;
        if (y > moveY) y = moveY;
    } else if (y > moveY) {
        y -= moveSpeed;
        if (y < moveY) y = moveY;
    }

    // Stop moving if destination is reached
    if (x == moveX && y == moveY) {
        isMoving = false;
    }
}
}