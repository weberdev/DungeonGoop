/// @description Disintegrate on pickup
// You can write your code in this editor
if(sprite_index == sprite_keyAnimated){
var total_frames = sprite_get_number(sprite_index);

// Play the animation normally
image_speed = 1; // Adjust this as needed for your animation speed

// Check if the animation has reached the last frame
if (image_index >= total_frames - 1) {
    // Stop the animation on the last frame
    image_index = total_frames - 1;
    image_speed = 0;
	instance_destroy();
}}