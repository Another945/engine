/// @description player_zero_saber_wall()
function player_zero_saber_wall() {

	if (image_xscale == -1 && canMoveLeft)
	|| (image_xscale == 1 && canMoveRight)
	|| ground {
	    saberID = 0;
	    saber = false;
	    saberTimer = 0;
	    locked = false; //Ensure the player isn't locked.
	    state = state_normal;
	    canGrav = true; //Turn on gravity
	}

	yspeed = 1;

	sprite_index = spr_zero_wall_saber;
	if saberInit {
	    image_index = 0;
	    saberInit = false;
	    instance_create(x, y, obj_player_saber_mask);
	    play_sound(sfx_player_saber_zero,0.7,false);
	}
	if floor(image_index) <= 3
	    image_speed = 1;
	else {
	    if floor(image_index) == 7
	        image_speed = 1/24;
	    else
	        image_speed = 1/2;
	}

	if image_index >= image_number-1 {
	    state = state_wall;
	    saberID = 0;
	    saber = false;
	    saberTimer = 0;
	    wallState = 1;
	    wallTimer = 0;
	}



}
