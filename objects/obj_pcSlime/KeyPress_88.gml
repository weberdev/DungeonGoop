/// @description Digest
// You can write your code in this editor
if(global.active_character == obj_pcSlime && obj_pcSlime.move_enabled == true){
if(active_item != ""){
obj_pcRemnant.active_trait = active_item;
show_debug_message("Digested " + active_item);
active_item = "";
sprite_index = sprite_SlimePC;}
else{
	show_debug_message("Digested nothing: empty tummy");}}