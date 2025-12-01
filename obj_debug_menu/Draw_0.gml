/// @description Draw

draw_set_text(global.font[font_mmx4],1,c_white,fa_left,fa_top);

draw_text(32, __view_get( e__VW.YView, 0 ), string_hash_to_newline(string(character)));

for(var i = 0; i < menuOptions[page]; i++) {
    if i == option
        draw_set_colour(c_yellow);
    else
        draw_set_colour(c_white);
    draw_text(32, 32+(i*16), string_hash_to_newline(string(menu[page,i])));
}

draw_set_colour(c_white);

