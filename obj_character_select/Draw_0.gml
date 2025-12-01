/// @description Draw the players

draw_set_text(global.font[font_mmx4], 1, c_white, fa_center, fa_center);
draw_text(room_width/2, 48, string_hash_to_newline("PLAYER SELECT"));

//Draw the cursor
var X;
if option == 0
    X = (room_width/2)-32;
else
    X = (room_width/2)+32;
draw_sprite(spr_character_select_cursor, floor(cursorIndex), X, room_height/2);

//Draw the character sprites
draw_sprite(spr_x_stand, 0, (room_width/2)-32, (room_height/2)+8);
draw_sprite(spr_zero_stand, 0, (room_width/2)+32, (room_height/2)+8);

