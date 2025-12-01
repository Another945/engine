/// @description player_x_shoot_weapon()
function player_x_shoot_weapon(argument0) {

	chargeShot = false;
	chargeTimer = 0;
	chargeIndex = 0;

	switch argument0 {
	    //Mega Buster
	    case(0):
	        if instance_number(obj_weapon_buster) < 3
	        && !instance_exists(obj_weapon_buster_half_charged)
	        && !instance_exists(obj_weapon_buster_charged) {
	            var shootID = instance_create(shootX, shootY, obj_weapon_buster);
	                shootID.image_xscale = shootDir;
                
	            shootTimer = 0;
	            shooting = true;
            
	            play_sound(sfx_player_shoot_x,0.7,false);
	        }
	    break;
    
	    //Test 1
	    case(1):
	        if instance_number(obj_weapon_test1) < 4 {
	            var shootID = instance_create(shootX, shootY, obj_weapon_test1);
                
	            shootDir = image_xscale;
	            if shootDir == 1 {
	                switch weapon_test1_dir {
	                    case(0): shootID.direction = angle_right; break;
	                    case(1): shootID.direction = angle_right+20; break;
	                    case(2): shootID.direction = angle_right; break;
	                    case(3): shootID.direction = angle_right-20; break;
	                }
	            }
	            else if shootDir == -1 {
	                switch weapon_test1_dir {
	                    case(0): shootID.direction = angle_left; break;
	                    case(1): shootID.direction = angle_left-20; break;
	                    case(2): shootID.direction = angle_left; break;
	                    case(3): shootID.direction = angle_left+20; break;
	                }
	            }
            
	            if weapon_test1_dir < 3
	                weapon_test1_dir++;
	            else
	                weapon_test1_dir = 0;
                
	            shootTimer = 0;
	            shooting = true;
            
	            play_sound(sfx_player_shoot_x,0.7,false);
	        }
	    break;
    
	    //Test 2
	    case(2):
	        if instance_number(obj_weapon_test2) < 6 {
	            var shootID = instance_create(shootX, shootY, obj_weapon_test2);
	                shootID.image_xscale = shootDir;
	                shootID.yspeed = -2;
	            var shootID = instance_create(shootX, shootY, obj_weapon_test2);
	                shootID.image_xscale = shootDir;
	                shootID.yspeed = 2;
                
	            shootTimer = 0;
	            shooting = true;
            
	            play_sound(sfx_player_shoot_x,0.7,false);
	        }
	    break;
	}

	//Decrease weapon energy (provided it's not the player's default weapon).
	if argument0 != 0 {
	    global.weapon_energy[argument0] -= global.weapon_ammo[character,argument0];
	    global.weapon_energy[argument0] = max(global.weapon_energy[argument0],0);
	}



}
