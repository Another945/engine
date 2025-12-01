/// @description draw_player(alpha, use_shader)
/// @param alpha
/// @param  use_shader
function draw_player(argument0, argument1) {

	var alpha = argument0;
	var useShader = argument1;

	switch character {
	    case(char_x): draw_player_x(alpha,useShader); draw_player_x_armors(); break;
	    case(char_zero): draw_player_zero(alpha,useShader); break;
	}



}
