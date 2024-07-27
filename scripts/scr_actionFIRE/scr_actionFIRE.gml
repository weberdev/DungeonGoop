// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_actionFIRE(){
if (obj_SlimePC.facing_x != 0) {
        // Slime is facing horizontally
        var fireball = instance_create_layer(obj_SlimePC.x+32, obj_SlimePC.y+32, "Projectile_instances", obj_fireball);
        fireball.direction = obj_SlimePC.facing_x == 1 ? 0 : 180;
		show_debug_message(string(fireball.direction));
        //fireball speed can be adjusted as per director's whims
		fireball.speed = 5;
        
        //this is all debug junk now
        for (var i = 1; i <= flame_range; i++) {
            var targeted_coord_x = obj_SlimePC.x + (i * tile_size * obj_SlimePC.facing_x);
            var instance_found = instance_position(targeted_coord_x, obj_SlimePC.y, obj_collidableParent);
            if (instance_found != noone && !instance_found.is_flammable) {
                break;
            }
            fire_action(targeted_coord_x, obj_SlimePC.y);    
        }
    } else if (obj_SlimePC.facing_y != 0) {
        // Slime is facing vertically
        var fireball = instance_create_layer(obj_SlimePC.x+32, obj_SlimePC.y+32, "Projectile_instances", obj_fireball);
        fireball.direction = obj_SlimePC.facing_y == 1 ? 270 : 90;
        fireball.speed = 5;

        //still debug junk
        for (var i = 1; i <= flame_range; i++) {
            var targeted_coord_y = obj_SlimePC.y + (i * tile_size * obj_SlimePC.facing_y);
            var instance_found = instance_position(obj_SlimePC.x, targeted_coord_y, obj_collidableParent);
            if (instance_found != noone && !instance_found.is_flammable) {
                break;
            }
            fire_action(obj_SlimePC.x, targeted_coord_y);    
        }
    }
}