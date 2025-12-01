/// @description draw_player_x_armors()
function draw_player_x_armors() {

	for(var i = 0; i < 4; i++) {
	    if global.armor[i] {
	        var armor = "template";
        
	        var sprite = sprite_get_name(sprite_index);
        
	        var part;
	        switch i {
	            case(armor_legs): part = "foot"; break;
	            case(armor_buster): part = "arm"; break;
	            case(armor_body): part = "body"; break;
	            case(armor_head): part = "head"; break;
	        }
        
	        var spriteArmor = asset_get_index(string(sprite+"_"+part+"_"+armor));
    
	        if sprite_exists(spriteArmor) {
	            palette_set_x_template(global.weapon);
	            draw_sprite_ext(spriteArmor,floor(image_index),round(x),round(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	            shader_reset();
	        }
	    }
	}



}
