// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_setSlimeTraits(activeItem){
	 switch(activeItem) {
        case "flame":
			//Properties of Slime:
			weight = 1;
			is_float = false;
			is_fly = false;

			//Elemental affinities
			is_immune_crush = false;
			is_immune_all = false;
			is_immune_ice = false;
			obj_pcSlime.is_immune_fire = true;
			obj_pcSlime.is_weak_water = true;
            break;
        case "rock":
			//There's nothing new here, but we still check this case for expandability reasons.
			weight = 1;
			is_float = false;
			is_fly = false;

			//Elemental affinities
			is_immune_fire = false;
			is_immune_crush = false;
			is_immune_all = false;
			is_immune_ice = false;
			is_weak_water = false;
            break;
        case "water":
			//Properties of Slime:
			weight = 1;
			is_float = true;
			is_fly = false;

//Elemental affinities
			is_immune_fire = false;
			is_immune_crush = false;
			is_immune_all = false;
			is_immune_ice = false;	
			is_weak_water = false;
            break;
		case "bone":
			//implement later
			break;
		case "ice":
			//Properties of Slime:
			weight = 1;
			is_float = false;
			is_fly = false;

			//Elemental affinities
			is_immune_fire = false;
			is_immune_crush = false;
			is_immune_all = false;
			is_immune_ice = false;
			is_weak_water = false;
			//implement later
			break;
		case "wind":
			//Properties of Slime:
			weight = 1;
			is_float = false;
			is_fly = true;

			//Elemental affinities
			is_immune_fire = false;
			is_immune_crush = false;
			is_immune_all = false;
			is_immune_ice = false;
			is_weak_water = false;
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
			break;
		default:
            show_debug_message("Error: Unknown item type.");
            break;
}}