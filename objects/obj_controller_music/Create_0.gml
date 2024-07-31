// Create Event of obj_audioController

// Variable to hold the music handle
global.music_handle = noone;

// Play the music and set it to loop
global.music_handle = audio_play_sound(snd_titleTheme, 1, true);
//TODO THIS IS IMPORTANT:
//SET GAIN TO 1.0 WHEN SHIPPING
audio_sound_gain(global.music_handle, 0.1, 0);