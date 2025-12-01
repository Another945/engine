/// @description Logic

if !global.frozen && active && !dead {
    if usePhysics {
        npc_physics();
        
        x += xspeed;
        y += yspeed;
    }
}
else {
    image_speed = 0;
    
    //Activate if on screen
    if inside_view() && !active && !dead
        active = true;
    
    //Respawn
    if dead && !inside_view() {
        x = xstart;
        y = ystart;
        image_xscale = xscale_start;
        image_yscale = yscale_start;
        flashTimer = 0;
        flash = false;
    
        dead = false;
        die = false;
        active = false;
        healthpoints = healthpoints_start;
    }
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

