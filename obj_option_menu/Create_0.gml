/// @description Options Menu

menu[0] = "GAME LEVEL";
menu[1] = "SCREEN SIZE";
menu[2] = "CONTROL CONFIGURATION";
menu[3] = "BGM TEST";
menu[4] = "BGM ON";
menu[5] = "SFX ON";
menu[6] = "BACK";
optionMax = array_length_1d(menu)-1;
option = 0;

bgm = 0;

instance_create(x, y, obj_fade_in); //Create fade in

