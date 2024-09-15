// Step Event for obj_pcRemnant

// Initialization of facing direction at the start (if needed)
if (facing_x == undefined && facing_y == undefined) {
    facing_x = 1;
    facing_y = 0;
}

if (move_enabled) {
    if (!isMoving && global.active_character == obj_pcRemnant) {
        var hMove = 0;
        var vMove = 0;

        // Check for horizontal movement
        if (keyboard_check(vk_left)) {
            hMove = -tile_size;
            facing_x = -1;
            facing_y = 0;
        } else if (keyboard_check(vk_right)) {
            hMove = tile_size;
            facing_x = 1;
            facing_y = 0;
        }

        // Check for vertical movement, only if no horizontal movement is detected
        if (hMove == 0) {
            if (keyboard_check(vk_up)) {
                vMove = -tile_size;
                facing_y = -1;
                facing_x = 0;
            } else if (keyboard_check(vk_down)) {
                vMove = tile_size;
                facing_y = 1;
                facing_x = 0;
            }
        }

        // Calculate facing tile coordinates
        facing_tile_x = x + (facing_x * tile_size);
        facing_tile_y = y + (facing_y * tile_size);

        // Update last_x and last_y before moving
        if (hMove != 0 || vMove != 0) {
            last_x = x;
            last_y = y;
        }


        // Check for horizontal movement with collision and directional blocker checking
        

		if (hMove != 0) {
            if ( (!place_meeting(x + hMove, y, obj_collidableParent)) ) {
				if (hMove > 0 && place_meeting(x + hMove, y, obj_directionalBlockerWest)) {
			        show_debug_message("Can't move right into barrier");
			    } else if (hMove < 0 && place_meeting(x + hMove, y, obj_directionalBlockerEast)) {
			        show_debug_message("Can't move left into barrier");
			    } else {
					moveX = x + hMove;
					isMoving = true;
	            }
			}
		}
				

        // Check for vertical movement with collision and directional blocker checking
        if (vMove != 0) {
            if (!place_meeting(x, y + vMove, obj_collidableParent)) {
                if (vMove > 0 && place_meeting(x, y + vMove, obj_collidableRemnant)) {
					show_debug_message("Block for Remnant only");
				
				/*
				} else if (vMove > 0 && place_meeting(x, y + vMove, obj_directionalBlockerNorth)) {
                    show_debug_message("Can't move down into barrier");
                } else if (vMove < 0 && place_meeting(x, y + vMove, obj_directionalBlockerSouth)) {
                    show_debug_message("Can't move up into barrier");
				*/
				
				} else {
                    moveY = y + vMove;
                    isMoving = true;
                }
            }
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