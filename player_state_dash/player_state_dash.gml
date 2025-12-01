/// @description player_state_dash()
function player_state_dash() {

	canLandSprite = false;
	landSprite = false;

	//The player can always shoot in this state
	canShoot = true;

	//Starting
	if dashState == 0 {
	    if !airDashing {
	        if dashTimer < 2 {
	            sprite_index = sprite_step;
	            image_index = floor(dashTimer);
            
	            if !dashTrail {
	                dashTrail = false;
	                if instance_exists(obj_dash_trail)
	                    with obj_dash_trail instance_destroy();
	                dashTrailTimer = 0;
	            }
	        }
	        else {
	            sprite_index = sprite_dash;
	            image_index = floor((dashTimer-2)/2);
	        }
	    }
	    else {
	        canGrav = false;
	        yspeed = 0;
	        sprite_index = sprite_dash;
	        image_index = floor(dashTimer/2);
	    }
	    xspeed = 0;
	    if dashTimer >= 6 {
	        dashState = 1;
	        xspeed = (dashSpeed * 2) * image_xscale;
	        dashTrail = true;
	        dashTrailTimer = 5;
        
	        //Play sound
	        var snd;
	        if character == char_x { snd = sfx_player_dash_x; }
	        else if character == char_zero { snd = sfx_player_dash_zero; }
	        play_sound(snd, 0.7, false);
        
	        if !airDashing {
	            var dustID = instance_create(x-(32*image_xscale),y+16,obj_dash_dust);
	                dustID.image_xscale = image_xscale;
                
	            mask_index = spr_x_short_mask;
	        }
        
	        var dustID = instance_create(x,y,obj_dash_boost);
	            dustID.image_xscale = image_xscale;
	    }
	}
	//Moving
	else if dashState == 1 {
	    if dashTimer <= 7
	        xspeed = (dashSpeed * 2) * image_xscale;
	    else if dashTimer > 7 && dashTimer <= 9
	        xspeed = (dashSpeed * 1.5) * image_xscale;
	    else
	        xspeed = dashSpeed * image_xscale;
        
	    sprite_index = sprite_dash;
	    if dashTimer mod 2 == 1 {
	        if image_index == 2
	            image_index = 3;
	        else if image_index == 3
	            image_index = 4;
	        else
	            image_index = 2;
	    }
        
	    //Stop dashing
	    if (!global.keyDash
	    && ((image_xscale == 1 && !global.keyRight)
	    || (image_xscale == -1 && !global.keyLeft)))
	    || ((!canMoveRight && image_xscale == 1)
	    || (!canMoveLeft && image_xscale == -1)) {
	        if !airDashing {
	            dashState = 3;
	            dashTimer = 0; //Reset the timer for this state
	            sprite_index = sprite_dash_stop;
	            image_index = 0;
	        }
	        else {
	            state = state_normal;
	            dashTimer = 0;
	            airDashing = false;
	            canAirDash = false;
	            canGrav = true;
	            canDoubleJump = false;
            
	            audio_stop_sound(sfx_player_dash_x);
	            audio_stop_sound(sfx_player_dash_zero);
	        }
	    }
        
	    if (!airDashing && dashTimer >= dashFrames - 10)
	    || (airDashing && dashTimer >= airDashFrames) {
	        if !airDashing {
	            if (image_xscale == 1 && !global.keyRight)
	            || (image_xscale == -1 && !global.keyLeft) {
	                dashState = 2;
	                sprite_index = sprite_dash_stop;
	                image_index = 0;
	            }
	            else {
	                dashTimer = 0;
	                dashState = 0;
	                state = state_normal
	                stepTimer = stepFrames;
	                canGrav = true;
                
	                audio_stop_sound(sfx_player_dash_x);
	                audio_stop_sound(sfx_player_dash_zero);
	            }
	            locked = false;
	        }
	        else {
	            state = state_normal;
	            dashTimer = 0;
	            airDashing = false;
	            canAirDash = false;
	            canGrav = true;
	            canDoubleJump = false;
	        }
	    }
	}
	//Halting 1
	else if dashState == 2 {
	    sprite_index = sprite_dash_stop;
	    dashTrail = false;
	    mask_index = spr_x_mask;
	    if dashTimer == (dashFrames - 10) + 1 {
	        audio_stop_sound(sfx_player_dash_x);
	        audio_stop_sound(sfx_player_dash_zero);
        
	        var snd;
	        if character == char_x { snd = sfx_player_dash_skid; }
	        else if character == char_zero { snd = sfx_player_dash_skid_zero; }
	        play_sound(snd, 0.7, false);
	    }
	    if dashTimer < dashFrames {
	        if image_xscale == 1
	            xspeed = max(xspeed-1, dashSpeed/1.25);
	        else if image_xscale == -1
	            xspeed = min(xspeed+1, -dashSpeed/1.25);
	    }
	    else {
	        if !place_meeting(x, y+2, obj_collision_ice)
	            xspeed = 0;
	        if dashTimer >= dashFrames+5 {
	            state = state_normal;
	            dashTimer = 0;
	            airDashing = false;
	            canAirDash = false;
	            locked = false;
	        }
	    }
	}
	//Halting 2
	else if dashState == 3 {
	    dashTrail = false;
	    if !place_meeting(x, y+2, obj_collision_ice)
	        xspeed = 0;
	    else {
	        if image_xscale == 1
	            xspeed = max(xspeed-1, dashSpeed/1.25);
	        else if image_xscale == -1
	            xspeed = min(xspeed+1, -dashSpeed/1.25);
	    }
        
	    sprite_index = sprite_dash_stop;
	    mask_index = spr_x_mask;
    
	    if dashTimer == 1 {
	        audio_stop_sound(sfx_player_dash_x);
	        audio_stop_sound(sfx_player_dash_zero);
        
	        var snd;
	        if character == char_x { snd = sfx_player_dash_skid; }
	        else if character == char_zero { snd = sfx_player_dash_skid_zero; }
	        play_sound(snd, 0.7, false);
	    }
        
	    if dashTimer >= 15 {
	        state = state_normal;
	        dashTimer = 0;
	        airDashing = false;
	        canAirDash = false;
	        locked = false;
	    }
	}

	dashTimer++;

	//Restart the dash
	if global.keyDashPressed && dashTimer >= 2
	&& (dashState == 2 || dashState == 3) {
	    dashTimer = 0;
	    dashState = 0;
    
	    audio_stop_sound(sfx_player_dash_x);
	    audio_stop_sound(sfx_player_dash_zero);
	}

	//Pressing in the opposite direction
	if (image_xscale == -1 && global.keyRight)
	|| (image_xscale == 1 && global.keyLeft) {
	    dashTimer = 0;
	    dashState = 0;
	    state = state_normal
	    stepTimer = stepFrames;
	    mask_index = spr_x_mask;
    
	    audio_stop_sound(sfx_player_dash_x);
	    audio_stop_sound(sfx_player_dash_zero);
    
	    if airDashing {
	        canGrav = true;
	        airDashing = false;
	        canAirDash = false;
	        canDoubleJump = false;
	    }
	}

	//Dashing off the ground
	if !ground && yspeed >= 0 && !airDashing {
	    dashTimer = 0;
	    dashState = 0;
	    state = state_normal
	    stepTimer = stepFrames;
	    image_index = 0;
	    canAirDash = false;
	    airDashing = false;
	    mask_index = spr_x_mask;
    
	    canGrav = true;
    
	    audio_stop_sound(sfx_player_dash_x);
	    audio_stop_sound(sfx_player_dash_zero);
    
	    //In the 32-bit games, the player doesn't go into a dash-jump
	    //when falling off the ground, unlike the 16-bit games.
	    //You can change the variable below to "true" if you want the
	    //16-bit games' functionality.
	    dashJumping = false;
    
	    canDoubleJump = false;
	}

	//Saber-dash
	if global.keyActionPressed && character == char_zero {
	    dashState = 0;
	    dashTimer = 0;
	    state = state_normal;
	    saber = true;
	    if !airDashing {
	        saberID = 0;
	        locked = true;
	    }
	    else {
	        saberID = 3;
	        canGrav = true;
	        airDashing = false;
	        canAirDash = false;
	        canDoubleJump = false;
	    }
	    saberInit = true;
	    saberTimer = 0;
    
	    audio_stop_sound(sfx_player_dash_x);
	    audio_stop_sound(sfx_player_dash_zero);
	}

	//Allow the player to jump
	player_can_jump();



}
