/// @description fade_to_position(x, y)
/// @param x
/// @param  y
function fade_to_position(argument0, argument1) {

	if !instance_exists(obj_fade_out) {
	    with instance_create(x, y, obj_fade_out) {
	        type = 1;
	        myX = argument0;
	        myY = argument1;
	    }
	}



}
