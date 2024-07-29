function scr_manifestROCK(){
if (obj_pcRemnant.facing_x != 0) {
        // Slime is facing horizontally
        var wind = instance_create_layer(obj_pcRemnant.x+32, obj_pcRemnant.y+32, "Projectile_instances", obj_manifestationRock);
        wind.direction = obj_pcRemnant.facing_x == 1 ? 0 : 180;
		show_debug_message(string(wind.direction));
        //wind speed can be adjusted as per director's whims
		wind.speed = 0;
        
        
    } else if (obj_pcRemnant.facing_y != 0) {
        // Slime is facing vertically
        var wind = instance_create_layer(obj_pcRemnant.x+32, obj_pcRemnant.y+32, "Projectile_instances", obj_manifestationRock);
        wind.direction = obj_pcRemnant.facing_y == 1 ? 270 : 90;
        wind.speed = 0;


    }
}