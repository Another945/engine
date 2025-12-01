/// @description dialogue_data_boss_template()
function dialogue_data_boss_template() {

	var Boss = "TEMPLATE";

	//Text Width------------

	//Template to X
	var num = 0;
	global.dialogue_name[dialogue_boss_template,num] = string(Boss);
	global.dialogue_text[dialogue_boss_template,num] =
	"Enter witty dialogue."

	var num = 1;
	global.dialogue_name[dialogue_boss_template,num] = "X";
	global.dialogue_text[dialogue_boss_template,num] =
	@"Enter even more witty
	dialogue."

	var num = 3;
	global.dialogue_name[dialogue_boss_template,num] = string(Boss);
	global.dialogue_text[dialogue_boss_template,num] =
	@"Something, something,
	die X!"

	//Template to Zero
	var num = 4;
	global.dialogue_name[dialogue_boss_template,num] = string(Boss);
	global.dialogue_text[dialogue_boss_template,num] =
	"Enter witty dialogue."

	var num = 5;
	global.dialogue_name[dialogue_boss_template,num] = "Zero";
	global.dialogue_text[dialogue_boss_template,num] =
	"Enter edgy dialogue."

	var num = 6;
	global.dialogue_name[dialogue_boss_template,num] = string(Boss);
	global.dialogue_text[dialogue_boss_template,num] =
	@"Something, something,
	die Zero!"



}
