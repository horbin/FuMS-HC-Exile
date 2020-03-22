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
_cartName = "marksmen";
_debugCart = false;


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	

	[
		"CAMS_AI_CSAT",1,false,
		[
			"O_Sharpshooter_F",
			"O_HeavyGunner_F"		
		]
	],
	[
		"CAMS_AI_CSAT_URBAN",1,false,
		[
			"O_Urban_Sharpshooter_F",
			"O_Urban_HeavyGunner_F"
		]
	],
	[
		"CAMS_AI_CSAT_SF",1,false,
		[
			"O_Pathfinder_F"
		]
	],
	[
		"CAMS_AI_ALL_E",0,true,
		[
			"CAMS_AI_FIA_E",
			"CAMS_AI_CSAT_SOLDIER",
			"CAMS_AI_CSAT_URBAN",
			"CAMS_AI_CSAT_SF"
		]
	],				




	
	[
		"CAMS_AI_FIA_W",1,false,
		[
			"B_G_Sharpshooter_F"
		]
	],
	[
		"CAMS_AI_NATO_SOLDIER",1,false,
		[
			"B_Sharpshooter_F","B_HeavyGunner_F"
		]
	],
	[
		"CAMS_AI_NATO_SF",1,false,
		[
			"B_ghillie_lsh_F","B_ghillie_sard_F","B_ghillie_ard_F","B_Recon_Sharpshooter_F"
		]
	],

	[
		"CAMS_AI_ALL_W",0,true,
		[
			"CAMS_AI_FIA_W","CAMS_AI_NATO_SOLDIER","CAMS_AI_NATO_SF"
		]
	],
	
	
	[
		"CAMS_AI_FIA_I",1,false,
		[
			"I_G_Sharpshooter_F"
		]
	],
	[
		"CAMS_AI_NATO_SF",1,false,
		[
			"I_ghillie_lsh_F","I_ghillie_sard_F","I_ghillie_ard_F"
		]
	],
	[
		"CAMS_AI_ALL_I",0,true,
		[
			"CAMS_AI_FIA_I","CAMS_AI_AAF","CAMS_AI_AAF_SF"
		]
	]
];




/////////////////////////////
// Cart processing //////////
/////////////////////////////

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};
