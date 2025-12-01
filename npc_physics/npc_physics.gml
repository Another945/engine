/// @description npc_physics()
function npc_physics() {

	/*
	These are pretty much similar to the player's physics, except made
	so the collisions work better for simple enemies.

	The methods of collision here were originally used for the player, but
	ther weren't very reliable for them.
	*/

	//Horisontal Physics
	var canCollide;
	if !place_meeting(x, y+yspeed+4, obj_collision_slope)
	|| (place_meeting(x, y+yspeed+4, obj_collision_slope)
	&& (collision_rectangle(bbox_left-(4+abs(xspeed)),bbox_top,bbox_right+(4+abs(xspeed)),bbox_bottom-4,obj_collision_solid,0,1))
	|| collision_rectangle(bbox_left-(4+abs(xspeed)),bbox_top,bbox_right+(4+abs(xspeed)),bbox_bottom-4,prt_moving_solid,0,1))
	    canCollide = true;
	else
	    canCollide = false;
    
	var mysolid = instance_place(x+xspeed+1, y, obj_collision_solid);
	var mymoving = instance_place(x+xspeed+6, y, prt_moving_solid);

	if mysolid && xspeed > 0 && canCollide {
	    xspeed = 0;
	    canMoveRight = false;
    
	    while !place_meeting(x+1,y,obj_collision_solid)
	        x++;
	    while place_meeting(x,y,obj_collision_solid)
	        x--;
	}

	if mymoving && canCollide {
	    if (state == state_wall || (state != state_wall && xspeed >= mymoving.xspeed)) {
	        xspeed = 0;
	        canMoveRight = false;
        
	        x = (mymoving.bbox_left - (bbox_right-x)) - (2-mymoving.xspeed);
	        y += mymoving.yspeed;
	    }
	    else
	        canMoveRight = true;
    
	}

	if !mysolid && !mymoving {
	    canMoveRight = true;
	}

	var mysolid = instance_place(x+xspeed-1, y, obj_collision_solid);
	var mymoving = instance_place(x+xspeed-6, y, prt_moving_solid);

	if mysolid && xspeed < 0 && canCollide {
	    xspeed = 0;
	    canMoveLeft = false;
    
	    while !place_meeting(x-1,y,obj_collision_solid)
	        x--;
	    while place_meeting(x,y,obj_collision_solid)
	        x++;
	}

	if mymoving && canCollide {
	    if (state == state_wall || (state != state_wall && xspeed <= mymoving.xspeed)) {
	        xspeed = 0;
	        canMoveLeft = false;
        
	        x = (mymoving.bbox_right + (x-bbox_left)) + (2+mymoving.xspeed);
	        y += mymoving.yspeed;
	    }
	    else
	        canMoveLeft = true;
	}

	if !mysolid && !mymoving {
	    canMoveLeft = true;
	}

	//Allow X movement
	if canMoveRight && canMoveLeft {
	    x += xspeed;
	}

	//Verticle Physics
	var myground = instance_place(x, y+yspeed+groundPixels, obj_collision_solid);
	var mymoving = instance_place(x, y+yspeed+4, prt_moving_solid);
	var mysemi = instance_place(x, y+yspeed+groundPixels, obj_collision_semisolid);
	var myslope = instance_place(x, y+yspeed+1+(abs(xspeed)/2), obj_collision_slope);

	if myslope && yspeed >= 0 {
	    yspeed = 0;
	    ground = true;
	    groundPixels = 3;
	    while !place_meeting(x, y+1, obj_collision_slope)
	        y++;
	    while place_meeting(x, y, obj_collision_slope)
	        y--;
	}

	//Normal solid ground
	if myground && yspeed >= 0 && !myslope {
	    yspeed = 0;
	    ground = true;
	    groundPixels = 1;
    
	    while !place_meeting(x, y+1, obj_collision_solid)
	        y++;
	    while place_meeting(x, y, obj_collision_solid)
	        y--;
	}

	//Moving solid ground
	if mymoving && !myslope {
	    groundPixels = 1;
	    y = (mymoving.bbox_top - (bbox_bottom-y)) - (2-mymoving.yspeed);
	    x += mymoving.xspeed;
	    if place_meeting(x, y+yspeed+1, prt_moving_solid) && yspeed >= mymoving.yspeed {
	        yspeed = 0;
	        ground = true;
	    }
	}

	//Semi solid ground
	if mysemi && yspeed >= 0 && !myslope {
	    if bbox_bottom < mysemi.bbox_top+2 {
	        yspeed = 0;
	        ground = true;
	        groundPixels = 1;
	        while !place_meeting(x, y+1, obj_collision_semisolid)
	            y++
	        while place_meeting(x, y, obj_collision_semisolid)
	            y--
	    }
	    else
	        ground = false;
	}

	if !myground && !mymoving && !mysemi && !myslope
	    ground = false;

	if place_meeting(x, y+yspeed-1, obj_collision_solid) && yspeed <= 0 {
	    yspeed = grav;
	    while !place_meeting(x, y-1, obj_collision_solid)
	        y--;
	}

	if place_meeting(x, y+yspeed+1, prt_moving_solid) && yspeed <= 0 {
	    yspeed = grav;
	}

	//Gravity
	if !ground {
	    groundPixels = 1;
	    yspeed = min(yspeed+(grav*canGrav), fallSpeed);
	    y += yspeed;
	}



}
