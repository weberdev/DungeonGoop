// Initialize the rock's speed and animation speed
speed = 0;
image_speed = 2;

// Determine the direction based on the facing direction of obj_pcRemnant
if (obj_pcRemnant.facing_tile_x != obj_pcRemnant.x) {
    show_debug_message("Remnant is facing HORIZONTAL");
    if(obj_pcRemnant.x > obj_pcRemnant.facing_tile_x){
		direction = 180;}
		else{
			direction = 0;}
} else {
    show_debug_message("Remnant is facing VERTICAL");
    direction = obj_pcRemnant.facing_y == -1 ? 90 : 270; // Up or Down
}

// Set the image angle to match the direction
image_angle = direction; // Adjust if the sprite's default orientation requires it
show_debug_message("Direction: " + string(direction) + ", Image Angle: " + string(image_angle));
