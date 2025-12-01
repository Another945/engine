/// @description player_can_jump()
function player_can_jump() {

	if global.keyJumpPressed {
	    if ground {
	        mask_index = spr_x_mask;
        
	        ground = false;
	        yspeed = -jumpSpeed;
	        y--; //A common thing done in a lot of Megaman fan games to make sure the player gets off the ground.
	        sprite_index = sprite_jump;
	        image_index = 0;
        
	        //Play sound
	        var snd;
	        if character == char_x { snd = sfx_player_jump_x; }
	        else if character == char_zero { snd = sfx_player_jump_zero; }
	        play_sound(snd, 0.7, false);
        
	        crouching = false;
	        crouchTimer = 0;
        
	        canGrav = true; //We don't want the player shooting into the air and never returning.
        
	        locked = false;
        
	        if (state == state_dash && dashState <= 1) || global.keyDash {
	            state = state_normal;
	            dashTimer = 0;
	            dashState = 0;
            
	            canAirDash = false;
            
	            dashJumping = true;
	            if !dashTrail {
	                dashTrailTimer = 5;
	                dashTrail = true;
	            }
	        }
	        else {
	            state = state_normal;
	            dashTimer = 0;
	            dashState = 0;
            
	            dashJumping = false;
	        }
        
	        canDoubleJump = true; //Allow the player to double jump, provided that character can double jump.
	    }
	    else {
	        //If the player is allowed to double jump...
	        if ability_doubleJump {
	            if canDoubleJump && !dashJumping && state != state_dash
	            //Don't let the player double jump if they are at a wall. They should wall kick instead.
	            && (canMoveRight && canMoveLeft) {
	                yspeed = -jumpSpeed;
	                sprite_index = sprite_jump_double;
	                image_index = 0;
	                canDoubleJump = false;
	                doubleJumping = true;
	                canAirDash = false; //Don't allow air dashing after double jumping
                
	                //Stop saber
	                saber = false;
	                saberID = 0;
	                saberTimer = 0;
	                saberInit = true;
	            }
	        }
	    }
	}



}
