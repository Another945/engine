/// @description option_refresh_keys(num)
/// @param num
function option_get_key(argument0) {

	switch argument0 {
	    case(0): return global.leftKey; break;
	    case(1): return global.rightKey; break;
	    case(2): return global.upKey; break;
	    case(3): return global.downKey; break;
	    case(4): return global.shootKey; break;
	    case(5): return global.jumpKey; break;
	    case(6): return global.dashKey; break;
	    case(7): return global.specialKey; break;
	    case(8): return global.weaponSwitchRightKey; break;
	    case(9): return global.weaponSwitchLeftKey; break;
	    case(10): return global.gigaKey; break;
	}



}
