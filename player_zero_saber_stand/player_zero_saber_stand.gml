/// @description player_zero_saber_stand()
function player_zero_saber_stand() {
	//The saber code for Zero's standing slashes

	if place_meeting(x, y+2, obj_collision_ice) && ground {
	    if xspeed > 0
	        xspeed = max(xspeed-iceDec,0);
	    else if xspeed < 0
	        xspeed = min(xspeed+iceDec,0);
	}
	else
	    xspeed = 0;

	locked = true;

	switch saberID {
	    case(0): sprite_index = spr_zero_stand_saber_1; break;
	    case(1): sprite_index = spr_zero_stand_saber_2; break;
	    case(2): sprite_index = spr_zero_stand_saber_3; break;
	}
	if saberInit {
	    image_index = 0;
	    saberInit = false;
    
	    var mySaber = instance_create(x, y, obj_player_saber_mask);
	    if saberID == 2
	        mySaber.defaultDamage = 3 * (1+global.armor[armor_black]);
        
	    play_sound(sfx_player_saber_zero,0.7,false);
	}

	if saberID != 2 {
	    if floor(image_index) <= 2
	        image_speed = 1;
	    else
	        image_speed = 1/2;
	}
	else {
	    if floor(image_index) == 0
	        image_speed = 1;
	    else {
	        if floor(image_index) == 3
	            image_speed = 1/3;
	        else
	            image_speed = 1/2;
	    }
	}

	if image_index >= image_number-1 {
	    image_index = image_number-1;
	    saberTimer++;
	    if saberTimer >= 10 {
	        saberTimer = 0;
	        saberID = 0;
	        saber = false;
	        locked = false;
	        saberEnd = true;
	    }
	}

	//Saber again
	if image_index >= image_number-3 {
	    if (global.keyActionPressed || (image_xscale == 1 && global.keyLeftPressed)
	    || (image_xscale == -1 && global.keyRightPressed))
	    && saberID < 2 {
	        saberInit = true;
	        saberTimer = 0;
	        saberID++;
	        if instance_exists(obj_player_saber_mask)
	            with obj_player_saber_mask instance_destroy();
            
	        if (image_xscale == 1 && global.keyLeftPressed)
	        || (image_xscale == -1 && global.keyRightPressed) {
	            image_xscale = -image_xscale;
	        }
	    }
	}



}
