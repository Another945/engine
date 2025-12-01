/// @description Logic

if phase == 0 {
    timer++;
    if timer >= 25 {
        timer = 0;
        phase = 1;
    }
}

else if phase == 1 {
    visible = false; //Turn invisible
    
    if timer == 0
        play_sound(sfx_player_die, 0.7, false);
    
    //Create explosions.
    if inside_view() {
        if timer == 0 {
            var dir = 0;
            repeat 8 {
                var orbID = instance_create(x, y, obj_death_orb);
                    orbID.speed = 1;
                    orbID.direction = dir;
                dir += 360/8;
            }
        }
        
        if timer == 6 {
            var dir = (360/8)/2;
            repeat 8 {
                var orbID = instance_create(x, y, obj_death_orb);
                    orbID.speed = 1.25;
                    orbID.direction = dir;
                dir += 360/8;
            }
        }
        
        if timer == 30 {
            var dir = 0;
            repeat 16 {
                var orbID = instance_create(x, y, obj_death_orb);
                    orbID.speed = 2;
                    orbID.direction = dir;
                dir += 360/16;
            }
        }
        
        //Random explosions
        if timer mod 3 == 1 && timer < 60 {
            randomize();
            var orbID = instance_create(x, y, obj_death_orb);
                orbID.speed = 6;
                orbID.direction = random(360);
        }
    }
    
    timer++;
}

