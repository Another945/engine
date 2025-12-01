/// @description player_x_shoot_weapon_charged(weapon)
/// @param weapon
function player_x_shoot_weapon_charged(argument0) {

	switch argument0 {
	    case(0):
	        var shootID = instance_create(shootX, shootY, obj_weapon_buster_charged);
	            shootID.image_xscale = shootDir;
            
	        play_sound(sfx_player_shoot3_x,0.7,false);
        
	        shootTimer = 0;
	        shooting = true;
	        chargeShot = true;
	    break;
    
	    case(1):
	        var angle = 0;
	        repeat 16 {
	            var charged = instance_create(x, y, obj_weapon_test1_giga);
	                charged.direction = angle;
	            angle -= 360/16;
	        }
        
	        global.weapon_energy[argument0] -= global.weapon_ammo[character,argument0] * 4;
	    break;
    
	    case(2):
	        var shootID = instance_create(shootX, shootY, obj_weapon_test2);
	            shootID.image_xscale = shootDir;
	            shootID.yspeed = -2;
	        var shootID = instance_create(shootX, shootY, obj_weapon_test2);
	            shootID.image_xscale = shootDir;
	            shootID.yspeed = -1;
	        var shootID = instance_create(shootX, shootY, obj_weapon_test2);
	            shootID.image_xscale = shootDir;
	            shootID.yspeed = 1;
	        var shootID = instance_create(shootX, shootY, obj_weapon_test2);
	            shootID.image_xscale = shootDir;
	            shootID.yspeed = 2;
            
	        shootTimer = 0;
	        shooting = true;
	        chargeShot = true;
        
	        play_sound(sfx_player_shoot_x,0.7,false);
	    break;
	}

	//Decrease weapon energy (provided it's not the player's default weapon).
	if argument0 != 0 {
	    global.weapon_energy[argument0] -= global.weapon_ammo[character,argument0] * 2;
	    global.weapon_energy[argument0] = max(global.weapon_energy[argument0],0);
	}



}
