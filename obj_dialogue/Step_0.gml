/// @description Text Box logic

//Lock the player
if instance_exists(prt_player) {
    with prt_player {
        function_state = 2;
        xspeed = 0;
        yspeed = max(0, yspeed+grav);
        
        if ground
            sprite_index = sprite_idle;
        else
            sprite_index = sprite_jump;
    }
}

if state == 0 {
    boxAlpha = min(boxAlpha+0.05,0.75);
    if boxAlpha >= 0.75 {
        state = 1;
    }
}

else if state == 1 {
    scrollTimer++;
    if scrollTimer >= scrollInterval && scrollPos < string_length(dialogue[currentText]) {
        scrollPos++;
        drawText = string_copy(dialogue[currentText],0,scrollPos);
        scrollTimer = 0;
        play_sound(sfx_healthbar_fill,0.7,false);
    }
    
    if global.keyPausePressed || global.keyJumpPressed
    || global.keyActionPressed {
        if scrollPos < string_length(dialogue[currentText]) {
            scrollPos = string_length(dialogue[currentText])
            drawText = string_copy(dialogue[currentText],0,scrollPos);
        }
        else {
            if currentText == textMax
                state = 2;
            else {
                currentText++;
                scrollPos = 0;
            }
        }
    }
}

else if state == 2 {
    boxAlpha = max(boxAlpha-0.075,0);
    if boxAlpha <= 0 {
        instance_destroy();
    }
}

