function scr_manifestROCK(){
    if (obj_pcRemnant.facing_x != 0) {
        // Create the rock instance for horizontal direction
        var rock = instance_create_layer(obj_pcRemnant.x + 32, obj_pcRemnant.y + 32, "Projectile_instances", obj_manifestationRock);
        rock.direction = obj_pcRemnant.facing_x == 1 ? 0 : 180;
        show_debug_message("Direction: " + string(rock.direction));
        rock.speed = 0; // Set speed as needed
        
    } else if (obj_pcRemnant.facing_y != 0) {
        // Create the rock instance for vertical direction
        var rock = instance_create_layer(obj_pcRemnant.x + 32, obj_pcRemnant.y + 32, "Projectile_instances", obj_manifestationRock);
        rock.direction = obj_pcRemnant.facing_y == 1 ? 270 : 90;
        rock.speed = 0; // Set speed as needed
    }
}
