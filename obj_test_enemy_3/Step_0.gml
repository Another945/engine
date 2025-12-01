/// @description Logic
event_inherited();

if !global.frozen && !dead && active {
    if move_axis == "h" {
        xspeed = move_dir * move_speed;
        yspeed = 0;
        
        if !canMoveLeft
            move_dir = 1;
        if !canMoveRight
            move_dir = -1;
    }
    else if move_axis == "v" {
        yspeed = move_dir * move_speed;
        xspeed = 0;
        
        if place_meeting(x, y-1, obj_collision_solid)
            move_dir = 1;
        if ground
            move_dir = -1;
    }
    
    if instance_exists(prt_player) {
        if distance_to_object(prt_player) <= shootDist && shootTimer <= 0 {
            shootTimer = shootFrames;
            var i = instance_create(x, y, obj_test_projectile_1);
            if move_axis == "v" {
                npc_face_player();
                i.xspeed = i.spd * image_xscale;
            }
            else {
                if prt_player.y < y
                    i.yspeed = -i.spd;
                else
                    i.yspeed = i.spd;
            }
        }
    }
    
    shootTimer = max(shootTimer-1,0);
}

