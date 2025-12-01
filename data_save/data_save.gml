/// @description data_save(file_num)
/// @param file_num
function data_save(argument0) {

	var fileName = "MMX32BaseEngine_Savefile"+string(argument0+1)+".sav";
	if file_exists(fileName)
	    file_delete(fileName);
    
	ini_open(fileName);

	//Save how many items the player has
	ini_write_real("Progress", "lives", global._lives);
	ini_write_real("Progress", "heart_tanks_x", global.heartTanks[0]);
	ini_write_real("Progress", "heart_tanks_zero", global.heartTanks[1]);
	ini_write_real("Progress", "sub_tanks", global.subTanks);
	ini_write_real("Progress", "weapons_tanks", global.weaponsTanks);
	ini_write_real("Progress", "ex_tanks", global.exTanks);

	for(var i = 0; i < global.maxCharacters; i++)
	    ini_write_real("Progress", "max_health"+string(i+1), global.healthpoints_max[i]);
    
	for(var i = 0; i < 8; i++)
	    ini_write_real("Progress", "boss_defeated"+string(i+1), global.boss_defeated[i]);
    
	for(var i = 0; i < global.maxWeapons; i++) {
	    //We only need to save if the weapon has been unlocked.
	    //The game will allow the player to charge them if the
	    //buster armor has been unlocked.
	    ini_write_real("Progress", "weapon_got"+string(i+1), global.weapon_unlocked[i]);
	}

	for(var i = 0; i <= armor_black; i++) {
	    ini_write_real("Progress", "armor"+string(i+1), global.armor[i]);
	}

	//Save item specifics
	for(var i = 0; i < global.maxSubTanks; i++) {
	    ini_write_real("Progress", "sub_tank_collected"+string(i+1), global.subTank_collected[i]);
	    ini_write_real("Progress", "sub_tank_energy"+string(i+1), global.subTank_energy[i]);
	}
	for(var i = 0; i < global.maxWeaponsTanks; i++) {
	    ini_write_real("Progress", "weapons_tank_collected"+string(i+1), global.weaponsTank_collected[i]);
	    ini_write_real("Progress", "weapons_tank_energy"+string(i+1), global.weaponsTank_energy[i]);
	}
	for(var i = 0; i < global.maxExTanks; i++) {
	    ini_write_real("Progress", "ex_tank_collected"+string(i+1), global.exTank_collected[i]);
	}
	for(var i = 0; i < global.maxHeartTanks; i++) {
	    for(var j = 0; j < global.maxCharacters; j++)
	        ini_write_real("Progress", "heart_tank_collected"+string(j+1)+string(i+1), global.heartTank_collected[j,i]);
	}

	ini_close();



}
