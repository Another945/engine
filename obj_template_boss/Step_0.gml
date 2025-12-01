/// @description Logic
event_inherited();

if !global.frozen && !global.frozen_bosses {
    if function_state == -1 {
        //Do nothing
    }
    //Intro
    else if function_state == 0 {
        if !instance_exists(obj_dialogue)
            introTimer++;
        
        //Text
        if global.character == char_x {
            textStart = 0;
            textEnd = 2;
        }
        else if global.character == char_zero {
            textStart = 3;
            textEnd = 6;
        }
        
        if introTimer == 30 && !instance_exists(obj_dialogue) && bossType != 3 {
            var myText = instance_create(x, y, obj_dialogue);
            for(var i = 0; i <= (textEnd-textStart); i++) {
                myText.name[i] = dialogue_get_name(dialogue_boss_template,textStart+i);
                myText.dialogue[i] = dialogue_get_text(dialogue_boss_template,textStart+i);
            }
            introTimer++;
        }    
        
        if introTimer >= 60 {
            with obj_boss_control event_user(0);
        }
    }
    //Fight!
    else if function_state == 1 {
        if state == 0 {
            if ground {
                //If on the ground, set certain variables to jump towards the player and add to the timer.
                if attackTimer == 0 {
                    yspeed = -5;
                    xspeed = 2 * image_xscale;
                    npc_face_player();
                    attackTimer = 1;
                }
                //Land
                else {
                    xspeed = 0;
                    attackTimer++;
                    if attackTimer >= 30 {
                        npc_face_player();
                        attackTimer = 0;
                        state = 1;
                    }
                }
            }
        }
        else if state == 1 {
            attackTimer++;
            if attackTimer == 5 {
                var i = instance_create(x+(16*image_xscale), y, obj_template_boss_projectile);
                if image_xscale == 1
                    i.direction = angle_right;
                else
                    i.direction = angle_left;
            }
            
            if attackTimer >= 30 {
                var attack;
                if healthpoints >= healthpoints_start/2
                    attack = 0;
                else {
                    randomize();
                    attack = choose(0, 2);
                }
                
                state = attack;
                attackTimer = 0;
            }
        }
        else if state == 2 {
            if attackTimer == 0 {
                reflectWeapons = true;
            }
            
            if attackTimer >= 90 {
                reflectWeapons = false;
                state = 0;
                attackTimer = 0;
            }
            
            attackTimer++;
        }
    }
}

