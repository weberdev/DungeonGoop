speed = 0;
// Determine the direction based on the slime's facing direction
//the maintainer who faced the issue
//was me
if (obj_pcSlime.facing_x != 0) {
    show_debug_message("Slime is HORIZONTAL");
	//maintainer problem
    direction = obj_pcSlime.facing_x == 1 ? 0 : 180; // Right or Left
} else {
    direction = obj_pcSlime.facing_y == -1 ? 90 : 270; // Down or Up
}
// Set the image angle to match the direction, adjusting if needed
image_angle = direction; // Adjust by 90 degrees if the sprite's default orientation is vertical
show_debug_message("Direction: " + string(direction) + ", Image Angle: " + string(image_angle));
/// @description set angle
// You can write your code in this editor
