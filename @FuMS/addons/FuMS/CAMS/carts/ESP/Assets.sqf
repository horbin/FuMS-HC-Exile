// Assets.sqf
// Extended Survival Pack
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
_cartName = "ESP"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,false,
		[
			"DDR_Item_Antibiotic","DDR_Item_Bloodbag","DDR_Item_Bandage_Dirty","DDR_Item_Disinfectant",
			"DDR_Item_Dressing","DDR_Item_Firstaid","DDR_Item_Painkillers","DDR_Item_Vitamins",
			"DDR_Item_Injector"
		]
	],	
	[
		"CAMS_H20_Boats_I",1,false,
		[
			"DDR_Boat_Armed",
			"DDR_Boat_MotorBoat","DDR_Boat_MotorBoat_police","DDR_Boat_MotorBoat_rescue"
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,false,
		[
			"DDR_Boat_RHIB","DDR_Boat_RubberDuck"
		]
	],
	[
		"CAMS_H20_SDV_I",1,false,
		[
			"DDR_Boat_SDV"
		]
	],

	[
		"CAMS_H20_ALL_I",0,true,
		[
			"CAMS_H20_Boats_I", "CAMS_H20_RubberDucks_I", "CAMS_H20_SDV_I"
		]
	],	
	[
		"CAMS_H20_ALL",0,true,
		[
			"CAMS_H20_ALL_W", "CAMS_H20_ALL_E", "CAMS_H20_ALL_I", "CAMS_H20_ALL_C"
		]
	],	
	///////////////////////////////////////////////// Helicopters - Ind
	[
		"CAMS_Heli_Transport_I",1,false,
		[
			"DDR_Chopper_Huron",

			"DDR_Chopper_Ghost_Hawk",
			"DDR_Chopper_Hellcat",
			"DDR_Chopper_Mohawk",
			"DDR_Chopper_Orca"
		
		]
	],
	[
		"CAMS_Heli_ArmedTransport_I",1,false,
		[
			"DDR_Chopper_Huron_Armed"

		]
	],
	[
		"CAMS_Heli_Armed_I",1,false,
		[	
		]
	],
	[
		"CAMS_Heli_Unarmed_I",1,false,
		[
			"DDR_Chopper_Hummingbird_Civillian"

		]
	],	
	/*
	[
		"CAMS_Plane_CAS_C",1,false,
		[
		]
	],
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,false,
		[
		]
	],

	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,false,
		[
		]
	],
	[
		"CAMS_Plane_UAV_E",1,false,
		[
		]
	],
	*/
	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,false,
		[
			"DDR_Plane_Black_Wasp","DDR_Plane_Black_Wasp_Stealth",
			"DDR_Plane_Blackfish_Infantry","DDR_Plane_Blackfish_Vehicle",
			"DDR_Plane_Buzzard",
			"DDR_Plane_Ceasar","DDR_Plane_Ceasar_racing",
			"DDR_Plane_Gryphon",
			"DDR_Plane_Neophron",
			"DDR_Plane_Shikra","DDR_Plane_Shikra_Stealth",
			"DDR_Plane_Wipeout",
			"DDR_Plane_Xian_Infantry","DDR_Plane_Xian_Vehicle"
		]
	],

	/////////////////////////////////////////////////////// Guerilla Vehicles
	[
		"CAMS_Land_ArmedOffroad_I",1,false,
		[
			"DDR_Car_LSV_01_AT","DDR_Car_LSV_02_AT",
			"DDR_Car_Offroad_01_AT","DDR_Car_Offroad_02_AT","DDR_Car_Offroad_02_LMG",

			"DDR_Car_Prowlerarmed","DDR_Car_ProwlerLight",

			"DDR_Car_Qilinarmed","DDR_Car_Qilinarmedpat",

			"DDR_Car_Tractor"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,false,
		[
			"DDR_Car_4WD",
			"DDR_Car_GEN_Offroad_comms","DDR_Car_GEN_Offroad_covered",
			
			"DDR_Car_MB4WD","DDR_Car_MB4WDOpen",
			
			"DDR_Car_QilinUnarmed",
			
			"DDR_Car_ProwlerUnarmed",
			
			"DDR_Car_Strider",
			
			"DDR_Car_Offroad_covered","DDR_Car_Offroad_covered_vehicle","DDR_Car_Offroad_gen",
			
			"DDR_Car_Hunter",
			"DDR_Car_Ifrit"
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
			"DDR_Car_Hemmt_covered","DDR_Car_Hemmt_transport",
			
			"DDR_Car_Van","DDR_Car_Van_02_vehicle",
			"DDR_Car_Van_gen_transport","DDR_Car_Van_gen_vehicle","DDR_Car_Van_transport",
			
			"DDR_Car_Zamak_covered","DDR_Car_Zamak_transport",
			
			"DDR_Car_Tempest_covered","DDR_Car_Tempest_transport"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,false,
		[
			"DDR_Car_Hemmt_ammo","DDR_Car_Hemmt_box","DDR_Car_Hemmt_flatbed","DDR_Car_Hemmt_fuel","DDR_Car_Hemmt_medical",
			"DDR_Car_Hemmt_mover","DDR_Car_Hemmt_Repair",
			
			"DDR_Car_Van_Box","DDR_Car_Van_medevac","DDR_Car_Van_service","DDR_Car_Van_vehicle",
			
			"DDR_Car_Zamak_ammo","DDR_Car_Zamak_box","DDR_Car_Zamak_fuel","DDR_Car_Zamak_medical","DDR_Car_Zamak_water",
			
			"DDR_Car_Tempest_ammo","DDR_Car_Tempest_device","DDR_Car_Tempest_fuel","DDR_Car_Tempest_medical","DDR_Car_Tempest_repair",
			
			"DDR_Car_Offroad_comms","DDR_Car_Offroad_comms_vehicle"

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
			"DDR_Tank_Bobcat",
			"DDR_Tank_Panther",
			"DDR_Tank_Scout",
			"DDR_Tank_Slammer"
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


/*


DDR_Item_Rotten_Orange
DDR_Item_Rotten_Apple
DDR_Item_Rotten_Apricot
DDR_Item_Rotten_Pear
DDR_Item_Rotten_Melon
DDR_Item_Rotten_Banana
DDR_Item_Stones
DDR_Item_Leaves
DDR_Item_Rotten_Carrot

DDR_Item_Rottenberry
DDR_Item_Drugs_Cocaine
DDR_Item_Drugs_Weed
DDR_Item_Heroin

DDR_Item_Fishing_Net
DDR_Item_Old_Camera
DDR_Item_Old_Documents
DDR_Item_File_Photos
DDR_Item_Document_Top_Secret
DDR_Item_Mobile_Phone
DDR_Item_Notepad
DDR_Item_Ballpoint_Pen
DDR_Item_Secret_Documents


DDR_Item_Craft_Box
DDR_Item_Skull


*/
