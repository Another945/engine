/// @description player_x_shooting()
function player_x_shooting() {
	//Controls Megaman X's shooting

	//Sprites
	switch sprite_index {
	    case(sprite_idle): shootPlusX = 10; shootY = y-14; break;
	    case(sprite_step): shootPlusX = 11; shootY = y-14; break;
	    case(sprite_walk): shootPlusX = 16; shootY = y-14; break;
	    case(sprite_jump): shootPlusX = 8; shootY = y-16; break;
	    case(sprite_dash):
	        if floor(image_index) >= 2 {
	            shootPlusX = 30; shootY = y-1;
	        }
	        else {
	            shootPlusX = 16; shootY = y-9;
	        }
	    break;
	    case(sprite_dash_stop):
	        if floor(image_index) <= 0 {
	            shootPlusX = 30; shootY = y-1;
	        }
	        else {
	            shootPlusX = 14; shootY = y-12;
	        }
	    break;
	    case(sprite_crouch): shootPlusX = 18; shootY = y; break;
	    case(sprite_wall): shootPlusX = 14; shootY = y-8; break;
	    case(sprite_wall_kick): shootPlusX = 14; shootY = y-8; break;
	    case(sprite_climb): shootPlusX = 16; shootY = y-8; break;
	    case(sprite_climb_start): shootPlusX = 16; shootY = y-8; break;
	    default: shootPlusX = 10; shootY = y-16; break;
	}

	if image_xscale == 1 {
	    if sprite_index != sprite_wall {
	        if state != state_climb
	            shootDir = 1;
	        else
	            shootDir = climbXscale;
	    }
	    else {
	        if floor(image_index) <= 0
	            shootDir = 1;
	        else
	            shootDir = -1;
	    }
	}
	else if image_xscale == -1 {
	    if sprite_index != sprite_wall {
	        if state != state_climb
	            shootDir = -1;
	        else
	            shootDir = climbXscale;
	    }
	    else {
	        if floor(image_index) <= 0
	            shootDir = -1;
	        else
	            shootDir = 1;
	    }
	}

	if shootDir == 1
	    shootX = bbox_right+shootPlusX;
	else if shootDir == -1
	    shootX = (bbox_left-shootPlusX)+1;

	if (global.keyActionPressed && global.weapon_energy[global.weapon] > 0)
	&& !global.keySpecial
	    player_x_shoot_weapon(global.weapon);
    
	if global.keySpecialPressed && !global.keyAction
	    player_x_shoot_weapon(0);

	if shooting {
	    if shootTimer == 0
	    && (sprite_index == sprite_idle || sprite_index == sprite_climb
	    || sprite_index == sprite_climb_start
	    || (sprite_index == sprite_crouch && chargeShot))
	        image_index = 0;
	    shootTimer++;
	    if shootTimer >= 25 {
	        shootTimer = 0;
	        shooting = false;
	        chargeShot = false;
	    }
	}



}
