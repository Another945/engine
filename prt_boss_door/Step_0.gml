/// @description Logic

//Idle
if state == 0 {
    image_speed = 0;
    image_index = 0;
    
    var boxLeft = collision_rectangle(bbox_left,bbox_top,bbox_left+1,bbox_bottom,prt_player,0,1);
    var boxRight = collision_rectangle(bbox_right,bbox_top,bbox_right-1,bbox_bottom,prt_player,0,1);
    var boxTop = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top+1,prt_player,0,1);
    var boxBottom = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom-1,prt_player,0,1);
    
    if (accessSide == -1 && ((dir == "h" && boxLeft) || (dir == "v" && boxTop)))
    || (accessSide == 1 && ((dir == "h" && boxRight) || (dir == "v" && boxBottom))) {
        state = 1;
        timer = 0;
        global.frozen = true;
        
        lock_player(true);
        
        with mySolid instance_destroy();
        
        if instance_exists(prt_player_projectile)
            with prt_player_projectile instance_destroy();
        
        with prt_player dashTrail = false;
        if instance_exists(obj_dash_trail)
            with obj_dash_trail instance_destroy();
        
        if instance_exists(obj_dash_boost)
            with obj_dash_boost instance_destroy();
            
        if instance_exists(obj_dash_dust)
            with obj_dash_dust instance_destroy();
        
        play_sound(sfx_door_open,0.7,false);
    }
}
//Opening
else if state == 1 {
    if floor(image_index) == 8
        image_speed = 1/5;
    else
        image_speed = 1/2;
    
    //Allow the player to charge
    with prt_player {
        if character == char_x
            player_x_charge();
    }
        
    if image_index >= image_number-1 {
        image_index = image_number-1;
        state = 2;
        global.disableCamera = true;
        prt_player.function_state = 3; //Put them in function state 2, where the player can't control the character and no physics are applied.
        
        moveDir = -accessSide;
        
        if dir == "h" {
            if accessSide == -1 {
                scrollSpeed_Cam = (camsetx[0]-__view_get( e__VW.XView, 0 ))/scrollFrames;
                scrollSpeed_Player = (bbox_right+16-prt_player.x)/scrollFrames;
            }
            else {
                scrollSpeed_Cam = ((camsetx[1]-__view_get( e__VW.WView, 0 ))-__view_get( e__VW.XView, 0 ))/scrollFrames;
                scrollSpeed_Player = (bbox_left-16-prt_player.x)/scrollFrames;
            }
        }
        else if dir == "v" {
            if accessSide == -1 {
                scrollSpeed_Cam = (camsety[0]-__view_get( e__VW.YView, 0 ))/scrollFrames;
                scrollSpeed_Player = (bbox_bottom+24-prt_player.y)/scrollFrames;
            }
            else {
                scrollSpeed_Cam = ((camsety[1]-__view_get( e__VW.HView, 0 ))-__view_get( e__VW.YView, 0 ))/scrollFrames;
                scrollSpeed_Player = (bbox_top-16-prt_player.y)/scrollFrames;
            }
        }
    }
}
//Scrolling the camera, moving the player
else if state == 2 {
    image_speed = 0;
    
    //Test code
    var timesSpeed;
    if (dir == "h" && moveDir == 1 && prt_player.x >= __view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2))
    || (dir == "h" && moveDir == -1 && prt_player.x <= __view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2))
    || (dir == "v" && moveDir == 1 && prt_player.y >= __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2))
    || (dir == "v" && moveDir == -1 && prt_player.y <= __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2))
        timesSpeed = 2;
    else
        timesSpeed = 1;
        
    if dir == "h" {
        if moveDir == 1 {
            __view_set( e__VW.XView, 0, min(__view_get( e__VW.XView, 0 )+(scrollSpeed_Cam * (timesSpeed)),camsetx[0]) );
            prt_player.x = min(prt_player.x+(scrollSpeed_Player * (timesSpeed)), bbox_right+16);
        }
        else {
            __view_set( e__VW.XView, 0, max(__view_get( e__VW.XView, 0 )-(scrollSpeed_Cam * (timesSpeed)),camsetx[1]-__view_get( e__VW.WView, 0 )) );
            prt_player.x = max(prt_player.x-(scrollSpeed_Player * (timesSpeed)), bbox_left-16);
        }
        
        if __view_get( e__VW.YView, 0 ) < camsety[0]
            __view_set( e__VW.YView, 0, min(__view_get( e__VW.YView, 0 )+1, camsety[0]) );
            
        if __view_get( e__VW.YView, 0 ) > camsety[1]-__view_get( e__VW.HView, 0 )
            __view_set( e__VW.YView, 0, max(__view_get( e__VW.YView, 0 )-1, camsety[1]-__view_get( e__VW.HView, 0 )) );
    }
    else if dir == "v" {
        if moveDir == 1 {
            __view_set( e__VW.YView, 0, min(__view_get( e__VW.YView, 0 )+(scrollSpeed_Cam * (timesSpeed)),camsety[0]) );
            prt_player.y = min(prt_player.y+(scrollSpeed_Player * (timesSpeed)), bbox_bottom+24);
        }
        else {
            __view_set( e__VW.YView, 0, max(__view_get( e__VW.YView, 0 )-(scrollSpeed_Cam * (timesSpeed)),camsety[1]-__view_get( e__VW.HView, 0 )) );
            prt_player.y = max(prt_player.y-(scrollSpeed_Player * (timesSpeed)), bbox_top-16);
        }
        
        if __view_get( e__VW.XView, 0 ) < camsetx[0]
            __view_set( e__VW.XView, 0, min(__view_get( e__VW.XView, 0 )+1, camsetx[0]) );
            
        if __view_get( e__VW.XView, 0 ) > camsetx[1]-__view_get( e__VW.WView, 0 )
            __view_set( e__VW.XView, 0, max(__view_get( e__VW.XView, 0 )-1, camsetx[1]-__view_get( e__VW.WView, 0 )) );
    }
    
    //Animate the player. Since the player is frozen, we will have to do this.
    with prt_player {
        switch prt_player.character {
            case(char_x): sprite_animations_x(); break;
            case(char_zero): sprite_animations_zero(); break;
        }
        player_dash_trail();
        
        //Allow the player to charge
        with prt_player {
            if character == char_x
                player_x_charge();
        }
    }
    
    if (dir == "h" && moveDir == 1 && __view_get( e__VW.XView, 0 ) == camsetx[0])
    || (dir == "h" && moveDir == -1 && __view_get( e__VW.XView, 0 ) == camsetx[1]-__view_get( e__VW.WView, 0 ))
    || (dir == "v" && moveDir == 1 && __view_get( e__VW.YView, 0 ) == camsety[0])
    || (dir == "v" && moveDir == -1 && __view_get( e__VW.YView, 0 ) == camsety[1]-__view_get( e__VW.HView, 0 )) {
        state = 3;
        play_sound(sfx_door_close,0.7,false);
        prt_player.function_state = 1;
    }
}
//Closing
else if state == 3 {
    image_speed = -(1/3);
    
    //Allow the player to charge
    with prt_player {
        if character == char_x
            player_x_charge();
    }
    
    if floor(image_index) <= 0 {
        image_index = 0;
        state = 0;
        global.disableCamera = false;
        global.frozen = false;
        
        lock_player(false);
        
        with prt_player {
            if state == state_dash {
                state = state_normal;
                xspeed = 0;
                yspeed = 0;
                
                dashTimer = 0;
                canGrav = true;
            }
            
            if state == state_wall {
                canGrav = true;
                image_xscale = -image_xscale;
            }
        }
        
        alarm[0] = 1;
        
        //Left-Top border
        obj_camera.camera_setX[0] = camsetx[0];
        obj_camera.camera_setY[0] = camsety[0];
        
        //Right-Bottom border
        obj_camera.camera_setX[1] = camsetx[1];
        obj_camera.camera_setY[1] = camsety[1];
    }
}

