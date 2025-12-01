/// @description player_zero_saber_crouch()
function player_zero_saber_crouch() {
	//The saber code for Zero's crouch slash

	xspeed = 0;
	locked = true;

	sprite_index = spr_zero_crouch_saber;
	if saberInit {
	    image_index = 0;
	    saberInit = false;
	    instance_create(x, y, obj_player_saber_mask);
	    play_sound(sfx_player_saber_zero,0.7,false);
	}

	if floor(image_index) <= 3
	    image_speed = 1;
	else
	    image_speed = 1/2;

	if image_index >= image_number-1 {
	    image_index = image_number-1;
	    saberTimer++;
	    if saberTimer >= 10 {
	        saberTimer = 0;
	        saberID = 0;
	        saber = false;
	        //locked = false;
        
	        crouchCanTimer = 0;
	        crouchCanLRkeys = true;
	    }
	}



}
