/// @description Breakable solid parent

/*
Solid objects that the player can break with weapons.

I put the moving solid and their parent because I have a feeling
you'll want these object to move (gravity). I've even developed them
with NPC physics.
*/

healthpoints_start = 3;
healthpoints = healthpoints_start;
die = false;

reflectWeapons = false; //Reflect the player's weapons completely
reflectWeapons_right = false; //Reflect the player's weapons from the right
reflectWeapons_left = false; //Reflect the player's weapons from the left

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

/* */
/*  */
