/// @description Controllers

//Heart Tank Control
global.healthpoints_max[global.character] = startHealth + (global.heartTanks[global.character]*2);

//Weapon charge control
if global.armor[armor_buster] {
    for(var i = 0; i < global.maxWeapons; i++) {
        global.weapon_canCharge[i] = true;
    }
}

//EX Tank Control
var tanks = 0;
for(var i = 0; i < global.maxExTanks; i++) {
    if global.exTank_collected[i]
        tanks++;
}

global.startLives = 2 + (2 * tanks);

