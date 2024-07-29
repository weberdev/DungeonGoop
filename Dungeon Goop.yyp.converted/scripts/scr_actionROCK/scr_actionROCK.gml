// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_actionROCK(){
                if (move_enabled) {
                    move_enabled = false;
                    is_immune_crush = true;
					obj_pcSlime.sprite_index = sprite_TEMPslimePCrock;
                    show_debug_message("Hardened, can't move");
                } else {
                    move_enabled = true;
                    is_immune_crush = false;
					obj_pcSlime.sprite_index = sprite_slimePCStone;
                    show_debug_message("Unhardened, can move");
                }
}