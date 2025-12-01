/// @description Collect the sub tank

global.exTanks += 1;
global.exTank_collected[ID] = true;

play_sound(sfx_menu_select_2,0.7,false);

instance_destroy();

