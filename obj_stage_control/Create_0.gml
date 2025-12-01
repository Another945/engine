/// @description Stage Control object.

//Stop music
audio_stop_sound(global.stream);
global.stream = -1;

lvlMusic = -1;

music_intro_length = 0;
music_loop_length = 0;
music_total_length = 0;

global.stageTimer = 0;

alarm[0] = 30;

