draw_set_text(global.font[font_mmx4],1,c_white,fa_center,fa_center);

draw_text(room_width/2, 96, string_hash_to_newline("You Got"));
draw_text(room_width/2, 128, string_hash_to_newline(string_upper(global.weapon_name[char_x,global.newWeapon])));
draw_text(room_width/2, 156, string_hash_to_newline(string_upper(global.weapon_name[char_zero,global.newWeapon])));

if canProceed {
    draw_text(room_width/2, room_height-48, string_hash_to_newline("Press the Pause Key#to continue."));
}

