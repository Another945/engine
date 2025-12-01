/// @description Draw the enemy

if !dead {
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
}

/*
draw_set_text(global.font[font_mmx4],1,c_white,fa_center,fa_center);
draw_text(x, y, string(dead));
draw_text(x-16, y-16, string(xstart));
draw_text(x+16, y-16, string(ystart));
draw_text(x-16, y-32, string(x));
draw_text(x+16, y-32, string(y));
*/

/* */
/*  */
