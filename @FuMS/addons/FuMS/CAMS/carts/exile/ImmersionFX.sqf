// ImmersionFX.sqf
// TheOneWhoKnocks
// Overwrites the global variables used by FrSB to integrate custom content into system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_immersionData","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "exile";
_debugCart = false;

_immersionData = 
[
	[
		"ImFX_Air_Patrol",1,false,
		[
			// AN-2
			"Exile_Plane_AN2_Green",
			"Exile_Plane_AN2_White",
			"Exile_Plane_AN2_Stripe",
			"An2_tk",
			"An2_af",
			"An2_a2",	
			// Cessna 185 Skymaster (armed)
			"GNT_C185T"
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
	],
	/////////////////////////// DAPE Loot Table
	[	
		"ImFX_DAPE_lootItems",1,false,
		[
			"Exile_Item_InstaDoc","Exile_Item_Vishpirin","Exile_Item_Bandage"
		]
	]

];


/////////////////////////////
// Cart processing //////////
/////////////////////////////
_hold = [_cartName,_immersionData,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): ImmersionFX.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};