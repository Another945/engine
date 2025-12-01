/// @description Leave

if type != 3 {
    with prt_player {
        var I = instance_create(x, y, obj_player_teleport_out);
            I.sprite_index = prt_player.sprite_teleport_out;
            I.image_xscale = image_xscale;
        if other.getWeaponMenu //other.type == 1 && !global.boss_defeated[other.ID]
            I.myroom = rm_weapon_get;
        else
            I.myroom = rm_save_game;
        instance_destroy();
    }
}
else {
    fade_to_position(myX, myY);
}

