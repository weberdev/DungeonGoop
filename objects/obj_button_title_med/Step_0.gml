/// @description Insert description here
// You can write your code in this editor

var mouse_hover = collision_point(mouse_x, mouse_y, id, true, false);

if (mouse_hover) {
		
		image_blend = merge_color( image_blend, c_hover, 0.1);
		
} else {
	
		image_blend = merge_color( image_blend, c_default, 0.1);
		
}