/// @description palette_add_zsaber()
function palette_add_zsaber() {

	//Loads palettes for the Z-Saber. Yeah, it has its own palette! Custom saber colours!

	var sprite = spr_zsaber_palette;
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
	        global.palette_zsaber_R[i,j] = colour_get_red(col);
	        global.palette_zsaber_G[i,j] = colour_get_green(col);
	        global.palette_zsaber_B[i,j] = colour_get_blue(col);
	    }
	}

	surface_reset_target();
	surface_free(surf);



}
