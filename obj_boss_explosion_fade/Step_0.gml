/// @description Fade logic

if fadeDir == 1 {
    whiteAlpha = min(whiteAlpha+0.005,1);
}
else {
    whiteAlpha = max(whiteAlpha-0.01,0);
    if whiteAlpha <= 0
        instance_destroy();
}

