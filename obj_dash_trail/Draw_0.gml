/// @description Draw the silouettes

var col;
switch global.character {
    case(char_x):
        switch ID {
            case(0): col = make_colour_rgb(24, 64, 160); break;
            case(1): col = make_colour_rgb(0, 40, 120); break;
            case(2): col = make_colour_rgb(0, 16, 96); break;
        }
    break;
    
    case(char_zero):
        switch ID {
            case(0): col = make_colour_rgb(144, 8, 0); break;
            case(1): col = make_colour_rgb(112, 0, 0); break;
            case(2): col = make_colour_rgb(72, 0, 0); break;
        }
    break;
}

draw_set_blend_mode(bm_add);
d3d_set_fog(true, col, 0, 0);
draw_self();
d3d_set_fog(false, c_white, 0, 0);
draw_set_blend_mode(bm_normal);

