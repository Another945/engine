if state == 0 {
    image_speed = 1/2;
    if image_index >= 7 {
        image_index = 7;
        stateTimer++;
        if stateTimer >= 5 {
            stateTimer = 0;
            state = 1;
        }
    }
}
else if state == 1 {
    image_speed = 1/3;
    if image_index >= image_number-1 {
        image_index = image_number-1;
        stateTimer++;
        if stateTimer == 5 {
            play_sound(readySnd,0.7,false); //Play SFX
        }
        if stateTimer >= 60 {
            stateTimer = 0;
            state = 2;
        }
    }
}
else {
    image_speed = -1/2;
    if image_index <= 1 {
        instance_destroy();
    }
}

