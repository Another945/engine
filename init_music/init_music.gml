/// @description init_music()
function init_music() {

	//Used to initiate music variables. They aren't neccesary in its
	//current state. It's mostly used for BGM Test.

	//However, if you advanced users out there want to
	//also store music loops and volumes etc, this should be a good
	//place to set it by adding stuff here.

	global.bgm[0] = bgm_shining_firefly;

	global.bgm[1] = bgm_dr_light;

	global.bgm[2] = bgm_boss;

	global.bgm[3] = bgm_stage_clear_x;

	global.bgm[4] = bgm_stage_clear_zero;

	global.bgm[5] = bgm_weapon_get;

	global.bgm[6] = bgm_stage_select_1;

	global.bgm[7] = bgm_stage_select_2;

	global.bgm[8] = bgm_stage_start;

	global.bgm_total = array_length_1d(global.bgm);



}
