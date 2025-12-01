/// @description Logic
event_inherited();

if !global.frozen && !dead && active {
    timer++;
    
    if timer < 90
        image_index = 0;
    
    if timer == 90 {
        reflectWeapons_left = true;
        reflectWeapons_right = false;
        image_index = 1;
    }
    
    if timer == 180 {
        reflectWeapons_right = true;
        reflectWeapons_left = false;
        image_index = 2;
    }
    
    if timer == 270 {
        reflectWeapons_right = false;
        reflectWeapons_left = false;
        reflectWeapons = true;
        image_index = 3;
    }
    
    if timer >= 360 {
        reflectWeapons_right = false;
        reflectWeapons_left = false;
        reflectWeapons = false;
        image_index = 0;
        timer = 0;
    }
}
else {
    if dead {
        image_index = 0;
        timer = 0;
        reflectWeapons = false;
        reflectWeapons_right = false;
        reflectWeapons_left = false;
    }
}

