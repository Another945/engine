/// @description palette_add_zero()
function palette_add_zero() {

	//Loads palettes for Zero

	var sprite = spr_zero_palette;
	var colours = sprite_get_height(sprite);

	var sets = sprite_get_width(sprite);
	var surf = surface_create(sets, colours);
	surface_set_target(surf);

	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_sprite(sprite, 0, 0, 0);

	for(var i = 0; i < sets; i++) {
	    for(var j = 0; j < colours; j++) {
	        col = surface_getpixel(surf,i,j)
	        global.palette_zero_R[i,j] = colour_get_red(col);
	        global.palette_zero_G[i,j] = colour_get_green(col);
	        global.palette_zero_B[i,j] = colour_get_blue(col);
	    }
	}

	surface_reset_target();
	surface_free(surf);



}
