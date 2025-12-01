/// @description Test 1 Logic
event_inherited();

if !global.frozen {
    image_speed = 1/3;
    xspeed = spd * image_xscale;
    x += xspeed;
    y += yspeed;
}

