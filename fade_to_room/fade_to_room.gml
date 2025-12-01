/// @description fade_to_room(myroom)
/// @param myroom
function fade_to_room(argument0) {

	if !instance_exists(obj_fade_out) {
	    with instance_create(x, y, obj_fade_out) myRoom = argument0;
	}



}
