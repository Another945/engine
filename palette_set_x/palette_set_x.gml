/// @description palette_set_x(palette_index)
/// @param palette_index
function palette_set_x(argument0) {

	var sprite = spr_x_palette;
	var palette = argument0;

	shader_set(sh_replace_color);

	for(var i = 0; i < 7; i++) {
	    if shootTimer <= 12 && shooting {
	        var paletteR = global.palette_x_shoot_R[palette,i];
	        var paletteG = global.palette_x_shoot_G[palette,i];
	        var paletteB = global.palette_x_shoot_B[palette,i];
	    }
	    else {
	        var paletteR = global.palette_x_R[palette,i];
	        var paletteG = global.palette_x_G[palette,i];
	        var paletteB = global.palette_x_B[palette,i];
	    }

	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "in"+string(i)), global.palette_x_R[0,i],global.palette_x_G[0,i],global.palette_x_B[0,i]);
	    shader_set_uniform_f(shader_get_uniform(sh_replace_color, "out"+string(i)),paletteR, paletteG, paletteB);
	}



}
