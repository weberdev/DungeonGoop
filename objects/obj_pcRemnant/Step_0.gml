// Step Event for obj_pcRemnant
if (!isMoving && global.active_character == obj_pcRemnant) {
    var hMove = 0;
    var vMove = 0;

    // Check for horizontal movement
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

        // Update last position before moving
        last_x = x;
        last_y = y;

        // Apply movement with collision checking
        if (!place_meeting(newX, y, obj_collidableParent)) {
            moveX = newX;
            // Set facing direction based on horizontal movement
            facing_x = (hMove != 0) ? sign(hMove) : facing_x;
            facing_y = 0; // Reset vertical facing if moving horizontally
            isMoving = true;
        }
        if (!place_meeting(x, newY, obj_collidableParent)) {
            moveY = newY;
            // Set facing direction based on vertical movement
            facing_y = (vMove != 0) ? sign(vMove) : facing_y;
            facing_x = 0; // Reset horizontal facing if moving vertically
            isMoving = true;
        }

        // Calculate the coordinates the character is facing
        facing_tile_x = x + (facing_x * tile_size);
        facing_tile_y = y + (facing_y * tile_size);
        show_debug_message("Facing coordinates: " + string(facing_tile_x) + ", " + string(facing_tile_y));
    }
} else {
    // Move towards the destination coordinates smoothly
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

