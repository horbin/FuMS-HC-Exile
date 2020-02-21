// ImmersionFX.sqf
// TEMPLATE FILE
// TheOneWhoKnocks
// Overwrites the global variables used by DEMS to integrate custom content into system

// Global variables in this file are available to the AI creation and Loot creation portions of DEMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When DEMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_immersionData","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "template"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes



_immersionData = 
[
	/////////////////////////////////////// AI Models 
	[
		"ImFX_AiModel_E",1,true,
		[
			// This will be the default enemy soldier (EAST)			
		]
	],
	
	////////////////////////////////////// Air Assets
	[
		"ImFX_Air_Patrol",1,true,
		[
			// Aircrat that should be used in air patrol roles (Used specificaly by DAPE)
			// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
			// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		]
	],
	[
		"ImFX_Air_Interceptor",1,true,
		[
			// Aircraft that should be used as interceptors (Used specificaly by DAPE)
			// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
			// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		]
	],
	[
		"ImFX_Air_Airdrop",0,true,
		[
			// Helos you want to use for airdrop type roles
		]
	],

	/////////////////////////////////////// Heli Assets
	[
		"ImFX_Heli_Escort",0,true,
		[
			// Helos you want to use for escort type roles
		]
	],
	[
		"ImFX_Heli_Transport",0,true,
		[
			// Helos you want to use in transport type roles
		]
	],
	[
		"ImFX_Heli_Troops",0,true,
		[
			// Helos you want to use as troop transport type roles
		]
	],
	[
		"ImFX_Air_Rescue_Heli",1,true,
		// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
		// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		[
			// Helos you want to use for Air Rescue type roles (Used specificaly by DAPE)
		]
	],

	
	/////////////////////////////////////// Land Assets

	[
		"ImFX_Land_Armed_Guard",0,true,
		[
			// Vehicles that will serve as armed guard roles
		]
	],	
	[
		"ImFX_Land_Armed_Transport",0,true,
		[
			// Vehicle that will serve as armed troop transports
		]
	],	
	[
		"ImFX_Land_Unarmed_Transport",0,true,
		[
			// Vehicle that will serve as unarmed troop transports
		]
	],	
	[
		"ImFX_Land_Civ_Truck",0,true,
		[
			// Vehicle that will serve as civilian transports
		]
	],	
	[
		"ImFX_Land_Civ_Car",0,true,
		[
			// Vehicle that will serve as civilian cars
		]
	],
	///////////////// DAPE Loot Tables
	[
		"ImFX_DAPE_lootWeapons",1,true,
		[
			// Weapons you want included as part of DAPE loot weapons found in rescue helicopter
		]
	],
	[
		"ImFX_DAPE_lootItems",1,true,
		[
			// Weapons you want included as part of DAPE loot items found in rescue helicopter
		]
	]
	/////////////////////////////////////// Misc Assets
	// Add any other groupings you want here
	
	
	
	
];

/////////////////////////////
// Cart processing //////////
/////////////////////////////
_hold = [_cartName,_immersionData,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): ImmersionFX.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};