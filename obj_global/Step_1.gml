/// @description Keys

global.keyLeft = keyboard_check(global.leftKey);
global.keyRight = keyboard_check(global.rightKey);
global.keyUp = keyboard_check(global.upKey);
global.keyDown = keyboard_check(global.downKey);
global.keyJump = keyboard_check(global.jumpKey);
global.keyDash = keyboard_check(global.dashKey);
global.keyAction = keyboard_check(global.shootKey);
global.keySpecial = keyboard_check(global.specialKey);
global.keyGiga = keyboard_check(global.gigaKey);
global.keyPause = keyboard_check(global.pauseKey);
global.keyWeaponSwitchLeft = keyboard_check(global.weaponSwitchLeftKey);
global.keyWeaponSwitchRight = keyboard_check(global.weaponSwitchRightKey);

global.keyLeftPressed = keyboard_check_pressed(global.leftKey);
global.keyRightPressed = keyboard_check_pressed(global.rightKey);
global.keyUpPressed = keyboard_check_pressed(global.upKey);
global.keyDownPressed = keyboard_check_pressed(global.downKey);
global.keyJumpPressed = keyboard_check_pressed(global.jumpKey);
global.keyDashPressed = keyboard_check_pressed(global.dashKey);
global.keyActionPressed = keyboard_check_pressed(global.shootKey);
global.keySpecialPressed = keyboard_check_pressed(global.specialKey);
global.keyGigaPressed = keyboard_check_pressed(global.gigaKey);
global.keyPausePressed = keyboard_check_pressed(global.pauseKey);
global.keyWeaponSwitchLeftPressed = keyboard_check_pressed(global.weaponSwitchLeftKey);
global.keyWeaponSwitchRightPressed = keyboard_check_pressed(global.weaponSwitchRightKey);

global.keyLeftReleased = keyboard_check_released(global.leftKey);
global.keyRightReleased = keyboard_check_released(global.rightKey);
global.keyUpReleased = keyboard_check_released(global.upKey);
global.keyDownReleased = keyboard_check_released(global.downKey);
global.keyJumpReleased = keyboard_check_released(global.jumpKey);
global.keyDashReleased = keyboard_check_released(global.dashKey);
global.keyActionReleased = keyboard_check_released(global.shootKey);
global.keySpecialReleased = keyboard_check_released(global.specialKey);
global.keyGigaReleased = keyboard_check_released(global.gigaKey);
global.keyPauseReleased = keyboard_check_released(global.pauseKey);
global.keyWeaponSwitchLeftReleased = keyboard_check_released(global.weaponSwitchLeftKey);
global.keyWeaponSwitchRightReleased = keyboard_check_released(global.weaponSwitchRightKey);

///Screen size

__view_set( e__VW.WView, 0, global.screen_width );
__view_set( e__VW.HView, 0, global.screen_height );

