/// @description Insert description here
if(other.is_washable){
	//we wash things to delete them. This differs from a fireball somehow I guess.
	//this goes through walls in the current implementation.
	//may not be intended behaviour but will consult for more spec details
	//I liked that doctor who episode
	//Water always wins
	//Thus this is acceptable functioning for now.
	instance_destroy(other);
}
