/// @description data_menu_load(file_num)
/// @param file_num
function data_menu_load(argument0) {

	/*
	This loads data for the data select menu ONLY. This doesn't apply
	saved data to the game itself. This is used to display what a save
	file contains in the data select.
	*/

	var fileName = "MMX32BaseEngine_Savefile"+string(argument0+1)+".sav";;
	if file_exists(fileName) {
	    ini_open(fileName);
    
	    data_lives = ini_read_real("Progress", "lives", 0);
	    data_heartTanks[0] = ini_read_real("Progress", "heart_tanks_x", 0);
	    data_heartTanks[1] = ini_read_real("Progress", "heart_tanks_zero", 0);
	    data_subTanks = ini_read_real("Progress", "sub_tanks", 0);
	    data_weaponsTanks = ini_read_real("Progress", "weapon_tanks", 0);
	    data_exTanks = ini_read_real("Progress", "ex_tanks", 0);
    
	    for(var i = 0; i < global.maxCharacters; i++)
	        data_healthpoints_max[i] = ini_read_real("Progress", "max_health"+string(i+1), 32);
        
	    for(var i = 0; i < 8; i++)
	        data_boss_defeated[i] = ini_read_real("Progress", "boss_defeated"+string(i+1), false);
        
	    for(var i = 0; i < global.maxWeapons; i++)
	        data_weapon_unlocked[i] = ini_read_real("Progress", "weapon_got"+string(i+1), false);
        
	    for(var i = 0; i <= armor_black; i++)
	        data_armor[i] = ini_read_real("Progress", "armor"+string(i+1), false);
        
	    for(var i = 0; i < global.maxSubTanks; i++) {
	        data_subTank_collected[i] = ini_read_real("Progress", "sub_tank_collected"+string(i+1), false);
	        data_subTank_energy[i] = ini_read_real("Progress", "sub_tank_energy"+string(i+1), 0);
	    }
    
	    for(var i = 0; i < global.maxWeaponsTanks; i++) {
	        data_weaponsTank_collected[i] = ini_read_real("Progress", "weapons_tank_collected"+string(i+1), false);
	        data_weaponsTank_energy[i] = ini_read_real("Progress", "weapons_tank_energy"+string(i+1), 0);
	    }
    
	    for(var i = 0; i < global.maxExTanks; i++) {
	        data_exTank_collected[i] = ini_read_real("Progress", "ex_tank_collected"+string(i+1), false);
	    }
    
	    for(var i = 0; i < global.maxHeartTanks; i++) {
	        for(var j = 0; j < global.maxCharacters; j++)
	            data_heartTank_collected[j,i] = ini_read_real("Progress", "heart_tank_collected"+string(j+1)+string(i+1), false);
	    }
    
	    ini_close();
	}



}
