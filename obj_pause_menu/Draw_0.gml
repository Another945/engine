/// @description Draw pause menu

draw_set_alpha(alpha);

var X = __view_get( e__VW.XView, 0 );
var Y = __view_get( e__VW.YView, 0 );

var col = make_colour_rgb(colour,colour,colour);
draw_sprite_ext(spr_pause_menu,0,X,Y,1,1,0,col,alpha);

if alpha >= 1 {
    //Draw Tanks
    tankX[0] = 15; tankY[0] = 27;
    tankX[1] = 15; tankY[1] = 59;
    tankX[2] = 15; tankY[2] = 92;
    if global.subTank_collected[0] == true
        draw_sprite_ext(spr_sub_tank,3,X+tankX[0],Y+tankY[0],1,1,0,col,alpha);
    if global.subTank_collected[1] == true
        draw_sprite_ext(spr_sub_tank,3,X+tankX[1],Y+tankY[1],1,1,0,col,alpha);
    if global.weaponsTank_collected[0] == true
        draw_sprite_ext(spr_weapons_tank,3,X+tankX[2],Y+tankY[2],1,1,0,col,alpha);
        
    draw_set_alpha(1);
    draw_set_colour(c_white);
    
    if colour >= 255 {
        //Healthbar
        var amount = 96 / global.healthpoints_max[global.character];
        draw_set_colour(c_lime);
        draw_rectangle(X+128+16,Y+16+8,X+128+16+((global.healthpoints*amount)-1),Y+16+15,false);
        
        for(var i = 1; i < global.maxWeapons; i++) {
            if global.weapon_unlocked[i] {
                var amount = 96 / 48;
                draw_set_colour(c_lime);
                draw_rectangle(X+128+16,Y+16+8+(i*24),X+128+16+((global.weapon_energy[i]*amount)-1),Y+16+15+(i*24),false);
            }
        }
        
        draw_set_colour(c_white);
        
        //Weapon icons
        for(var i = 0; i < global.maxWeapons; i++) {
            if global.weapon_unlocked[i]
                draw_sprite_ext(spr_pause_x_weapon_icons,i,X+128,Y+16+(i*24),1,1,0,c_white,1);
        }
        
        //Sub Tanks
        if global.subTank_energy[0] > 0 {
            var amount = 32 / tank_max_energy;
            draw_set_colour(c_lime);
            draw_rectangle(X+32,Y+28,X+32+((global.subTank_energy[0]*amount)-1),Y+28+4,false);
        }
        
        if global.subTank_energy[1] > 0 {
            var amount = 32 / tank_max_energy;
            draw_set_colour(c_lime);
            draw_rectangle(X+32,Y+60,X+32+((global.subTank_energy[1]*amount)-1),Y+60+4,false);
        }
        
        //Weapons Tank
        if global.weaponsTank_energy[0] > 0 {
            var amount = 32 / tank_max_energy;
            draw_set_colour(c_lime);
            draw_rectangle(X+32,Y+92,X+32+((global.weaponsTank_energy[0]*amount)-1),Y+92+4,false);
        }
        
        draw_set_colour(c_white);
        
        //Selected weapon
        if optionType == 0 {
            draw_set_alpha(1-(sin(flashTimer/8)));
            d3d_set_fog(true, c_white, 0, 0);
            draw_sprite(spr_pause_x_weapon_icons,0,X+128,Y+16+(option*24));
            d3d_set_fog(false, c_white, 0, 0);
            draw_set_alpha(1);
        }
        else if optionType == 1 {
            var mySprite;
            if tank < global.maxSubTanks
                mySprite = spr_sub_tank;
            else if tank >= global.maxSubTanks && tank < global.maxSubTanks+global.maxWeaponsTanks
                mySprite = spr_weapons_tank;
                
            draw_set_alpha(1-(sin(flashTimer/8)));
            d3d_set_fog(true, c_white, 0, 0);
            draw_sprite(mySprite,3,X+tankX[tank],Y+tankY[tank]);
            d3d_set_fog(false, c_white, 0, 0);
            draw_set_alpha(1);
        }
        
        //Draw life
        draw_set_text(global.font[font_mmx4],1,c_white,fa_left,fa_top);
        draw_text(X+8, Y+138, string_hash_to_newline(string(global._lives)));
        for(var i = 0; i < global.exTanks; i++) {
            draw_text(X+8, Y+148+(i*20),string_hash_to_newline("EX"));
        }
        
        //Draw exit icon
        var X = 48;
        var Y = 128;
        draw_sprite_ext(spr_pause_menu_exit,canExit,__view_get( e__VW.XView, 0 )+X,__view_get( e__VW.YView, 0 )+Y,1,1,0,c_white,1);
    }
}

draw_set_colour(c_white);
draw_set_alpha(1);

