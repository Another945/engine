var player = instance_nearest(x, y, prt_player);
var boss   = instance_nearest(x, y, prt_boss);

if canInit && instance_exists(player) && instance_exists(boss) {
    
    // Solo activar si el jugador entra en la zona de activación
    if (player.x > activ_x1 && player.x < activ_x2 &&
        player.y > activ_y1 && player.y < activ_y2) {
        
        // Lock player
        event_user(2);

        // Crear advertencia en la posición del boss
        instance_create_layer(boss.x, boss.y, "Instances", obj_warning);

        canInit = false;     // Solo una vez
        Bossfunction = true;
    }
}

// TELEPORT PLAYER OUT IF NO BOSS
if noBoss && instance_exists(prt_player) {
    if prt_player.ground {
        with (prt_player) {
            var i = instance_create_layer(x, y, "Instances", obj_player_teleport_out);
            i.myroom = rm_save_game;
            i.sprite_index = prt_player.sprite_teleport_out;
            i.image_xscale = image_xscale;
            instance_destroy();
        }
        noBoss = false;
    }
}
