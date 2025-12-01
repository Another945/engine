/// @description Buster Shot (Half Charged)
/// @param Half Charged
event_inherited();

var effectID = instance_create(x, y, obj_effect_buster_half_charged);
    effectID.image_xscale = image_xscale;
visible = false;
stuckFrames = 10;

xspeed = 0;
spd = 7.5;
acc = 1.5;

defaultDamage = 2;

deathToSolid = false; //X1-4 - should be set to false, X5-6 - should be set to true.

