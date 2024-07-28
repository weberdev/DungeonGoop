// Assuming the object has a weight property and a pushing flag
if (!other.pushing) {
    other.pushing = true;

    // Calculate direction from the slime to the object
    var dircplaceholder = point_direction(obj_pcSlime.x, obj_pcSlime.y, other.x, other.y);
    show_debug_message("Direction to push: " + string(dircplaceholder));

    // Calculate the number of tiles to push: 5 minus twice the weight
    var max_tiles = max(0, 5 - 2 * other.weight); // Ensure the number of tiles is not negative
    var tile_size = 64;
    var margin = 2; // Slight margin to avoid flush edge detection
    show_debug_message("Max tiles to push: " + string(max_tiles));

    // Variables to hold the final position
    var final_x = other.x;
    var final_y = other.y;

    // Iterate through each tile distance
    for (var i = 1; i <= max_tiles; i++) {
        // Calculate the new position for this tile
        var next_x = other.x + lengthdir_x(tile_size * i, dircplaceholder);
        var next_y = other.y + lengthdir_y(tile_size * i, dircplaceholder);
        show_debug_message("Checking position for tile " + string(i) + ": (" + string(next_x) + ", " + string(next_y) + ")");

        // Define the potential bounding box for collision checking, adjusted to avoid flush detection
        var box_left = next_x - (tile_size / 2) + margin;
        var box_right = next_x + (tile_size / 2) - margin;
        var box_top = next_y - (tile_size / 2) + margin;
        var box_bottom = next_y + (tile_size / 2) - margin;

        show_debug_message("Bounding box: left=" + string(box_left) + ", right=" + string(box_right) +
                           ", top=" + string(box_top) + ", bottom=" + string(box_bottom));

        // Check for collision using the bounding box approach
        if (collision_rectangle(box_left, box_top, box_right, box_bottom, obj_collidableParent, false, false)) {
            show_debug_message("Collision detected at bounding box with obj_collidableParent at tile " + string(i));
            break; // Stop movement before this tile
        }

        // Update final position if no collision
        final_x = next_x;
        final_y = next_y;
        show_debug_message("No collision at tile " + string(i) + ". Moving to new position.");
    }

    // Move the object to the final calculated position
    show_debug_message("Final position set to: (" + string(final_x) + ", " + string(final_y) + ")");
    other.x = final_x;
    other.y = final_y;

    // Optionally, you can reset the pushing flag after some time or an event
    other.push_timer = 30; // Example timer duration, adjust as needed
    show_debug_message("Pushing flag set for object. Will reset in 30 frames.");
}
