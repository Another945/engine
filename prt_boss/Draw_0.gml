/// @description Draw the boss

if function_state != -1 {
    if iTimer > 0 {
        if !global.frozen {
            if function_state != 2
                flashTimer++;
            else
                flashTimer += 0.25;
        }
    }
    if !flash || (flash && flashTimer == flashFrames-1) {
        draw_self();
    }
    else {
        d3d_set_fog(true,c_white,0,0);
        draw_self();
        d3d_set_fog(false,c_white,0,0);
        
        if flashTimer >= flashFrames
            flashTimer = 0;
    }
}

