/// @description Saber

if canHit && !global.frozen {
    if function_state == 1 {
        var hit, saber;
        if !(reflectWeapons
        || ((other.x < x && reflectWeapons_left)
        || (other.x > x && reflectWeapons_right))
        || saberDamage[other.saberID] == 0) {
            if iTimer <= 0 {
                iTimer = saber_iFrames[other.saberID];
                if saberDamage[other.saberID] == -1
                    healthpoints -= other.defaultDamage;
                else
                    healthpoints -= saberDamage[other.saberID];
            }
        }
        else {
        }
            
        //Create the hit effect
        if flashTimer == 0 {
            if !(reflectWeapons
            || ((other.x < x && reflectWeapons_left)
            || (other.x > x && reflectWeapons_right))
            || saberDamage[other.saberID] == 0) {
                hit = instance_create(x, y, obj_effect_saber_contact);
                if other.saberID <= 1
                    sprite = spr_saber_contact_2;
                else
                    sprite = spr_saber_contact_1;
            }
            else {
                play_sound(sfx_reflect, 0.7, false);
                hit = instance_create(x, y, obj_effect_weapon_reflect);
                sprite = -1;
            }
            
            if sprite != -1
                hit.sprite_index = sprite;
            
            var contactX = (other.bbox_left+((other.bbox_right-other.bbox_left)/2));
            if other.x < x
                hit.x = contactX + (x - contactX)/2;
            else
                hit.x = x + (contactX - x)/2;
                
            var plusY;
            plusY = 0;
            if other.saberID == 2 && floor(other.image_index) >= 3
                plusY = -16;
            if other.saberID == 3 && floor(other.image_index) >= 4
                plusY = 16;
                
            var contactY = (other.bbox_top+((other.bbox_bottom-other.bbox_top)/2));
            if other.y < y
                hit.y = (contactY + (y - contactY)/2)+plusY;
            else
                hit.y = (y + (contactY - y)/2)+plusY;
                
            if other.saberID != 2 || sprite == -1
                hit.image_xscale = other.image_xscale;
            else
                hit.image_xscale = -other.image_xscale;
                
            //Destroy the recently created saber contact effect if there are now too many (more than two)
            if instance_number(obj_effect_saber_contact) > 2
                with hit instance_destroy();
                
            play_sound(sfx_enemy_slashed, 0.7, false);
        }
        else {
            hit = -1;
            sprite = -1;
        }
        
        if !flash {
            flash = true;
            flashTimer = 0;
        }
        
        if prt_player.saberID < 2 || prt_player.saberID > 4 {
            canSaberHit = false;
        }
        else {
            canSaberHit = false;
            if !saberLag {
                saberLag = true;
                global.frozen = true;
                global.saberLag = true;
                alarm[10] = 6;
            }
        }
    }
}

