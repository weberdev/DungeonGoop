function scr_slimeAction(facing_x, facing_y, itemName) {
    if(!isMoving){show_debug_message("Action with: " + itemName);
    switch(itemName) {
        case "flame":
            
            break;
        case "rock":
			if(obj_SlimePC.move_enabled){
				obj_SlimePC.move_enabled = false;
				obj_SlimePC.is_immune_crush = true;
				//next line is commented out on for implementation adjustment
				//obj_SlimePC.is_immune_all = true;
				show_debug_message("hardened, can't move");
			}
			else{
				obj_SlimePC.move_enabled = true;
				obj_SlimePC.is_immune_crush = false;
				show_debug_message("unhardened, can move");
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
    }}
	else{
	show_debug_message("no abilities while moving, please");
	}
}
