// ImmersionFX.sqf
// The Birds and The Bees Files
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
_cartName = "birdsbees"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes



_immersionData = 
[
	/////////////////////////////////////// AI Models 
	[
		"ImFX_AiModel_E",1,false,
		[
			// This will be the default enemy soldier (EAST)			
		]
	],
	////////////////////////////////////// Air Assets
	[
		"ImFX_Land_CoolCars",1,false,
		[
			"SIG_Hcode",
			"SIG_Hubcaps",
			"SIG_Magnums",
			"SIG_Roadrunner",
			
			"SIG_SuperBee",
			"SIG_SuperBeeB",
			"SIG_SuperBeeG",
			"SIG_SuperBeeL",
			"SIG_SuperBeeM",
			"SIG_SuperBeeY"	
		]
	],	
	/////////////////////////////////////// Land Assets

	[
		"ImFX_Land_Civ_Car",0,true,
		[
			// Vehicle that will serve as civilian cars
			"ImFX_Land_Steal"
		]
	]		
];

/////////////////////////////////////////////////////////////////////////////////////////////////
// Map Immersion Data
/////////////////////////////////////////////////////////////////////////////////////////////////

_swapArray = 
[
	//["Land_wpp_Turbine_V1_F","Land_WX_Windmill",180] // [Orig classname, new classname, rotation adjustment]
];


/////////////////////////////
// Cart processing //////////
/////////////////////////////
_hold = [_cartName,_immersionData,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): ImmersionFX.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

_oldSwapArray = missionNameSpace getvariable ["ImFX_BuildingSwap",[]];
_newSwapArray = _oldSwapArray + _swapArray;
missionNameSpace setVariable ["ImFX_BuildingSwap",_newSwapArray,true];