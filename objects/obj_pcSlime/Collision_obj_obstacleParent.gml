/// @description Death, Perhaps
// You can write your code in this editor
if(!isMoving){
var item_instance = instance_place(x, y, obj_obstacleParent);
    if (item_instance != noone) {

        // Determine the type of the picked-up item
        var item_type = item_instance.object_index;
        switch (item_type) {
            case obj_obstacleWater:
				if(obj_pcSlime.is_float == false && obj_pcSlime.is_fly == false){
					scr_youAreDead();
				}
                break;
            case obj_obstacleLava:
				if(!(obj_pcSlime.is_float == true && obj_pcSlime.is_immune_fire == true) && obj_pcSlime.is_fly == false){
					scr_youAreDead();
				}
                break;
            case obj_elemWater:
                sprite_index = sprite_slimePCWater;
                active_item = "water";
                break;
			case obj_elemWind:
				sprite_index = sprite_slimePCWind;
				active_item = "wind";
            default:
                break;
        }

    }
}