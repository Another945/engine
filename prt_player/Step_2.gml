with (other) {
///Keep track of the player's previous X and Y coordinates
//from the previous 9-or-so frames every 4 frames.
for(var i = 12; i >= 0; i--) {
    if i == 0 {
        prevX[i] = x;
        prevY[i] = y;
    }
    else {
        prevX[i] = prevX[i-1];
        prevY[i] = prevY[i-1];
    }
}

}
