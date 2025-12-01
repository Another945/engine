/// @description Move
event_inherited();

if !global.frozen && active {
    if state == 0 {
        var myPlayer = instance_place(x, y-4, prt_player);
        if myPlayer {
            if myPlayer.ground && startTimer == 0
                startTimer = 1;
        }
            
        if startTimer >= 1 {
            startTimer++;
            if startTimer >= startFrames {
                state = 1;
            }
        }
    }
    
    else if state == 1 {
        yspeed += 0.2;
    }
}

