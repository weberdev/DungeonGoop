/// @description Insert description here
// You can write your code in this editor
move_enabled = true;
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