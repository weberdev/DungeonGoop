/// @description Button trigger
// You can write your code in this editor
 if (!down){
	 // In a script or an event where you want to toggle the layers

// Get the layer IDs
var layer_false_id = layer_get_id("Walls_Temp_False");
var layer_true_id = layer_get_id("Walls_Temp_True");
var water_false_id = layer_get_id("water_puzzle_false");
var water_true_id = layer_get_id("water_puzzle_true");

// Check if the layers are visible
var is_layer_false_visible = layer_get_visible(layer_false_id);
var is_layer_true_visible = layer_get_visible(layer_true_id);


// Toggle the layers' visibility
if (is_layer_false_visible) {
    layer_set_visible(layer_false_id, false); // Hide Walls_Temp_False
    layer_set_visible(layer_true_id, true);   // Show Wa⌈lls_Temp_True
	instance_deactivate_layer(water_false_id);
	instance_activate_layer(water_true_id);
	
} else if(is_layer_true_visible) {
    layer_set_visible(layer_false_id, true);  // Show Walls_Temp_False
    layer_set_visible(layer_true_id, false);  // Hide Walls_Temp_True
	instance_deactivate_layer(water_true_id);
	instance_activate_layer(water_false_id);
	
}
	else{
		layer_set_visible(layer_true_id, true);
		instance_deactivate_layer(water_false_id);
	}

	var instance_cnt = instance_number(obj_button_circle); // Get the total number of instances
for (var i = 0; i < instance_cnt; i++) {
    var instnce_id = instance_find(obj_button_circle, i); // Find each instance by index

    // Now you can access each instance's properties or methods
    with (instnce_id) {
        down = false;
    }
}
	down = true;
 }
