// Assets.sqf
// The Birds and The Bees Files
// TheOneWhoKnocks
// Overwrites the global variables used by FuMS to generate various elements of the system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).


private ["_cartContents","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "birdsbees"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,false,
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
	[
		"CAMS_Land_Work_C",0,true,
		[
			"CAMS_Land_Car_C", "CAMS_Land_Offroad_C", "CAMS_Land_Van_C"
		]
	],	

	[
		"CAMS_Land_ALL_C",0,true,
		[
			"CAMS_Land_Work_C", "CAMS_Land_Truck_C"
		]
	]
	*/
];

// Global Collections

// Admin ATTENTION!
// Any new global arrays you want to have available on the headless client need to be defined in this file.
// Define the array below, then place the name of the array in the 'FuMS_ListofCustomGlobalItems' variable below.
// At initialization your global variable will be passed onto the HC prior to it attempting to initialize any missions.
CAMS_MyExampleGlobalVariable = ["Chemlight_blue","Chemlight_green","Chemlight_red"];

CAMS_ListofCustomGlobalItems =
[
	"CAMS_MyExampleGlobalVariable"
];


/////////////////////////////
// Cart processing //////////
/////////////////////////////

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

//diag_log format ["[CAMS] CART System: %1 assets loaded",_cartName];
