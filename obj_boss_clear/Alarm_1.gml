/// @description Play victory theme

if type != 0 && type != 3 {
    switch global.character {
        case(char_x): play_music(bgm_stage_clear_x,0.7,false); break;
        case(char_zero): play_music(bgm_stage_clear_zero,0.7,false); break; 
    }
    
    alarm[2] = 320;
}
else
    alarm[2] = 1;

