/// @description Logic

//Fade In
if state == 0 {
    alpha += 1/fadeFrames;
    if alpha >= 1 {
        alpha = 1;
        colour += 255/fadeFrames;
        if colour >= 255 {
            state = 1;
        }
    }
}
//Actual functionality
else if state == 1 {
    //Unpause state
    if global.keyPausePressed {
        state = 2;
    }
    
    //Exiting the stage
    canExit = (global.introStage && global.introStageBeaten)
              || (!global.introStage && global.boss_defeated[global.myBoss])
              || (global.endStage > global.endStages) //This bit just prevents you exiting in end stages, at least as it
                                                      //is now.
                                                      
    if keyboard_check_pressed(vk_shift) && canExit {
        fade_to_room(rm_save_game);
    }
    
    flashTimer++;
    
    //Selecting a weapon
    if optionType == 0 {
        //Set weapon
        if global.keyJumpPressed || global.keyActionPressed {
            global.weapon = option;
            play_sound(sfx_menu_select_2, 0.7, false);
        }
        
        //Move
        if global.keyDownPressed {
            var looped = false;
            
            while !global.weapon_unlocked[option] || !looped {
                option++;
                if option > global.maxWeapons-1
                    option = 0;
                
                looped = true;
            }
            
            play_sound(sfx_menu_move_1,0.7,false);
            flashTimer = 0;
        }
        
        if global.keyUpPressed {
            var looped = false;
            
            while !global.weapon_unlocked[option] || !looped {
                option--;
                if option < 0
                    option = global.maxWeapons-1;
                    
                looped = true;
            }
            
            play_sound(sfx_menu_move_1,0.7,false);
            flashTimer = 0;
        }
        
        //Select tank
        if global.keyLeftPressed {
            optionType = 1;
            play_sound(sfx_menu_move_1,0.7,false);
        }
    }
    //Select a Tank
    else if optionType == 1 {
        if !usingSubTank && !usingWeaponsTank {
            //Round off the weapon ammo
            global.healthpoints = ceil(global.healthpoints);
            for (var i = 0; i < global.maxWeapons; i++)
                global.weapon_energy[i] = ceil(global.weapon_energy[i]);
            
            if global.keyDownPressed && tank != (global.maxSubTanks+global.maxWeaponsTanks)-1 {
                tank++;
                play_sound(sfx_menu_move_1,0.7,false);
            }
            
            if global.keyUpPressed && tank != 0 {
                tank--;
                play_sound(sfx_menu_move_1,0.7,false);
            }
            
            //Use a tank
            if global.keyJumpPressed {
                if (tank < global.maxSubTanks
                && (global.subTank_collected[tank] && global.subTank_energy[tank] > 0))
                || (tank >= global.maxSubTanks
                && (global.weaponsTank_collected[tank-global.maxSubTanks] && global.weaponsTank_energy[tank-global.maxSubTanks] > 0)) {
                    if tank < global.maxSubTanks
                        usingSubTank = true;
                    else
                        usingWeaponsTank = true;
                        
                    audio_play_sound(sfx_menu_select_2, 0.7, false);
                }
            }
            
            if global.keyRightPressed {
                optionType = 0;
                play_sound(sfx_menu_move_1,0.7,false);
            }
        }
        //Using the Sub Tanks
        else {
            if usingSubTank {
                var myTank = tank;
                
                if global.healthpoints >= global.healthpoints_max[global.character]
                || global.subTank_energy[myTank] <= 0 {
                    usingSubTank = false;
                }
                else {
                    global.healthpoints = min(global.healthpoints+1,global.healthpoints_max[global.character]);
                    global.subTank_energy[myTank] = max(global.subTank_energy[myTank]-1,0);
                }
                
                if global.subTank_energy[myTank] mod 3 == 1
                    play_sound(sfx_healthbar_fill,0.7,false);
            }
            else if usingWeaponsTank {
                var myTank = tank-global.maxSubTanks;
                var stopFill = false;
                
                //Check if all unlocked weapons are full
                var weapons = 0;
                var weaponsFull = 0;
                for(var i = 1; i < global.maxWeapons; i++) {
                    if global.weapon_unlocked[i] {
                        weapons++;
                        if global.weapon_energy[i] >= weapon_max_energy
                            weaponsFull++;
                    }
                }
                
                if global.weaponsTank_energy[myTank] > 0 && (weaponsFull < weapons) {
                    for(var i = 1; i < global.maxWeapons; i++)
                        global.weapon_energy[i] = min(global.weapon_energy[i]+1,weapon_max_energy);
                    global.weaponsTank_energy[myTank] = max(global.weaponsTank_energy[myTank]-1,0);
                    
                    if global.weaponsTank_energy[myTank] mod 3 == 1
                        play_sound(sfx_healthbar_fill,0.7,false);
                }
                else {
                    usingWeaponsTank = false;
                }
            }
        }
    }
}
//Fade out
else if state == 2 {
    colour -= 255/fadeFrames;
    if colour <= 0 {
        colour = 0;
        alpha -= 1/fadeFrames;
        if alpha <= 0 {
            global.frozen = false;
            instance_destroy();
        }
    }
}

