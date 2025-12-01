/// @description palette_set_x_charge(palette_index)
/// @param palette_index
function palette_set_x_charge(argument0) {

	var sprite = spr_x_charge_palette;
	var palette = argument0;

	shader_set(sh_replace_color);

	for(var i = 0; i < 7; i++) {
	    var paletteR = global.palette_x_charge_R[palette,i];
	    var paletteG = global.palette_x_charge_G[palette,i];
	    var paletteB = global.palette_x_charge_B[palette,i];

	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "in"+string(i)), global.palette_x_charge_R[0,i],global.palette_x_charge_G[0,i],global.palette_x_charge_B[0,i]);
	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "out"+string(i)),paletteR, paletteG, paletteB);
	}



}
