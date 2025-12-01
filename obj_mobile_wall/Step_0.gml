/// @description Move
event_inherited();

//Activate if in the current section
if inside_section()
    active = true;

if !global.frozen && active {
    image_speed = 1/16;
    if state == 0 {
        xspeed = 0;
        yspeed = 0;
        startTimer++;
        if startTimer >= startFrames {
            startTimer = 0;
            state = 1;
            
            switch moveDir {
                case(dir_right): xspeed = spd; break;
                case(dir_up): yspeed = -spd; break;
                case(dir_left): xspeed = -spd; break;
                case(dir_down): yspeed = spd; break;
            }
        }
    }
    //Moving
    else if state == 1 {
        if place_meeting(x+xspeed+sign(xspeed), y+yspeed+sign(yspeed), obj_trigger_direction) {
            var mydirection = instance_place(x+xspeed+sign(xspeed), y+yspeed+sign(yspeed), obj_trigger_direction);
            moveDir = mydirection.image_angle/90;
            xspeed = 0;
            yspeed = 0;
            state = 0;
            startTimer = 0;
        }
    }
}
else
    image_speed = 0;

