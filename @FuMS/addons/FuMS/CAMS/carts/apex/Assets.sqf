// Assets.sqf
// TheOneWhoKnocks
// Overwrites the global variables used by FrSB to generate various elements of the system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_cartContents","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "apex";
_debugCart = false;




// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	// Water Vehicles - West
	[
		"CAMS_H20_Boats_W",1,false,
		[
			"B_T_Boat_Armed_01_minigun_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,false,
		[
			"B_T_Boat_Transport_01_F","B_T_Lifeboat","B_G_Boat_Transport_01_F"
		]
	],
	[
		"CAMS_H20_RHIB_W",1,false,
		[
			"B_G_Boat_Transport_02_F"
		]
	],	
	[
		"CAMS_H20_ALL_W",0,false,
		[
			"CAMS_H20_Boats_W", "CAMS_H20_RubberDucks_W", "CAMS_H20_RHIB_W"
		]
	],	
	
	// Water Vehicles - East
	[
		"CAMS_H20_Boats_E",1,false,
		[
			"O_T_Boat_Armed_01_hmg_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,false,
		[
			"O_T_Boat_Transport_01_F","O_T_Lifeboat"
		]
	],
	[
		"CAMS_H20_RHIB_E",1,false,
		[
			"O_G_Boat_Transport_02_F"
		]
	],	
	[
		"CAMS_H20_ALL_E",0,false,
		[
			"CAMS_H20_Boats_E", "CAMS_H20_RubberDucks_E", "CAMS_H20_RHIB_E"
		]
	],	
	
	// Water Vehicles - Ind
	[
		"CAMS_H20_Boats_I",1,false,
		[
			"I_Boat_Armed_01_minigun_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,false,
		[
			"I_C_Boat_Transport_01_F ","I_C_Boat_Transport_02_F ","I_G_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_RHIB_I",1,false,
		[
			"I_C_Boat_Transport_02_F"
		]
	],	
	[
		"CAMS_H20_ALL_I",0,false,
		[
			"CAMS_H20_Boats_I", "CAMS_H20_RubberDucks_I", "CAMS_H20_RHIB_I"
		]
	],

	[
		"CAMS_Heli_Unarmed_I",1,false,
		[
			"I_C_Heli_Light_01_civil_F"
		]
	],
	[
		"CAMS_Heli_Unarmed_W",1,false,
		[
			"B_T_VTOL_01_vehicle_F","B_T_VTOL_01_vehicle_blue_F","B_T_VTOL_01_vehicle_olive_F"
		]
	],
	
	[
		"CAMS_Heli_Unarmed_E",1,false,
		[
			"O_T_VTOL_02_vehicle_F","O_T_VTOL_02_vehicle_dynamicLoadout_F","O_T_VTOL_02_vehicle_F",
			"O_T_VTOL_02_vehicle_hex_F","O_T_VTOL_02_vehicle_ghex_F","O_T_VTOL_02_vehicle_grey_F"
		]
	],

	[
		"CAMS_Heli_Armed_W",1,false,
		[
			"B_T_VTOL_01_armed_F","B_T_VTOL_01_armed_blue_F","B_T_VTOL_01_armed_olive_F"
		]
	],
	
	[
		"CAMS_Heli_Transport_W",1,false,
		[
			"B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F","B_T_VTOL_01_infantry_F",
			"B_T_VTOL_01_infantry_blue_F","B_T_VTOL_01_infantry_olive_F","O_T_VTOL_02_infantry_dynamicLoadout_F"
		]
	],

	[
		"CAMS_Heli_Transport_E",1,false,
		[
			"O_T_VTOL_02_infantry_F","O_T_VTOL_02_infantry_dynamicLoadout_F","O_T_VTOL_02_infantry_hex_F","O_T_VTOL_02_infantry_ghex_F","O_T_VTOL_02_infantry_grey_F"
		]
	],


	[
		"CAMS_Plane_CAS_W",1,false,
		[
			"B_Plane_CAS_01_F","B_Plane_CAS_01_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F"
		]
	],
	[
		"CAMS_Plane_UAV_W",1,false,
		[
			"B_T_UAV_03_F","B_T_UAV_03_dynamicLoadout_F"
		]
	],
	
	[
		"CAMS_Plane_CAS_E",1,false,
		[

		]
	],
	[
		"CAMS_Plane_UAV_E",1,false,
		[
			"O_T_UAV_04_CAS_F","O_T_UAV_04_CAS_F"
		]
	],
	
	[
		"CAMS_Civ_Offroad",1,false,
		[
			"C_Offroad_02_unarmed_black_F","C_Offroad_02_unarmed_blue_F","C_Offroad_02_unarmed_F","C_Offroad_02_unarmed_green_F",
			"C_Offroad_02_unarmed_orange_F","C_Offroad_02_unarmed_red_F","C_Offroad_02_unarmed_white_F"
		]
	],
	[
		"CAMS_Civ_Plane",1,false,
		[
			"C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"
		]
	],	
	
	[
		"CAMS_Mil_ArmedOffroad_W",1,false,
		[
			"B_T_LSV_01_armed_F","B_T_LSV_01_AT_F","B_T_LSV_01_armed_CTRG_F","B_LSV_01_armed_F","B_LSV_01_AT_F",
			"B_LSV_01_armed_black_F","B_LSV_01_armed_olive_F","B_LSV_01_armed_sand_F","B_T_LSV_01_armed_black_F",
			"B_T_LSV_01_armed_olive_F","B_T_LSV_01_armed_sand_F","B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F"
		]
	],

	[
		"CAMS_Mil_UnarmedOffroad_W",1,false,
		[
			"B_T_LSV_01_unarmed_F","B_T_LSV_01_unarmed_CTRG_F","B_LSV_01_unarmed_F","B_CTRG_LSV_01_light_F",
			"B_LSV_01_unarmed_black_F","B_LSV_01_unarmed_olive_F","B_LSV_01_unarmed_sand_F","B_T_LSV_01_unarmed_black_F",
			"B_T_LSV_01_unarmed_olive_F","B_T_LSV_01_unarmed_sand_F","B_T_MRAP_01_F","B_GEN_Offroad_01_gen_F"
		]
	],
	[
		"CAMS_Mil_Toy_W",1,false,
		[
			"B_T_Quadbike_01_F"
		]
	],
	[
		"CAMS_Mil_Transport_W",1,false,
		[
			"B_T_Truck_01_transport_F","B_T_Truck_01_covered_F"
		]
	],
	[
		"CAMS_Mil_UtilityVehicle_W",1,false,
		[
			"B_T_Truck_01_mover_F","B_T_Truck_01_box_F","B_T_Truck_01_Repair_F","B_T_Truck_01_ammo_F","B_T_Truck_01_fuel_F","B_T_Truck_01_medical_F"
		]
	],
	
	[
		"CAMS_Mil_UGV_Armed_W",1,false,
		[
			"B_T_UGV_01_rcws_olive_F"
		]
	],
	[
		"CAMS_Mil_UGV_Unarmed_W",1,false,
		[
			"B_T_UGV_01_olive_F"
		]
	],
	
	[
		"CAMS_Mil_ArmedTransport_W",1,false,
		[
			"B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_CRV_F","B_T_APC_Tracked_01_rcws_F"
		]
	],

	[
		"CAMS_Mil_Tank_W",1,false,
		[
			"B_T_MBT_01_cannon_F","B_T_MBT_01_TUSK_F"
		]
	],
	[
		"CAMS_Mil_AA_E",1,false,
		[
			"B_T_APC_Tracked_01_AA_F"
		]
	],	
	
	[
		"CAMS_Mil_Artillery_W",1,false,
		[
			"B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"
		]
	],
	
	
	
	
	
	[
		"CAMS_Mil_ArmedOffroad_E",1,false,
		[
			"O_T_LSV_02_armed_F","O_T_LSV_02_armed_viper_F","O_T_LSV_02_AT_F","O_LSV_02_armed_F","O_LSV_02_armed_viper_F","O_LSV_02_AT_F",
			"O_T_LSV_02_armed_black_F","O_T_LSV_02_armed_ghex_F","O_T_LSV_02_armed_arid_F","O_LSV_02_armed_black_F","O_LSV_02_armed_ghex_F",
			"O_LSV_02_armed_arid_F","O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F"

		]
	],

	[
		"CAMS_Mil_UnarmedOffroad_E",1,false,
		[
			"O_T_LSV_02_unarmed_F","O_T_LSV_02_unarmed_viper_F","O_LSV_02_unarmed_F","O_LSV_02_unarmed_viper_F","O_T_LSV_02_unarmed_black_F",
			"O_T_LSV_02_unarmed_ghex_F","O_T_LSV_02_unarmed_arid_F","O_LSV_02_unarmed_black_F","O_LSV_02_unarmed_ghex_F","O_LSV_02_unarmed_arid_F"
		]
	],
	[
		"CAMS_Mil_Toy_E",1,false,
		[
			"O_T_Quadbike_01_ghex_F"
		]
	],
	[
		"CAMS_Mil_Transport_E",1,false,
		[
			"O_T_MRAP_02_ghex_F","O_T_Truck_02_F","O_T_Truck_02_transport_F","O_T_Truck_03_covered_ghex_F",
			"O_T_Truck_03_transport_ghex_F","O_G_Van_02_transport_F","O_G_Van_02_vehicle_F"
		]
	],
	[
		"CAMS_Mil_UtilityVehicle_E",1,false,
		[
			"O_T_Truck_02_Ammo_F","O_T_Truck_02_Box_F","O_T_Truck_02_fuel_F","O_T_Truck_02_Medical_F","O_T_Truck_03_ammo_ghex_F",
			"O_T_Truck_03_device_ghex_F","O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_medical_ghex_F","O_T_Truck_03_repair_ghex_F"

		]
	],
	
	[
		"CAMS_Mil_UGV_Armed_E",1,false,
		[
			"O_T_UGV_01_rcws_ghex_F"

		]
	],
	[
		"CAMS_Mil_UGV_Unarmed_E",1,false,
		[
			"O_T_UGV_01_ghex_F"
		]
	],
	[
		"CAMS_Mil_ArmedTransport_E",1,false,
		[
			"O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F"
		]
	],

	[
		"CAMS_Mil_Tank_E",1,false,
		[
			"O_T_MBT_02_cannon_ghex_F"
		]
	],
	[
		"CAMS_Mil_AA_E",1,false,
		[
			"O_T_APC_Tracked_02_AA_ghex_F"
		]
	],	
	[
		"CAMS_Mil_Artillery_E",1,false,
		[
			"O_T_MBT_02_arty_ghex_F"
		]
	]
	
	
];




/////////////////////////////
// Cart processing //////////
/////////////////////////////
////////////////////////  NEW for today

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};
//["CAMS System",format ["Cart:%1 assets loaded",_cartName]] spawn Haz_fnc_createNotification;
