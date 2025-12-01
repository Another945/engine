/// @description Initiate position

if instance_exists(prt_player)
    __view_set( e__VW.XView, 0, prt_player.x - (__view_get( e__VW.WView, 0 )/2) );
__view_set( e__VW.XView, 0, max(__view_get( e__VW.XView, 0 ), camera_setX[0]) );
__view_set( e__VW.XView, 0, min(__view_get( e__VW.XView, 0 ), camera_setX[1]-__view_get( e__VW.WView, 0 )) );

if instance_exists(prt_player)
    __view_set( e__VW.YView, 0, prt_player.y - (__view_get( e__VW.HView, 0 )/2) );
__view_set( e__VW.YView, 0, max(__view_get( e__VW.YView, 0 ), camera_setY[0]) );
__view_set( e__VW.YView, 0, min(__view_get( e__VW.YView, 0 ), camera_setY[1]-__view_get( e__VW.HView, 0 )) );

xview = __view_get( e__VW.XView, 0 );
yview = __view_get( e__VW.YView, 0 );

initiate = false;

