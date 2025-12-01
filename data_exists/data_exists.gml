/// @description data_exists(file_num);
/// @param file_num
function data_exists(argument0) {

	var fileName = "MMX32BaseEngine_Savefile"+string(argument0+1)+".sav";
	if file_exists(fileName)
	    return true;
	else
	    return false;



}
