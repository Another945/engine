/// @description data_load_settings()
function data_load_settings() {

	var fileName = "MMX32BaseEngine_Settingsfile.sav";
	if file_exists(fileName) {
	    ini_open(fileName);
    
	    global.difficulty = ini_read_real("Settings", "difficuly", diff_normal);
	    global.screen_size = ini_read_real("Settings", "screen", 1);
	    global.bgm_on = ini_read_real("Settings", "bgm", true);
	    global.sfx_on = ini_read_real("Settings", "sfx", true);
	    global.mySave = ini_read_real("Settings", "mySave", 0);
    
	    ini_close();
	}



}
