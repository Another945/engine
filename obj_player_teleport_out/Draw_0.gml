/// @description Draw

//Set palette
switch global.character {
    case(0): shooting = false; shootTimer = 0; palette_set_x(global.weapon); break;
    case(1): palette_set_zero(global.armor[armor_black]); break;
}

//Draw sprite
draw_sprite_ext(sprite_index,floor(image_index),round(x),round(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Reset shader
shader_reset();

