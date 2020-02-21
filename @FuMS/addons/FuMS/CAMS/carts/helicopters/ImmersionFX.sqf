// ImmersionFX.sqf
// TheOneWhoKnocks
// Overwrites the global variables used by FrSB to integrate crstom content into system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_immersionData","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "apex";
_debugCart = false;

_immersionData = 
[
	[
		"ImFX_Air_Patrol",1,false,
		[
		// Ceaser BTT
		"C_Plane_Civil_01_F",
		"C_Plane_Civil_01_racing_F",
		"I_C_Plane_Civil_01_F",	
		
		// KH-3A Fenghuang (UAV)
		"O_T_UAV_04_CAS_F",
		// V-44 X Blackfish
		"B_T_VTOL_01_armed_F",
		"B_T_VTOL_01_infantry_F",
		"B_T_VTOL_01_vehicle_F",
		// Y-32 Xi'an
		"O_T_VTOL_02_infantry_dynamicLoadout_F",
		"O_T_VTOL_02_vehicle_dynamicLoadout_F"
		]
	],
	[	
		"ImFX_Air_Interceptor",1,false,
		[
		]
	],
	[	
		"ImFX_Air_Rescue_Heli",1,false,
		[
		]
	]

];


/////////////////////////////
// Cart processing //////////
/////////////////////////////
_hold = [_cartName,_immersionData,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): ImmersionFX.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};