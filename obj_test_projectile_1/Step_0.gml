/// @description Logic
event_inherited();

if !global.frozen {
    image_speed = 1/3;
    
    x += xspeed;
    y += yspeed;
}
else {
    speed = 0;
}

