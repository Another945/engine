/// @description Default logic

if !global.frozen && !global.frozen_bosses {
    if function_state == -1 {
        //Do nothing
    }
    else if function_state == 0 {
        //This would be where the intro code goes.
    }
    else if function_state == 1 {
        //This would be where all the fighting code goes.
        
        //Die code
        if healthpoints <= 0 {
            function_state = 2; //Death function state.
            global.frozen = false;
            global.frozen_bosses = false;
        }
    }
    
    if function_state == 0 || function_state == 1 {
        if usePhysics {
            npc_physics();
        }
        
        //Invincibility frames
        iTimer = max(0, iTimer-1);
        if iTimer == 0 {
            flash = false;
            flashTimer = 0;
        }
    }
}

//Death animation. This can't be frozen
if function_state == 2 {
    //Dying code
    sprite_index = deathSprite;
    image_index = deathIndex;
    image_speed = 0;
    
    //Lock the player
    if instance_exists(prt_player) {
        lock_player(true);
    }
    
    deathTimer++;
    if deathTimer >= 120 && deathTimer < 380 {
        //Stop the music
        audio_stop_sound(global.stream);
        global.stream = -1;
        
        if deathTimer == 140
            instance_create(x, y, obj_boss_explosion_fade);
        
        if deathTimer mod 8 == 1 {
            randomize();
            var randX = random(20);
            randomize();
            var randY = random(20);
            var spacing = 12;
            var I = instance_create(x+(randX*spacing)-((20*spacing)/2),y+(randY*spacing)-((20*spacing)/2),obj_explosion);
                I.depth = -10000;
            
            play_sound(choose(sfx_explosion_1,sfx_explosion_2,sfx_explosion_3),0.7,false);
        }
    }
    
    if deathTimer == 380 {
        with obj_boss_explosion_fade fadeDir = -1;
        play_sound(sfx_boss_destroyed,0.7,false);
        with instance_create(x, y, obj_boss_clear) {
            type = other.bossType;
            ID = other.bossID;
            
            myX = other.myX;
            myY = other.myY;
        }
        instance_destroy();
    }
}

//Saber lag unfreeze
if alarm[10] == 2 {
    global.saberLag = false;
}

if alarm[10] > 0 && !global.saberLag && !instance_exists(obj_pause_menu)
    global.frozen = false;

if global.frozen && (!global.saberLag || instance_exists(obj_pause_menu)) {
    if alarm[10] > 0
        alarm[10]++;
}

