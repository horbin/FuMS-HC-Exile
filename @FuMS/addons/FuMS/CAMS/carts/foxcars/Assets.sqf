// Assets.sqf
// FoxCars
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
_cartName = "foxcars"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;			// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	/*
	/////////////////////////////////////////////////////// Guerilla Vehicles
	[
		"CAMS_Land_ArmedOffroad_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,false,
		[
			"Fox_LandCruiserPolice",			// 2006 Toyota Land Cruiser Police - Yellow Camo Pattern
			"Fox_Landrover","Fox_Landrover2",	// Landrover Fox Performance - Yellow, Orange
			"Fox_Tahoe",						// The Anerican - Black SUV
			"Fox_Tahoe_Apocalypse",				// The Nomad - Survivor Skinned SUV	
			"Fox_LandCruiser",					// The Cruiser CSAT Camo - Yellow Camo (Land Cruiser)
			"Fox_LandCruiser2",					// The Cruiser Green Camo
			"Fox_LandCruiser3",					// The Cruiser Black Camo
			"Fox_Patrol",						// The Insurgent CSAT Camo - Yellow Camo (Small Dickmobile)
			"Fox_Patrol2",						// The Insurgent Green Camo
			"Fox_Patrol3",						// The Insurgent Black Camo
			"Fox_Pickup_Apocalypse",			// The Renegade (Survivor Open Bed Pickup)
			"Fox_Pickup_6S",					// The Renegade (Survivor Covered Bed Pickup)
			"Fox_Pickup_Tow",					// The Renegade (Survivor Towtruck)
			
			
			"Fox_RickGrimes",					// Rick Grimes CVI (Clean Cop Car)
			"Fox_Wanderer",						// NYPD Survivor Ride			
			"fox_R34_Fox",						// Fox Custom Skinned Charger
			"Fox_CobraR_Police",				// Survivor PD Mustang

			"Fox_ChallengerO",					// The Defiant - Orange Challenger
			"Fox_ChallengerBR",					// The Defiant - Black Red Challenger
			"Fox_ChallengerW",					// The Defiant - White Challenger
			"Fox_ChallengerDev2",				// The Defiant - White Red Challenger
			"Fox_ChallengerYB",					// The Defiant - Yellow Black Challenger
			
			
			"Fox_Daytona",						// The General - Survivor Daytona
			"Fox_DaytonaGeneral",				// The General - Army Daytona
			"Fox_DaytonaStratos",				// The General - Stratospheric Daytona
			
			"Fox_Interceptor",					// The Interceptor - Survivor Camero
			
			"Fox_F40",							// The Intruder - Monster Sports Car
			"Fox_GNX",							// The Outlaw - Monster Buick
			"Fox_Outsider",						// The Outsider - Monster Charger?
			"Fox_Charger_Apocalypse",			// The Raider - Monster Charger?
			"Fox_M5TG",							// The Responder - Monster Station Wagon
			"Fox_Viper",						// The Runner - Monster Corvettes
			"fox_R34_Apocalypse"				// The Samurai - Monster Skyline
		]
	],
	[
		"CAMS_Land_UGV_Armed_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Transport_I",1,false,
		[
			"Fox_BUS","Fox_MEGABUS",	// The Carrier / The Carrier Mk2 - Armored Busses
			"Fox_Truck",				// The GlobeMaster - 
			"Fox_Fireengine"			// The Patriot - Armored Firetruck
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Tank_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Transport_ALL_I",0,true,
		[
			"CAMS_Land_Transport_I", "CAMS_Land_ArmedTransport_I"
		]
	],
	[
		"CAMS_Land_Unarmed_I",0,true,
		[
			"CAMS_Land_UnarmedOffroad_I", "CAMS_Land_Transport_I"
		]
	],	
	[
		"CAMS_Land_Armed_I",0,true,
		[
			"CAMS_Land_ArmedOffroad_I", "CAMS_Land_ArmedTransport_I"
		]
	],	
	[
		"CAMS_Land_ALL_I",0,true,
		[
			"CAMS_Land_Unarmed_I", "CAMS_Land_Armed_I"
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
