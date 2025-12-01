/// @description Logic

//Set death checker box
/*
if the deathBox overlaps with solid collision, the player will die.
This is essentially my attempt to have a stuck-in-collision death,
which usually occurs when the player stops dashing or crouching under
a solid.
*/
deathBox = collision_rectangle(bbox_left+1+abs(xspeed), bbox_top+1+abs(yspeed), bbox_right-(1+abs(xspeed)), bbox_bottom-(1+abs(xspeed)), obj_collision_solid, 0, 1);

if deathBox {
    global.healthpoints = 0;
    var die = instance_create(x, y, obj_player_die);
        die.sprite_index = sprite_hurt[0];
        die.image_xscale = image_xscale;
    instance_destroy();
}

noWallBox = collision_rectangle(bbox_left-(4+abs(xspeed)), bbox_top-(4+abs(yspeed)), bbox_right+(4+abs(xspeed)), bbox_bottom+(4+abs(xspeed)), obj_collision_solid_no_wall, 0, 1);

//A collision box we use for ladders. Typically the area where
//the player gets up from a ladder.
noLadder = !collision_rectangle(bbox_left,y,bbox_right,bbox_top,obj_collision_ladder,0,1);

if !global.frozen && !global.frozen_player {

    //Starting
    if function_state == 0 {
        beginTimer++;
        if beginTimer == 45 {
            instance_create(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2),__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2),obj_ready);
        }
        
        if beginTimer >= 150 {
            player_teleport_down();
        }
    }
    
    //Player control
    else if function_state == 1 {
        player_physics(); //Use physics for this function state
        
        if state == state_hurt {
            player_state_hurt();
        }
        
        else if state == state_normal {
            player_state_normal();
        }
        
        else if state == state_dash {
            player_state_dash();
        }
        
        else if state == state_wall {
            player_state_wall();
        }
        
        else if state == state_climb {
            player_state_climb();
        }
        
        else if state == state_zero_giga {
            player_state_zero_giga();
        }
        
        //Allow X to shoot.
        if character == char_x && state != state_hurt {
            if canShoot
                player_x_shooting();
        }
    }
    
    //CPU control
    else if function_state == 2 {
        player_physics(); //Use physics for this function state
        
        //Set correct sprites
        if !ground
            sprite_index = sprite_jump;
        else
            sprite_index = sprite_idle;
            
        if ground && teleportOut {
            var i = instance_create(x, y, obj_player_teleport_out);
                i.myroom = global.myRoom;
                i.sprite_index = sprite_teleport_out;
            instance_destroy();
        }
    }
    
    //CPU control (no physics or auto-sprite change)
    else if function_state == 3 {
    
    }
    
    //Victory animation
    else if function_state == 4 {
        if victoryTimer == 0 {
            image_index = 0;
            victoryTimer = 1;
        }
        sprite_index = sprite_victory;
        if sprite_index == spr_x_victory {
            if floor(image_index) == 0 || floor(image_index) == 2
                image_speed = 1/2;
            else
                image_speed = 1/10;
        }
        else {
            image_speed = 1/2;
        }
        if image_index >= image_number-1 {
            image_index = image_number-1;
            if victoryTimer == 1 {
                play_sound(sfx_victory,0.7,false);
                victoryTimer = 2;
            }
        }
    }
    
    //Reset some stuff in not in function state 1
    if function_state > 1 {
        saberTimer = 0;
        saber = false;
        saberID = 0;
        
        landSprite = false;
        canLandSprite = false;
        canLandSound = false;
        
        shootTimer = 0;
        shooting = false;
    }
    
    //Reset victory timer
    if function_state != 4
        victoryTimer = 0;
    
    //If not in the normal state, reset the crouch-related variables.
    if state != state_normal {
        crouching = false;
        crouchTimer = 0;
        crouchCanTimer = 0;
        crouchCanLRkeys = true;
    }
    
    //Load animations
    switch global.character {
        case(char_x): sprite_animations_x(); sprite_set_x(); break;
        case(char_zero): sprite_animations_zero(); break;
    }
    
    //Dash effects
    player_dash_trail();
    
    //Die to spikes
    if canDie {
        spikeBox = collision_rectangle(bbox_left-(1+abs(xspeed)), bbox_top-(1+abs(yspeed)), bbox_right+(1+abs(xspeed)), bbox_bottom+(1+abs(xspeed)), obj_collision_spike, 0, 1);
        if (spikeBox && global.difficulty != diff_easy) || global.healthpoints <= 0
        || y >= __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+32 {
            global.healthpoints = 0;
            with instance_create(x, y, obj_player_die) {
                sprite_index = other.sprite_hurt[0];
                image_xscale = other.image_xscale;
            }
            instance_destroy();
        }
        
        if spikeBox && !recovering && global.difficulty == diff_easy {
            player_get_hit(14, 1);
        }
    }
    
    //Recovery/invincibility
    if recovering && state != state_hurt {
        recoveryTimer--;
        if recoveryTimer <= 0 {
            recovering = false;
            recoveryTimer = 0;
        }
    }
    
    //X's weapon switching
    if character == char_x && function_state == 1 {
        if global.keyWeaponSwitchRightPressed {
            var looped = false;
            
            while !global.weapon_unlocked[global.weapon] || !looped {
                global.weapon++;
                if global.weapon > global.maxWeapons-1
                    global.weapon = 0;
                    
                looped = true;
            }
            
            play_sound(sfx_menu_move_2, 0.7, false);
        }
        
        if global.keyWeaponSwitchLeftPressed {
            var looped = false;
            
            while !global.weapon_unlocked[global.weapon] || !looped {
                global.weapon--;
                if global.weapon < 0
                    global.weapon = global.maxWeapons-1;
                    
                looped = true;
            }
            
            play_sound(sfx_menu_move_2, 0.7, false);
        }
    }
    
    //Cap positions at the room borders
    x = max(x, 0);
    x = min(x, room_width);
    y = max(y, 0);
}
else
    image_speed = 0;
    
//Pause 
if global.keyPausePressed && function_state == 1 && !instance_exists(obj_dialogue)
&& !instance_exists(obj_pause_menu) {
    if (!global.frozen && !global.frozen_player) || global.saberLag {
        instance_create(x, y, obj_pause_menu);
        global.frozen = true;
    }
}
    
//If the player is not frozen via the normal frozen, they can charge their buster.
if !global.frozen && function_state >= 1 {
    if character == char_x
        player_x_charge();
}

/* */
/*  */
