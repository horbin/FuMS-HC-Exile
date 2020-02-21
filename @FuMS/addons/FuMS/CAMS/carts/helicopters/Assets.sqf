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
_cartName = "helicopters";
_debugCart = false;




// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	[
		"CAMS_Heli_Unarmed_W",1,false,
		[
			
		]
	],
	[
		"CAMS_Heli_Armed_W",1,false,
		[
			
		]
	],
	[
		"CAMS_Heli_Transport_W",1,false,
		[
			"B_Heli_Transport_03_F ","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_black_F","B_Heli_Transport_03_unarmed_green_F"
		]
	],
	
	
	
	
	[
		"CAMS_Heli_Taru_E",1,false,
		[
			"O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_box_F",
			"O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F",
			"O_Heli_Transport_04_black_F","O_Heli_Transport_04_ammo_black_F","O_Heli_Transport_04_box_black_F",
			"O_Heli_Transport_04_fuel_black_F","O_Heli_Transport_04_repair_black_F"
		]
	],
	[
		"CAMS_Heli_Armed_E",1,false,
		[
			
		]
	],
	[
		"CAMS_Heli_Transport_E",1,false,
		[
			"O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_bench_black_F",
			"O_Heli_Transport_04_covered_black_F","O_Heli_Transport_04_medevac_black_F"
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
