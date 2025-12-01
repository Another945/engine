/// @description Trigger checkpoint

global.checkpoint = true;

//Save position (must be set in creative code).
global.saveX = myX;
global.saveY = myY;

//Save the camera settings.
global.camera_saveX[0] = obj_camera.camera_setX[0];
global.camera_saveY[0] = obj_camera.camera_setY[0];
global.camera_saveX[1] = obj_camera.camera_setX[1];
global.camera_saveY[1] = obj_camera.camera_setY[1];

