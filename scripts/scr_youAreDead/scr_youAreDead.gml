// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_youAreDead(){
	//Ideally we'll have more here!
	show_debug_message("You are dead, please close the game!");
	audio_stop_sound(global.music_handle);
	
	room_restart();
	//Uncomment this to crash the game on death.
	//Very funny and clever everytime.
	//game_end();
}