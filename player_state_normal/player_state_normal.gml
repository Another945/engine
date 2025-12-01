/// @description player_state_normal()
function player_state_normal() {

	//The player can always shoot in this state
	canShoot = true;

	//Used to allow the player to duck whilst holding left or right.
	//Usually this can't be done, unless landing from the ground or
	//coming out from a dash.
	crouchCanTimer = min(crouchCanTimer+1, 2);
	crouchCanLRkeys = (crouchCanTimer < 2) || crouching; //If the player is already crouching, set it as true.

	if global.keyRight && canMoveRight && !locked {
	    if image_xscale == -1
	        stepDashTimer = 0;
	    image_xscale = 1;
    
	    if stepDashTimer <= 0
	        stepDashTimer = stepDashFrames;
            
	    if ground {
	        if stepTimer < stepFrames {
	            xspeed = 0;
	            if stepTimer == 0
	                xspeed = stepSpeed;
	            if !saber {
	                sprite_index = sprite_step;
	                image_index = (stepTimer > stepFrames/2); //This will return either a 0 if the timer is below half the step frames, 1 if above.
	            }
	            stepTimer++;
	        }
	        else {
	            xspeed = walkSpeed;
	            //Reset the sprite animation
	            if !saber {
	                sprite_index = sprite_walk;
	                if stepTimer == stepFrames {
	                    image_index = 1;
	                    stepTimer++; //Add to the timer so the animation won't reset constantly.
	                }
	            }
	        }
	    }
	    else {
	        stepTimer = stepFrames;
	        if !dashJumping
	            xspeed = walkSpeed;
	        else {
	            xspeed = dashSpeed;
	            canAirDash = false;
	        }
            
	        if (!doubleJumping || yspeed > 0) && !saber
	            sprite_index = sprite_jump;
	    }
	}
	else if global.keyLeft && canMoveLeft && !locked {
	    if image_xscale == 1
	        stepDashTimer = 0;
	    image_xscale = -1;
    
	    if stepDashTimer <= 0
	        stepDashTimer = stepDashFrames;
    
	    if ground {
	        if stepTimer < stepFrames {
	            xspeed = 0;
	            if stepTimer == 0
	                xspeed = -stepSpeed;
	            if !saber {
	                sprite_index = sprite_step;
	                image_index = (stepTimer > stepFrames/2); //This will return either a 0 if the timer is below half the step frames, 1 if above.
	            }
	            stepTimer++;
	        }
	        else {
	            xspeed = -walkSpeed;
	            //Reset the sprite animation
	            if !saber {
	                sprite_index = sprite_walk;
	                if stepTimer == stepFrames {
	                    image_index = 1;
	                    stepTimer++; //Add to the timer so the animation won't reset constantly.
	                }
	            }
	        }
	    }
	    else {
	        stepTimer = stepFrames;
	        if !dashJumping
	            xspeed = -walkSpeed;
	        else {
	            xspeed = -dashSpeed;
	            canAirDash = false;
	        }
            
	        if (!doubleJumping || yspeed > 0) && !saber
	            sprite_index = sprite_jump;
	    }
	}
	else {
	    stepDashTimer = max(stepDashTimer-1, 0);
	    if ground {
	        if !saber {
	            if !crouching {
	                if !landSprite {
	                    if saberEnd
	                        sprite_index = spr_zero_stand_saber_end;
	                    else
	                        sprite_index = sprite_idle;
	                }
	                else
	                    sprite_index = sprite_land;
                    
	                if stepTimer != 0 {
	                    image_index = 0;
	                    stepTimer = 0;
	                }
	            }
	            else {
	                var frames = 2; //originally 4
	                sprite_index = sprite_crouch;
	                if !chargeShot
	                    image_index = (crouchTimer > frames-1);
	                saberEnd = false;
                
	                //Crouching
	                if global.keyDown || saber //(Keep the player crouched when doing a duck-saber.
	                    crouchTimer = min(crouchTimer+1,frames);
	                else {
	                    crouchTimer--;
	                    if crouchTimer <= 0 {
	                        crouchTimer = 0;
	                        crouching = false;
	                        locked = false //Unlock the player
	                    }
	                }
	            }
	        }
	        //Zero's Saber moves for standing and ducking.
	        else {
	            if saberID >= 0 && saberID <= 2
	                player_zero_saber_stand();
	            if saberID == 5
	                player_zero_saber_crouch();
	        }
	    }
	    else {
	        if (!doubleJumping || yspeed > 0) && !saber
	            sprite_index = sprite_jump;
	        stepTimer = 0;
	    }
    
	    //If on ice, decelerate. Otherwize, just stop.
	    if place_meeting(x, y+2, obj_collision_ice) && ground {
	        if xspeed > 0
	            xspeed = max(xspeed-iceDec,0);
	        else if xspeed < 0
	            xspeed = min(xspeed+iceDec,0);
	    }
	    else
	        xspeed = 0;
	}

	//Manage land sprite
	if !ground {
	    canLandSprite = true;
	    landSprite = false;
	    canLandSound = true;
    
	    saberEnd = false;
    
	    crouchCanLRkeys = true;
	    crouchCanTimer = 0;
	}

	if ground {
	    dashJumping = false;
	    canAirDash = true;
	    canAirJump = true;
	    airDashing = false;
	    doubleJumping = false;
    
	    //Play landing sound
	    if canLandSound {
	        var snd;
	        if character == char_x { snd = sfx_player_land_x; }
	        else if character == char_zero { snd = sfx_player_land_zero; }
	        play_sound(snd, 0.7, false);
        
	        canLandSound = false;
	    }
    
	    if xspeed == 0 {
	        if !saber {
	            if canLandSprite {
	                landSprite = true;
	                canLandSprite = false;
	                sprite_index = sprite_land;
	                image_index = 0;
	            }
	        }
	        else {
	            //Don't do the landing sprite if doing an air saber
	            landSprite = false;
	            canLandSprite = false;
	        }
	    }
	    else {
	        //Don't do the landing sprite if moving
	        landSprite = false;
	        canLandSprite = false;
        
	        saberEnd = false;
	    }
	}

	//Air saber
	if saber && (saberID == 3 || saberID == 4) {
	    player_zero_saber_jump();
	}

	//Jump
	if (ground && !saber) || (!ground)
	    player_can_jump();

	//Cancel jump
	if !global.keyJump && !ground && yspeed < 0 && canMinJump {
	    yspeed = 0;
	}

	//Dash
	if (global.keyDashPressed && (ground || (!ground && canAirDash))
	&& (!saber || saberID <= 2))
	|| (((global.keyRightPressed && image_xscale == 1) || (global.keyLeftPressed && image_xscale == -1))
	&& (stepDashTimer > 0 && stepDashTimer < stepDashFrames && (ground || (!ground && canAirDash)))) {
	    state = state_dash;
	    if !crouching {
	        dashTimer = 0;
	        dashState = 0;
	    }
	    else {
	        dashTimer = 6;
	        dashState = 0;
	    }
    
	    locked = false;
    
	    airDashing = !ground;
    
	    stepDashTimer = 0;
        
	    saber = false;
	    saberID = 0;
	    saberTimer = 0;
	    locked = false;
    
	    crouchCanLRkeys = true;
	    crouchCanTimer = 0;
	}

	//Wall
	if !ground && yspeed >= -jumpSpeed/1.75 && !noWallBox {
	    if (!canMoveLeft && global.keyLeft)
	    || (!canMoveRight && global.keyRight) {
	        state = state_wall;
	        wallTimer = 0;
	        wallState = 0;
	        xspeed = 0;
	        yspeed = 0;
        
	        //Reset saber variables.
	        saber = false;
	        saberID = 0;
	        saberTimer = 0;
	    }
	}
	player_can_wall_jump();

	//Allow climbing on a ladder
	if !locked
	    player_can_climb();

	//Crouch / Go down a ladder
	if ground && !crouching && !saber {
	    if global.keyDown {
	        if !(instance_place(x, y+yspeed+2, obj_collision_ladder)
	        && !place_meeting(x, y+yspeed+1, obj_collision_solid)) {
	            if (!global.keyRight && !global.keyLeft)
	            || crouchCanLRkeys {
	                crouching = true;
	                crouchTimer = 0;
	                locked = true;
	            }
	        }
	        else {
	            climbXscale = image_xscale;
	            state = state_climb;
	            climbState = 3;
	            climbTimer = 0;
	            dashTrail = false;
	        }
	    }
	}

	//Changing facing direction when crouching
	if crouching {
	    var face = global.keyRight - global.keyLeft;
	    if face != 0 && !saber
	        image_xscale = face;
	}

	//Mask/Hitbox
	if !crouching
	    mask_index = spr_x_mask;
	else
	    mask_index = spr_x_short_mask;

	//Saber
	if character == char_zero {
	    if global.keyActionPressed && !saber && !saberEnd {
	        saber = true;
	        saberTimer = 0;
	        saberInit = true;
        
	        //In a situation like this, you could write (if global.weapon_unlocked[x] && global.keyUp)
	        //or something like that to make Zero do a technique.
        
	        /*
	        if trying to do a saber technique {
	            enter code to set the saberID or state
	        }
	        else if trying to do another saber technique {
	            enter code to set the saberID or state
	        }
	        else {*/
	            if ground {
	                locked = true;
	                if !crouching
	                    saberID = 0; //Normal stand slashes
	                else
	                    saberID = 5; //Crouch slash
	            }
	            else {
	                if !doubleJumping
	                    saberID = 3; //Normal jump slash
	                else
	                    saberID = 4; //Spin jump slash
	            }
	        //}
	    }
	}

	//Zero's Giga Attack!!
	var gigaWeapon = 1;
	if character == char_zero && ground && global.weapon_unlocked[gigaWeapon] {
	    if (global.keySpecialPressed && global.weapon == gigaWeapon)
	    || global.keyGigaPressed {
	        if global.weapon_ammo[gigaWeapon] > 0 {
	            state = state_zero_giga;
	            weapon_test1_giga = false;
	            global.weapon = 2;
	            image_index = 0;
	        }
	    }
	}



}
