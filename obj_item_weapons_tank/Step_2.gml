/// @description Animation Short loop

if floor(image_index) >= 4 && shineCount < shineEffectNum {
    image_index = 3;
    animDir = -1;
    shineCount++;
}

