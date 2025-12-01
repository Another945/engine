/// @description This object controls the camera

xview = __view_get( e__VW.XView, 0 );
yview = __view_get( e__VW.YView, 0 );

//Left-Top border
camera_setX[0] = 0;
camera_setY[0] = 0;

//Right-Bottom border
camera_setX[1] = room_width;
camera_setY[1] = room_height;

if global.checkpoint {
    //Left-Top border
    camera_setX[0] = global.camera_saveX[0];
    camera_setY[0] = global.camera_saveY[0];
    
    //Right-Bottom border
    camera_setX[1] = global.camera_saveX[1];
    camera_setY[1] = global.camera_saveY[1];
}

moveSpeed = 4;
camera_moveX = true;
camera_moveY = true;

initiate = true;
alarm[0] = 2;

