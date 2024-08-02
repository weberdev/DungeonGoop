// Alarm[0] event code
// Move to the final tile position
x = global.final_tile_x;
y = global.final_tile_y;
show_debug_message("Moved to (" + string(x) + ", " + string(y) + ").");
move_enabled = false;
// Determine the opposite direction for the "entering" animation
var opposite_dirchoice;
if (facing_x == 1) opposite_dirchoice = "left";
else if (facing_x == -1) opposite_dirchoice = "right";
else if (facing_y == 1) opposite_dirchoice = "up";
else if (facing_y == -1) opposite_dirchoice = "down";

// Play the "entering" animation
sprite_index = asset_get_index("sprite_slime_entering_" + opposite_dirchoice);
image_index = 0;
image_speed = 1;

// You can set another alarm if you need to perform actions after the "entering" animation
alarm[1] = 2*sprite_get_number(sprite_index);
