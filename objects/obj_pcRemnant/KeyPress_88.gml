/// @description Interact
// You can write your code in this editor
if(global.active_character == obj_pcRemnant){
        show_debug_message("interacted ");
        if (facing_tile_x != undefined && facing_tile_y != undefined) {
            show_debug_message("Targeting facing coordinates " + string(facing_tile_x) + ", " + string(facing_tile_y));
			scr_remnantManifest();
        } else {
            show_debug_message("Error: Facing coordinates are undefined or not numbers");
        }
}