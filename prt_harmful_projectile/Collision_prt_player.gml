/// @description Hurt the player

if !other.recovering && other.state >= 0 {
    with other player_get_hit(other.damage,0);
}

if destroyType == 0
    instance_destroy();

