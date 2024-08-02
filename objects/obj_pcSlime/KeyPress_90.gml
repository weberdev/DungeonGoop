/// @description Ability
if (global.active_character == obj_pcSlime) {
    if (active_item != "") {
        show_debug_message("Used " + active_item);
        scr_slimeAction(active_item);
    } else {
        show_debug_message("Used empty tummy, can we squeeze?");

		scr_squeeze();
    }
}
