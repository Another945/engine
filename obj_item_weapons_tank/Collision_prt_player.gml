/// @description Collect the sub tank

global.weaponsTanks += 1;
global.weaponsTank_collected[ID] = true;

play_sound(sfx_menu_select_2,0.7,false);

instance_destroy();

