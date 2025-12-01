/// @description Update position

if instance_exists(prt_player) {
    if ID == 0 {
        x = prt_player.prevX[0];
        y = prt_player.prevY[0];
    }
    else if ID == 1 {
        x = prt_player.prevX[round(prt_player.dashTrailI)];
        y = prt_player.prevY[round(prt_player.dashTrailI)];
    }
    else if ID == 2 {
        x = prt_player.prevX[round(prt_player.dashTrailI*2)];
        y = prt_player.prevY[round(prt_player.dashTrailI*2)];
    }
}

