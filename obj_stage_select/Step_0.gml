/// @description Logic

if instance_exists(obj_fade_in) || instance_exists(obj_fade_out)
    exit;

if state == 0 {
    //Cursor Speed
    cursorIndex += 1/2;
    
    //Moving
    if global.keyRightPressed {
        if !optionFinal {
            if option != 3 && option != 7
                play_sound(sfx_menu_move_1,0.7,false);
                
            if option < 4
                option = min(option+1,3); 
            if option >= 4
                option = min(option+1,7);
        }   
    }
    
    if global.keyLeftPressed {
        if !optionFinal {
            if option != 0 && option != 4
                play_sound(sfx_menu_move_1,0.7,false);   
                
            if option < 4
                option = max(option-1,0); 
            if option >= 4
                option = max(option-1,4); 
        }
    }
    
    if global.keyDownPressed {
        if optionFinal {
            optionFinal = false;
            if option < 4
                option = option+4;
            play_sound(sfx_menu_move_1,0.7,false); 
        }
        else {  
            if option < 4 {
                if canSelectFinal
                    optionFinal = true;
                else
                    option = option+4;
                play_sound(sfx_menu_move_1,0.7,false); 
            }
        }
    }
    
    if global.keyUpPressed {
        if optionFinal {
            optionFinal = false;
            if option >= 4
                option = option-4;
            play_sound(sfx_menu_move_1,0.7,false); 
        }
        else {
            if option >= 4 {
                if canSelectFinal
                    optionFinal = true;
                else
                    option = option-4;
                play_sound(sfx_menu_move_1,0.7,false); 
            }
        }
    }
    
    //Selecting
    if global.keyPausePressed || global.keyJumpPressed {
        play_sound(sfx_menu_select_1,0.7,false); 
        if !optionFinal {
            global.myBoss = option;
            global.myRoom = bossRoom[option];
        }
        else {
        
        }
        state = 1;
    }
}

else if state == 1 {
    if global.keyRightPressed {
        if character == global.maxCharacters-1
            character = 0;
        else
            character++;
            
        play_sound(sfx_menu_move_1,0.7,false);
    }
    
    if global.keyLeftPressed {
        if character == 0
            character = global.maxCharacters-1;
        else
            character--;
            
        play_sound(sfx_menu_move_1,0.7,false);
    }
    
    if global.keyActionPressed {
        state = 0;
    }
    
    if global.keyPausePressed || global.keyJumpPressed {
        global.character = character;
        if !optionFinal {
            var myRoom;
            if global.boss_defeated[global.myBoss]
                myRoom = global.myRoom;
            else
                myRoom = rm_boss_intro;
            fade_to_room(myRoom);
        }
        else {
            var myRoom;
            switch global.endStage {
                case(0): myRoom = rm_beta_endstg_1; break;
                case(1): myRoom = rm_beta_endstg_2; break;
                case(2): myRoom = rm_beta_endstg_2; break;
                case(3): myRoom = rm_beta_endstg_2; break;
            }
            fade_to_room(myRoom);
        }
        play_sound(sfx_menu_select_3,0.7,false);
    }
}

