// Ensure the object has a weight property and a pushing flag
if (!other.pushing) {
    other.pushing = true;

    // Calculate direction from the slime to the gustable object
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
        show_debug_message("Checking tile " + string(i) + ": (" + string(next_x) + ", " + string(next_y) + ")");

        // Debugging bounding box for collision check
        show_debug_message("Object position: (" + string(other.x) + ", " + string(other.y) + ")");
        show_debug_message("Next position: (" + string(next_x) + ", " + string(next_y) + ")");
        show_debug_message("Direction: " + string(dircplaceholder) + " degrees");
        
        // Check for collision at the next position with obj_collidableParent, excluding self
        if (instance_position(next_x, next_y, obj_collidableParent) != noone &&
            instance_position(next_x, next_y, obj_collidableParent) != other) {
            show_debug_message("Collision detected at tile " + string(i) + ". Stopping movement.");
            
            // Further debugging: list nearby collidable objects
            var nearby_collidable = instance_nearest(next_x, next_y, obj_collidableParent);
            if (nearby_collidable != noone) {
                show_debug_message("Nearest collidable object at: (" + string(nearby_collidable.x) + ", " + string(nearby_collidable.y) + ")");
            }
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

    // Reset the pushing flag after some time or an event
    other.push_timer = 30; // Example timer duration, adjust as needed
    show_debug_message("Pushing flag set for object. Will reset in 30 frames.");
}
