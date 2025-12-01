/// @description Player Parent

image_speed = 0;
image_index = 0;

mask_index = spr_x_mask;
palette_index = 0;

function_state = 0;
state = 0;
locked = false;

teleportY = y - 240;
teleportTimer = 0;
beginTimer = 0;

character = char_x;
ability_doubleJump = false;
ability_airDash = false;

xspeed = 0;
yspeed = 0;
canMoveRight = true;
canMoveLeft = true;
ground = true;
groundPixels = 1;

fallAnim = true;

inWater = false;

walkSpeed = 2.1;
stepSpeed = 1;
stepTimer = 0;
stepFrames = 4;
iceDec = 0.05;

jumpSpeed = 6;
grav = 0.25;
canGrav = true;
fallSpeed = 7;
inWater = false;
canMinJump = true;
landSprite = false;
canLandSprite = false;
canLandSound = false;
canDoubleJump = false;
doubleJumping = false;

dashSpeed = 4;
dashState = 0;
dashTimer = 0;
dashFrames = 50;
airDashFrames = 25;
stepDashTimer = 0;
stepDashFrames = 10;
dashJumping = false;
canAirDash = true;
airDashing = false;

wallTimer = 0;
wallState = 0;
wallJumpSpeed = 5.5;
wallJumpFrames = 10;
wallDir = 0;

climbSpeed = 1;
climbState = 0;
climbTimer = 0;
climbStartFrames = 3;
climbXscale = 1;

dashTrailTimer = 5;
dashTrail = false;
dashTrailEndFrames = 12;
dashTrailEndTimer = dashTrailEndFrames+1;
dashTrailI = 0;
dashTrailInterval = 0;
dashTrailFast = false;

crouching = false;
crouchTimer = 0;
crouchCanLRkeys = true;
crouchCanTimer = 0;

//- Weapon related -

//Shooting
shooting = false;
shootTimer = 0;
shootPlusX = 0;
shootX = 0;
shootY = 0;
shootDir = image_xscale;
chargeTimer = 0;
chargeFrames[0] = 30; //Small
chargeFrames[1] = 80; //Normal
chargeFrames[2] = 140; //Special
chargeIndex = 0;
chargeShot = false;
chargeDefault = false; //Is the player charging his/her default weapon?
canShoot = true;

//Special weapons
weapon_test1_dir = 0; //Direction tracker for Test 1
weapon_test1_giga = false;

//Saber
saber = false;
saberTimer = 0;
saberID = 0;
saberInit = true;
//0-2 = 1st-3rd stand slash, 3 = jump slash,
//4 = spin slash, 5 = crouch slash, 6 = wall slash
saberEnd = false;

hitType = 0;
hitTimer = 0;
hitFrames = 30;
recovering = false;
recoveryTimer = 0;
recoveryFrames = 120;

victoryTimer = 0;

teleportOut = false;

canDie = false;
alarm[0] = 1; //Set camera and if the player can die

for(var i = 0; i <= 12; i++) {
    prevX[i] = x;
    prevY[i] = y;
}

