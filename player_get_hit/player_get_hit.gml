/// @description player_get_hit(damage, hurtType)
/// @param damage
/// @param  hurtType
function player_get_hit(argument0, argument1) {

	//Bug fix
	if saber
	    locked = false;

	//Damage the player
	global.healthpoints -= argument0;
	state = state_hurt;
	hitType = argument1;

	recovering = true;
	recoveryTimer = recoveryFrames;

	dashJumping = false;

	//Destroy dash trail
	dashTrail = false;
	if instance_exists(obj_dash_trail)
	    with obj_dash_trail instance_destroy();

	//Stop saber
	saber = false;
	saberID = 0;
	saberTimer = 0;



}
