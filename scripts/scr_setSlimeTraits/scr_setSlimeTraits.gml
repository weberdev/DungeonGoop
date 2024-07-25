// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setSlimeTraits(activeItem){
	 switch(activeItem) {
        case "flame":
			obj_SlimePC.is_immune_fire = true;
			obj_SlimePC.is_weak_water = true;
            break;
        case "rock":
			//There's nothing here, but we still check this case for expandability reasons.
            break;
        case "water":
			obj_SlimePC.is_float = true;
            break;
		case "bone":
			//implement later
			break;
		case "ice":
			//implement later
			break;
		case "wind":
			//implement later
			break;
        case "":
			//IMPORTANT:
			//Every frame the slime is not elementally aligned, the parameters are reset.
			//This will need to be changed if we have power ups not based on active elemental alignment.
			//This is a problem for later.
			weight = 1;
			is_float = false;
			is_fly = false;

			//Elemental affinities
			is_immune_fire = false;
			is_immune_crush = false;
			is_immune_all = false;
			is_immune_ice = false;
			is_weak_water = false;
		default:
            show_debug_message("Error: Unknown item type.");
            break;
}}