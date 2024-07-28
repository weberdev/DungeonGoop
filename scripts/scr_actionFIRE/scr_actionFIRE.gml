// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_actionFIRE(){
if (obj_pcSlime.facing_x != 0) {
        // Slime is facing horizontally
        var fireball = instance_create_layer(obj_pcSlime.x+32, obj_pcSlime.y+32, "Projectile_instances", obj_effectFireball);
        fireball.direction = obj_pcSlime.facing_x == 1 ? 0 : 180;
		show_debug_message(string(fireball.direction));
        //fireball speed can be adjusted as per director's whims
		fireball.speed = 5;
        

    } else if (obj_pcSlime.facing_y != 0) {
        // Slime is facing vertically
        var fireball = instance_create_layer(obj_pcSlime.x+32, obj_pcSlime.y+32, "Projectile_instances", obj_effectFireball);
        fireball.direction = obj_pcSlime.facing_y == 1 ? 270 : 90;
        fireball.speed = 5;

}
    }