/// @description Draw Debug info

draw_set_text(global.font[font_mmx4],0.75,c_white,fa_left,fa_top);
var X = __view_get( e__VW.XView, 0 );
var Y = __view_get( e__VW.YView, 0 );

if instance_exists(prt_player) {
    draw_text(X,Y, string_hash_to_newline("STATE "+string(prt_player.state)));
    draw_text(X,Y+16, string_hash_to_newline("DASH STATE "+string(prt_player.dashState)));
    draw_text(X,Y+32, string_hash_to_newline("DASH TIMER "+string(prt_player.dashTimer)));
    draw_set_colour(c_white);
    if !prt_player.airDashing
        draw_set_colour(c_red);
    draw_text(X+128,Y+16, string_hash_to_newline("AIR DASHING"));
    
    draw_set_colour(c_white);
    if !prt_player.canMoveRight
        draw_set_colour(c_red);
    draw_text(X,Y+64, string_hash_to_newline("CAN MOVE RIGHT"));
    
    draw_set_colour(c_white);
    if !prt_player.canMoveLeft
        draw_set_colour(c_red);
    draw_text(X,Y+80, string_hash_to_newline("CAN MOVE LEFT"));
    
    draw_set_colour(c_white);
    draw_text(X,Y+112, string_hash_to_newline("XSPEED "+string(prt_player.xspeed)));
    draw_text(X,Y+128, string_hash_to_newline("YSPEED "+string(prt_player.yspeed)));
    
    draw_set_colour(c_white);
    if !prt_player.ground
        draw_set_colour(c_red);
    draw_text(X,Y+154, string_hash_to_newline("GROUND"));
    
    draw_set_colour(c_white);
    draw_text(X, Y+170, string_hash_to_newline("DIR "+string(prt_player.image_xscale)));
    
    draw_text(X, Y+192, string_hash_to_newline("MASK "+string(mask_index)));
    
    if instance_exists(prt_enemy) {
        var myX = instance_nearest(x, y, prt_enemy).x;
        var myY = instance_nearest(x, y, prt_enemy).y;
        draw_text(X+240, Y, string_hash_to_newline(string(myX)));
        draw_text(X+240, Y+16, string_hash_to_newline(string(myY)));
    }
    
    draw_text(X+200,Y+32, string_hash_to_newline("CHARGE "+string(prt_player.chargeTimer)));
}

