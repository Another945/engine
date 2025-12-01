///Draw the boss healthbar

if (!Bossfunction || instance_exists(obj_warning)) {
    return;
}

if (instance_exists(prt_boss)) {

    var myboss = instance_nearest(x, y, prt_boss);

    var X = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 24);
    var Y = camera_get_view_y(view_camera[0]) + ((camera_get_view_height(view_camera[0]) / 2) - 24);

    draw_set_alpha(1);
    draw_set_colour(c_white);

    //Main boss health bar
    draw_sprite_ext(spr_boss_healthbar, healthIndex, X, Y, 1, 1, 0, c_white, 1);

    //Small components
    for (var i = 0; i <= floor(myboss.healthpoints_start / 2) - 3; i++) {
        draw_sprite(spr_healthbar_components, 0, X, Y - (2 * i));
    }

    redHealth = max(redHealth - 0.2, healthDisplay);

    if (redHealth > 0) {
        draw_set_colour(c_red);
        draw_rectangle(X - 3, Y + 4, X + 2, (Y + 4) - ceil(redHealth - 1), false);
    }

    if (healthDisplay > 0) {
        draw_set_colour(c_lime);
        draw_rectangle(X - 3, Y + 4, X + 2, (Y + 4) - ceil(healthDisplay - 1), false);
    }

    if (healthFunction) {
        healthDisplay = min(healthDisplay + 1, myboss.healthpoints);

        if (healthDisplay < myboss.healthpoints - 1) {
            if (healthDisplay mod 3 == 1) {
                audio_play_sound(sfx_healthbar_fill, 0.7, false);
            }
        }
        else if (healthDisplay == myboss.healthpoints - 1) {
            audio_stop_sound(sfx_healthbar_fill);

            if (!battle) {
                event_user(1);
            }
        }
    }

    draw_set_colour(c_white);
}
