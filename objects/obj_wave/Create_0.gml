/// @description Wave creation
speed = 0; // Waves typically don't move after being created
bigDirection = 0;
// Determine the direction based on the slime's facing direction
if (obj_SlimePC.facing_x != 0) {
    show_debug_message("Slime is HORIZONTAL");
	//maintainer problem
    direction = obj_SlimePC.facing_x == 1 ? 180 : 0; // Right or Left
} else {
    direction = obj_SlimePC.facing_y == -1 ? 270 : 90; // Down or Up
}

// Set the image angle to match the direction, adjusting if needed
image_angle = direction +90; // Adjust by 90 degrees if the sprite's default orientation is vertical
show_debug_message("Direction: " + string(direction) + ", Image Angle: " + string(image_angle));
