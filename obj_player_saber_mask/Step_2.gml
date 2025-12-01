/// @description Saber control

if instance_exists(prt_player) {
    image_xscale = prt_player.image_xscale;
    image_index = prt_player.image_index;
    image_speed = 0;
    x = prt_player.x;
    y = prt_player.y;
    
    switch prt_player.sprite_index {
        case(spr_zero_stand_saber_1): sprite_index = spr_zero_stand_sabermask_1; break;
        case(spr_zero_stand_saber_2): sprite_index = spr_zero_stand_sabermask_2; break;
        case(spr_zero_stand_saber_3): sprite_index = spr_zero_stand_sabermask_3; break;
        case(spr_zero_jump_saber): sprite_index = spr_zero_jump_sabermask; break;
        case(spr_zero_jump_saber_ground): sprite_index = spr_zero_jump_sabermask; break;
        case(spr_zero_jump_saber_spin): sprite_index = spr_zero_jump_sabermask_spin; break;
        case(spr_zero_crouch_saber): sprite_index = spr_zero_crouch_sabermask; break;
        case(spr_zero_wall_saber): sprite_index = spr_zero_wall_sabermask; break;
        case(spr_zero_climb_saber): sprite_index = spr_zero_climb_sabermask; break;
        default: sprite_index = prt_player.sprite_index; break;
    }
    
    if prt_player.saber == false || prt_player.function_state != 1 {
        instance_destroy();
    }
}
else {
    instance_destroy();
}

