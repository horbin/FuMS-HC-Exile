// Assets.sqf
// Template
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
_cartName = "madmax"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	/*
	//////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// Uniforms ////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////  Civ
	[	
		"CAMS_U_Civ",		// Global variable being adjusted
		1,					// Side this is assigned to 
							// 0 - Global group combination
							// 1 - Everything else
		true,				// TRUE - Replaces vanilla class      FALSE - Appends to vanilla class
					
		[
			"U_C_Journalist","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1",
			"U_C_Scientist","U_OrestesBody","U_Rangemaster","U_NikosAgedBody","U_NikosBody","U_Competitor"

		]
	],

	//////////////////////////////////// Uniforms - WEST
	
	[
		"CAMS_U_Soldier_W",1,false,
		[
		]	
	],
	[
		"CAMS_U_Guerilla_W",1,false,
		[
		]
	],	
	[
		"CAMS_U_Ghillie_W",1,false,
		[
		]
	],
	[
		"CAMS_U_Aviation_W",1,false,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_W",1,false,
		[
		]
	],
	[	
		"CAMS_U_All_W",0,true,
		[
			"CAMS_U_Soldier_W","CAMS_U_Guerilla_W","CAMS_U_Ghillie_W","CAMS_U_Wetsuit_W","CAMS_U_Aviation_W"
		]
	],
	
	//////////////////////////////////////// Uniforms - EAST
	
	[
		"CAMS_U_Soldier_E",1,false,
		[
		]	
	],
	[
		"CAMS_U_Guerilla_E",1,false,
		[
		]
	],
	[
		"CAMS_U_Ghillie_E",1,false,
		[
		]
	],
	[
		"CAMS_U_Aviation_E",1,false,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_E",1,false,
		[
		]
	],
	[	
		"CAMS_U_All_E",0,true,
		[
			"CAMS_U_Soldier_E", "CAMS_U_Guerilla_E", "CAMS_U_Ghillie_E", "CAMS_U_Wetsuit_E", "CAMS_U_Aviation_E"
		]
	],

	//////////////////////////////////////////// Uniforms - Independant
	
	[
		"CAMS_U_Soldier_I",1,false,
		[
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,false,
		[
		]
	],
	[
		"CAMS_U_Ghillie_I",1,false,
		[
		]
	],
	[
		"CAMS_U_Aviation_I",1,false,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_I",1,false,
		[
		]
	],
	[	
		"CAMS_U_All_I",0,true,
		[
			"CAMS_U_Soldier_I", "CAMS_U_Guerilla_I", "CAMS_U_Ghillie_I", "CAMS_U_Wetsuit_I", "CAMS_U_Aviation_I"
		]
	],
		
	/////////////////////////////////////////////////////// Vest / Chest items
	////////////////////////////////////////////////////// May have to be broken down by EAST, WEST, IND in future or expansion packs

	[
		"CAMS_V_Bandolliers",1,false,
		[
		]
	],
	[
		"CAMS_V_Chestrig",1,false,
		[
		]
	],

	[
		"CAMS_V_Vests_W",1,false,
		[
			// West - CIV?
		]
	],
	[
		"CAMS_V_Vests_E",1,false,
		[		
			"V_MM_Vest_01"
		]
	],
	[
		"CAMS_V_Vests",0,true,
		[
			"CAMS_V_Vests_W","CAMS_V_Vests_E"
		]
	],
	
	[
		"CAMS_V_Harness",1,false,
		[
		]
	],
	[
		"CAMS_V_Plate",1,false,
		[
		]
	],
	[
		"CAMS_V_Rebreather",1,false,
		[
		]
	],
	[
		"CAMS_V_All",0,true,
		[
			"CAMS_V_Bandolliers", "CAMS_V_Chestrig", "CAMS_V_Vests", "CAMS_V_Harness", "CAMS_V_Plate"
		]
	],
		// Head/Hat items
	[
		"CAMS_H_Caps_W",1,false,
		[
		]
	],
	[
		"CAMS_H_Caps_E",1,false,
		[
		]
	],	[
		"CAMS_H_Caps",0,true,
		[
			"CAMS_H_Caps_W","CAMS_H_Caps_E"
		]
	],	
	*/
	[
		"CAMS_H_RegHelmet_W",1,false,////////////////////////////////////////////////////////
		[			
		]
	],
	[
		"CAMS_H_LightHelmet_W",1,false,///////////////////////////////////////////////////////
		[
		]
	],	
	[
		"CAMS_H_LightHelmet_E",1,false,///////////////////////////////////////////////////////
		[
			"H_MM_Helmet_01"	//Self Made Mask
		]
	],
	[
		"CAMS_H_LightHelmet",1,false,///////////////////////////////////////////////////////
		[
			"CAMS_H_LightHelmet_W","CAMS_H_LightHelmet_E"
		]
	],	
	[
		"CAMS_H_RegHelmet_E",1,false,/////////////////////////////////////////////////////////
		[
			"H_MM_Helmet_02"		// Old Drivers Helmet
		]
	],
	[
		"CAMS_H_RegHelmet",0,true,
		[
			"CAMS_H_RegHelmet_W","CAMS_H_RegHelmet_E"
		]
	],
	
	[
		"CAMS_H_SpecOps",1,false,
		[
			"H_MM_Buzzard_Gasmask_01"		// Buzzard Gasmask
		]
	],

	[
		"CAMS_H_Civ",0,true,
		[
			"CAMS_H_Caps", "CAMS_H_Beanies", "CAMS_H_Bandannas", "CAMS_H_Hats"
		]
	],
	[
		"CAMS_H_Hunter",0,true,
		[
			"CAMS_H_Caps", "CAMS_H_Boonie", "CAMS_H_Shemags"
		]
	],
	[	
		"CAMS_H_Military",0,true,
		[
			"CAMS_H_Berets", "CAMS_H_LightHelmet", "CAMS_H_RegHelmet", "CAMS_H_SuperHelmet", 
			"CAMS_H_SpecOps"
		]
	],
	[
		"CAMS_H_ALL",0,true,
		[
			"CAMS_H_Military", "CAMS_H_Civ", "CAMS_H_Boonie", "CAMS_H_Shemags", "CAMS_H_Aviation"
		]
	],
	///////////////////////////////////////////////////////////// Glasses
	[
		"CAMS_G_Regular",1,false,
		[
			"G_MM_Hockey_Mask"
		]
	],	
	[
		"CAMS_G_Tactical",1,false,
		[
			"G_MM_Crow_Dazzle_Mask"
		]
	],
	[
		"CAMS_G_Sport",1,false,
		[
			"G_MM_Catchers_Mask"
		]
	],
	[
		"CAMS_G_Shades",1,false,
		[
			"G_MM_FaceFork"
		]
	],
	[
		"CAMS_G_Lady",1,false,
		[
		]
	],	
	[
		"CAMS_G_Bandana",1,false,
		[
			"G_MM_bandana_bloody_co","G_MM_bandana_dirty_co","G_MM_bandana_dirty_2_co","G_MM_bandana_dirty_3_co",
			"G_MM_bandana_fur_co","G_MM_bandana_worn_co"
			
		]
	],
	[
		"CAMS_G_Balaclava",1,false,
		[
		]
	],

	[
		"CAMS_G_ALL_Guer",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Tactical","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Bandana", "CAMS_G_Balaclava"
		]
	],
	[
		"CAMS_G_ALL_CIV",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Lady"
		]
	],	
	[
		"CAMS_G_ALL_Mil",0,true,
		[
			"CAMS_G_Tactical","CAMS_G_Sport","CAMS_G_Shades"
		]
	],
	[
		"CAMS_G_ALL",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Tactical","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Lady", "CAMS_G_Bandana", 
			"CAMS_G_Balaclava"
		]
	],


	// ******* WEAPONS - EAST ********************	
	[
		"CAMS_Pistols_E",1,false,
		[
			"MadArmA_Execution","MadArmA_Mauser_C96","MadArmA_Revolver_01"			
		]
	],

	[
		"CAMS_Shotgun_E",1,false,
		[
			"MadArmA_Imperfect","MadArmA_VG_sawed_off"	
		]
	],
	[
		"CAMS_AssaultRifles_E",1,false,
		[
			"MadArmA_Devastator","MadArmA_LuckyShot","MadArmA_TrashGun","MadArmA_WrenchGun"			
		]
	],

	[
		"CAMS_MG_ALL_E",0,true,
		[
			"CAMS_SMG_E", "CAMS_MMG_E", "CAMS_LMG_E"
		]
	],	
	
	[
		"CAMS_Rifles_ALL_E",0,true,
		[
			"CAMS_MG_ALL_E", "CAMS_AssaultRifles_E", "CAMS_SniperRifles_E"
		]
	],
	
	[
		"CAMS_Guns_ALL_E",0,true,
		[
			"CAMS_Rifles_ALL_E", "CAMS_Pistols_E"
		]
	],

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,false,
		[
			"interceptor_1"		
		]
	],
	[
		"CAMS_Land_Offroad_C",1,false,
		[
			"chums_buggy_1",
			"nux_car_1"
		]
	],
	[
		"CAMS_Land_Transport_C",1,false,
		[
			//"warrig_black"	
		]
	],
	[
		"CAMS_Land_SUV_C",1,false,
		[
			"plymouth_rock_1"
		]
	],
	[
		"CAMS_Land_Van_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Utility_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Kart_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Work_C",0,true,
		[
			"CAMS_Land_Car_C", "CAMS_Land_Offroad_C", "CAMS_Land_Van_C"
		]
	],	
	[
		"CAMS_Land_Truck_C",0,true,
		[
			"CAMS_Land_Offroad_C", "CAMS_Land_Transport_C", "CAMS_Land_SUV_C", "CAMS_Land_Van_C"
		]
	],
	[
		"CAMS_Land_ALL_C",0,true,
		[
			"CAMS_Land_Work_C", "CAMS_Land_Truck_C"
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
