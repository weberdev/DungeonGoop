function scr_manifest(itemName) {
    show_debug_message("Action with: " + itemName);
    switch(itemName) {
        case "flame":
            scr_manifestFIRE();
            break;
        case "rock":
            scr_manifestROCK();
			
            break;
        case "water":
			scr_manifestWATER();
            break;
        default:
            show_debug_message("Error: Unknown item type.");
            break;
    }
}
