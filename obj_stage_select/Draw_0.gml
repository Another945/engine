/// @description Draw stage select
var centerX = room_width/2;

for(var i = 0; i < 8; i++) {
    X[0] = centerX-96; Y[0] = 48;
    X[1] = centerX-32; Y[1] = 48;
    X[2] = centerX+32; Y[2] = 48;
    X[3] = centerX+96; Y[3] = 48;
    X[4] = centerX-96; Y[4] = room_height-48;
    X[5] = centerX-32; Y[5] = room_height-48;
    X[6] = centerX+32; Y[6] = room_height-48;
    X[7] = centerX+96; Y[7] = room_height-48;
    
    var iconCol;
    iconCol = c_white;
    if global.boss_defeated[i]
        iconCol = c_dkgray;
    draw_sprite_ext(spr_stage_select_icons,i,X[i],Y[i],1,1,0,iconCol,1);
}

if canSelectFinal
    draw_sprite_ext(spr_stage_select_final,0,room_width/2,room_height/2,1,1,0,c_white,1);

if !optionFinal
    draw_sprite_ext(spr_stage_select_cursor,floor(cursorIndex),X[option],Y[option],1,1,0,c_white,1);
else
    draw_sprite_ext(spr_stage_select_cursor,floor(cursorIndex),room_width/2,room_height/2,1,1,0,c_white,1);

if state == 1 {
    var boxX = 32;
    var boxY = 128;
    
    draw_set_alpha(0.75);
    draw_set_blend_mode(bm_add);
    draw_rectangle_colour(boxX,boxY,boxX+96,boxY+64,c_aqua,c_aqua,c_blue,c_blue,false);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    switch character {
        case(char_x): draw_text(boxX+16,boxY+16,string_hash_to_newline("X")); break;
        case(char_zero): draw_text(boxX+16,boxY+16,string_hash_to_newline("Zero")); break;
    }
}

