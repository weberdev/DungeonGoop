// Step Event for obj_SlimePC
if (!isMoving && global.active_character == obj_SlimePC) {
    var hMove = 0;
    var vMove = 0;

    // Check for item pickup
    var item_instance = instance_place(x, y, obj_itemParent);
    if (item_instance != noone) {
        if (active_item != "") {
            // Create a new instance of the previous active item at the last position
            scr_discarditem(last_x, last_y, active_item);
        }

        // Determine the type of the picked-up item
        var item_type = item_instance.object_index;
        switch (item_type) {
            case obj_elemRock:
                sprite_index = sprite_slimePCStone;
                active_item = "rock";
                break;
            case obj_elemFlame:
                sprite_index = sprite_slimePCFire;
                active_item = "flame";
                break;
            case obj_elemWater:
                sprite_index = sprite_slimePCWater;
                active_item = "water";
                break;
            default:
                break;
        }
        instance_destroy(item_instance);
    }

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

