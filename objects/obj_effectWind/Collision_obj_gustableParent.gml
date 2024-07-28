// Assuming the object has a weight property and a pushing flag
if (!other.pushing) {
    other.pushing = true;

    // Calculate direction from the slime to the object
    var dircplaceholder = point_direction(obj_pcSlime.x, obj_pcSlime.y, other.x, other.y);
    
    // Calculate distance to push: 5 tiles minus twice the weight
    var tile_size = 64;
    var push_distance = max(0, 5 - 2 * other.weight) * tile_size; // Ensure push_distance is not negative

    // Set the initial new position
    var new_x = other.x;
    var new_y = other.y;

    // Define the number of steps for collision checking
    var steps = 10; // The number of incremental checks
    var step_distance = push_distance / steps;

    // Move the object step by step, checking for collisions
    for (var i = 1; i <= steps; i++) {
        var step_x = other.x + lengthdir_x(step_distance * i, dircplaceholder);
        var step_y = other.y + lengthdir_y(step_distance * i, dircplaceholder);

        // Check for collisions at the new step position
        if (place_meeting(step_x, step_y, obj_collidableParent)) {
            // Collision detected, stop movement
            break;
        }

        // Update the new position to the current step position
        new_x = step_x;
        new_y = step_y;
    }

    // Set the final position after checking for collisions
    other.x = new_x;
    other.y = new_y;

    // Set a timer or flag to prevent immediate re-pushing
    other.push_timer = 10; // Example timer duration, adjust as needed
}
