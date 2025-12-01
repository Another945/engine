/// @description Buster Shot (Charged)
/// @param Charged
event_inherited();

var effectID = instance_create(x, y, obj_effect_buster_charged);
    effectID.image_xscale = image_xscale;
visible = false;
stuckFrames = 8;

xspeed = 0;
spd = 10;
acc = 0.75;

destroyObject = obj_effect_buster_charged_destroy;
destroyType = 1;
defaultDamage = 3;

deathToSolid = false; //X1-4 - should be set to false, X5-6 - should be set to true.

