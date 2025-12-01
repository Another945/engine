if !global.frozen
{
    if instance_exists(prt_player) {
        x = round(prt_player.x);
        y = round(prt_player.y);
    
        image_speed = 1/3;
        if image_index >= image_number-1
        || ((prt_player.state != state_dash && prt_player.state != state_airdash)
        || (prt_player.state == state_dash && prt_player.dashState > 1))
        {
            instance_destroy();
        }
    }
    else {
        image_speed = 1/3;
        if image_index >= image_number-1
        {
            instance_destroy();
        }
    }
}
else
    image_speed = 0;

