/// @description Logic

/*
Usually, these after images are seen to be made every few frames,
then disappear not long after being created. However, they never
disappear until a while after the player stops dashing. Their
positions are the players position a few frames earlier.

This explains why when the player stops dashing, the distance between
the after images tighten up.

Also, the after images share the player's current sprite and image index.
*/

depth = ID;
if ID == 0 { image_alpha = 0.75; }
else if ID == 1 { image_alpha = 0.7; }
else if ID == 2 { image_alpha = 0.65; }

if instance_exists(prt_player) {
    if !prt_player.saber {
        sprite_index = prt_player.sprite_index;
        image_index = prt_player.image_index;
        image_xscale = prt_player.image_xscale;
    }
    else
        instance_destroy();
}
else
    instance_destroy();

/* */
/*  */
