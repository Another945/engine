/// @description init_game();
function init_game() {

	//Initiate the game

	global.maxCharacters = 2;
	global.character = char_x;

	global.healthpoints_max[0] = startHealth;
	global.healthpoints_max[1] = startHealth;
	global.healthpoints = global.healthpoints_max[0];

	global.startLives = 2;
	global._lives = global.startLives;

	global.introStage = false; //In the intro stage?
	global.introStageBeaten = false;

	global.myBoss = -1; //The ID of the boss you are going to (used for the 8 mavericks)
	for(var i = 0; i < 8; i++) {
	    global.boss_defeated[i] = false;
	    global.boss_rematch_defeated[i] = false;
	}
	global.endStage = 0; //Keeps track of what end-stage you're on.
	                     //"endStage" is refering to the "fortress" stages
	                     //(Sigma's Fortress/X-Hunter's Base/Doppler's Lab/Final Weapon)
	global.endStages = 4; //The number end stages. Don't know what this would be useful
	                      //for, but eh.

	global.myRoom = -1; //A room to save for later. Useful for stage select/boss introduction.

	global.weapon = 0;
	global.newWeapon = 0; //Used for the weapon get
	global.maxWeapons = 9; //Including Mega Buster/Z-Saber
	for(var i = 0; i < global.maxWeapons; i++) {
	    global.weapon_canCharge[i] = false;
	    global.weapon_unlocked[i] = false;
	    global.weapon_energy[i] = 48;
	    global.weapon_ammo[i] = 1;
    
	    global.weapon_name[char_x,i] = "";
	    global.weapon_name[char_zero,i] = "";
	}
	//ID 0 is considered the player's main weapon (X-buster/Z-saber)
	global.weapon_unlocked[0] = true;
	global.weapon_canCharge[0] = true;

	global.weapon_unlocked[2] = true;

	global.weapon_ammo[char_x,1] = 1;
	global.weapon_ammo[char_x,2] = 3;

	global.weapon_ammo[char_zero,1] = 0;
	global.weapon_ammo[char_zero,2] = 6;

	global.weapon_name[char_x,0] = "M. Buster";
	global.weapon_name[char_zero,0] = "Z. Saber";
	global.weapon_name[char_x,1] = "Test 1";
	global.weapon_name[char_zero,1] = "Test Giga";
	global.weapon_name[char_x,2] = "Test 2";
	global.weapon_name[char_zero,2] = "";

	global.disableCamera = false;

	//Items
	global.heartTanks[0] = 0;
	global.heartTanks[1] = 0;
	global.maxHeartTanks = 8;
	for(var i = 0; i < global.maxHeartTanks; i++) {
	    global.heartTank_collected[i] = false;
	}

	global.subTanks = 0;
	global.maxSubTanks = 2;
	for(var i = 0; i < global.maxSubTanks; i++) {
	    global.subTank_collected[i] = false;
	    global.subTank_energy[i] = 0;
	}

	global.weaponsTanks = 0;
	global.maxWeaponsTanks = 1;
	for(var i = 0; i < global.maxWeaponsTanks; i++) {
	    global.weaponsTank_collected[i] = false;
	    global.weaponsTank_energy[i] = 0;
	}

	global.exTanks = 0;
	global.maxExTanks = 1;
	for(var i = 0; i < global.maxExTanks; i++) {
	    global.exTank_collected[i] = false;
	}

	//Armor parts
	global.armor[armor_head] = false;
	global.armor[armor_body] = false;
	global.armor[armor_buster] = false;
	global.armor[armor_legs] = false;

	global.armor[armor_black] = false;



}
