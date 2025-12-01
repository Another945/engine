/// @description Logic

//Destroy if off-screen.
if !inside_view() {
    instance_destroy();
}
 
//Death to solid
if deathToSolid {
    if place_meeting(x+sign(xspeed),y+sign(yspeed),obj_collision_solid)
    || place_meeting(x+sign(xspeed),y+sign(yspeed),obj_collision_slope)
    || (place_meeting(x,y+sign(yspeed),obj_collision_solid) && yspeed > 0) {
        event_user(0);
    }
}

//Don't animate if paused
if global.frozen
    image_speed = 0;

