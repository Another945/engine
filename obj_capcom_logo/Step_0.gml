/// @description Manage key presses

if global.keyJumpPressed || global.keyActionPressed
|| global.keyPausePressed || global.keySpecialPressed {
    if alarm[0] < time/2 && alarm[0] > 1 {
        alarm[0] = 1;
    }
}

