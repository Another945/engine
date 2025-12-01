/// @description Create a semisolid on to of the ladder

if !instance_place(x, y-1, obj_collision_ladder) && !instance_place(x, y-1, obj_collision_solid)
    instance_create(x, y, obj_collision_semisolid);

