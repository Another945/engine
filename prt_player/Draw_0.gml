/// @description Draw the player

if chargeTimer >= chargeFrames[0] {
    if chargeDefault
        palette_set_x_charge(0);
    else
        palette_set_x_charge(global.weapon);
    if chargeTimer >= chargeFrames[1]
        draw_sprite_ext(spr_x_charging_glow,chargeIndex,x,y,1,1,0,c_white,1);
    draw_sprite_ext(spr_x_charging_orbs,chargeIndex,x,y,1,1,0,c_white,1);
    shader_reset();
}

if function_state == 0 {
    if character == char_zero
        palette_set_zero(global.armor[armor_black]);
        
    draw_sprite_ext(sprite_index, image_index, x, teleportY, 1, 1, 0, c_white, 1);
    
    if character == char_x {
        if floor(image_index) >= 15
            draw_player_x_armors();
    }
    
    shader_reset();
}
else {
    d3d_set_fog(false,c_white,0,0);
    if recovering && recoveryTimer mod 3 == 1
        d3d_set_fog(true,c_white,0,0);
    draw_player(1,false);
    d3d_set_fog(false,c_white,0,0);
    //If flashing, draw the player with less alpha on top of the flash. This should make
    //it less flashy. (Note: You can't change the alpha of the fog, so we have to do this)
    if recovering && recoveryTimer mod 3 == 1
        draw_player(0.25,true);
    else
        draw_player(1, true);
        
    //Draw charge colour
    if function_state != 0 && chargeTimer > chargeFrames[0] && chargeTimer mod 6 == 1 {
        var col;
        if chargeTimer < chargeFrames[1]
            col = make_colour_rgb(global.palette_x_R[global.weapon,0],global.palette_x_G[global.weapon,0],global.palette_x_B[global.weapon,0]);
        else if chargeTimer >= chargeFrames[1] && chargeTimer < chargeFrames[2]
            col = make_colour_rgb(145,255,145);
        else
            col = c_fuchsia;
            
        d3d_set_fog(true,col,0,0);
        draw_player(1,false);
        draw_set_blend_mode(bm_normal);
        d3d_set_fog(false,c_white,0,0);
        draw_player(0.25,true);
    }
    else {
        if !(recovering && recoveryTimer mod 3 == 1)
            draw_player(1, true);
    }
}

draw_set_alpha(1);
draw_set_colour(c_white);

