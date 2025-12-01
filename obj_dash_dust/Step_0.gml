if !global.frozen
{
    image_speed = 1/3;
    if floor(image_index) == 1
        image_speed = 1/10;
    if image_index >= image_number-1
    {
        instance_destroy();
    }
}
else
    image_speed = 0;

