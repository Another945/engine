/// @description Logic

hitbox = collision_rectangle(x-3,y,x+3,y-16,prt_player,0,1);

if state == 0 {
    if hitbox && ((type == 0 && !global.boss_rematch_defeated[ID])
    || type == 1) {
        if prt_player.ground {
            prt_player.function_state = 2;
            prt_player.yspeed = min(prt_player.yspeed,0);
            prt_player.xspeed = 0;
            prt_player.x = x;
            
            state = 1;
        }
    }
}
else if state == 1 {
    timer++;
    if timer == 40 && !instance_exists(obj_fade_out) {
        if type == 0 {
            fade_to_position(myX, myY);
        }
        else if type == 1 {
            fade_to_room(myRoom);
        }
        else if type == 2 {
            if timer == 42
                global.endStage++;
            fade_to_room(rm_save_game);
        }
    }
}

