layer_set_visible(layer_get_id("Walls_Temp_False"), false);  // Show Walls_Temp_False
layer_set_visible(layer_get_id("Walls_Temp_True"), false);  // Hide Walls_Temp_True
instance_activate_layer( layer_get_id("water_puzzle_true"));
instance_activate_layer(layer_get_id("water_puzzle_false"));
instance_activate_layer(layer_get_id("water_puzzle_static"));
audio_stop_sound(global.music_handle);
global.music_handle = audio_play_sound(snd_mainTheme, 1, true);
audio_sound_gain(global.music_handle, 1, 0);
