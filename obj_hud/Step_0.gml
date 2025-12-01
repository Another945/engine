/// @description Increasing health

if increaseHealth {
    if increaseInit {
        if global.healthpoints < global.healthpoints_max[global.character] {
            preValue = global.healthpoints;
            increaseInit = false;
            increaseTimer = 0;
        }
        else {
            if global.subTank_collected[0] || global.subTank_collected[1] {
                var myTank;
                if global.subTank_collected[0] && !global.subTank_collected[1]
                    myTank = 0;
                else if global.subTank_collected[1] && !global.subTank_collected[0]
                    myTank = 1;
                //If both Sub Tanks have been collected, fill up the one with the most energy.
                else if global.subTank_collected[0] && global.subTank_collected[1] {
                    if global.subTank_energy[0] < global.subTank_energy[1]
                        myTank = 1;
                    else
                        myTank = 0;
                }
                
                if global.subTank_energy[myTank] != tank_max_energy
                    play_sound(sfx_menu_move_2,0.7,false);
                global.subTank_energy[myTank] = min(global.subTank_energy[myTank]+(addAmount/2),tank_max_energy);
            }
            increaseHealth = false;
        }
    }
    else {
        global.frozen = true;
        increaseTimer++
        global.healthpoints += 1;
            
        if increaseTimer mod 3 == 1
            play_sound(sfx_healthbar_fill,0.7,false);
            
        if global.healthpoints >= global.healthpoints_max[global.character]
        || global.healthpoints >= preValue+addAmount {
            global.healthpoints = min(preValue+addAmount,global.healthpoints_max[global.character]);
            global.frozen = false;
            increaseHealth = false;
            increaseInit = true;
            audio_stop_sound(sfx_healthbar_fill);
        }
    }
}

if increaseWeapon {
    if increaseInit {
        //If the current weapon isn't full, fill up the current weapon
        if global.weapon_energy[global.weapon] < 48 {
            myWeapon = global.weapon;
            preValue = global.weapon_energy[myWeapon];
            increaseInit = false;
            increaseTimer = 0;
            play_sound(sfx_healthbar_fill,0.7,true);
        }
        //Otherwise, find a weapon with the least amount on energy
        else {
            var weapons = 0;
            var weaponsFull = 0;
            for(var i = 0; i < global.maxWeapons; i++) {
                for(var j = 0; j < global.maxWeapons; j++) {
                    if global.weapon_unlocked[i] && global.weapon_unlocked[j]
                    && global.weapon_energy[i] < 48 {
                        if global.weapon_energy[i] < global.weapon_energy[j] && i != j {
                            if global.weapon_energy[i] < global.weapon_energy[lowestWeapon]
                                lowestWeapon = i;
                        }
                    }
                }
                
                //Check if all unlocked weapons have full energy.
                if global.weapon_unlocked[i] {
                    weapons++;
                    if global.weapon_energy[i] >= 48
                        weaponsFull++;
                }
            }
            weaponsAllFull = weaponsFull >= weapons;
            if !weaponsAllFull {
                myWeapon = lowestWeapon;
                global.weapon_energy[myWeapon] = min(global.weapon_energy[myWeapon]+addAmount,48);
                increaseWeapon = false;
                weaponsAllFull = false;
                play_sound(sfx_menu_move_2,0.7,false);
            }
            //If all available weapons are full, fill up the weapon sub tank.
            else {
                var myTank = 0;
                if global.weaponsTank_collected[myTank] {
                    if global.weaponsTank_energy[myTank] != tank_max_energy
                        play_sound(sfx_menu_move_2,0.7,false);
                    global.weaponsTank_energy[myTank] = min(global.weaponsTank_energy[myTank]+(addAmount/2), tank_max_energy);
                }
                increaseWeapon = false;
                weaponsAllFull = false;
            }
        }
    }
    else {
        global.frozen = true;
        if increaseTimer++ mod increaseInterval == 1 {
            global.weapon_energy[myWeapon] += 1;
        }
        if global.weapon_energy[myWeapon] >= 48
        || global.weapon_energy[myWeapon] >= preValue+addAmount {
            global.weapon_energy[myWeapon] = min(preValue+addAmount,48);
            global.frozen = false;
            increaseWeapon = false;
            increaseInit = true;
            audio_stop_sound(sfx_healthbar_fill);
        }
    }
}

