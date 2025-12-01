/// @description palette_add_x(palette_sprite)
/// @param palette_sprite
function palette_add_x() {

	//Loads palettes for Megaman X

	var sprite = spr_x_palette;
	var colours = sprite_get_height(sprite);

	var sets = sprite_get_width(sprite);
	var surf = surface_create(sets, colours);
	surface_set_target(surf);

	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_sprite(sprite, 0, 0, 0);

	for(var i = 0; i < sets; i++) {
	    for(var j = 0; j < colours/2; j++) {
	        col = surface_getpixel(surf,i,j)
	        global.palette_x_R[i,j] = colour_get_red(col);
	        global.palette_x_G[i,j] = colour_get_green(col);
	        global.palette_x_B[i,j] = colour_get_blue(col);
        
	        col = surface_getpixel(surf,i,j+(colours/2))
	        global.palette_x_shoot_R[i,j] = colour_get_red(col);
	        global.palette_x_shoot_G[i,j] = colour_get_green(col);
	        global.palette_x_shoot_B[i,j] = colour_get_blue(col);
	    }
	}

	surface_reset_target();
	surface_free(surf);



}
