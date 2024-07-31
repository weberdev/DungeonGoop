// Create Event for obj_SlimePC
x = global.respawn_x;
y = global.respawn_y;
tile_size = 64;
isMoving = false;
moveX = x;
moveY = y;
last_x = x;
last_y = y;
moveSpeed = 4;
active_item = global.slime_trait;
//facing = east;
facing_x = 0;
facing_y = 0;  
facing_tile_x = 0;
facing_tile_y = 0;
num_keys = 0;
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
//Properties of Slime:
weight = 1;
is_float = false;
is_fly = false;

//Elemental affinities
is_immune_fire = false;
is_immune_crush = false;
is_immune_all = false;
is_immune_ice = false;
is_weak_water = false;
}