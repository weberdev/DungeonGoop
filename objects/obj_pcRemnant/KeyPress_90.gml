/// @description Manifest
// You can write your code in this editor
if(global.active_character == obj_pcRemnant){
if(active_trait != ""){
show_debug_message("Used " + active_trait);
show_debug_message(" targeting facing coordinates " + string(facing_tile_x) +", " + string(facing_tile_y));}
scr_manifest(active_trait);}
else{
	show_debug_message("Used empty ghost hands because you haven't digested anything");}
	