/// @description Lock the player

prt_player.function_state = 2;
prt_player.yspeed = max(prt_player.yspeed, 0)
prt_player.xspeed = 0;

if prt_player.x < __view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2)
    prt_player.image_xscale = 1;
else
    prt_player.image_xscale = -1;

