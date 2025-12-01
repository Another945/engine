/// @description Hurt the player

if canHit && function_state == 1 {
    if !other.recovering && other.state >= 0 {
        var multiply;
        switch global.difficulty {
            case(diff_easy): multiply = 0.5; break;
            case(diff_normal): multiply = 1; break;
            case(diff_xtreme): multiply = 1.5; break;
        }
        with other player_get_hit(other.player_damage*multiply,other.player_hurtType);
    }
}

