/// @description Draw the boss and it's name

draw_set_text(global.font[font_mmx4],1,c_white,fa_center,fa_center);

draw_text(room_width/2,room_height/2, string_hash_to_newline(name));

