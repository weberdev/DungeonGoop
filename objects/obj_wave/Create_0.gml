/// @description Wave creation
// You can write your code in this editor
speed = 0;
if(obj_SlimePC.facing_x != 0){
	show_debug_message("Slime is HORIZONTAL");
	if(obj_SlimePC.facing_x = 1){
		direction = 0;
	}
	else{
		direction = 180;
	}
}
else{
	if(obj_SlimePC.facing_y= 1){
		direction = 270;}
	else{
		direction = 90;}
}
image_angle = direction;
