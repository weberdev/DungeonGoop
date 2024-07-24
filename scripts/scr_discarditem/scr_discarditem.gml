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
    show_debug_message("Discarding item: " + itemName);
    switch(itemName) {
        case "flame":
            if (object_exists(obj_elemFlame)) {
                instance_create_depth(xCoord, yCoord, 1, obj_elemFlame);
            } else {
                show_debug_message("Error: obj_elemFlame does not exist.");
            }
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
