function scr_slimeAction(itemName) {
    flame_range = 10;
    water_range = 3;
    if (!isMoving) {
        show_debug_message("Action with: " + itemName);
        switch (itemName) {
           case "flame":
			scr_actionFIRE()
    break;
			case "rock":
				scr_actionROCK();
            
                break;
            case "water":
			scr_actionWATER()
			break;
            default:
                show_debug_message("Error: Unknown item type.");
                break;
        }
    } else {
        show_debug_message("No abilities while moving, please");
    }
}

function fire_action(xCoord, yCoord) {
    //show_debug_message("Fire strikes coordinates " + string(xCoord) + ", " + string(yCoord));
    var instance_found = instance_position(xCoord, yCoord, obj_collidableParent);
    if (instance_found != noone) {
        if (instance_found.is_flammable) {
            instance_destroy(instance_found);
        }
    }
}

function water_action(xCoord, yCoord) {
    show_debug_message("Water washes over coordinates " + string(xCoord) + ", " + string(yCoord));
}
