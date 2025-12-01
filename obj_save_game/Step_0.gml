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

if global.keyJumpPressed && menuCan[option] {
    if (option == 0 && type == 0)
    || (option == 2 && type == 1) {
        with instance_create(x, y, obj_data_select) {
            page = 1;
            saving = true;
        }
        instance_destroy();
    }
    if option == 1 {
        fade_to_room(rm_stage_select);
    }
    else if (option == 2 && type == 0) {
        fade_to_room(rm_title_screen);
    }
    else if (option == 0 && type == 1) {
        fade_to_room(global.myRoom);
    }
}

