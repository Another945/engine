/// @description sprite_animations_zero()
function sprite_animations_zero() {

	//Standing animation
	if sprite_index == sprite_idle
	    image_speed = 1/12;
    
	if sprite_index == spr_zero_stand_saber_end {
	    if floor(image_index) <= 1
	        image_speed = 1/4;
	    else
	        image_speed = 1/7;
	    if image_index >= image_number-1 {
	        sprite_index = sprite_idle;
	        image_index = 0;
	        saberEnd = false;
	    }
	}

	//Stepping animation
	if sprite_index == sprite_step
	    image_speed = 0;
    
	//Walking animation
	if sprite_index == sprite_walk {
	    if floor(image_index) == 5 || floor(image_index) == 6
	    || floor(image_index) == 13 || floor(image_index) == 14
	        image_speed = 1/3;
	    else if floor(image_index) == 3 || floor(image_index) == 10
	        image_speed = 1/4;
	    else
	        image_speed = 1/2;
	}

	//Climbing animation
	if sprite_index == sprite_climb
	    image_speed = (1/4) * -sign(yspeed);

	if sprite_index == sprite_climb_getup
	    image_speed = 0;
    
	//Crouching animation
	if sprite_index == sprite_crouch
	    image_speed = 0;

	//Jumping animation
	if sprite_index == sprite_jump {
	    if yspeed < 0 {
	        image_speed = 0.2;
	        if image_index > 3
	            image_index = 1;
	    }
	    else {
	        if image_index <= 3
	            image_index = 4;
            
	        if fallAnim && image_index > 4 {
	            image_index = 4;
	            fallAnim = false;
	        }
            
	        image_speed = 0.275;
	        if image_index >= image_number-1
	            image_index = image_number-4;
	    }
	}
	else
	    fallAnim = true;

	if sprite_index == sprite_jump_double {
	    image_speed = 1/3;
	    if image_index >= image_number-1 || yspeed >= 0 {
	        sprite_index = sprite_jump;
	        image_index = 5;
	    }
	}

	//Landing animation
	if sprite_index == sprite_land {
	    if floor(image_index) <= 1
	        image_speed = 1/5;
	    else {
	        image_speed = 1/2;
	        if image_index > image_number-1 {
	            sprite_index = sprite_idle;
	            image_index = 0;
	            landSprite = false;
	        }
	    }
	}

	//Dashing animation
	if sprite_index == sprite_dash
	    image_speed = 0;

	//Dash-stopping animation
	if sprite_index == sprite_dash_stop {
	    if floor(image_index) <= 1
	        image_speed = 1;
	    else if floor(image_index) == 2
	        image_speed = 1/8;
	    else
	        image_speed = 0;
	}

	//Wall animation
	if sprite_index == sprite_wall {
	    image_speed = 1/3;
	    if image_index >= image_number-1
	        image_index = image_number-1;
	}

	//Wall kick animation
	if sprite_index == sprite_wall_kick {
	    if floor(image_index) <= 1
	        image_speed = 1/2;
	    else {
	        image_speed = 1/3;
	        if image_index >= image_number-1
	            sprite_index = sprite_jump;
	    }
	}

	//Hurt animations
	if sprite_index == sprite_hurt[0]
	|| sprite_index == sprite_hurt[1] {
	    image_speed = 1/2;
	}

	//Giga attack animation
	if sprite_index == spr_zero_giga_attack {
	    if floor(image_index) <= 1
	        image_speed = 1/8;
	    else {
	        if floor(image_index) < image_number-2
	            image_speed = 1/3;
	        else
	            image_speed = 1/5;
            
	        if image_index > image_number-1 {
	            image_index = image_number-1;
	        }
	    }
	}



}
