/// @description Camera and allow death

__view_set( e__VW.XView, 0, prt_player.x - (__view_get( e__VW.WView, 0 )/2) );
__view_set( e__VW.YView, 0, prt_player.y - (__view_get( e__VW.HView, 0 )/2) );

canDie = true;

