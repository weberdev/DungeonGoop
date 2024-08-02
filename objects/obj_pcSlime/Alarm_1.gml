/// @description Insert description here
// You can write your code in this editor
move_enabled = true;
moveX = x;
moveY = y;
last_x = x;
last_y = y;
moveSpeed = 4;

//facing = east;
facing_x = 0;
facing_y = 0;  
facing_tile_x = 0;
facing_tile_y = 0;

switch(active_item){
	case("flame"):
		sprite_index = sprite_slimePCFire;
		break;
	case("water"):
		sprite_index = sprite_slimePCWater;
		break;
	case("rock"):
		sprite_index = sprite_slimePCStone;
		break;
	case("wind"):
		sprite_index = sprite_slimePCWind;
		break;
	default:
		sprite_index = sprite_SlimePC;
		break;
}