/// @description npc_default_damage()
function npc_default_damage() {

	//When the values are set to -1, the npc will recieve the amount
	//of damage set within the object.

	//X's wepaons
	weaponDamage[obj_weapon_buster] = -1;
	weaponDamage[obj_weapon_buster_half_charged] = -1;
	weaponDamage[obj_weapon_buster_charged] = -1;

	weaponDamage[obj_weapon_test1] = -1;
	weaponDamage[obj_weapon_test1_giga] = -1;

	weaponDamage[obj_weapon_test2] = -1;

	//Zero's saber
	for(var i = 0; i <= 6; i++) {
	    saberDamage[i] = -1;
	}



}
