/// @description Ability
// You can write your code in this editor
if (global.active_character == obj_SlimePC) {
    if (active_item != "") {
        show_debug_message("Used " + active_item);
        if (facing_tile_x != undefined && facing_tile_y != undefined) {
            show_debug_message("Targeting facing coordinates " + string(facing_tile_x) + ", " + string(facing_tile_y));
        } else {
            show_debug_message("Error: Facing coordinates are undefined or not numbers");
        }
    } else {
        show_debug_message("Used empty tummy, can we squeeze?");
    }
}
