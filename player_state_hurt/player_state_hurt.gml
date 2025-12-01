/// @description player_state_hit()
function player_state_hurt() {

	if hitType == 0 {
	    sprite_index = sprite_hurt[0];
	    canGrav = false;
	    yspeed = 0;
	    xspeed = -1 * image_xscale;
    
	    if hitTimer++ >= hitFrames {
	        canGrav = true;
	        xspeed = 0;
        
	        hitTimer = 0;
        
	        recoveryTimer = recoveryFrames;
	        recovering = true;
        
	        state = state_normal;
	    }
	}

	else if hitType == 1 {
	    sprite_index = sprite_hurt[1];
	    canGrav = true;
	    yspeed += grav*0.25; //Additional gravity
	    xspeed = -1 * image_xscale;
    
	    if hitTimer == 0
	        yspeed = -2.5;
    
	    if hitTimer++ >= hitFrames {
	        canGrav = true;
	        xspeed = 0;
        
	        hitTimer = 0;
        
	        recoveryTimer = recoveryFrames;
	        recovering = true;
        
	        state = state_normal;
	    }
	}



}
