function player_x_charge() {
	//Charging
	if (global.keyAction && global.weapon_canCharge[global.weapon])
	|| global.keySpecial {
	    chargeTimer++;
    
	    if global.keyAction && global.weapon != 0
	        chargeDefault = false;
    
	    if chargeTimer >= chargeFrames[0] {
	        if chargeTimer == chargeFrames[0] {
	            play_sound(sfx_player_charge_x,0.7,false);
            
	            //if global.keyAction && global.weapon != 0
	            //    chargeDefault = false;
	        }
        
	        //If the buster armor hasn't been unlocked, don't let the charge timer
	        //go past the last amount of charge frames.
	        if !global.armor[armor_buster] {
	            if chargeTimer >= chargeFrames[2]-6
	                chargeTimer -= 6;
	        }
        
	        //Animate
	        if floor(chargeIndex) < 6
	            chargeIndex += 1/3;
	        else
	            chargeIndex += 1/4;
            
	        if chargeTimer >= chargeFrames[1]
	            chargeIndex += 0.15;
	        if chargeTimer >= chargeFrames[2]
	            chargeIndex += 0.15;
            
	        //Reset animation
	        if chargeIndex > 8
	            chargeIndex = 0;
	    }
	}

	//Charge release (X-Buster)
	if chargeDefault {
	    if !global.keyAction && !global.keySpecial {
	        if (!global.frozen && function_state == 1)
	        && state != state_hurt {
	            //Small Shot
	            if chargeTimer >= chargeFrames[0] && chargeTimer < chargeFrames[1] {
	                var shootID = instance_create(shootX, shootY, obj_weapon_buster_half_charged);
	                    shootID.image_xscale = shootDir;
                    
	                play_sound(sfx_player_shoot2_x,0.7,false);
                    
	                shootTimer = 0;
	                shooting = true;
	            } 
	            else if chargeTimer >= chargeFrames[1] && chargeTimer < chargeFrames[2] {
	                player_x_shoot_weapon_charged(0);
	            } 
	            else if chargeTimer >= chargeFrames[2] {
	                var shootID = instance_create(shootX, shootY, obj_weapon_buster_charged);
	                    shootID.image_xscale = shootDir;
                    
	                play_sound(sfx_player_shoot3_x,0.7,false);
                
	                shootTimer = 0;
	                shooting = true;
	                chargeShot = true;
	            }
	        }
        
	        audio_stop_sound(sfx_player_charge_x);
	        chargeTimer = 0;
	        chargeIndex = 0;
        
	        chargeDefault = true;
	    }
	}
	//Charge weapon
	else {
	    if !global.keyAction {
	        if (!global.frozen && function_state == 1)
	        && state != state_hurt
	        && global.weapon_canCharge[global.weapon] {
	            if chargeTimer >= chargeFrames[0] && chargeTimer < chargeFrames[1] {
	                player_x_shoot_weapon(global.weapon);
	            }
	            else if chargeTimer >= chargeFrames[1] {
	                player_x_shoot_weapon_charged(global.weapon);
	            }
	        }
        
	        audio_stop_sound(sfx_player_charge_x);
	        chargeTimer = 0;
	        chargeIndex = 0;
        
	        chargeDefault = true;
	    }
	}

	//Bug fix - If the player is in the middle of charging when they switch to a non-chargable
	//          weapon, reset the charge variables.
	if global.keyAction && !global.weapon_canCharge[global.weapon] && chargeTimer > 0 {
	    audio_stop_sound(sfx_player_charge_x);
	    chargeTimer = 0;
	    chargeIndex = 0;
	}



}
