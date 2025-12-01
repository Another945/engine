/// @description player_zero_saber_climb()
function player_zero_saber_climb() {

	yspeed = 0;

	sprite_index = spr_zero_climb_saber;
	if saberInit {
	    image_xscale = climbXscale;
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
	    state = state_climb;
	    saberID = 0;
	    saber = false;
	    saberTimer = 0;
	    wallState = 1;
	    wallTimer = 0;
	}



}
