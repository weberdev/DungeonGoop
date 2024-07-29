//Can discarding an item put two items on the same tile without designer intent?
//In this set of comments, I will prove that is not possible.
//PROOF BY CONTRADICTION:
//We assume that it is.
//An item is excreted onto the most recently vacated tile.
//There would need to be an item on this most recently vacated tile already.
//We know that there is no item on this tile, because it would have already been picked up.
//Given that the two preconditions cannot possibly both be true, the premise is impossible.
//QED

function scr_discarditem(xCoord, yCoord, itemName) {
    if(obj_pcSlime.move_enabled){
	show_debug_message("Discarding item: " + itemName);
    switch(itemName) {
        case "flame":
            instance_create_depth(xCoord, yCoord, 1, obj_elemFlame);
            break;
        case "rock":
            instance_create_depth(xCoord, yCoord, 1, obj_elemRock);
            break;
        case "water":
            instance_create_depth(xCoord, yCoord, 1, obj_elemWater);
            break;
		case "wind":
			instance_create_depth(xCoord, yCoord, 1, obj_elemWind);
			break;
		case "bone":
			instance_create_depth(xCoord, yCoord, 1, obj_elemBone);
			break;
		case "ice":
			instance_create_depth(xCoord, yCoord, 1, obj_elemIce);
			break;
		
        default:
            show_debug_message("Error: Unknown item type.");
            break;
    }
	}
}
