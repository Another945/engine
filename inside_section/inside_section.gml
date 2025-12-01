/// @description inside_section()
function inside_section() {

	if instance_exists(obj_camera) {
	    if mask_index != -1 {
	        var dist = 8;
	        if bbox_right >= obj_camera.camera_setX[0]-dist && bbox_left <= obj_camera.camera_setX[1]+dist
	        && bbox_bottom >= obj_camera.camera_setY[0]-dist && bbox_top <= obj_camera.camera_setY[1]+dist
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
	        if x >= obj_camera.camera_setX[0]-distLeft && x <= obj_camera.camera_setX[1]+distRight
	        && x >= obj_camera.camera_setY[0]-distTop && x <= obj_camera.camera_setY[1]+distBottom
	            return true;
	        else
	            return false;
	    }
	}



}
