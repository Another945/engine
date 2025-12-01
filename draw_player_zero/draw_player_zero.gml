/// @description draw_player_x(alpha, use_shader)
/// @param alpha
/// @param  use_shader
function draw_player_zero(argument0, argument1) {

	var spriteAlpha = argument0;

	if argument1 == true
	    palette_set_zero(global.armor[armor_black])

	draw_sprite_ext(sprite_index,floor(image_index),round(x),round(y),image_xscale,image_yscale,image_angle,image_blend,spriteAlpha);

	if argument1 == true
	    shader_reset();



}
