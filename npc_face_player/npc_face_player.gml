/// @description npc_face_player()
function npc_face_player() {

	if instance_exists(prt_player) {
	    var myPlayer = instance_nearest(x, y, prt_player);
	    if myPlayer.x < x
	        image_xscale = -1;
	    else if myPlayer.x > x
	        image_xscale = 1;
	}



}
