/// @description Boss door parent

accessSide = -1; //1 = right/down, -1 = left/up
dir = "h";

state = 0;
timer = 0;

image_speed = 0;
image_index = 0;

scrollFrames = 120;

mySolid = -1;
alarm[0] = 1; //Create solid collision.

//Default camera settings
camsetx[0] = x+16;
camsetx[1] = x+16+320;
camsety[0] = 0;
camsety[1] = room_height;

