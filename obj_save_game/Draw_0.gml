/// @description Save game

draw_set_text(global.font[font_mmx4],1,c_white,fa_center,fa_top);

for(var i = 0; i < 3; i++) {
    draw_set_colour(c_white);
    if !menuCan[i]
        draw_set_colour(c_gray);
    draw_text(room_width/2, 64+(i*24),string_hash_to_newline(menu[i]));
}

draw_set_colour(c_yellow);
draw_text(room_width/2, 64+(option*24),string_hash_to_newline(menu[option]));

draw_set_colour(c_white);

