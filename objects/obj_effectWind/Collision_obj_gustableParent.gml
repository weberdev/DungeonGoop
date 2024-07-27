/// @description Insert description here
// You can write your code in this editor
// Assuming the object has a weight property and a pushing flag
if (!other.pushing) {
    other.pushing = true;

    // Calculate direction from the slime to the object
    var dircplaceholder = point_direction(obj_pcSlime.x, obj_pcSlime.y, other.x, other.y);
    
    // Calculate distance to push: 5 tiles minus twice the weight
    var tile_size = 64;
    var push_distance = max(0, 5 - 2 * other.weight) * tile_size; // Ensure push_distance is not negative

    // Calculate the new position
    var new_x = other.x + lengthdir_x(push_distance, dircplaceholder);
    var new_y = other.y + lengthdir_y(push_distance, dircplaceholder);

    // Move the object
    other.x = new_x;
    other.y = new_y;

	other.push_timer =30;
}
