if !global.frozen
{
    image_speed = 1/2;
    if image_index >= image_number-1
    {
        instance_destroy();
    }
}
else
    image_speed = 0;

