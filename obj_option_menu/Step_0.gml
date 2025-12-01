/// @description Logic

if instance_exists(obj_fade_in) || instance_exists(obj_fade_out)
    exit;

if global.keyDownPressed && option != optionMax {
    option++;
    play_sound(sfx_menu_move_2,0.7,false);
}
if global.keyUpPressed && option != 0 {
    option--;
    play_sound(sfx_menu_move_2,0.7,false);
}

if global.keyRightPressed {
    play_sound(sfx_menu_move_2,0.7,false);
    if option == 0 {
        var diff = global.difficulty;
        if diff != diff_xtreme
            global.difficulty++;
        else
            global.difficulty = 0;
    }
    if option == 1 {
        if global.screen_size < 4
            global.screen_size++;
        else
            global.screen_size = 0;
            
        with obj_global event_user(0);
    }
    if option == 3 {
        bgm = min(bgm+1, global.bgm_total-1);
    }
    if option == 4 {
        global.bgm_on = !global.bgm_on;
    }
    if option == 5 {
        global.sfx_on = !global.sfx_on;
    }
}
if global.keyLeftPressed {
    play_sound(sfx_menu_move_2,0.7,false);
    if option == 0 {
        var diff = global.difficulty;
        if diff != 0
            global.difficulty--;
        else
            global.difficulty = diff_xtreme;
    }
    if option == 1 {
        if global.screen_size > 0
            global.screen_size--;
        else
            global.screen_size = 4;
            
        with obj_global event_user(0);
    }
    if option == 3 {
        bgm = max(bgm-1, 0);
    }
    if option == 4 {
        global.bgm_on = !global.bgm_on;
    }
    if option == 5 {
        global.sfx_on = !global.sfx_on;
    }
}

if global.keyPausePressed || global.keyJumpPressed {
    if option != 3 {
        play_sound(sfx_menu_select_2,0.7,false);
        audio_stop_sound(global.stream);
        global.stream = -1;
    }
    
    switch option {
        case(0): /*Do nothing*/; break;
        case(1): /*Do nothing*/; break;
        case(2): fade_to_room(rm_key_config); break;
        case(3): play_music(global.bgm[bgm],0.7,false); break;
        case(4): /*Do nothing*/; break;
        case(5): /*Do nothing*/; break;
        case(6):
            data_save_settings();
            fade_to_room(rm_title_screen);
        break;
    }
}

/* */
/*  */
