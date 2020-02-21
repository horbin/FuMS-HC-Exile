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
_cartName = "jets";
_debugCart = false;

_immersionData = 
[
	[
		"ImFX_Air_Patrol",1,false,
		[
			// UCAV Sentinel
			"B_UAV_05_F"
		]
	],
	[	
		"ImFX_Air_Interceptor",1,false,
		[
			// A-149 Gryphon
			"I_Plane_Fighter_04_F",
			// F/A 181
			"B_Plane_Fighter_01_F",
			"B_Plane_Fighter_01_Stealth_F",
			// To-201 Shikra
			"O_Plane_Fighter_02_F",
			"O_Plane_Fighter_02_Stealth_F"
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