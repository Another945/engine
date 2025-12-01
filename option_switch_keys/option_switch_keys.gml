/// @description option_switch_keys()
function option_switch_keys() {

	old_key = option;
	for(var i = 0; i <= 10; i++) {
	    if key[i] == option_get_key(old_key) && i != option {
	        switch i {
	            case(0): global.leftKey = key[old_key]; break;
	            case(1): global.rightKey = key[old_key]; break;
	            case(2): global.upKey = key[old_key]; break;
	            case(3): global.downKey = key[old_key]; break;
	            case(4): global.shootKey = key[old_key]; break;
	            case(5): global.jumpKey = key[old_key]; break;
	            case(6): global.dashKey = key[old_key]; break;
	            case(7): global.specialKey = key[old_key]; break;
	            case(8): global.weaponSwitchRightKey = key[old_key]; break;
	            case(9): global.weaponSwitchLeftKey = key[old_key]; break;
	            case(10): global.gigaKey = key[old_key]; break;
	        }
	    }
	}



}
