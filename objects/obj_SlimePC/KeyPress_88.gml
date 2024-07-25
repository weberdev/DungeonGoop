/// @description Digest
// You can write your code in this editor
if(global.active_character == obj_SlimePC && obj_SlimePC.move_enabled == true){
if(active_item != ""){
obj_RemnantPC.active_trait = active_item;
show_debug_message("Digested " + active_item);
active_item = "";
sprite_index = sprite_SlimePC;}
else{
	show_debug_message("Digested nothing: empty tummy");}}