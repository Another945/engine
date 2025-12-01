/// @description Data logic

if instance_exists(obj_fade_in) || instance_exists(obj_fade_out)
    exit;

//Choose wether to use the previous data or select a data
if page == 0 {
    if global.keyUpPressed && loadOption != 0 {
        loadOption--;
        play_sound(sfx_menu_move_2,0.7,false);
    }
    
    if global.keyDownPressed && loadOption != 2 {
        loadOption++;
        play_sound(sfx_menu_move_2,0.7,false);
    }
    
    if loadOption == 0 && !data_exists(global.mySave)
        loadOption = 1;
    
    if global.keyJumpPressed {
        switch loadOption {
            case(0): 
                if data_exists(global.mySave) {
                    data_load(global.mySave);
                    fade_to_room(rm_stage_select);
                }
            break;
            case(1): page = 1; break;
            case(2): fade_to_room(rm_title_screen); break;
        }
        
        play_sound(sfx_menu_select_2, 0.7, false);
    }
}
//Choose data
else if page == 1 {
    if global.keyUpPressed && data != 0 {
        data--;
        data_menu_load(data);
        play_sound(sfx_menu_move_1,0.7,false);
    }
    if global.keyDownPressed && data != global.maxSaves {
        data++;
        data_menu_load(data);
        play_sound(sfx_menu_move_1,0.7,false);
    }
    
    if global.keyJumpPressed {
        if data == global.maxSaves {
            if !saving {
                page--;
                audio_play_sound(sfx_menu_select_2,0.7,false);
            }
            else {
                instance_create(x, y, obj_save_game);
                audio_play_sound(sfx_menu_select_2,0.7,false);
                instance_destroy();
            }
        }
        else {
            if !saving {
                if data_exists(data) {
                    data_load(data);
                    global.mySave = data
                    data_save_settings();
                    audio_play_sound(sfx_menu_select_2,0.7,false);
                    fade_to_room(rm_stage_select);
                }
            }
            else {
                data_save(data);
                data_menu_load(data);
                global.mySave = data;
                data_save_settings();
                audio_play_sound(sfx_menu_select_2,0.7,false);
                fade_to_room(rm_stage_select);
            }
        }
    }
}

