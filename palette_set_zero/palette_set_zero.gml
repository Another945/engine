/// @description palette_set_zero(palette_index)
/// @param palette_index
function palette_set_zero(argument0) {

	var sprite = spr_zero_palette;
	var palette = argument0;

	shader_set(sh_replace_color);

	for(var i = 0; i < 7; i++) {
	    var paletteR = global.palette_zero_R[palette,i];
	    var paletteG = global.palette_zero_G[palette,i];
	    var paletteB = global.palette_zero_B[palette,i];

	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "in"+string(i)), global.palette_zero_R[0,i],global.palette_zero_G[0,i],global.palette_zero_B[0,i]);
	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "out"+string(i)),paletteR, paletteG, paletteB);
	}



}
