
if !global.frozen {
    if floor(image_index) <= 2
        image_speed = 1/2;
    else
        image_speed = 1/3;
    if instance_exists(prt_player) {
        x = prt_player.shootX;
        y = prt_player.shootY;
        image_xscale = prt_player.shootDir;
    }
}
else
    image_speed = 0;

