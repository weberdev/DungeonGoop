// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_manifestWATER(){
        // Create the water instance for horizontal direction
        var water = instance_create_layer(obj_pcRemnant.x + 32, obj_pcRemnant.y + 32, "Projectile_instances", obj_manifestationWater);
        water.direction = obj_pcRemnant.facing_x == 1 ? 0 : 180;
        show_debug_message("Direction: " + string(water.direction));
        water.speed = 0; // Set speed as needed
        
    } else if (obj_pcRemnant.facing_y != 0) {
        // Create the water instance for vertical direction
        var water = instance_create_layer(obj_pcRemnant.x + 32, obj_pcRemnant.y + 32, "Projectile_instances", obj_manifestationWater);
        water.direction = obj_pcRemnant.facing_y == 1 ? 270 : 90;
        water.speed = 0; // Set speed as needed
}