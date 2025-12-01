/// @description Logic

if global.keyPausePressed && canProceed {
    fade_to_room(rm_save_game);
    canProceed = false;
}

