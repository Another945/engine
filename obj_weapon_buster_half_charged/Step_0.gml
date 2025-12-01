/// @description Buster Logic
event_inherited();

if !global.frozen {
    image_speed = 1/3;
    if !stuckToPlayer {
        visible = true;
        if image_xscale == 1
            xspeed = min(xspeed+acc, spd);
        else if image_xscale == -1
            xspeed = max(xspeed-acc, -spd);
        
        x += xspeed;
    }
}

