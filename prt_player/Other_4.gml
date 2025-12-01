/// @description Change the player, create the camera, hud and stuff

global.weapon = 0;
global.healthpoints = global.healthpoints_max[global.character];
for(var i = 0; i < global.maxWeapons; i++) {
    global.weapon_energy[i] = 48;
}

instance_create(x, y, obj_camera);
instance_create(x, y, obj_hud);
instance_create(x, y, obj_fade_in);

//instance_create(x, y, obj_debug_hud);

//If a checkpoint has been reached, send the player to the
//location when the room starts.
if global.checkpoint {
    x = global.saveX;
    y = global.saveY;
}

switch global.character {
    case(char_x): instance_change(obj_x, true); break;
    case(char_zero): instance_change(obj_zero, true); break;
}

