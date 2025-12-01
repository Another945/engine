/// @description Draw the files

draw_set_text(global.font[font_mmx4],1,c_white,fa_left,fa_top);

if page == 0 {
    if data_exists(global.mySave) {
        draw_set_colour(c_white);
        if loadOption == 0
            draw_set_colour(c_yellow);
    }
    else
        draw_set_colour(c_gray);
    draw_text(20, 100, string_hash_to_newline("Load Previous Data"));
    
    draw_set_colour(c_white);
    if loadOption == 1
        draw_set_colour(c_yellow);
    draw_text(20, 128, string_hash_to_newline("Load Other Data"));
    
    draw_set_colour(c_white);
    if loadOption == 2
        draw_set_colour(c_yellow);
    draw_text(20, 156, string_hash_to_newline("Cancel"));
}
else if page == 1 {
    for(var i = 0; i < global.maxSaves; i++) {
        draw_text(8, 32+(i*16), string_hash_to_newline("Data "+string(i+1)));
    }
    if data != global.maxSaves {
        //Highlighted option
        draw_set_colour(c_yellow);
        draw_text(8, 32+(data*16), string_hash_to_newline("Data "+string(data+1)));
        
        draw_set_colour(c_white);
    }
    
    draw_set_colour(c_white);
    if data == global.maxSaves
        draw_set_colour(c_yellow);
    draw_text(8, 32+(global.maxSaves*16), string_hash_to_newline("Cancel"));
    
    draw_set_colour(c_white);
    
    //Draw data box
    var boxX = room_width-8;
    var boxXleft = boxX-154;
    var boxY = 64;
    
    draw_set_alpha(0.75);
    draw_set_blend_mode(bm_add);
    draw_rectangle_colour(boxXleft, boxY, boxX, boxY+64,c_aqua,c_aqua,c_blue,c_blue,false);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    
    if data_exists(data) && data != global.maxSaves {
        for(var i = 0; i < global.maxSubTanks; i++) {
            if data_subTank_collected[i]
                draw_sprite(spr_sub_tank,3,(boxXleft+8)+(32*i),boxY+56);
        }
        for(var i = 0; i < global.maxWeaponsTanks; i++) {
            if data_weaponsTank_collected[i]
                draw_sprite(spr_weapons_tank,3,(boxXleft+8+64)+(32*i),boxY+56);
        }
        for(var i = 0; i < global.maxExTanks; i++) {
            if data_exTank_collected[i]
                draw_sprite(spr_ex_tank,0,(boxXleft+8+96)+(24*i),boxY+56);
        }
        var heartTanks = 0;
        for(var i = 0; i < global.maxHeartTanks; i++) {
            if data_heartTank_collected[i]
                heartTanks++;
        }
        draw_sprite(spr_heart_tank,0,(boxXleft+8),boxY+32);
        draw_text((boxXleft+8)+14,boxY+32,string_hash_to_newline("x"+string(heartTanks)));
        
        for(var i = 0; i < global.maxWeapons; i++) {
            if data_weapon_unlocked[i]
                draw_sprite(spr_healthbar_weapons,i,(boxXleft+48)+(12*i),boxY+12);
        }
        
        for(var i = 0; i <= armor_black; i++) {
            if data_armor[i]
                draw_sprite(spr_lightcapsule_icons,2+(i*4),(boxXleft+48)+(16*i),boxY+32);
        }
    }
}

