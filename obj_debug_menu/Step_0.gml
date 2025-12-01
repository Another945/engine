with (other) {
///Logic

if global.keyUpPressed && option != 0 {
    option--;
    if option >= 8
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (16) );
}
if global.keyDownPressed && option != menuOptions[page]-1 {
    option++;
    if option >= 9
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (16) );
}
    
if subOption == 0 {
    if global.keyLeftPressed && character != 0
        character--;
    if global.keyRightPressed && character != 1
        character++;
}

if global.keyWeaponSwitchRightPressed {
    if subOption != 0
        subOption++;
    else
        subOption = 0;
}
    
if global.keyJumpPressed {
    global.character = character;
    switch page {
        case(0):
            switch option {
                case(0): room_goto(rm_test); break;
                case(1): page = 1; break;
                case(2): room_goto(rm_test); break;
            }
        break;
        
        case(1):
            room_goto(option);
        break;
    }
    option = 0;
}

}
