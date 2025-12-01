/// @description Save game?

global.frozen = false;
global.checkpoint = false;

audio_stop_sound(global.stream);
global.stream = -1;

instance_create(x, y, obj_fade_in);

type = global._lives < 0; //0 = stage clear, 1 = game over
                          //If the player's lives are above 0, it will return
                          //a 0, otherwise it will return a 1.

option = 0;
menu[0] = "";
menu[1] = "";
menu[2] = "";
optionMax = array_length_1d(menu)-1;

for(var i = 0; i < optionMax+1; i++)
    menuCan[i] = true;

alarm[0] = 1;

//Restart lives if it's a Game Over.
//Also gray-out the stage select option the intro stage
//hasn't been beaten.
if type == 1 {
    global._lives = global.startLives;
    if !global.introStageBeaten
        menuCan[1] = false;
}
    
//Refill weapon energy
for(var i = 0; i < global.maxWeapons; i++)
    global.weapon_energy[i] = weapon_max_energy;

