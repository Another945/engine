/// @description data_load(file_num)
/// @param file_num
function data_load(argument0) {

	var fileName = "MMX32BaseEngine_Savefile"+string(argument0+1)+".sav";;
	if file_exists(fileName) {
	    ini_open(fileName);
    
	    global._lives = ini_read_real("Progress", "lives", 0);
	    global.heartTanks[0] = ini_read_real("Progress", "heart_tanks_x", 0);
	    global.heartTanks[1] = ini_read_real("Progress", "heart_tanks_zero", 0);
	    global.subTanks = ini_read_real("Progress", "sub_tanks", 0);
	    global.weaponsTanks = ini_read_real("Progress", "weapon_tanks", 0);
	    global.exTanks = ini_read_real("Progress", "ex_tanks", 0);
    
	    for(var i = 0; i < global.maxCharacters; i++)
	        global.healthpoints_max[i] = ini_read_real("Progress", "max_health"+string(i+1), 32);
        
	    for(var i = 0; i < 8; i++)
	        global.boss_defeated[i] = ini_read_real("Progress", "boss_defeated"+string(i+1), false);
        
	    for(var i = 0; i < global.maxWeapons; i++)
	        global.weapon_unlocked[i] = ini_read_real("Progress", "weapon_got"+string(i+1), false);
        
	    for(var i = 0; i <= armor_black; i++)
	        global.armor[i] = ini_read_real("Progress", "armor"+string(i+1), false);
        
	    for(var i = 0; i < global.maxSubTanks; i++) {
	        global.subTank_collected[i] = ini_read_real("Progress", "sub_tank_collected"+string(i+1), false);
	        global.subTank_energy[i] = ini_read_real("Progress", "sub_tank_energy"+string(i+1), 0);
	    }
    
	    for(var i = 0; i < global.maxWeaponsTanks; i++) {
	        global.weaponsTank_collected[i] = ini_read_real("Progress", "weapons_tank_collected"+string(i+1), false);
	        global.weaponsTank_energy[i] = ini_read_real("Progress", "weapons_tank_energy"+string(i+1), 0);
	    }
    
	    for(var i = 0; i < global.maxExTanks; i++) {
	        global.exTank_collected[i] = ini_read_real("Progress", "ex_tank_collected"+string(i+1), false);
	    }
    
	    for(var i = 0; i < global.maxHeartTanks; i++) {
	        for(var j = 0; j < global.maxCharacters; j++)
	            global.heartTank_collected[j,i] = ini_read_real("Progress", "heart_tank_collected"+string(j+1)+string(i+1), false);
	    }
    
	    ini_close();
	}



}
