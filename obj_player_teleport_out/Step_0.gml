/// @description Logic

if sprite_index == spr_x_teleport_out
    image_speed = 1/4;
else
    image_speed = 1/2;
    
if image_index >= image_number-1 {
    image_index = image_number-1;
    y -= 8;
}

