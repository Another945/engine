/// @description sprite_set_x()
function sprite_set_x() {

	//Armor sprites

	if !shooting {
	    player_sprites_x();
	}
	else {
	    if !chargeShot {
	        sprite_idle = spr_x_stand_shoot;
	    }
	    else {
	        sprite_idle = spr_x_stand_shoot_charged;
	    }
        
	    sprite_step = spr_x_step_shoot;
    
	    sprite_walk = spr_x_walk_shoot;
	    sprite_jump = spr_x_jump_shoot;
	    sprite_jump_double = sprite_jump;
	    sprite_land = spr_x_land_shoot;
	    if !chargeShot
	        sprite_crouch = spr_x_crouch_shoot;
	    else
	        sprite_crouch = spr_x_crouch_shoot_charged;
	    sprite_dash = spr_x_dash_shoot;
	    sprite_dash_stop = spr_x_dash_stop_shoot;
    
	    sprite_wall = spr_x_wall_shoot;
	    sprite_wall_kick = spr_x_wall_kick_shoot;
    
	    sprite_climb = spr_x_climb_shoot;
	    sprite_climb_start = spr_x_climb_shoot;
	}



}
