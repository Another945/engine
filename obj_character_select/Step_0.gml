/// @description Select player

if instance_exists(obj_fade_in) || instance_exists(obj_fade_out)
    exit;

if global.keyRightPressed && option != characters-1 {
    option++;
    play_sound(sfx_menu_move_1,0.7,false);
}
if global.keyLeftPressed && option != 0 {
    option--;
    play_sound(sfx_menu_move_1,0.7,false);
}

if global.keyJumpPressed || global.keyPausePressed {
    play_sound(sfx_menu_select_3,0.7,false);
    global.character = option;
    fade_to_room(rm_test);
}

cursorIndex += 1/3;

