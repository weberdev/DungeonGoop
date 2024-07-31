function interact(){
	var layer_temp_id = layer_get_id("Walls_Temp_Entrance");
	instance_destroy(inst_5968AE6);
	instance_destroy(inst_769C47BE);
	layer_set_visible(layer_temp_id, false);
	image_speed = 1;
	
}