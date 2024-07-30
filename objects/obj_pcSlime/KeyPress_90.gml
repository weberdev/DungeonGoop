/// @description Ability
if (global.active_character == obj_pcSlime) {
    if (active_item != "") {
        show_debug_message("Used " + active_item);
        scr_slimeAction(active_item);
    } else {
        show_debug_message("Used empty tummy, can we squeeze?");

        // Loop to keep moving through grates
        var keep_moving = true;
        while (keep_moving) {
            // Get facing coordinates
            var facing_instance = instance_place(facing_tile_x, facing_tile_y, obj_grate);
            if (facing_instance != noone) {
                show_debug_message("There's a grate here.");

                // Calculate the next tile's coordinates
                var next_tile_x = facing_tile_x + (facing_x * tile_size);
                var next_tile_y = facing_tile_y + (facing_y * tile_size);
                
                // Check if the next tile has a collidable object
                var next_instance = instance_place(next_tile_x, next_tile_y, obj_collidableParent);
				var other_next_instance = instance_place(next_tile_x, next_tile_y, obj_grateSemiCollider);
                if ((next_instance == noone && other_next_instance == noone) || next_instance.object_index == obj_grate) {
                    // Move to the next tile
                    x = next_tile_x;
                    y = next_tile_y;
                    show_debug_message("Squeezed through to (" + string(x) + ", " + string(y) + ").");

                    // Update facing_tile_x and facing_tile_y to the new position
                    facing_tile_x = next_tile_x;
                    facing_tile_y = next_tile_y;

                    // Continue moving if the next tile also has a grate
                    keep_moving = (next_instance == noone || next_instance.object_index == obj_grate);
                } else {
                    show_debug_message("The next tile is blocked by a non-grate collidable object!");
                    keep_moving = false;
                }
            } else {
                show_debug_message("No grate to squeeze through.");
                keep_moving = false;
            }
        }

        // Reset movement variables
        moveX = x;
        moveY = y;
        isMoving = false;
    }
}
