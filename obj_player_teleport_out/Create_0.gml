/// @description The player teleporting out and fading to a room

alarm[0] = 60;

switch global.character {
    case(char_x): play_sound(sfx_player_teleport_out_x,0.7,false); break;
    case(char_zero): play_sound(sfx_player_teleport_out_zero,0.7,false); break;
}

