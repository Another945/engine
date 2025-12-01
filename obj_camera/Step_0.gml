/// @description Move the camera

if !initiate {

    if instance_exists(prt_player) && !global.disableCamera {
        var viewSpeed;
        if abs(prt_player.xspeed) < 4
            viewSpeed = moveSpeed;
        else
            viewSpeed = moveSpeed * 2;
        if xview < camera_setX[0]
            xview = min(xview+(max(viewSpeed,prt_player.xspeed)),camera_setX[0]);
        else if xview > camera_setX[1]-__view_get( e__VW.WView, 0 )
            xview = max(xview-(max(viewSpeed,-prt_player.xspeed)),camera_setX[1]-__view_get( e__VW.WView, 0 ));
        else {
            var targetX = prt_player.x-(__view_get( e__VW.WView, 0 )/2);
            if xview < targetX {
                xview = min(xview+(max(viewSpeed,prt_player.xspeed)),targetX);
                xview = min(xview, camera_setX[1]-__view_get( e__VW.WView, 0 ));
            }
            else if xview > targetX {
                xview = max(xview-(max(viewSpeed,-prt_player.xspeed)),targetX);
                xview = max(xview, camera_setX[0]);
            }
            else
                xview = targetX;
        }
        
        var viewSpeed;
        if abs(prt_player.yspeed) < 4
            viewSpeed = moveSpeed;
        else
            viewSpeed = moveSpeed * 2;
        if yview < camera_setY[0]
            yview = min(yview+(max(viewSpeed,-prt_player.yspeed)),camera_setY[0]);
        else if yview > camera_setY[1]-__view_get( e__VW.HView, 0 )
            yview = max(yview-(max(viewSpeed,prt_player.yspeed)),camera_setY[1]-__view_get( e__VW.HView, 0 ));    
        else {
            var targetY = prt_player.y;
            if targetY < yview+80 {
                yview = max(yview-(max(viewSpeed,-prt_player.yspeed)),targetY-80);
                yview = max(yview, camera_setY[0]);
            }
            else if targetY > yview+(__view_get( e__VW.HView, 0 )-80) {
                yview = min(yview+(max(viewSpeed,prt_player.yspeed)),(targetY+80)-__view_get( e__VW.HView, 0 ));
                yview = min(yview, camera_setY[1]-__view_get( e__VW.HView, 0 ));
            }
        }
        
        __view_set( e__VW.XView, 0, round(xview) );
        __view_set( e__VW.YView, 0, round(yview) );
    }
    else {
        //We still need this camera to keep track of where the
        //game camera is, so when it's enabled, it won't cut the camera to
        //where it was before being disabled.
        xview = __view_get( e__VW.XView, 0 );
        yview = __view_get( e__VW.YView, 0 );
    }

}

