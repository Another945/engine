/// @description play_music(bgm,volume,loop?)
/// @param bgm
/// @param volume
/// @param loop?
function play_music(argument0, argument1, argument2) {

	if global.bgm_on {
	    audio_stop_sound(global.stream);
	    global.stream = argument0;
	    var bgm = audio_play_sound(argument0,10,argument2);
	    audio_sound_gain(bgm, argument1, 0);
	}



}
