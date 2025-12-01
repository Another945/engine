/// @description Victory

global.weapon = 0;

if type != 0 && type != 3 {
    prt_player.function_state = 4;
    alarm[3] = 75;
}
else
    alarm[3] = 1;

