/// @description player_state_climb()
function player_state_climb() {

	if instance_place(x, y+1, obj_collision_ladder)
	    myLadder = instance_place(x, y+1, obj_collision_ladder);
	else
	    myLadder = -1;

	//Starting (getting on the ladder)
	if climbState == 0 {
	    canGrav = false;
	    x = myLadder.x+8;
	    xspeed = 0;
	    yspeed = 0;
	    sprite_index = sprite_climb_start;
	    if climbTimer++ >= climbStartFrames || saber {
	        //If on the ground, get the player off the ground
	        if ground {
	            y--;
	            ground = false;
	        }
            
	        climbState = 1;
	        climbTimer = 0;
	    }
	}
	//Main logic
	else if climbState == 1 {
	    xspeed = 0;
	    x = myLadder.x+8;
	    canGrav = false;
    
	    if !saber && !shooting {
	        canShoot = true;
	        if global.keyUp && !global.keyDown
	            yspeed = -climbSpeed;
	        else if global.keyDown && !global.keyUp
	            yspeed = climbSpeed;
	        else
	            yspeed = 0;
        
	        //Get off the ladder
	        if global.keyJumpPressed || ground
	        || myLadder == -1 {
	            state = state_normal
	            climbState = 0;
	            climbTimer = 0;
	            yspeed = 0;
	            canGrav = true;
	            image_index = 0;
	        }
        
	        //Get up
	        if noLadder {
	            climbState = 2;
	            climbTimer = 0;
	            yspeed = 0;
	        }
	    }
	    else {
	        if saber
	            player_zero_saber_climb();
	        else {
	            yspeed = 0;
	            image_xscale = climbXscale;
	        }
	    }
    
	    if !saber {
	        sprite_index = sprite_climb;
	        if global.keyLeft && !global.keyRight
	            climbXscale = -1;
	        else if !global.keyLeft && global.keyRight
	            climbXscale = 1;
	    }
	}
	//Getting up
	else if climbState == 2 {
	    canShoot = false;
	    xspeed = 0;
	    var climbInterval = 5;
	    sprite_index = sprite_climb_getup;
	    if climbTimer == 0 {
	        image_index = 0;
	        image_xscale = climbXscale;
	    }
    
	    if climbTimer == climbInterval || climbTimer == climbInterval*2 {
	        image_index++;
	        y -= 7;
	    }
    
	    if climbTimer >= climbInterval*3 {
	        climbTimer = 0;
	        climbState = 0;
	        state = state_normal
	        locked = false;
	        //Don't do the land sprite.
	        landSprite = false;
	        canLandSprite = false;
	        canLandSound = false;
	        ground = true;
	        sprite_index = sprite_idle;
	        image_index = 0;
	        canGrav = true;
	    }
        
	    climbTimer++;
	}
	//Going down
	else if climbState == 3 {
	    canShoot = false;
	    var climbInterval = 5;
	    canGrav = false; //Disable gravity
	    x = myLadder.x+8;
	    xspeed = 0;
	    sprite_index = sprite_climb_getup;
	    if climbTimer == 0 {
	        image_index = 2;
	        image_xscale = climbXscale;
	    }
    
	    if climbTimer == climbInterval || climbTimer == climbInterval*2 {
	        image_index--;
	        y += 8;
	    }
    
	    if climbTimer >= climbInterval*3 {
	        climbTimer = 0;
	        climbState = 1;
	        y += 8;
	        sprite_index = sprite_climb;
	        image_index = 0;
	    }
        
	    climbTimer++;
	}

	//Saber
	if character == char_zero {
	    if global.keyActionPressed && !saber && climbState == 1 {
	        saber = true;
	        saberTimer = 0;
	        saberInit = true;
        
	        saberID = 7;
	    }
	}



}
