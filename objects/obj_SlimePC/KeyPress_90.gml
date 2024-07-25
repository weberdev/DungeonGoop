/// @description Ability
if (global.active_character == obj_SlimePC) {
    if (active_item != "") {
        show_debug_message("Used " + active_item);
        scr_slimeAction(facing_tile_x, facing_tile_y, active_item);
    } else {
        show_debug_message("Used empty tummy, can we squeeze?");
        //show_debug_message("Targeting facing coordinates " + string(facing_tile_x) + ", " + string(facing_tile_y));

        //Is there a grate here?
        var facing_instance = instance_place(facing_tile_x, facing_tile_y, obj_grate);
        if (facing_instance != noone) {
            show_debug_message("There's a grate here.");
            // Calculate the next tile's coordinates
            var next_tile_x = facing_tile_x + (facing_x * tile_size);
            var next_tile_y = facing_tile_y + (facing_y * tile_size);
            
            //Check if the next tile is clear
            if (!place_meeting(next_tile_x, next_tile_y, obj_collidableParent)) {
                //Move to next tile
                x = next_tile_x;
                y = next_tile_y;
                show_debug_message("Squeezed through.");

                //Reset movement variables
                moveX = x;
                moveY = y;
                isMoving = false;
            } else {
                show_debug_message("The next tile is blocked!");
            }
        } else {
            show_debug_message("No grate to squeeze through.");
        }
    }
}
