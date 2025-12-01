/// @description Stage Select

global.checkpoint = false;
global.introStage = false;
global.introStageBeaten = true; //If you got to the stage select it's likely
                                //you've already beaten the intro stage.

instance_create(x, y, obj_fade_in);

play_music(bgm_stage_select_1,0.7,false);

state = 0;
option = 0;
cursorIndex = 0;
character = 0;

bossRoom[0] = rm_beta;
bossRoom[1] = rm_beta;
bossRoom[2] = rm_beta;
bossRoom[3] = rm_beta;
bossRoom[4] = rm_beta;
bossRoom[5] = rm_beta;
bossRoom[6] = rm_beta;
bossRoom[7] = rm_beta;

var bossesDefeated = 0;
for(var i = 0; i < 8; i++) {
    if global.boss_defeated[i]
        bossesDefeated++;
}

if bossesDefeated >= 8
    canSelectFinal = true;
else
    canSelectFinal = false;
    
optionFinal = false; //Do we have the final icon selected?

