/// @description Create Collision

if dir == "h" {
    if accessSide == -1 {
        mySolid = instance_create(x+16, y, obj_collision_solid);
            mySolid.image_yscale = sprite_height/16;
    }
    else {
        mySolid = instance_create(x, y, obj_collision_solid);
            mySolid.image_yscale = sprite_height/16;
    }
}
else if dir == "v" {
    if accessSide == -1 {
        mySolid = instance_create(x, y+16, obj_collision_solid);
            mySolid.image_xscale = sprite_width/16;
    }
    else {
        mySolid = instance_create(x, y, obj_collision_solid);
            mySolid.image_xscale = sprite_width/16;
    }
}

