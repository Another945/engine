/// @description inside_view()
function inside_view() {

	if mask_index != -1 {
	    var dist = 8;
	    if bbox_right >= __view_get( e__VW.XView, 0 )-dist && bbox_left <= __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+dist
	    && bbox_bottom >= __view_get( e__VW.YView, 0 )-dist && bbox_top <= __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+dist
	        return true;
	    else
	        return false;
	}
	else {
	    var distLeft,distRight,distTop,distBottom;
	    if sprite_index == -1 {
	        distLeft = 8;
	        distRight = 8;
	        distTop = 8;
	        distBottom = 8;
	    }
	    else {
	        distLeft = sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index);
	        distRight = sprite_get_xoffset(sprite_index);
	        distTop = sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index);
	        distBottom = sprite_get_yoffset(sprite_index);
	    }
	    if x >= __view_get( e__VW.XView, 0 )-distLeft && x <= __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+distRight
	    && y >= __view_get( e__VW.YView, 0 )-distTop && y <= __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+distBottom
	        return true;
	    else
	        return false;
	}



}
