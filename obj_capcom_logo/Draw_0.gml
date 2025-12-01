/// @description Draw logo and disclaimer

draw_self();

draw_set_text(global.font[font_mmx4], 1, c_white, fa_center, fa_middle);

draw_text(room_width/2,(room_height/2)+32, string_hash_to_newline(text));

