if instance_exists(prt_player) {
    if prt_player.state == state_wall && prt_player.wallState <= 1 {
        if image_index >= 5 {
            image_index = 2;
        }
        
        //Follow player
        x = round(prt_player.x);
        y = round(prt_player.y);
        image_xscale = prt_player.image_xscale;
    }
    else {
        //Wall jumping
        if prt_player.wallState == 3 {
            instance_destroy();
        }
        else {
            if image_index < image_number-3
                image_index = image_number-3;
        }
    }
}

