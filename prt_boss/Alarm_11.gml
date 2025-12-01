/// @description If a Maverick boss, check if it has been defeated.

//Destroy if already defeated.
if bossType == 1 && global.boss_defeated[bossID] {
    instance_destroy();
}

