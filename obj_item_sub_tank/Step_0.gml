/// @description Animation logic
event_inherited();

if floor(image_index) <= 0 && animDir == -1 {
    animDir = 1;
    image_index = 0;
}

if floor(image_index) < 4
    image_speed = (1/8) * animDir;
else {
    if shineCount == shineEffectNum
        image_speed = 1 * animDir;
}

