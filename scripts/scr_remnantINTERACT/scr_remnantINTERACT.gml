function scr_remnantManifest(){
    if (obj_pcRemnant.facing_x != 0) {
        // Create the spookyTendril instance for horizontal direction
        var spookyTendril = instance_create_layer(obj_pcRemnant.x + 32, obj_pcRemnant.y + 32, "Projectile_instances", obj_remnantTendril);
        spookyTendril.direction = obj_pcRemnant.facing_x == 1 ? 0 : 180;
        show_debug_message("Direction: " + string(spookyTendril.direction));
        spookyTendril.speed = 0; // Set speed as needed
        
    } else if (obj_pcRemnant.facing_y != 0) {
        // Create the spookyTendril instance for vertical direction
        var spookyTendril = instance_create_layer(obj_pcRemnant.x + 32, obj_pcRemnant.y + 32, "Projectile_instances", obj_remnantTendril);
        spookyTendril.direction = obj_pcRemnant.facing_y == 1 ? 270 : 90;
        spookyTendril.speed = 0; // Set speed as needed
    }
}