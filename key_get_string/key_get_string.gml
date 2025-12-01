/// @description key_get_string(key)
/// @param key
function key_get_string(argument0) {

	switch argument0 {
	    case(vk_right): return "RIGHT KEY"; break;
	    case(vk_left): return "LEFT KEY"; break;
	    case(vk_up): return "UP KEY"; break;
	    case(vk_down): return "DOWN KEY"; break;
    
	    default: return chr(argument0); break;
	}



}
