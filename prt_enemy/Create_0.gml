/// @description Enemy Parent

dead = false; //Controls if the enemy is dead or not. In Megaman games, the enemy
              //instances don't get destroyed. They dust disappear and don't interact
              //with anything. Doing this, we can easily respawn teh enemy when it
              //goes off screen.

active = false; //Controls if the enmey is active. The enemy wont perform its usual AI
                //until it appears on screen. After that, it won't be deactivated until
                //it is "dead".
                
healthpoints_start = 3;
healthpoints = healthpoints_start;
die = false;

player_damage = 3; //Damage done to the player if he/she touches the enemy.
player_hurtType = 0;

reflectWeapons = false; //Reflect the player's weapons completely
reflectWeapons_right = false; //Reflect the player's weapons from the right
reflectWeapons_left = false; //Reflect the player's weapons from the left

xscale_start = image_xscale;
yscale_start = image_yscale;
alarm[11] = 1; //Refresh these

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
flashFrames = 3; //The image won't be a flash on the last frame.
canGetHit = true;

canSaberHit = true;
saberLag = false;

npc_default_damage();

