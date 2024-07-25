function scr_slimeAction(facing_x, facing_y, itemName) {
    flame_range = 10;
    water_range = 3;
    if (!isMoving) {
        show_debug_message("Action with: " + itemName);
        switch (itemName) {
            case "flame":
                if (obj_SlimePC.facing_x != 0) {
                    // Slime is facing horizontally
                    for (var i = 0; i < flame_range; i++) {
                        var targeted_coord = x + (i * tile_size * obj_SlimePC.facing_x);
                        var instance_found = instance_position(targeted_coord, obj_SlimePC.y, obj_collidableParent);
                        if (instance_found != noone) {
                            if (instance_found.is_flammable == false) {
                                break;
                            }
                        }
                        fire_action(targeted_coord, y);    
                    }
                } else if (obj_SlimePC.facing_y != 0) {
                    // Slime is facing vertically
                    for (var i = 0; i < flame_range; i++) {
                        var targeted_coord = y + (i * tile_size * obj_SlimePC.facing_y);
                        var instance_found = instance_position(obj_SlimePC.x, targeted_coord, obj_collidableParent);
                        if (instance_found != noone) {
                            if (instance_found.is_flammable == false) {
                                break;
                            }
                        }
                        fire_action(x, targeted_coord);    
                    }
                } else {
                    show_debug_message("Slime is facing itself somehow");
                    show_debug_message("Assume error or slime has just spawned");
                }
                break;
            case "rock":
                if (move_enabled) {
                    move_enabled = false;
                    is_immune_crush = true;
					obj_SlimePC.sprite_index = sprite_TEMPslimePCrock;
                    show_debug_message("Hardened, can't move");
                } else {
                    move_enabled = true;
                    is_immune_crush = false;
					obj_SlimePC.sprite_index = sprite_slimePCStone;
                    show_debug_message("Unhardened, can move");
                }
                break;
            case "water":
                if (obj_SlimePC.facing_x != 0) {
                    // Slime is facing horizontally
                    for (var i = 0; i < water_range; i++) {
                        var targeted_coord = x + (i * tile_size * obj_SlimePC.facing_x);
                        water_action(targeted_coord, y);    
                    }
                } else if (obj_SlimePC.facing_y != 0) {
                    // Slime is facing vertically
                    for (var i = 0; i < water_range; i++) {
                        var targeted_coord = y + (i * tile_size * obj_SlimePC.facing_y);
                        water_action(x, targeted_coord);    
                    }
                } else {
                    show_debug_message("Slime is facing itself somehow");
                    show_debug_message("Assume error or slime has just spawned");
                }
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
    show_debug_message("Fire strikes coordinates " + string(xCoord) + ", " + string(yCoord));
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
