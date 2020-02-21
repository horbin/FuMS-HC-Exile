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
_cartName = "jets";
_debugCart = false;


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	[
		"CAMS_Plane_CAS_W",1,false,
		[
			"B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_Cluster_F"
		]
	],
	[
		"CAMS_Plane_UAV_W",1,false,
		[
			"B_UAV_05_F"
		]
	],
	[
		"CAMS_Plane_CAS_E",1,false,
		[
			"O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","O_Plane_Fighter_02_Cluster_F"
		]
	],
	[
		"CAMS_Plane_UAV_E",1,false,
		[
			
		]
	],
	[
		"CAMS_Plane_CAS_I",1,false,
		[
			"I_Plane_Fighter_04_F","I_Plane_Fighter_04_Cluster_F"
		]
	],
	[
		"CAMS_Plane_UAV_I",1,false,
		[
			
		]
	]

];




/////////////////////////////
// Cart processing //////////
/////////////////////////////

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

