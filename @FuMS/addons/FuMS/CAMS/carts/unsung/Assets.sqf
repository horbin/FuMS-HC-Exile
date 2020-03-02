// Assets.sqf
// TEMPLATE FILE
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
_cartName = "template"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	// Uniforms
	[	
		"CAMS_U_Civ",		// Global variable being adjusted
		4,					// Side this is assigned to 
							// 0 - Code used to combine other global variables (See below)
							// 1 - Everyone can use
							// 2 - Players
							// 3 - AI
							// 4 - Civilian
							// 5 - Military
							// FOR NOW ALL CODES ABOVE DON'T MATTER EXCEPT FOR 0 
							// 0 is used when you are combining other global groups together (See below)
							// The next option determines if this global variable REPLACES (overwrites) existing global variable
							// Onlt one of your CART files should do this ato serve as the base global, for example if you do not
							// remove the vanilla items and instead do a complete replacement (Ex. Unsung, IFA, Star Wars opposition, etc)
							// This allows you to set a base set of resources and then add to them with other cart files
							
		true,				// TRUE - Replaces existing global variable      FALSE - Appends to existing variable
							// NOTE: Everything in this template files is set to true as an example of how to create a base
							// custom content CART.  If this is an add on, set this to FALSE
		[
				// Civilian clothing classnames (CIV)
		]
	],
	[
		"CAMS_U_Soldier",5,true,
		[
			// Soldier uniforms (EAST)
		]	
	],
	[
		"CAMS_U_Guerilla",3,true,
		[
			// Guerilla Uniforms (RESISTANCE)
		]
	],
	[
		"CAMS_U_Ghillie",5,true,
		[
			// Gillie type uniforms
		]
	],
	[
		"CAMS_U_Aviation",5,true,
		[
			// Aviator uniforms
		]
	],
	[
		"CAMS_U_Wetsuit",5,true,
		[
			// Frogman uniforms
		]
	],
	[	
		"CAMS_U_All",0,true,	// LEAVE THIS SECTION! This creates global variables that include all sections above
		[
			// NOTE: By using the 0 code, it tells the system that these are not individual classnames, but actually
			// other global variables that are being appended to each other.  Any time you are creating a global 
			// grouping made up of other global groupings, you need to use this code.
			// This should be left in all files to give you an overarching global group for all types
			"CAMS_U_Civ", "CAMS_U_Soldier", "CAMS_U_Guerilla", "CAMS_U_Ghillie", "CAMS_U_Wetsuit", "CAMS_U_Aviation"
		]
	],
	
	
	
	// Vest / Chest container items
	[
		"CAMS_V_Bandolliers",5,true,
		[
			// Bandollier type vests
		]
	],
	[
		"CAMS_V_Chestrig",5,true,
		[
			// Chest rig type vests
		]
	],
	[
		"CAMS_V_Vests",5,true,
		[
			// Regular Vests
		]
	],
	[
		"CAMS_V_Harness",5,true,
		[
			// Harness type vests
		]
	],
	[
		"CAMS_V_Plate",5,true,
		[
			// Armored plate type vests
		]
	],
	[
		"CAMS_V_Rebreather",5,true,
		[
			// Underwater breathing appratus classnames
		]
	],
	[
		"CAMS_V_All",0,true,
		[
			// NOTE: See the 0 code.  Again, this combines the global variables into a single variable
			"CAMS_V_Bandolliers", "CAMS_V_Chestrig", "CAMS_V_Vests", "CAMS_V_Harness", "CAMS_V_Plate"
		]
	],
	
	
	
		// Head/Hat items
	[
		"CAMS_H_Caps",4,true,
		[
			// Cap headgear
		]
	],
	[
		"CAMS_H_MilitaryCaps",5,true,
		[
			// Military style cap headgear
		]
	],
	[
		"CAMS_H_Beanies",4,true,
		[
			// Beanies
		]
	],
	[
		"CAMS_H_Bandannas",3,true,
		[
			// Bandanas
		]
	],
	[
		"CAMS_H_Boonie",3,true,
		[
			// Boonie hats
		]
	],
	[
		"CAMS_H_Hats",4,true,
		[
			// Civilian hats
		]
	],
	[
		"CAMS_H_Berets",5,true,
		[
			// Berets (ohh lala)
		]
	],
	[
		"CAMS_H_Shemags",3,true,
		[
			// Shaemags (head scarves)
		]
	],
	[
		"CAMS_H_LightHelmet",5,true,
		[
			// Light military helmets
		]
	],
	[
		"CAMS_H_RegHelmet",5,true,
		[
			// Regulat military helmets
		]
	],
	[
		"CAMS_H_SuperHelmet",5,true,
		[
			// Strong military helmets
		]
	],
	[
		"CAMS_H_SpecOps",5,true,
		[
			// Spec Ops helmets
		]
	],
	[
		"CAMS_H_Aviation",5,true,
		[
			// Aviator helmets
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
			"CAMS_H_Caps", "CAMS_H_Boonie", "CAMS_H_Shemags", "CAMS_H_MilitaryCaps"
		]
	],
	[	
		"CAMS_H_Military",0,true,
		[
			"CAMS_H_MilitaryCaps", "CAMS_H_Berets", "CAMS_H_LightHelmet", "CAMS_H_RegHelmet", "CAMS_H_SuperHelmet", 
			"CAMS_H_SpecOps"
		]
	],
	[
		"CAMS_H_ALL",0,true,
		[
			"CAMS_H_Military", "CAMS_H_Civ", "CAMS_H_Boonie", "CAMS_H_Shemags", "CAMS_H_Aviation"
		]
	],
	
	
	
	// Glasses
	[
		"CAMS_G_Regular",5,true,
		[
			// Regular glasses
		]
	],	
	[
		"CAMS_G_Tactical",5,true,
		[
		]
	],
	[
		"CAMS_G_Sport",4,true,
		[
		]
	],
	[
		"CAMS_G_Shades",4,true,
		[
		]
	],
	[
		"CAMS_G_Lady",4,true,
		[
		]
	],	
	[
		"CAMS_G_Bandana",3,true,
		[
		]
	],
	[
		"CAMS_G_Balaclava",3,true,
		[
		]
	],

	[
		"CAMS_G_Guer_ALL",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Tactical","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Bandana", "CAMS_G_Balaclava"
		]
	],
	[
		"CAMS_G_CIV_ALL",0,true,
		[
			"CAMS_G_Regular","CAMS_G_Sport","CAMS_G_Shades", "CAMS_G_Lady"
		]
	],	
	[
		"CAMS_G_Military_ALL",0,true,
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
	
	
	// Weapon attachments
	[
		"CAMS_W_Pointer",1,true,
		[
		]
	],
	[
		"CAMS_W_Bipod",5,true,
		[
		]
	],
	[
		"CAMS_W_Muzzle",5,true,
		[
		]
	],
	[
		"CAMS_W_OpticsLv1",5,true,
		[
		]
	],
	[
		"CAMS_W_OpticsLv2",5,true,
		[
		]
	],
	[
		"CAMS_W_OpticsLv3",5,true,
		[
		]
	],
	[
		"CAMS_W_Optics_ALL",0,true,
		[
			"CAMS_W_OpticsLv1", "CAMS_W_OpticsLv2", "CAMS_W_OpticsLv3"
		]
	],
	[
		"CAMS_W_Attachments_ALL",0,true,
		[
			"CAMS_W_Pointer", "CAMS_W_Bipod", "CAMS_W_Muzzle", "CAMS_W_Optics_ALL"
		]
	],
	

	// Navigation and Belt Items
	[
		"CAMS_B_Navigation",5,true,
		[
		]
	],
	
	// Other Items
	[
		"CAMS_I_Meds",5,true,
		[
		]
	],

	// Backpacks
	[
		"CAMS_Packs_Lv1",4,true,
		[
		]
	],
	[
		"CAMS_Packs_Lv2",5,true,
		[
		]
	],
	[
		"CAMS_Packs_Lv3",5,true,
		[
		]
	],
	[
		"CAMS_Packs_ALL",0,true,
		[
			"CAMS_Packs_Lv1", "CAMS_Packs_Lv2", "CAMS_Packs_Lv3"
		]
	],
	
	// Ammo
	// Setting this in the 'magazine' section of loot configuration (LootData.sqf) will ensure ammo for each weapon specified in the weapon section is also part
	//  of the loot definition.
	/*  MAY REMOVE SINCE THIS IS CORE FUNCTION
		"FuMS_AmmoForEach",1,true,
	[
		"FuMS_AmmoForEach"];
	*/

	// Flares
	[
		"CAMS_Flares_Chemical",4,true,
		[
		]
	],
	[
		"CAMS_Flares_Normal",4,true,
		[
		]
	],
	[
		"CAMS_Flares_1Rnd",5,true,
		[
		]
	],
	[
		"CAMS_Flares_3Rnd",5,true,
		[
		]
	],
	[
		"CAMS_Flares_ALL",0,true,
		[
			"CAMS_Flares_Chemical", "CAMS_Flares_Normal", "CAMS_Flares_1Rnd", "CAMS_Flares_3rnd"
		]
	],

	//Smokes
	[
		"CAMS_Smoke_Shell",5,true,
		[
		]
	],
	[
		"CAMS_Smoke_1Rnd",5,true,
		[
		]
	],
	[
		"CAMS_Smoke_3Rnd",5,true,
		[
		]
	],
	[
		"CAMS_Smoke_ALL",0,true,
		[
			"CAMS_Smoke_Shell", "CAMS_Smoke_1Rnd", "CAMS_Smoke_3rnd"
		]
	],

	// Explosives
	[
		"CAMS_E_Grenade",5,true,
		[
		]
	],
	[
		"CAMS_E_GrenadeIR",5,true,
		[
		]
	],
	[
		"CAMS_E_1Rnd",5,true,
		[
		]
	],
	[
		"CAMS_E_3Rnd",5,true,
		[
		]
	],
	[
		"CAMS_E_Mine",5,true,
		[
		]
	],
	[
		"CAMS_E_IED",5,true,
		[
		]
	],
	
	//CAMS_E_Grenade_ALL = CAMS_E_Grenade + CAMS_E_GrenadeIR + CAMS_E_GrenadeStun;
	//CAMS_E_Shell_ALL = CAMS_E_1Rnd + CAMS_E_3Rnd;
	
	[
		"CAMS_E_ALL",0,true,
		[
			"CAMS_E_Grenade", "CAMS_E_GrenadeIR", "CAMS_E_1Rnd", "CAMS_E_3Rnd", "CAMS_E_Mine", "CAMS_E_IED"
		]
	],
	
	// ******* WEAPONS ********************	
	[
		"CAMS_Pistols",4,true,
		[
		]
	],

	[
		"CAMS_SubMGs",3,true,
		[
		]
	],
	[
		"CAMS_LightMGs",5,true,
		[
		]
	],
	[
		"CAMS_AssaultRifles",5,true,
		[
		]
	],
	[
		"CAMS_SniperRifles",5,true,
		[
		]
	],
	[
		"CAMS_Rifles_ALL",0,true,
		[
			"CAMS_LightMGs", "CAMS_AssaultRifles", "CAMS_SniperRifles"
		]
	],
	
	[
		"CAMS_Guns_ALL",0,true,
		[
			"CAMS_Rifles_ALL", "CAMS_SubMGs", "CAMS_Pistols"
		]
	],

	// ******* VEHICLES ********************
	//  Water vehicles - Civ / General
	[
		"CAMS_H20_Boats_C",1,true,
		[
			"uns_skiff_C","uns_skiff2_c","uns_skiff_cargo_c","uns_skiff2_cargo_C"
		]
	],
	[
		"CAMS_H20_RubberDucks_C",1,true,
		[
		]
	],
	[
		"CAMS_H20_Jetski_C",1,true,
		[
		]
	],
	[
		"CAMS_H20_All_C",0,true,
		[
			"CAMS_H20_Boats_C", "CAMS_H20_RubberDucks_C", "CAMS_H20_SDV_C", "CAMS_H20_Jetski_C"
		]
	],
	

	// Water Vehicles - West
	[
		"CAMS_H20_Boats_W",1,true,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,true,
		[
		]
	],
	[
		"CAMS_H20_SDV_W",1,true,
		[
		]
	],

	[
		"CAMS_H20_ALL_W",0,true,
		[
			"CAMS_H20_Boats_W", "CAMS_H20_RubberDucks_W", "CAMS_H20_SDV_W"
		]
	],	
	
	// Water Vehicles - East
	[
		"CAMS_H20_Boats_E",1,true,
		[
			"UNS_Zodiac_VC","UNS_Zodiac_NVA"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,true,
		[
		]
	],
	[
		"CAMS_H20_Patrol_E",1,true,
		[
			"UNS_PATROL_BOAT_VC","UNS_ASSAULT_BOAT_VC","UNS_PATROL_BOAT_NVA","uns_assault_BOAT_NVA"
		]
	],

	[
		"CAMS_H20_SDV_E",1,true,
		[
			"UNS_PATROL_BOAT_VC","UNS_ASSAULT_BOAT_VC","UNS_PATROL_BOAT_NVA","uns_assault_BOAT_NVA"
		]
	],

	[
		"CAMS_H20_ALL_E",0,true,
		[
			"CAMS_H20_Boats_E", "CAMS_H20_RubberDucks_E", "CAMS_H20_SDV_E"
		]
	],	
	
	// Water Vehicles - Guer
	[
		"CAMS_H20_Boats_G",1,true,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_G",1,true,
		[
		]
	],
	[
		"CAMS_H20_SDV_G",1,true,
		[
		]
	],

	[
		"CAMS_H20_ALL_G",0,true,
		[
			"CAMS_H20_Boats_G", "CAMS_H20_RubberDucks_G", "CAMS_H20_SDV_G"
		]
	],	

	
	[
		"CAMS_Mil_H20_ALL",0,true,
		[
			"CAMS_H20_ALL_W","CAMS_H20_ALL_E","CAMS_H20_ALL_G", "CAMS_H20_ALL_C"
		]
	],
	
	// Helicopters

	[
		"CAMS_Heli_Unarmed_C",1,true,
		[
		]
	],	
	
	[
		"CAMS_Heli_Unarmed_W",1,true,
		[
			"uns_ch34_vnaf","uns_oh6_xm8"
		]
	],
	[
		"CAMS_Heli_Armed_W",1,true,
		[
			"uns_ch34_vnaf_m60","uns_oh6_m60","uns_oh6_m27r","uns_oh6_m27"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,true,
		[
			"uns_oh6_transport"
		]
	],

	[
		"CAMS_Heli_Unarmed_E",1,true,
		[
		]
	],
	[
		"CAMS_Heli_Armed_E",1,true,
		[
		]
	],

	[
		"CAMS_Heli_Unarmed_G",1,true,
		[
		]
	],
	[
		"CAMS_Heli_Armed_G",1,true,
		[
		]
	],	
	[
		"CAMS_Heli_Transport_G",1,true,
		[
		]
	],
	
	
	// Aircraft
	[
		"CAMS_Plane_CAS_W",1,true,
		[
		]
	],
	[
		"CAMS_Plane_UAV_W",1,true,
		[
		]
	],

	[
		"CAMS_Plane_CAS_E",1,true,
		[
		]
	],
	[
		"CAMS_Plane_UAV_E",1,true,
		[
		]
	],

	[
		"CAMS_Plane_CAS_G",1,true,
		[
		]
	],
	[
		"CAMS_Plane_UAV_G",1,true,
		[
		]
	],
	
	
	
	
	// Civilian Vehicles
	[
		"CAMS_Civ_Car",1,true,
		[
		]
	],
	[
		"CAMS_Civ_Offroad",1,true,
		[
		]
	],
	[
		"CAMS_Civ_Transport",1,true,
		[
		]
	],
	[
		"CAMS_Civ_SUV",1,true,
		[
		]
	],
	[
		"CAMS_Civ_Van",1,true,
		[
		]
	],
	[
		"CAMS_Civ_Utility",1,true,
		[
		]
	],
	[
		"CAMS_Civ_Toy",1,true,
		[
		]
	],

	[
		"CAMS_Civ_Work",0,true,
		[
			"CAMS_Civ_Car", "CAMS_Civ_Offroad", "CAMS_Civ_Van"
		]
	],	
	[
		"CAMS_Civ_Truck",0,true,
		[
			"CAMS_Civ_Offroad", "CAMS_Civ_Transport", "CAMS_Civ_SUV", "CAMS_Civ_Van"
		]
	],
	[
		"CAMS_Civ_ALL",0,true,
		[
			"CAMS_Civ_Work", "CAMS_Civ_Truck"
		]
	],	




	//////////////////// West Vehicles


	[
		"CAMS_Mil_ArmedOffroad_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UnarmedOffroad_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UGV_Armed_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UGV_Unarmed_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Toy_Quad_W",1,true,
		[
		]
	],

	[
		"CAMS_Mil_OpenTransport_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_CoveredTransport_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UtilityVehicle_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_ArmedTransport_W",1,true,
		[
		]
	],

	[
		"CAMS_Mil_Tank_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Artillery_W",1,true,
		[
		]
	],

	[
		"CAMS_Mil_Transport_ALL_W",0,true,
		[
			"CAMS_Mil_OpenTransport_W", "CAMS_Mil_CoveredTransport_W", "CAMS_Mil_ArmedTransport_W"
		]
	],

	[
		"CAMS_Mil_Unarmed_W",0,true,
		[
			"CAMS_Mil_UnarmedOffroad_W" + "CAMS_Mil_OpenTransport_W" + "CAMS_Mil_CoveredTransport_W"
		]
	],
	[
		"CAMS_Mil_Armed_W",0,true,
		[
			"CAMS_Mil_ArmedOffroads_W" + "CAMS_Mil_ArmedTransport_W"
		]
	],
	[
		"CAMS_Mil_ALL_W",0,true,
		[
			"CAMS_Mil_Unarmed_W" + "CAMS_Mil_Armed_W"
		]
	],

	//////////////////// EAST Vehicles


	[
		"CAMS_Mil_ArmedOffroad_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UnarmedOffroad_E",1,true,
		[
		]
	],

	[
		"CAMS_Mil_UGV_Armed_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UGV_Unarmed_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Toy_Quad_E",1,true,
		[
		]
	],

	[
		"CAMS_Mil_OpenTransport_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_CoveredTransport_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UtilityVehicle_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_ArmedTransport_E",1,true,
		[
		]
	],

	[
		"CAMS_Mil_Tank_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Artillery_E",1,true,
		[
		]
	],

	[
		"CAMS_Mil_Transport_ALL_E",0,true,
		[
			"CAMS_Mil_OpenTransport_E","CAMS_Mil_CoveredTransport_E", "CAMS_Mil_ArmedTransport_E"
		]
	],
	[
		"CAMS_Mil_Unarmed_E",0,true,
		[
			"CAMS_Mil_UnarmedOffroad_E", "CAMS_Mil_OpenTransport_E", "CAMS_Mil_CoveredTransport_E"
		]
	],	
	[
		"CAMS_Mil_Armed_E",0,true,
		[
			"CAMS_Mil_ArmedOffroad_E", "CAMS_Mil_ArmedTransport_E"
		]
	],	
	[
		"CAMS_Mil_ALL_E",0,true,
		[
			"CAMS_Mil_Unarmed_E", "CAMS_Mil_Armed_E"
		]
	],

	//////////////////// Guerilla Vehicles
	[
		"CAMS_Mil_ArmedOffroad_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UnarmedOffroad_G",1,true,
		[
		]
	],

	[
		"CAMS_Mil_UGV_Armed_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UGV_Unarmed_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Toy_Quad_E",1,true,
		[
		]
	],
	
	[
		"CAMS_Mil_OpenTransport_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_CoveredTransport_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_UtilityVehicle_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_ArmedTransport_G",1,true,
		[
		]
	],

	[
		"CAMS_Mil_Tank_G",1,true,
		[
		]
	],

	[
		"CAMS_Mil_Transport_ALL_G",0,true,
		[
			"CAMS_Mil_OpenTransport_G", "CAMS_Mil_CoveredTransport_G", "CAMS_Mil_ArmedTransport_G"
		]
	],
	[
		"CAMS_Mil_Unarmed_G",0,true,
		[
			"CAMS_Mil_UnarmedOffroads_G", "CAMS_Mil_OpenTransport_G", "CAMS_Mil_CoveredTransport_G"
		]
	],	
	[
		"CAMS_Mil_Armed_G",0,true,
		[
			"CAMS_Mil_ArmedOffroads_G", "CAMS_Mil_ArmedTransport_G"
		]
	],	
	[
		"CAMS_Mil_ALL_G",0,true,
		[
			"CAMS_Mil_Unarmed_G", "CAMS_Mil_Armed_G"
		]
	],

	

	//////////////////////////// Misc

		
	// Static Guns
	[
		"CAMS_Mil_StaticGuns_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticGL_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticAA_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticAT_W",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Mortar_W",1,true,
		[
		]
	],


	[
		"CAMS_Mil_StaticGuns_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticGL_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticAA_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticAT_E",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Mortar_E",1,true,
		[
		]
	],

	[
		"CAMS_Mil_StaticGuns_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticGL_G",1,true,
		[
		]
	],
			
	[
		"CAMS_Mil_StaticAA_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_StaticAT_G",1,true,
		[
		]
	],
	[
		"CAMS_Mil_Mortar_G",1,true,
		[
		]
	],
	[
		"CAMS_Hist_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Car_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Truck_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Vehicle_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Tank_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Heli_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Plane_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Boat_Wreck",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Land",0,true,
		[
			"CAMS_Car_Wreck", "CAMS_Truck_Wreck", "CAMS_Vehicle_Wreck", "CAMS_Heli_Wreck", "CAMS_Plane_Wreck", 
			"CAMS_Hist_Wreck"
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

//FuMS_Veh_Land = FuMS_Civ_All + FuMS_Work_All + FuMS_Mil_Unarmed;
//FuMS_Loot_Items = FuMS_BaseBuilding_ALL + FuMS_Food_ALL + FuMS_Drink + FuMS_Medical_Supplies + FuMS_W_Optics_ALL + FuMS_W_Attachments;



/*
FuMS_ListofFuMSGlobalItems =
[
"FuMS_Crafting_Wood","FuMS_Crafting_Metal","FuMS_Crafting_Other","FuMS_Crafting_Tools","FuMS_Crafting_Raw","FuMS_Crafting_ALL",
"FuMS_Food_Cooked","FuMS_Food_Raw","FuMS_Food_ALL","FuMS_Drink",

"FuMS_U_Civ","FuMS_U_Soldier","FuMS_U_Guerilla","FuMS_U_Ghillie","FuMS_U_Aviation","FuMS_U_Wetsuit","FuMS_U_All",

"FuMS_V_Bandolliers","FuMS_V_Chestrig","FuMS_V_Vests","FuMS_V_Harness","FuMS_V_Plate","FuMS_V_Rebreather","FuMS_V_All",

"FuMS_H_Caps","FuMS_H_MilitaryCaps","FuMS_H_Beanies","FuMS_H_Bandannas","FuMS_H_Boonie","FuMS_H_Hats","FuMS_H_Berets",
"FuMS_H_Shemags","FuMS_H_LightHelmet","FuMS_H_RegHelmet","FuMS_H_SuperHelmet","FuMS_H_SpecOps","FuMS_H_Aviation",
"FuMS_H_Civ","FuMS_H_Hunter","FuMS_H_Military","FuMS_H_ALL",

"FuMS_W_Pointer","FuMS_W_Bipod","FuMS_W_Muzzle",
"FuMS_W_OpticsLv1","FuMS_W_OpticsLv2","FuMS_W_OpticsLv3","FuMS_W_Optics_ALL","FuMS_W_Attachments",

"FuMS_B_Navigation","FuMS_Packs_Lv1","FuMS_Packs_Lv2","FuMS_Packs_Lv3","FuMS_Packs_ALL",

"FuMS_Ammo_All","FuMS_Ammo_762","FuMS_Ammo_93","FuMS_Ammo_45","FuMS_Ammo_65","FuMS_Ammo_338","FuMS_Ammo_556",
"FuMS_Ammo_water","FuMS_Ammo_9mm","FuMS_Ammo_127","FuMS_Ammo_408",

"FuMS_Flares_Chemical","FuMS_Flares_Normal","FuMS_Flares_1Rnd","FuMS_Flares_3Rnd","FuMS_Flares_ALL",
"FuMS_Smoke_Shell","FuMS_Smoke_1Rnd","FuMS_Smoke_3Rnd","FuMS_Smoke_All",

"FuMS_E_Grenade","FuMS_E_GrenadeIR","FuMS_E_1Rnd","FuMS_E_3Rnd","FuMS_E_Mine","FuMS_E_IED","FuMS_E_All",

"FuMS_Pistols","FuMS_SubMGs","FuMS_LightMGs","FuMS_AssaultRifles","FuMS_SniperRifles","FuMS_Rifles_ALL","FuMS_Guns_ALL",

"FuMS_AmmoForEach",

  //Vehicle
"FuMS_Toy_All","FuMS_Toy_Bikes","FuMS_Toy_Quads","FuMS_Toy_Karts",
"FuMS_H20_All","FuMS_H20_Boats","FuMS_H20_RubberDucks","FuMS_H20_SDVs",
"FuMS_Heli_ALL","FuMS_Heli_Hellcats","FuMS_Heli_Hummingbirds","FuMS_Heli_Hurons","FuMS_Heli_Mohawks","FuMS_Heli_Orcas","FuMS_Heli_Tarus",
"FuMS_Plane_All","FuMS_Plane_Cessnas",
"FuMS_Civ_All","FuMS_Civ_Hatchbacks","FuMS_Civ_SportHatchbacks","FuMS_Civ_Offroads","FumS_Civ_SUVs","FuMS_Civ_Vans",
"FuMS_Work_All","FuMS_Work_RepairOffroads","FuMS_Work_BoxVans","FuMS_Work_FuelVans",
"FuMS_Mil_Unarmed","FuMS_Mil_Hemmts","FuMS_Mil_Hunters","FuMS_Mil_Ifrits","FuMS_Mil_Striders","FuMS_Mil_Tempests","FuMS_Mil_Zamaks",
"FuMS_Mil_Armed","FuMS_Mil_ArmedOffroads",
"FuMS_Mil_All","FuMS_Veh_Land"

];
*/




/////////////////////////////
// Cart processing //////////
/////////////////////////////

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

//diag_log format ["[CAMS] CART System: %1 assets loaded",_cartName];
