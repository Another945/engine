/// @description Fade in

fadeTimer++;
if fadeTimer >= fadeInterval {
    fadeAlpha -= fadeAmount;
    fadeTimer = 0;
}

if fadeAlpha <= 0 {
    instance_destroy();
}

