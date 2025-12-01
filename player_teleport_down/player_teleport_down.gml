/// @description player_teleport_down()
function player_teleport_down() {

	sprite_index = sprite_teleport_in;
	if teleportY < y {
	    teleportY = min(teleportY+8, y);
	    image_index = 0;
	    image_speed = 0;
	}
	else {
	    if image_index == 0 {
	        var snd;
	        if global.character == char_x { play_sound(sfx_player_teleport_in_x,0.7,false); }
	        else if global.character == char_zero { play_sound(sfx_player_teleport_in_zero,0.7,false); }
	    }
    
	    if sprite_index == spr_x_teleport_in {
	        if floor(image_index) < image_number/1.5
	            image_speed = 1/3;
	        else {
	            if floor(image_index) == 14
	                image_speed = 1;
	            else
	                image_speed = 1/5;
	        }
	    }
	    else {
	        if floor(image_index) < 11
	            image_speed = 1/2;
	        else {
	            if floor(image_index) == 11
	                image_speed = 1/16;
	            else
	                image_speed = 1/5;
	        }
	    }
    
	    if image_index > image_number-1 {
	        image_index = image_number-1;
	        teleportTimer++
	        if teleportTimer >= 30 {
	            sprite_index = sprite_idle;
	            image_index = 0;
	            teleportTimer = 0;
	            function_state = 1;
	        }
	    }
	}



}
