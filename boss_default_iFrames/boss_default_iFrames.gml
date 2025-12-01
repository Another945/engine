/// @description boss_default_iFrames()
function boss_default_iFrames() {

	//NOTE: the "iFrames" must be set in the object before hand

	//X's wepaons
	weapon_iFrames[obj_weapon_buster] = iFrames;
	weapon_iFrames[obj_weapon_buster_half_charged] = iFrames;
	weapon_iFrames[obj_weapon_buster_charged] = iFrames;

	weapon_iFrames[obj_weapon_test1] = iFrames;
	weapon_iFrames[obj_weapon_test1_giga] = iFrames;

	weapon_iFrames[obj_weapon_test2] = iFrames;

	//Zero's saber
	for(var i = 0; i <= 6; i++) {
	    saber_iFrames[i] = iFrames;
	}

	saber_iFrames[0] = 6;
	saber_iFrames[1] = 6;



}
