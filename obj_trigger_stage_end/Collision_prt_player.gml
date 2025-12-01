/// @description End the stage

other.function_state = 2;
other.xspeed = 0;
other.yspeed = max(other.yspeed, 0);

if type == 0 {
    fade_to_room(myroom);
}
else {
    other.teleportOut = true;
    global.myRoom = myroom;
}

instance_destroy();

