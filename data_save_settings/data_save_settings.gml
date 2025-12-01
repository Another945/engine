/// @description data_save_settings()
function data_save_settings() {

	var fileName = "MMX32BaseEngine_Settingsfile.sav";
	if file_exists(fileName)
	    file_delete(fileName);
    
	ini_open(fileName);

	ini_write_real("Settings", "difficuly", global.difficulty);
	ini_write_real("Settings", "screen", global.screen_size);
	ini_write_real("Settings", "bgm", global.bgm_on);
	ini_write_real("Settings", "sfx", global.sfx_on);
	ini_write_real("Settings", "mySave", global.mySave);

	ini_close();



}
