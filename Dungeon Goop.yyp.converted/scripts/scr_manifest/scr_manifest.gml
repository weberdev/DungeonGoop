function scr_remnantManifest(facing_tile_x, facing_tile_y, itemName) {
    show_debug_message("Action with: " + itemName);
    switch(itemName) {
        case "flame":
            
            break;
        case "rock":
            if (object_exists(obj_elemRock)) {
                show_debug_message("obj_elemRock exists.");
                instance_create_depth(xCoord, yCoord, 1, obj_elemRock);
            } else {
                show_debug_message("Error: obj_elemRock does not exist.");
            }
            break;
        case "water":
            if (object_exists(obj_elemWater)) {
                instance_create_depth(xCoord, yCoord, 1, obj_elemWater);
            } else {
                show_debug_message("Error: obj_elemWater does not exist.");
            }
            break;
        default:
            show_debug_message("Error: Unknown item type.");
            break;
    }
}
