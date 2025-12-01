/// @description Do something when dying.

var explosion = instance_create(x, y, obj_explosion); //Create an explosion
randomize();
play_sound(choose(sfx_explosion_1,sfx_explosion_2,sfx_explosion_3),0.7,false);

//Item drop
randomize();
var RNG; //Don't worry, you shouldn't loose the run to RNG, man!
RNG = random(100);
var item = -1;
if RNG < 30 {
    if RNG < 15
        item = obj_item_weapon_energy_small;
    else
        item = obj_item_weapon_energy;
}
else if RNG < 60 {
    if RNG < 45
        item = obj_item_health_energy_small;
    else
        item = obj_item_health_energy;
}
else {
    if RNG < 62 //originally 65
        item = obj_item_life;
}
if item != -1 {
    var dropItem = instance_create(x, y, item);
        dropItem.yspeed = -1.75;
        dropItem.alarm[11] = 180;
}

/*
Usually in Mega Man X games, even the SNES titles, enemies that are
destroyed usually break apart when destroyed.

You could create a sprite for the parts that break away and then
create them here.
*/

/* */
/*  */
