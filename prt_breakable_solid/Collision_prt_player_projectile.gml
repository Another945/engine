/// @description Hit with a player's projectile

if !flash && canGetHit {
    if healthpoints > 0 {
        if !(reflectWeapons
        || ((other.x < x && reflectWeapons_left)
        || (other.x > x && reflectWeapons_right))
        || weaponDamage[other.object_index] == 0) {
            if weaponDamage[other.object_index] == -1
                healthpoints -= other.defaultDamage;
            else
                healthpoints -= weaponDamage[other.object_index];
            
            play_sound(sfx_enemy_hit, 0.7, false);
            
            if healthpoints <= 0 {
                die = true;
            }
            
            if other.destroyType == 0
                with other event_user(0);
            else if other.destroyType == 1 {
                if healthpoints > 0
                    with other event_user(0);
            }
            else {
                //Don't destroy Destroy-Type 2 projectiles.
            }
            
            flash = true;
            flashTimer = 0;
        }
        //Reflect projectiles
        else {
            with other {
                play_sound(sfx_reflect,0.7,false);
                var reflect = instance_create(x, y, obj_effect_weapon_reflect);
                    reflect.image_xscale = image_xscale;
                    
                if destroyType == 2 {
                    canGetHit = false;
                    alarm[10] = 4;
                }
                    
                if destroyType != 2
                    instance_destroy();
            }
        }
    }
}

