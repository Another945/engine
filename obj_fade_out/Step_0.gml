/// @description Fade in

fadeTimer++;
if fadeTimer >= fadeInterval {
    fadeAlpha += fadeAmount;
    fadeTimer = 0;
}

if fadeAlpha >= 1 {
    endTimer++;
    if endTimer >= endFrames {
        if type == 0
            room_goto(myRoom);
        else if type == 1 {
            if instance_exists(prt_player) {
                prt_player.x = myX;
                prt_player.y = myY;
                prt_player.canDie = false;
                prt_player.function_state = 1;
                prt_player.alarm[0] = 2;
            }
            obj_camera.initiate = true;
            obj_camera.alarm[0] = 1;
            if instance_exists(obj_stage_control) {
                obj_stage_control.alarm[0] = 10; //Play the music again if it's not playing.
            }
            instance_create(x, y, obj_fade_in);
            instance_destroy();
        }
    }
}

