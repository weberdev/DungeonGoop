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
        show_debug_message(active_item);
        instance_destroy(item_instance);
    }

    // Update movement
    if (keyboard_check_pressed(vk_left)) {
        hMove = -tile_size;
    } else if (keyboard_check_pressed(vk_right)) {
        hMove = tile_size;
    }

    if (keyboard_check_pressed(vk_up)) {
        vMove = -tile_size;
    } else if (keyboard_check_pressed(vk_down)) {
        vMove = tile_size;
    }

    if (hMove != 0 || vMove != 0) {
        var newX = x + hMove;
        var newY = y + vMove;

        if (!place_meeting(newX, y, obj_collidableParent)) {
            last_x = x;
            last_y = y;
            moveX = newX;
            isMoving = true;
        }
        if (!place_meeting(x, newY, obj_collidableParent)) {
            last_x = x;
            last_y = y;
            moveY = newY;
            isMoving = true;
        }
    }
} else {
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

    if (x == moveX && y == moveY) {
        isMoving = false;
    }
}
