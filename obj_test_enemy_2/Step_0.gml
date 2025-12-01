/// @description Logic
event_inherited();

if !global.frozen && active && !dead {
    if floor(image_index) >= 3 && floor(image_index) <= 7
        image_speed = 1/3;
    else
        image_speed = 1/6;
}

