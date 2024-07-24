// Step Event for obj_RemnantPC

if (!isMoving && global.active_character == obj_RemnantPC) {
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
        if (!place_meeting(newX, y, obj_collidableParent) && !place_meeting(x, newY, obj_collidableParent)) {
            moveX = newX;
            moveY = newY;
            isMoving = true;
        }
    }
} else {
    // Move towards the destination coordinates smoothly
    if (x < moveX) {
        x += moveSpeed;
        if (x > moveX) x = moveX;
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
