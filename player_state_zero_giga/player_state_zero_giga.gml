/// @description player_state_zero_giga()
function player_state_zero_giga() {

	sprite_index = spr_zero_giga_attack;

	xspeed = 0;
	yspeed = 0;

	//Attack
	if floor(image_index) == 6 && !weapon_test1_giga {
	    var angle = 180;
	    repeat 9 {
	        var giga = instance_create(x, y, obj_weapon_test1_giga);
	            giga.direction = angle;
	        angle -= 180/8;
	    }
    
	    global.weapon_energy[global.weapon] -= global.weapon_ammo[character,global.weapon];
    
	    weapon_test1_giga = true;
	}

	//Finish
	if image_index > image_number-1 {
	    sprite_index = sprite_idle;
	    weapon_test1_giga = false;
	    if state == state_zero_giga
	        state = state_normal;
	}



}
