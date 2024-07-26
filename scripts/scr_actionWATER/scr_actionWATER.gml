// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_actionWATER(){
if (obj_SlimePC.facing_x != 0) {
        // Slime is facing horizontally
        var wave = instance_create_layer(obj_SlimePC.x+32, obj_SlimePC.y+32, "Instances", obj_wave);
        wave.direction = obj_SlimePC.facing_x == 1 ? 0 : 180; // Right or Left
		show_debug_message(string(wave.direction));
        wave.speed = 0; // Set the speed of the wave
        
        // Check the path and perform actions
        for (var i = 1; i <= water_range; i++) {
            var targeted_coord_x = obj_SlimePC.x + (i * tile_size * obj_SlimePC.facing_x);
            var instance_found = instance_position(targeted_coord_x, obj_SlimePC.y, obj_collidableParent);
            if (instance_found != noone) {
                break;
            }
            water_action(targeted_coord_x, obj_SlimePC.y);    
        }
    } else if (obj_SlimePC.facing_y != 0) {
        // Slime is facing vertically
        var wave = instance_create_layer(obj_SlimePC.x+32, obj_SlimePC.y+32, "Instances", obj_wave);
        wave.direction = obj_SlimePC.facing_y == 1 ? 270 : 90; // Down or Up
        wave.speed = 0; // Set the speed of the wave

        // Check the path and perform actions
        for (var i = 1; i <= water_range; i++) {
            var targeted_coord_y = obj_SlimePC.y + (i * tile_size * obj_SlimePC.facing_y);
            var instance_found = instance_position(obj_SlimePC.x, targeted_coord_y, obj_collidableParent);
            if (instance_found != noone) {
                break;
            }
            water_action(obj_SlimePC.x, targeted_coord_y);    
        }
    }
}