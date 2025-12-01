/// @description player_dash_trail()
function player_dash_trail() {

	if dashTrail {
	    dashTrailTimer++;
	    dashTrailEndTimer = 0;
	}
	else {
	    dashTrailTimer++;
	    dashTrailEndTimer++;
	    if dashTrailEndTimer >= dashTrailEndFrames {
	        dashTrailEndTimer = dashTrailEndFrames+1;
	        dashTrailTimer = 0;
        
	        if instance_exists(obj_dash_trail) {
	            with obj_dash_trail instance_destroy();
	        }
	    }
	}

	if state == state_dash && dashTimer <= 9
	    dashTrailFast = true;

	if dashTrailTimer > 0 {
	    if dashTrail {
	        if dashTrailFast {
	            dashTrailI = min(dashTrailI+1, 3);
	            dashTrailInterval = min(dashTrailInterval+1, 3);
	        }
	        else {
	            dashTrailI = min(dashTrailI+1, 5);
	            dashTrailInterval = min(dashTrailInterval+1, 5);
	        }
	    }
	    else {
	        dashTrailI = max(dashTrailI-1,2);
	        dashTrailInterval = max(dashTrailInterval-1,2);
	    }
	    if dashTrailTimer >= dashTrailInterval+1 {
	        if instance_number(obj_dash_trail) < 3 {
	            with instance_create(x, y, obj_dash_trail) ID = instance_number(obj_dash_trail)-1;
	        }
        
	        if instance_exists(obj_dash_trail) {
	            with obj_dash_trail event_user(0);
	        }
        
	        dashTrailTimer = 1;
	        dashTrailFast = false;
	    }
	}

	if state != state_dash && !dashJumping
	    dashTrail = false;



}
