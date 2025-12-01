/// @description lock_player(lock[true]/unlock[false])
/// @param lock[true]/unlock[false]
function lock_player(argument0) {

	if instance_exists(prt_player) {
	    //Lock the player
	    if argument0 == true {
	        with prt_player {
	            function_state = 2;
	            xspeed = 0;
	            yspeed = max(yspeed, 0);
	            canGrav = true;
            
	            if state == state_wall && wallState <= 1
	                image_xscale *= -1;
            
	            state = state_normal;
	            dashJumping = false;
	        }
	    }
	    //Unlock the player
	    else {
	        with prt_player {
	            function_state = 1;
	        }
	    }
	}



}
