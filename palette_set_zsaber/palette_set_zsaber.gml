/// @description palette_set_zsaber(palette_index)
/// @param palette_index
function palette_set_zsaber(argument0) {

	var sprite = spr_zsaber_palette;
	var palette = argument0;

	shader_set(sh_replace_color);

	for(var i = 0; i < 10; i++) {
	    var paletteR = global.palette_zsaber_R[palette,i];
	    var paletteG = global.palette_zsaber_G[palette,i];
	    var paletteB = global.palette_zsaber_B[palette,i];

	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "in"+string(i)), global.palette_zsaber_R[0,i],global.palette_zsaber_G[0,i],global.palette_zsaber_B[0,i]);
	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "out"+string(i)),paletteR, paletteG, paletteB);
	}



}
