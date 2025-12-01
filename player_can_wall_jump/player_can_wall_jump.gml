/// @description player_can_wall_jump()
function player_can_wall_jump() {

	//Wall jump
	if (!canMoveLeft)
	|| (!canMoveRight) {
	    if global.keyJumpPressed && yspeed > -jumpSpeed && !noWallBox {
	        if !canMoveLeft
	            wallDir = -1;
	        else if !canMoveRight
	            wallDir = 1;
	        image_xscale = wallDir;
	        state = state_wall;
	        wallTimer = 0;
	        wallState = 3;
	        if !global.keyDash
	            dashJumping = false;
	        else
	            dashJumping = true;
	    }
	}



}
