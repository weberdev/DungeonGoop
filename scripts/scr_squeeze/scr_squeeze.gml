/// @description Ability - Squeeze through grates
function scr_squeeze() {
    show_debug_message("Used empty tummy, can we squeeze?");
    show_debug_message("This is only in scr_squeeze.");

    // Variables to accumulate final position
    var final_tile_x = obj_pcSlime.x;
    var final_tile_y = obj_pcSlime.y;

    // Loop to keep moving through grates
    var keep_moving = true;
    while (keep_moving) {
        // Calculate the next tile's coordinates
        var next_tile_x = final_tile_x + (obj_pcSlime.facing_x * tile_size);
        var next_tile_y = final_tile_y + (obj_pcSlime.facing_y * tile_size);

        // Check if the next tile has a collidable object
        var next_instance = instance_place(next_tile_x, next_tile_y, obj_collidableParent);
        var grate_instance = instance_place(next_tile_x, next_tile_y, obj_grate);

        if (next_instance == noone && grate_instance != noone) {
            // Update final position to the grate tile
            final_tile_x = next_tile_x;
            final_tile_y = next_tile_y;
            show_debug_message("Found grate at (" + string(next_tile_x) + ", " + string(next_tile_y) + ")");
        } else if (next_instance == noone && grate_instance == noone) {
            // Update final position to the empty tile and stop
            final_tile_x = next_tile_x;
            final_tile_y = next_tile_y;
            show_debug_message("Found empty tile at (" + string(next_tile_x) + ", " + string(next_tile_y) + ")");
            keep_moving = false;
        } else {
            show_debug_message("The next tile is blocked by a non-grate collidable object at (" + string(next_tile_x) + ", " + string(next_tile_y) + ")");
            keep_moving = false;
        }
    }

    // If the final position has changed, move the character
    if (final_tile_x != obj_pcSlime.x || final_tile_y != obj_pcSlime.y) {
        // Set the "leaving" animation based on direction
        if (obj_pcSlime.facing_x == 1) {
            obj_pcSlime.sprite_index = sprite_slime_leaving_right;
        } else if (obj_pcSlime.facing_x == -1) {
            obj_pcSlime.sprite_index = sprite_slime_leaving_left;
        } else if (obj_pcSlime.facing_y == 1) {
            obj_pcSlime.sprite_index = sprite_slime_leaving_down;
        } else {
            obj_pcSlime.sprite_index = sprite_slime_leaving_up;
        }

        obj_pcSlime.image_index = 0;
        obj_pcSlime.image_speed = 1;
        global.final_tile_x = final_tile_x;
        global.final_tile_y = final_tile_y;

        // Set alarm to trigger after the "leaving" animation
        obj_pcSlime.alarm[0] = sprite_get_number(obj_pcSlime.sprite_index) / obj_pcSlime.image_speed;
        show_debug_message("Alarm set for " + string(obj_pcSlime.alarm[0]) + " steps.");
    } else {
        show_debug_message("No movement necessary.");
    }
}
