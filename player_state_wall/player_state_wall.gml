/// @description player_state_wall()
function player_state_wall() {

	//The player can always shoot in this state
	canShoot = true;

	//Starting
	if wallState == 0 {
	    if !saber {
	        dashTrail = false;
	        canGrav = false;
	        xspeed = 0;
	        yspeed = 0;
	        sprite_index = sprite_wall;
	        if wallTimer == 0 {
	            image_index = 0;
	            var snd;
	            if character == char_x { snd = sfx_player_wall; }
	            else if character == char_zero { snd = sfx_player_wall_zero; }
	            play_sound(snd, 0.7, false);
	        }
            
	        if wallTimer >= 10 {
	            wallState = 1;
	            wallTimer = 0;
	        }
        
	        canDoubleJump = true;
	        doubleJumping = false;
	        airDashing = false;
	        canAirDash = true;
        
	        if !canMoveLeft { image_xscale = -1; }
	        else if !canMoveRight { image_xscale = 1; }
        
	        //Reset variables for the saber if jump-slashing
	        if saber && saberID == 3 {
	            saberID = 0;
	            saber = false;
	            saberTimer = 0;
	        }
        
	        wallTimer++;
	    }
    
	    //No wall
	    if (canMoveLeft && image_xscale == -1)
	    || (canMoveRight && image_xscale == 1) {
	        state = state_normal;
	        canGrav = true;
	        dashJumping = false;
	    }
	}

	//Sliding down the wall
	else if wallState == 1 {
	    if !saber {
	        xspeed = 0;
	        sprite_index = sprite_wall;
	        image_speed = 0;
	        image_index = image_number-1;
        
	        //Create wall dust
	        if wallTimer == 1 {
	            var wallDustID = instance_create(x, y, obj_wall_dust);
	                wallDustID.image_xscale = image_xscale;
                
	            wallTimer++;
	        }
        
	        canGrav = false;
	        yspeed = min(yspeed+grav, 1);
        
	        //No wall
	        if ground
	        || ((canMoveLeft && image_xscale == -1)
	        || (canMoveRight && image_xscale == 1)) {
	            state = state_normal;
	            canGrav = true;
	            dashJumping = false;
	        }
	    }
	}
	//Coming off the wall
	else if wallState == 2 {
	    canGrav = true;
	    if wallTimer == 0 {
	        image_xscale = -image_xscale;
	        yspeed = 0;
	    }
	    sprite_index = sprite_jump;
	    image_index = 3;
	    xspeed = 1 * image_xscale;
    
	    if wallTimer >= 7
	    || ((global.keyLeft || global.keyRight) && wallTimer >= 4) {
	        wallTimer = 0;
	        wallState = 0;
	        state = state_normal;
	    }
    
	    wallTimer++;
	}
	//Wall jump
	else if wallState == 3 {
	    canGrav = true;
	    sprite_index = sprite_wall_kick;
	    if wallTimer == 0 {
	        image_index = 0;
        
	        var sparkID = instance_create(x+(16*image_xscale), y+8, obj_wall_kick_spark);
	            sparkID.image_xscale = image_xscale;
            
	        //Play sound
	        var snd;
	        if character == char_x { snd = sfx_player_wall_jump_x; }
	        else if character == char_zero { snd = sfx_player_wall_jump_zero; }
	        play_sound(snd, 0.7, false);
	    }
    
	    wallTimer++;
	    if wallTimer < wallJumpFrames {
	        if wallTimer <= 2
	            yspeed = -wallJumpSpeed;
            
	        if !dashJumping
	            xspeed = -image_xscale * walkSpeed;
	        else {
	            xspeed = -image_xscale * dashSpeed;
	            dashTrail = true;
	            dashTrailTimer = 5;
	        }
            
	        if (image_xscale == -1 && !canMoveRight)
	        || (image_xscale == 1 && !canMoveLeft)
	        || place_meeting(x, y+yspeed-1, obj_collision_solid) {
	            wallTimer = wallJumpFrames;
	            yspeed = 0;
	            xspeed = 0;
	        }
	    }
	    else {
	        state = state_normal;
	        wallTimer = 0;
	        wallState = 0;
	    }
	}

	if !saber {
	    if wallState <= 1 {
	        //Release from a wall
	        if (!canMoveLeft && !global.keyLeft)
	        || (!canMoveRight && !global.keyRight) {
	            wallTimer = 0;
	            wallState = 2;
	            dashJumping = false;
	        }
	    }
    
	    //Saber
	    if character == char_zero && wallState <= 1 {
	        if global.keyActionPressed && !saber {
	            saber = true;
	            saberTimer = 0;
	            saberInit = true;
	            saberID = 6;
	        }
	    }
    
	    player_can_wall_jump();
	}
	else {
	    player_zero_saber_wall();
	}



}
