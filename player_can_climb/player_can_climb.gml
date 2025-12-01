/// @description player_can_climb()
function player_can_climb() {

	if place_meeting(x, y, obj_collision_ladder) && !noLadder
	&& global.keyUp {
	    climbXscale = image_xscale;
	    state = state_climb;
	    climbState = 0;
	    climbTimer = 0;
	    dashTrail = false;
	}



}
