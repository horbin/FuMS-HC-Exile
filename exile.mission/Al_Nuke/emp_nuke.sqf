// by ALIAS

private ["_al_grenade","_shooter","_poz_g","_zgud","_obj_nuke"];

//if (!isServer) exitWith {};
_obj_nuke		= _this select 0;
_rang_emp	= _this select 1;

_poz_g = position _obj_nuke;
_list_man = _poz_g nearEntities [["Civilian","SoldierGB","SoldierEB","SoldierWB"],_rang_emp];
sleep 1;
_list_car = _poz_g nearEntities [["Car", "Motorcycle", "Tank","Air","Ship"],_rang_emp];
sleep 1;
_static = _poz_g nearEntities [["B_static_AA_F", "B_static_AT_F","B_T_Static_AA_F","B_T_Static_AT_F","B_T_GMG_01_F","B_T_HMG_01_F","B_T_Mortar_01_F","B_HMG_01_high_F","B_HMG_01_A_F","B_GMG_01_F","B_GMG_01_high_F","B_GMG_01_A_F","B_Mortar_01_F","B_G_Mortar_01_F","B_Static_Designator_01_F","B_AAA_System_01_F","B_SAM_System_01_F","B_SAM_System_02_F","O_HMG_01_F","O_HMG_01_high_F","O_HMG_01_A_F","O_GMG_01_F","O_GMG_01_high_F","O_GMG_01_A_F","O_Mortar_01_F","O_G_Mortar_01_F","O_static_AA_F","O_static_AT_F","O_Static_Designator_02_F","I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_Mortar_01_F","I_G_Mortar_01_F","I_static_AA_F","I_static_AT_F"],_rang_emp];
sleep 1;
_list_lit = nearestObjects [_poz_g,["Land_TTowerBig_2_F","Land_TTowerBig_1_F","Lamps_base_F","PowerLines_base_F","PowerLines_Small_base_F","Land_LampStreet_small_F"],_rang_emp];
_special_helmet = ["H_PilotHelmetFighter_B", "H_PilotHelmetFighter_O","H_HelmetO_ViperSP_ghex_F","H_PilotHelmetFighter_I","H_HelmetO_ViperSP_hex_F"];
_special_launchers = ["launch_RPG32_F","launch_O_Titan_F","launch_O_Titan_short_F","launch_MRAWS_sand_F","launch_NLAW_F","launch_B_Titan_short_F","launch_B_Titan_F","launch_B_Titan_short_tna_F","launch_B_Titan_tna_F","launch_MRAWS_green_F","launch_MRAWS_olive_rail_F","launch_I_Titan_short_F","launch_I_Titan_F","launch_RPG32_ghex_F","launch_O_Vorona_green_F","launch_O_Titan_short_ghex_F","launch_O_Titan_ghex_F","launch_O_Vorona_brown_F"];

sleep 30;
{_x setHitPointDamage ["hitEngine",1]; _x disableTIEquipment true; _x disableNVGEquipment true; [[_x],"AL_Nuke\tgt_sfx.sqf"] remoteExec ["execVM"]; sleep 0.1} forEach _list_car;

{_x setDamage 0.9;[[_x],"AL_Nuke\sparky.sqf"] remoteExec ["execVM"];sleep 0.1} forEach _list_lit;
{_x setDamage 1;[[_x],"AL_Nuke\sparky.sqf"] remoteExec ["execVM"];sleep 0.1} forEach _static;
//{_x disableTIEquipment true; _x disableNVGEquipment true; [[_x],"AL_Nuke\sparky.sqf"] remoteExec ["execVM"];sleep 0.1} forEach _static;
["geiger"] remoteExec ["playsound"];
{
	[[_x],"AL_Nuke\tgt_sfx.sqf"] remoteExec ["execVM"];
	removeGoggles _x; _x removeWeaponGlobal "Rangefinder"; _x removeWeaponGlobal "Laserdesignator"; _x removeItem "Rangefinder"; _x unassignItem "ItemGPS"; _x removeItem "ItemGPS"; _x unassignItem "ItemRadio"; _x removeItem "ItemRadio";
	_x unassignItem "NVGoggles"; _x removeItem "NVGoggles"; _x unassignItem "NVGoggles_OPFOR"; _x removeItem "NVGoggles_OPFOR"; _x unassignItem "NVGoggles_INDEP"; _x removeItem "NVGoggles_INDEP";
	_x unassignItem "O_NVGoggles_hex_F"; _x removeItem "O_NVGoggles_hex_F"; _x unassignItem "O_NVGoggles_urb_F"; _x removeItem "O_NVGoggles_urb_F"; _x unassignItem "O_NVGoggles_ghex_F"; _x removeItem "O_NVGoggles_ghex_F";
	_x unassignItem "NVGoggles_tna_F"; _x removeItem "NVGoggles_tna_F"; _x unassignItem "NVGogglesB_blk_F"; _x removeItem "NVGogglesB_blk_F"; _x unassignItem "NVGogglesB_grn_F"; _x removeItem "NVGogglesB_grn_F";
	_x unassignItem "NVGogglesB_gry_F"; _x removeItem "NVGogglesB_gry_F"; _x unassignItem "Integrated_NVG_F"; _x removeItem "Integrated_NVG_F"; _x unassignItem "Integrated_NVG_TI_0_F"; _x removeItem "Integrated_NVG_TI_0_F";
	_x unassignItem "Integrated_NVG_TI_1_F"; _x removeItem "Integrated_NVG_TI_1_F"; _x removePrimaryWeaponItem "acc_pointer_IR"; 
	if (headgear _x in _special_helmet) then {removeHeadgear _x};
	if (secondaryWeapon _x in _special_launchers) then {_x removeWeaponGlobal (secondaryWeapon _x)};
	_x setDamage ((getDammage _x) + 0.1); sleep 0.1
} forEach _list_man;