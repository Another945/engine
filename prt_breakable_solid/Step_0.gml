/// @description Logic

if !global.frozen {
    if usePhysics {
        npc_physics();
        
        x += xspeed;
        y += yspeed;
    }
}
else {
    image_speed = 0;
}
    
//If no saber mask exists, allow it to get hit by the saber
if !instance_exists(obj_player_saber_mask) {
    canSaberHit = true;
    saberLag = false;
}

if global.frozen && (!global.saberLag || instance_exists(obj_pause_menu)) {
    if alarm[10] > 0
        alarm[10]++;
}

