/// @description draw_player_x(alpha, use_shader)
/// @param alpha
/// @param  use_shader
function draw_player_x(argument0, argument1) {

	var spriteAlpha = argument0;

	if argument1 == true
	    palette_set_x(global.weapon)

	draw_sprite_ext(sprite_index,floor(image_index),round(x),round(y),image_xscale,image_yscale,image_angle,image_blend,spriteAlpha);

	draw_player_x_armors();

	if argument1 == true
	    shader_reset();



}
