/// @description Draw Heads-Up-Display

var X = __view_get( e__VW.XView, 0 )+16;
var Y = __view_get( e__VW.YView, 0 )+((__view_get( e__VW.HView, 0 )/2)-24);

draw_set_text(global.font[font_healthbar],1,c_white,fa_left,fa_top);

draw_set_alpha(1);
draw_set_colour(c_white);

if global.weapon != 0 {
    //Weapon healthbar
    draw_sprite_ext(spr_weapon_bar,0,X,Y,1,1,0,c_white,1);
    
    //Player weapon bar ammo
    if global.weapon_energy[global.weapon] > 0 {
        draw_set_colour(c_lime);
        draw_rectangle(X+11,Y+4,X+16,(Y+4)-ceil(global.weapon_energy[global.weapon]-1),false);
    }
    
    draw_set_colour(c_white);
    draw_sprite(spr_healthbar_weapons,global.weapon-1,X+9,Y-57);
    draw_set_halign(fa_right);
    draw_text(X+3,Y-56,string_hash_to_newline(string(ceil(global.weapon_energy[global.weapon] / global.weapon_ammo[global.character,global.weapon]))));
}

draw_set_colour(c_white);

//Main Player Healthbar
draw_sprite_ext(spr_player_healthbar,global.character,X,Y,1,1,0,c_white,1);

//Player healthbar components
for(var i = 0; i <= floor(global.healthpoints_max[global.character]/2)-3; i++) {
    draw_sprite(spr_healthbar_components,i==floor(global.healthpoints_max[global.character]/2)-3,X,Y-(2*i));
}

//Draw health
redHealth = max(redHealth-0.2, global.healthpoints);
if redHealth > 0 {
    draw_set_colour(c_red);
    draw_rectangle(X-3,Y+4,X+2,(Y+4)-ceil(redHealth-1),false);
}

if global.healthpoints > 0 {
    draw_set_colour(c_lime);
    draw_rectangle(X-3,Y+4,X+2,(Y+4)-ceil(global.healthpoints-1),false);
}

draw_set_colour(c_white);

//Draw lives
draw_set_halign(fa_left);
draw_text(X+(24-12),Y+(8+2),string_hash_to_newline(max(0,string(global._lives))));

