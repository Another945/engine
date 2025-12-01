/// @description Draw

draw_set_text(global.font[font_mmx4],1,c_white, fa_left, fa_top);

var X = (room_width/2)-128;
var X2 = (room_width/2)+128;
var Y = 32;
var spacing = 24;
for(var i = 0; i <= optionMax; i++) {
    if i == option
        draw_set_colour(c_white);
    else
        draw_set_colour(c_gray);
    draw_text(X, Y+(i*spacing), string_hash_to_newline(string(menu[i])));
}

draw_set_colour(c_gray);
if option == 1
    draw_set_colour(c_white);
draw_set_halign(fa_right);
var size;
switch global.screen_size {
    case(0): size = "x1"; break;
    case(1): size = "x2"; break;
    case(2): size = "x3"; break;
    case(3): size = "x4"; break;
    case(4): size = "Full"; break;
}
draw_text(X2, Y+(1*spacing), string_hash_to_newline(string(size)));

draw_set_colour(c_gray);
if option == 3
    draw_set_colour(c_white);
draw_set_halign(fa_right);
draw_text(X2, Y+(3*spacing), string_hash_to_newline(string(bgm)));

var diffName;
switch global.difficulty {
    case(diff_easy): diffName = "EASY"; break;
    case(diff_normal): diffName = "NORMAL"; break;
    case(diff_xtreme): diffName = "XTREME"; break;
}

draw_set_colour(c_gray);
if option == 4
    draw_set_colour(c_white);
draw_set_halign(fa_right);
var text;
if global.bgm_on { text = "ON"; } else { text = "OFF"; }
draw_text(X2, Y+(4*spacing), string_hash_to_newline(text));

draw_set_colour(c_gray);
if option == 5
    draw_set_colour(c_white);
draw_set_halign(fa_right);
var text;
if global.sfx_on { text = "ON"; } else { text = "OFF"; }
draw_text(X2, Y+(5*spacing), string_hash_to_newline(text));

draw_set_colour(c_gray);
if option == 0
    draw_set_colour(c_white);
draw_set_halign(fa_right);
draw_text(X2, Y+(0*spacing), string_hash_to_newline(string(diffName)));

draw_set_colour(c_white);

