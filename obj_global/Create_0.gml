/// @description The global control.

global.frozen = false; //Used to pause everything
global.frozen_player = false; //Used to pause the player
global.frozen_bosses = false; //Used to pause bosses
global.saberLag = false;

global.screen_width = 320;
global.screen_height = 240;

startHealth = 32;

//Checkpoint stuff
global.checkpoint = false;
global.saveX = 0;
global.saveY = 0;
global.camera_saveX[0] = 0;
global.camera_saveY[0] = 0;
global.camera_saveX[1] = room_width;
global.camera_saveY[1] = room_height;

//Keys
global.leftKey = vk_left;
global.rightKey = vk_right;
global.upKey = vk_up;
global.downKey = vk_down;
global.jumpKey = ord("C");
global.shootKey = ord("X");
global.specialKey = ord("F");
global.pauseKey = vk_space;
global.dashKey = ord("Z");
global.weaponSwitchLeftKey = ord("A");
global.weaponSwitchRightKey = ord("D");
global.gigaKey = ord("D");

//Settings
global.difficulty = diff_normal;
global.screen_size = 1;
global.bgm_on = true;
global.sfx_on = true;

//Save Files
global.maxSaves = 8;
global.mySave = 0;

//Set screen
surface_resize(application_surface,global.screen_width,global.screen_height);

//Music
global.stream = -1;

init_game();

//Fonts
global.font[font_mmx4] = font_add_sprite(spr_font_MMX4, ord("!"), true, 1);
global.font[font_healthbar] = font_add_sprite_ext(spr_healthbar_lives, "0123456789", true, 1);

//Load Text data
dialogue_data_lightcapsules();
dialogue_data_boss_template();

//Load music variables
init_music();

//Load palettes
palette_add_x();
palette_add_x_charge();
palette_add_zero();
palette_add_zsaber();
palette_add_x_template();

//Load game data. This will also set up the window.
alarm[1]= 1;

if room == rm_init
    room_goto(rm_test);

