// Create Event of obj_audioController

// Variable to hold the music handle
global.music_handle = noone;

// Play the music and set it to loop
global.music_handle = audio_play_sound(snd_mainTheme, 1, true);
audio_sound_gain(global.music_handle, 0.1, 0);