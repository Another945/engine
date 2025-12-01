/// @description Default logic

if !global.frozen {
    
    npc_physics();
    
    //Bounce on the ground
    if ground {
        if bounceNum == 0 {
            yspeed = -3;
            bounceNum++;
        }
        else if bounceNum == 1 {
            yspeed = -1.5;
            bounceNum++;
        }
        else {
            yspeed = 0;
        }
    }
        
    image_speed = animationSpeed;
    
    if alarm[11] != -1 && alarm[11] < 45 {
        visible = !visible;
    }
}
else {
    image_speed = 0;
    
    //Prevent the alarm from decrementing when the game is frozen
    if alarm[11] > 0 {
        alarm[11]++;
    }
}

if alarm[11] != -1
    if !inside_view() instance_destroy();

