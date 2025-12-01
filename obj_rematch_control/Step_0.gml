/// @description Logic

var bosses,defeated;
bosses = 1;
defeated = 0;
for(var i = 0; i < bosses; i++) {
    if global.boss_rematch_defeated[i]
        defeated++;
}   

if defeated >= bosses {
    global.rematchCleared = true;
}

