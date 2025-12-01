/// @description Draw the solid

if flash {
    flashTimer++;
    if flashTimer >= flashFrames {
        flashTimer = 0;
        flash = false;
    }
    
    if flashTimer >= flashFrames-1 {
        if die {
            event_user(0);
            dead = true;
        }
    }
}

if !flash || flashTimer >= flashFrames-1 {
    draw_self();
}
else {
    d3d_set_fog(true,c_white,0,0);
    draw_self();
    d3d_set_fog(false,c_white,0,0);
}

