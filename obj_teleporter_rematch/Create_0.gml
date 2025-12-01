type = 0;
/*
0 = takes you to another area.
1 = takes you to a different room.
2 = takes you to the save screen and adds to the global.endStage.
*/
myRoom = rm_beta_final;

state = 0;
timer = 0;

//Boss ID
ID = 0;
alarm[0] = 2;

//Position
myX = 0;
myY = 0;

//Camera
camsetx[0] = 0;
camsety[0] = 0;

camsetx[1] = room_width;
camsety[1] = room_height;

camdestx = 0;
camdesty = 0;

/* */
/*  */
