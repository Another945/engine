/// @description Boss parent

bossType = 1;
/*
0 = Intro stage boss.
1 = Maverick.
2 = Fortress Boss.
3 = Rematch.
*/
bossID = 0;
healthpoints_start = 48;
healthpoints = healthpoints_start;
alarm[11] = 2;

player_damage = 3; //Damage done to the player if he/she touches the enemy.
player_hurtType = 0;

reflectWeapons = false; //Reflect the player's weapons completely
reflectWeapons_right = false; //Reflect the player's weapons from the right
reflectWeapons_left = false; //Reflect the player's weapons from the left

iTimer = 0;
iFrames = 40;
boss_default_iFrames();

deathSprite = spr_nothing;
deathIndex = 0;

canHurtPlayer = true; //If the boss can hurt the player via contact.
canHit = true; //If the player can get hit by projectiles.

function_state = -1; //Not active

usePhysics = true;
//The physics values
xspeed = 0;
yspeed = 0;
canMoveRight = true;
canMoveLeft = true;
ground = true;
canGrav = true;
grav = 0.25;
fallSpeed = 7;
groundPixels = 1;

flash = false;
flashTimer = 0;
flashFrames = 3;

canSaberHit = true;
saberLag = false;

deathTimer = 0;

npc_default_damage();
canGetHit = true;

//Rematch stuff
myX = 0; //X position to teleport the player after defeat
myY = 0; //Y position to teleport the player after defeat

/* */
/*  */
