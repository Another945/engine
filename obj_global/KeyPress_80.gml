/// @description DEBUG - Unlock everything

//be sure to remove this in your final game.

global.heartTanks[0] = 4;
global.heartTanks[1] = 4;
for(var i = 0; i < global.maxHeartTanks; i++)
    global.heartTank_collected[i] = true;

for(var i = 0; i < global.maxWeapons; i++)
    global.weapon_unlocked[i] = true;
    
for(var i = 0; i <= armor_black; i++)
    global.armor[i] = true;
    
for(var i = 0; i < global.maxSubTanks; i++) {
    global.subTank_collected[i] = true;
    global.subTank_energy[i] = tank_max_energy;
}
    
for(var i = 0; i < global.maxWeaponsTanks; i++) {
    global.weaponsTank_collected[i] = true;
    global.weaponsTank_energy[i] = tank_max_energy;
}
    
for(var i = 0; i < global.maxExTanks; i++)
    global.exTank_collected[i] = true;
    
for(var i = 0; i < 8; i++)
    global.boss_defeated[i] = true;

