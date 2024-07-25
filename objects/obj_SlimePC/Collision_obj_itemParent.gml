/// @description Item Pickup
// You can write your code in this editor
if(!isMoving){
var item_instance = instance_place(x, y, obj_itemParent);
    if (item_instance != noone) {
        if (active_item != "") {
            // Create a new instance of the previous active item at the last position
            scr_discarditem(last_x, last_y, active_item);
        }

        // Determine the type of the picked-up item
        var item_type = item_instance.object_index;
        switch (item_type) {
            case obj_elemRock:
                sprite_index = sprite_slimePCStone;
                active_item = "rock";
                break;
            case obj_elemFlame:
                sprite_index = sprite_slimePCFire;
                active_item = "flame";
                break;
            case obj_elemWater:
                sprite_index = sprite_slimePCWater;
                active_item = "water";
                break;
            default:
                break;
        }
        instance_destroy(item_instance);
    }
}