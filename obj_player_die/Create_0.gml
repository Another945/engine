image_speed = 0;
image_index = 0;

phase = 0;
timer = 0;

alarm[0] = 60 * 2;

if instance_exists(obj_dash_trail) {
    with obj_dash_trail instance_destroy();
}

