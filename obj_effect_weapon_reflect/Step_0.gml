/// @description Animation

if !global.frozen {
    if floor(image_index) <= 1
        image_speed = 1;
    else
        image_speed = 1/2;
}
else
    image_speed = 0;

