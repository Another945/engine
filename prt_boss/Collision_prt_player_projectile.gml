/// @description Hit with a player's projectile

if canGetHit {
    if function_state == 1 {
        if !(reflectWeapons
            || ((other.x < x && reflectWeapons_left)
            || (other.x > x && reflectWeapons_right))
            || weaponDamage[other.object_index] == 0) {
            if iTimer <= 0 {
                iTimer = weapon_iFrames[other.object_index];
                if weaponDamage[other.object_index] == -1
                    healthpoints -= other.defaultDamage;
                else
                    healthpoints -= weaponDamage[other.object_index];
                flash = true;
                flashTimer = 0;
            }
            
            play_sound(sfx_enemy_hit, 0.7, false);
            
            if other.destroyType == 0
                with other event_user(0);
            else if other.destroyType == 1 {
                if healthpoints > 0
                    with other event_user(0);
            }
            else {
                //Don't destroy Destroy-Type 2 projectiles.
            }
        }
        else {
            with other {
                play_sound(sfx_reflect,0.7,false);
                var reflect = instance_create(x, y, obj_effect_weapon_reflect);
                    reflect.image_xscale = image_xscale;
                if destroyType == 2 {
                    other.canGetHit = false;
                    other.alarm[9] = 4;
                }
                if destroyType != 2
                    instance_destroy();
            }
        }
    }
}

