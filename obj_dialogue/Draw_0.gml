/// @description Draw the dialogue

var X = __view_get( e__VW.XView, 0 )+24+2;
var Y = __view_get( e__VW.YView, 0 )+16+4;

draw_set_alpha(boxAlpha);
draw_set_blend_mode(bm_add);
draw_rectangle_colour(__view_get( e__VW.XView, 0 )+24,__view_get( e__VW.YView, 0 )+16,__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )-24),__view_get( e__VW.YView, 0 )+96,c_aqua,c_aqua,c_blue,c_blue,false);
draw_set_blend_mode(bm_normal);

draw_set_text(global.font[font_mmx4], 1, c_white, fa_left, fa_top);

if state == 1 {
    draw_text(X,Y,string_hash_to_newline(string(name[currentText])));
    draw_text(X,Y+16,string_hash_to_newline(string(drawText)));
}

