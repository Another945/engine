/// @description player_physics()
function player_physics() {

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
	var mymoving = instance_place(x+xspeed+10, y, prt_moving_solid);

	var spacing = sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index);

	if mysolid && xspeed > 0 && canCollide {
	    if collision_rectangle(bbox_right-xspeed,bbox_top,bbox_right+xspeed+1,bbox_bottom-3,mysolid,0,1) {
	        xspeed = 0;
	        canMoveRight = false;
    
	        x = mysolid.bbox_left - spacing;
	    }
	}

	var mymoving2 = -1;
	if mymoving {
	    mymoving2 = instance_place((x+xspeed+1+(image_xscale==1))+abs(mymoving.xspeed), y, prt_moving_solid);
	    if mymoving2 /* && xspeed >= mymoving.xspeed*/
	    && collision_rectangle(bbox_right-xspeed,bbox_top,bbox_right+10,bbox_bottom-3,mymoving,0,1) {
	        canMoveRight = false;
	        xspeed = 0;
	        y += mymoving2.yspeed;
	        x = (mymoving2.bbox_left - spacing)// + myWallMove2.xspeed;
        
	        if mymoving2.xspeed < 0
	            x += mymoving2.xspeed;
	    }
	}

	if !mysolid && mymoving2 <= 0 {
	    canMoveRight = true;
	}

	var mysolid = instance_place(x+xspeed-1, y, obj_collision_solid);
	var mymoving = instance_place(x+xspeed-10, y, prt_moving_solid);

	var spacing = sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index)

	if mysolid && xspeed < 0 && canCollide {
	    if collision_rectangle(bbox_left-xspeed,bbox_top,(bbox_left+xspeed)-1,bbox_bottom-3,mysolid,0,1) {
	        xspeed = 0;
	        canMoveLeft = false;
        
	        x = mysolid.bbox_right + spacing + 1;
	    }
	}

	var mymoving2 = -1;
	if mymoving {
	    mymoving2 = instance_place((x+xspeed-(1+(image_xscale==-1)))-abs(mymoving.xspeed), y, prt_moving_solid);
	    if mymoving2/* && xspeed <= mymoving.xspeed*/
	    && collision_rectangle(bbox_left-xspeed,bbox_top,bbox_left-10,bbox_bottom-3,mymoving,0,1) {
	        canMoveLeft = false;
	        xspeed = 0;
	        y += mymoving2.yspeed;
	        x = (mymoving2.bbox_right + spacing + 1)// + mymoving2.xspeed;
        
	        if mymoving2.xspeed > 0
	            x += mymoving2.xspeed;
	    }
	}

	if !mysolid && mymoving2 <= 0 {
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

	var spacing = sprite_get_height(mask_index) - sprite_get_yoffset(mask_index);

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
	if myground && yspeed > 0 && !myslope {
	    yspeed = 0;
	    ground = true;
	    groundPixels = 1;
    
	    y = myground.bbox_top - spacing;
    
	    while place_meeting(x, y, obj_collision_solid)
	        y--;
	}

	//Moving solid ground
	if mymoving && !myslope {
	    groundPixels = 1;
	    y = (mymoving.bbox_top - spacing) - (2-mymoving.yspeed);
    
	    if (mymoving.xspeed > 0
	    && (!place_meeting(x+xspeed+mymoving.xspeed+1,y,obj_collision_solid) && !place_meeting(x+xspeed+mymoving.xspeed+1,y,prt_moving_solid)))
	    || (mymoving.xspeed < 0
	    && (!place_meeting(x+xspeed+mymoving.xspeed-1,y,obj_collision_solid) && !place_meeting(x+xspeed+mymoving.xspeed-1,y,prt_moving_solid)))
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

	//Ceiling
	if place_meeting(x, y+yspeed-1, obj_collision_solid) && yspeed <= 0 {
	    yspeed = grav;
	    y++;
	}

	//Moving ceiling
	if place_meeting(x, y+yspeed-1, prt_moving_solid) && yspeed <= 0 {
	    yspeed = grav;
	    y++;
	}

	//Gravity
	if !ground {
	    groundPixels = 1;
	    yspeed = min(yspeed+(grav*canGrav), fallSpeed);
	    y += yspeed;
	}

	//Check if the player is in water
	if instance_place(x, y, obj_collision_water) {
	    inWater = true;
    
	    if !place_meeting(x+xspeed+2, y, obj_collision_solid) && !place_meeting(x+xspeed-2, y, obj_collision_solid)
	        x -= xspeed*0.25;
    
	    if !place_meeting(x, y+yspeed+2, obj_collision_solid) && !place_meeting(x, y+yspeed+2, obj_collision_slope)
	    && !place_meeting(x, y+yspeed-2, obj_collision_solid) && !ground
	        y -= yspeed*0.25;
    
	    //When in water, decrease the gravity.
	    //(NOTE: You could probably edit this to allow the player to float upwards
	    //whilst air dashing, an armor feature maybe, because if in water when
	    //"canGrav" is off, the game will still minus gravitation.)
	    if !ground && canGrav
	        yspeed -= grav*0.5;
	}
	else
	    inWater = false;



}
