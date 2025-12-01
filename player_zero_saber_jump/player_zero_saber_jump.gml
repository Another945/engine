/// @description player_zero_saber_jump()
function player_zero_saber_jump() {
	//Zero's air saber attack.

	canGrav = true;
	canLandSprite = false;
	landSprite = false;
	canLandSound = false;

	//Normal jump slash
	if saberID == 3 {
	    if saberInit {
	        image_index = 0;
	        dashTrail = false;
	        if instance_exists(obj_dash_trail)
	            with obj_dash_trail instance_destroy();
	        saberInit = false;
	        instance_create(x, y, obj_player_saber_mask);
	        play_sound(sfx_player_saber_zero,0.7,false);
	    }
    
	    if floor(image_index) != 7 {
	        if floor(image_index) <= 3
	            image_speed = 1/2;
	        else
	            image_speed = 1/3;
	    }
	    else
	        image_speed = 1/4;
        
	    if ground {
	        locked = true;
	        if place_meeting(x, y+2, obj_collision_ice) && ground {
	            if xspeed > 0
	                xspeed = max(xspeed-iceDec,0);
	            else if xspeed < 0
	                xspeed = min(xspeed+iceDec,0);
	        }
	        else
	            xspeed = 0;
	        sprite_index = spr_zero_jump_saber_ground;
	    }
	    else {
	        locked = false;
	        sprite_index = spr_zero_jump_saber;
	    }
    
	    if image_index >= image_number-1 {
	        image_index = image_number-1;
	        saberTimer++;
	        if saberTimer >= 2 {
	            saberTimer = 0;
	            saberID = 0;
	            saber = false;
	            locked = false;
            
	            if ground
	                saberEnd = true;
	        }
	    }
	}
	//Spin jump slash
	else if saberID == 4 {
	    locked = false;
	    sprite_index = spr_zero_jump_saber_spin;
    
	    if saberInit {
	        image_index = 0;
	        dashTrail = false;
	        if instance_exists(obj_dash_trail)
	            with obj_dash_trail instance_destroy();
	        saberInit = false;
	        instance_create(x, y, obj_player_saber_mask);
	        play_sound(sfx_player_saber_zero,0.7,false);
	    }
    
	    image_speed = 1/3;
    
	    //Finish when either the animation is done or the player hits the ground.
	    if image_index >= image_number-1 || ground {
	        saberTimer = 0;
	        saberID = 0;
	        saber = false;
	        locked = false;
        
	        sprite_index = sprite_jump;
	    }
	}



}
