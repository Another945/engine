/// @description play_sound(sfx,volume,loop?)
/// @param sfx
/// @param volume
/// @param loop?
function play_sound(argument0, argument1, argument2) {

	if global.sfx_on {
	    audio_stop_sound(argument0); //Stop the sound if it is already playing
	    var sfx = audio_play_sound(argument0,10,argument2);
	    audio_sound_gain(sfx, argument1, 0);
	}



}
