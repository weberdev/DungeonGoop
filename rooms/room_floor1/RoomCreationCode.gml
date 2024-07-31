layer_set_visible(layer_get_id("Walls_Temp_False"), false);  // Show Walls_Temp_False
layer_set_visible(layer_get_id("Walls_Temp_True"), false);  // Hide Walls_Temp_True
instance_activate_layer( layer_get_id("water_puzzle_true"));
instance_activate_layer(layer_get_id("water_puzzle_false"));
instance_activate_layer(layer_get_id("water_puzzle_static"));

