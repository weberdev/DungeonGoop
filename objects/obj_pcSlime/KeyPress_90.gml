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
                
				//The problem is on line 27. 
                if ((next_instance == noone && other_next_instance == noone) || 
                    (next_instance != noone && next_instance.object_index == obj_grate)) {
                    
                    // Set the "leaving" animation
                    if (facing_x == 1) {
                        sprite_index = sprite_slime_leaving_right;
                    } else if (facing_x == -1) {
                        sprite_index = sprite_slime_leaving_left;
                    } else if (facing_y == 1) {
                        sprite_index = sprite_slime_leaving_down;
                    } else {
                        sprite_index = sprite_slime_leaving_up;
                    }
                    
                    image_index = 0;
                    image_speed = 1;
                    
                    // Save the target position and direction
                    global.final_tile_x = next_tile_x;
                    global.final_tile_y = next_tile_y;
                    global.facing_x = facing_x;
                    global.facing_y = facing_y;

                    // Save whether there are more grates to consider
                    global.keep_moving = (next_instance == noone || other_next_instance.object_index == obj_grate);
                    
                    keep_moving = false; // Stop further processing in this frame
					          // Set alarm to trigger after the "leaving" animation
                    alarm[0] = sprite_get_number(sprite_index);  // Use image_speed if necessary
                    
                } else {
                    show_debug_message("The next tile is blocked by a non-grate collidable object!");
                    keep_moving = false;
                }
            } else {
                keep_moving = false;
            }
        }
    }
}
