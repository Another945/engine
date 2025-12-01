/// @description Unlock weapon and clear boss
if type == 0 {
    global.introStageBeaten = true;
}
else if type == 1 {
    global.weapon_unlocked[ID+1] = true;
    global.newWeapon = ID+1;
    
    if !global.boss_defeated[other.ID]
        getWeaponMenu = true;
    global.boss_defeated[ID] = true;
}
else if type == 2 {
    global.endStage++;
}
else if type == 3 {
    global.boss_rematch_defeated[ID] = true;
}

