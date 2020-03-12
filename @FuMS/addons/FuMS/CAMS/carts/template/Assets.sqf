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
_cartName = "vanilla";
_debugCart = false;


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
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
		"CAMS_U_Soldier_W",1,true,
		[
		]	
	],
	[
		"CAMS_U_Guerilla_W",1,true,
		[
		]
	],	
	[
		"CAMS_U_Ghillie_W",1,true,
		[
		]
	],
	[
		"CAMS_U_Aviation_W",1,true,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_W",1,true,
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
		"CAMS_U_Soldier_E",1,true,
		[
		]	
	],
	[
		"CAMS_U_Guerilla_E",1,true,
		[
		]
	],
	[
		"CAMS_U_Ghillie_E",1,true,
		[
		]
	],
	[
		"CAMS_U_Aviation_E",1,true,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_E",1,true,
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
		"CAMS_U_Soldier_I",1,true,
		[
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,true,
		[
		]
	],
	[
		"CAMS_U_Ghillie_I",1,true,
		[
		]
	],
	[
		"CAMS_U_Aviation_I",1,true,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_I",1,true,
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
		"CAMS_V_Bandolliers",1,true,
		[
		]
	],
	[
		"CAMS_V_Chestrig",1,true,
		[
		]
	],
	[
		"CAMS_V_Vests",1,true,
		[
		]
	],
	[
		"CAMS_V_Harness",1,true,
		[
		]
	],
	[
		"CAMS_V_Plate",1,true,
		[
		]
	],
	[
		"CAMS_V_Rebreather",1,true,
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
		"CAMS_H_Caps",1,true,
		[
		]
	],
	[
		"CAMS_H_MilitaryCaps",1,true,
		[
		]
	],
	[
		"CAMS_H_Beanies",1,true,
		[
		]
	],
	[
		"CAMS_H_Bandannas",1,true,
		[
		]
	],
	[
		"CAMS_H_Boonie",1,true,
		[
		]
	],
	[
		"CAMS_H_Hats",1,true,
		[
		]
	],
	[
		"CAMS_H_Berets",1,true,
		[
		]
	],
	[
		"CAMS_H_Shemags",1,true,
		[
		]
	],
	[
		"CAMS_H_LightHelmet",1,true,
		[
		]
	],
	[
		"CAMS_H_RegHelmet",1,true,
		[
		]
	],
	[
		"CAMS_H_SuperHelmet",1,true,
		[
		]
	],
	[
		"CAMS_H_SpecOps",1,true,
		[
		]
	],
	[
		"CAMS_H_Aviation",1,true,
		[
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
	///////////////////////////////////////////////////////////// Glasses
	[
		"CAMS_G_Regular",1,true,
		[
		]
	],	
	[
		"CAMS_G_Tactical",1,true,
		[
		]
	],
	[
		"CAMS_G_Sport",1,true,
		[
		]
	],
	[
		"CAMS_G_Shades",1,true,
		[
		]
	],
	[
		"CAMS_G_Lady",1,true,
		[
		]
	],	
	[
		"CAMS_G_Bandana",1,true,
		[
		]
	],
	[
		"CAMS_G_Balaclava",1,true,
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
	
	/////////////////////////////////////////////////////
	///////////// CAMS AI Models ////////////////////////
	/////////////////////////////////////////////////////
	// This whole section should be rebuilt to your content but keep the global groupings at the end
	// Just swap out your own global names
	
	/////////////// EAST
	[
		"CAMS_AI_FIA_E",1,true,
		[
		]
	],
	[
		"CAMS_AI_CSAT_SOLDIER",1,true,
		[
		]
	],
	[
		"CAMS_AI_CSAT_URBAN",1,true,
		[
		]
	],
	[
		"CAMS_AI_CSAT_SF",1,true,
		[
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
	//////////////// WEST
	[
		"CAMS_AI_FIA_W",1,true,
		[
		]
	],
	[
		"CAMS_AI_NATO_SOLDIER",1,true,
		[
			]
	],
	[
		"CAMS_AI_NATO_SF",1,true,
		[
		]
	],
	[
		"CAMS_AI_ALL_W",0,true,
		[
			"CAMS_AI_FIA_W","CAMS_AI_NATO_SOLDIER","CAMS_AI_NATO_SF"
		]
	],
	
	//////////////// IND
	[
		"CAMS_AI_FIA_I",1,true,
		[
		]
	],
	[
		"CAMS_AI_AAF",1,true,
		[
		]
	],
	[
		"CAMS_AI_AAF_SF",1,true,
		[
		]
	],
	[
		"CAMS_AI_ALL_I",0,true,
		[
			"CAMS_AI_FIA_I","CAMS_AI_AAF","CAMS_AI_AAF_SF"
		]
	],
	

	//////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Items ///////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////

	// Navigation and Belt Items
	[
		"CAMS_I_Navigation",1,true,
		[
		]
	],
	
	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,true,
		[
		]
	],
	// Backpacks
	[
		"CAMS_Packs_Lv1",1,true,
		[
		]
	],
	[
		"CAMS_Packs_Lv2",1,true,
		[
		]
	],
	[
		"CAMS_Packs_Lv3",1,true,
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
		"CAMS_Flares_Chemical",1,true,
		[
		]
	],
	[
		"CAMS_Flares_Normal",1,true,
		[
		]
	],
	[
		"CAMS_Flares_1Rnd",1,true,
		[
		]
	],
	[
		"CAMS_Flares_3Rnd",1,true,
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
		"CAMS_Smoke_Shell",1,true,
		[
		]
	],
	[
		"CAMS_Smoke_1Rnd",1,true,
		[
		]
	],
	[
		"CAMS_Smoke_3Rnd",1,true,
		[
		]
	],
	[
		"CAMS_Smoke_ALL",0,true,
		[
			"CAMS_Smoke_Shell", "CAMS_Smoke_1Rnd", "CAMS_Smoke_3rnd"
		]
	],
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////// Explosives ///////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
	

	// Grenades
	[
		"CAMS_E_Grenade",1,true,
		[
		]
	],
	[
		"CAMS_E_GrenadeIR_W",1,true,
		[
		]
	],
	[
		"CAMS_E_GrenadeIR_E",1,true,
		[
		]
	],
	[
		"CAMS_E_GrenadeIR_I",1,true,
		[
		]
	],	
	[
		"CAMS_E_GrenadeIR_ALL",0,true,
		[
			"CAMS_E_GrenadeIR_W","CAMS_E_GrenadeIR_E","CAMS_E_GrenadeIR_I"
		]
	],
	// Explosive Shells
	[
		"CAMS_E_1Rnd",1,true,
		[
		]
	],
	[
		"CAMS_E_3Rnd",1,true,
		[
		]
	],
	// Mines
	[
		"CAMS_E_Mine",1,true,
		[
		]
	],// IEDs
	[
		"CAMS_E_IED",1,true,
		[
		]
	],	
	[
		"CAMS_E_ALL",0,true,
		[
			"CAMS_E_Grenade", "CAMS_E_GrenadeIR_ALL", "CAMS_E_1Rnd", "CAMS_E_3Rnd", "CAMS_E_Mine", "CAMS_E_IED"
		]
	],


	/////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////// Weapons ////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Weapon attachments
	[
		"CAMS_W_Pointer",1,true,
		[
		]
	],
	[
		"CAMS_W_Bipod",1,true,
		[
		]
	],
	[
		"CAMS_W_Muzzle",1,true,
		[
		]
	],
	[
		"CAMS_W_OpticsLv1",1,true,
		[
		]
	],
	[
		"CAMS_W_OpticsLv2",1,true,
		[
		]
	],
	[
		"CAMS_W_OpticsLv3",1,true,
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
	
	// ******* WEAPONS - WEST ********************	
	[
		"CAMS_Pistols_W",1,true,
		[
		]
	],
	[
		"CAMS_SMG_W",1,true,
		[
		]
	],
	[
		"CAMS_LMG_W",1,true,
		[
		]
	],
	[
		"CAMS_MMG_W",1,true,
		[
		]
	],
	[
		"CAMS_AssaultRifles_W",1,true,
		[
		]
	],
	[
		"CAMS_SniperRifles_W",1,true,
		[
		]
	],
	[
		"CAMS_AA_W",1,true,
		[
		]
	],
	[
		"CAMS_AT_W",1,true,
		[
		]
	],
	[
		"CAMS_MG_ALL_W",0,true,
		[
			"CAMS_SMG_W", "CAMS_MMG_W", "CAMS_LMG_W"
		]
	],	
	[
		"CAMS_Rifles_ALL_W",0,true,
		[
			"CAMS_MG_ALL_W", "CAMS_AssaultRifles_W", "CAMS_SniperRifles_W"
		]
	],
	[
		"CAMS_Guns_ALL_W",0,true,
		[
			"CAMS_Rifles_ALL_W", "CAMS_Pistols_W"
		]
	],

	// ******* WEAPONS - EAST ********************	
	[
		"CAMS_Pistols_E",1,true,
		[
		]
	],
	[
		"CAMS_SMG_E",1,true,
		[
		]
	],
	[
		"CAMS_LMG_E",1,true,
		[
		]
	],
	[
		"CAMS_MMG_E",1,true,
		[
		]
	],
	[
		"CAMS_AssaultRifles_E",1,true,
		[
		]
	],
	[
		"CAMS_SniperRifles_E",1,true,
		[
		]
	],
	[
		"CAMS_AA_E",1,true,
		[
		]
	],
	[
		"CAMS_AT_E",1,true,
		[
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

	// ******* WEAPONS - IND ********************	
	[
		"CAMS_Pistols_I",1,true,
		[
		]
	],
	[
		"CAMS_SubMGs_I",1,true,
		[
		]
	],
	[
		"CAMS_LightMGs_I",1,true,
		[
		]
	],
	[
		"CAMS_MedMGs_I",1,true,
		[
		]
	],
	[
		"CAMS_AssaultRifles_I",1,true,
		[
		]
	],
	[
		"CAMS_SniperRifles_I",1,true,
		[
		]
	],
	[
		"CAMS_AA_I",1,true,
		[
		]
	],
	[
		"CAMS_AT_I",1,true,
		[
		]
	],
	[
		"CAMS_MG_ALL_I",0,true,
		[
			"CAMS_SMG_I", "CAMS_MMG_I", "CAMS_LMG_I"
		]
	],		
	[
		"CAMS_Rifles_ALL_I",0,true,
		[
			"CAMS_MG_ALL_I", "CAMS_AssaultRifles_I", "CAMS_SniperRifles_I"
		]
	],	
	[
		"CAMS_Guns_ALL_I",0,true,
		[
			"CAMS_Rifles_ALL_I", "CAMS_Pistols_I"
		]
	],

	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//  Water vehicles - Civ / General
	[
		"CAMS_H20_Boats_C",1,true,
		[
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
			"CAMS_H20_Boats_C", "CAMS_H20_RubberDucks_C", "CAMS_H20_Jetski_C"
		]
	],
	///////////////////////////////// Water Vehicles - West
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
	//////////////////////////////// Water Vehicles - East
	[
		"CAMS_H20_Boats_E",1,true,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,true,
		[
		]
	],
	[
		"CAMS_H20_SDV_E",1,true,
		[
		]
	],
	[
		"CAMS_H20_ALL_E",0,true,
		[
			"CAMS_H20_Boats_E", "CAMS_H20_RubberDucks_E", "CAMS_H20_SDV_E"
		]
	],	
	
	//////////////////////////// Water Vehicles - Ind
	[
		"CAMS_H20_Boats_I",1,true,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,true,
		[
		]
	],
	[
		"CAMS_H20_SDV_I",1,true,
		[
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
			"CAMS_H20_ALL_W","CAMS_H20_ALL_E","CAMS_H20_ALL_I", "CAMS_H20_ALL_C"
		]
	],	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////// Air Vehicles /////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_C",1,true,
		[
		]
	],	
	
	///////////////////////////////////////////////// Helicopters - West
	[
		"CAMS_Heli_Unarmed_W",1,true,
		[
		]
	],
	[
		"CAMS_Heli_Armed_W",1,true,
		[
		]
	],
	[
		"CAMS_Heli_Transport_W",1,true,
		[
		]
	],

	///////////////////////////////////////////////// Helicopters - Civ
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
	/////////////////////////////////// Helicopters - Independant 
	[
		"CAMS_Heli_Unarmed_I",1,true,
		[
		]
	],
	[
		"CAMS_Heli_Armed_I",1,true,
		[
		]
	],	
	[
		"CAMS_Heli_Transport_I",1,true,
		[
		]
	],
	
	/////////////////////////////////////// Aircraft - West
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
	///////////////////////////////////// Aircraft - East
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
	
	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,true,
		[
		]
	],
	[
		"CAMS_Plane_UAV_I",1,true,
		[
		]
	],
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Offroad_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_SUV_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Van_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Utility_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_C",1,true,
		[
		]
	],
	[
		"CAMS_Land_Kart_C",1,true,
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
	],	


	////////////////////////////////////////////////////// West Vehicles
	[
		"CAMS_Land_ArmedOffroad_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Armed_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Tank_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Artillery_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_ALL_W",0,true,
		[
			"CAMS_Land_Transport_W", "CAMS_Land_ArmedTransport_W"
		]
	],
	[
		"CAMS_Land_Unarmed_W",0,true,
		[
			"CAMS_Land_UnarmedOffroad_W", "CAMS_Land_Transport_W"
		]
	],
	[
		"CAMS_Land_Armed_W",0,true,
		[
			"CAMS_Land_ArmedOffroads_W", "CAMS_Land_ArmedTransport_W"
		]
	],
	[
		"CAMS_Land_ALL_W",0,true,
		[
			"CAMS_Land_Unarmed_W", "CAMS_Land_Armed_W"
		]
	],

	//////////////////////////////////////// EAST Vehicles
	[
		"CAMS_Land_ArmedOffroad_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Armed_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_E",1,true,
		[
		]
	],

	[
		"CAMS_Land_Transport_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_Tank_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_AA_E",1,true,
		[
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_ALL_E",0,true,
		[
			"CAMS_Land_Transport_E", "CAMS_Land_ArmedTransport_E"
		]
	],
	[
		"CAMS_Land_Unarmed_E",0,true,
		[
			"CAMS_Land_UnarmedOffroad_E", "CAMS_Land_Transport_E"
		]
	],	
	[
		"CAMS_Land_Armed_E",0,true,
		[
			"CAMS_Land_ArmedOffroad_E", "CAMS_Land_ArmedTransport_E"
		]
	],	
	[
		"CAMS_Land_ALL_E",0,true,
		[
			"CAMS_Land_Unarmed_E", "CAMS_Land_Armed_E"
		]
	],

	/////////////////////////////////////////////////////// Guerilla Vehicles
	[
		"CAMS_Land_ArmedOffroad_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Armed_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_Quad_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_Transport_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_Tank_I",1,true,
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
	],

	//////////////////////////////////////////// Static Guns - West
	[
		"CAMS_Land_StaticGuns_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAA_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_W",1,true,
		[
		]
	],
	[
		"CAMS_Land_Mortar_W",1,true,
		[
		]
	],

	//////////////////////////////////////////// Static Guns - East
	[
		"CAMS_Land_StaticGuns_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAA_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_E",1,true,
		[
		]
	],
	[
		"CAMS_Land_Mortar_E",1,true,
		[
		]
	],

	//////////////////////////////////////////// Static Guns - Ind
	[
		"CAMS_Land_StaticGuns_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_I",1,true,
		[
		]
	],
			
	[
		"CAMS_Land_StaticAA_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_I",1,true,
		[
		]
	],
	[
		"CAMS_Land_Mortar_I",1,true,
		[
		]
	],


	////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////// Misc Content ////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////
	// If it doesnt have a classname, I suggest you use the ImmersionFX files just for continuity  //
	// but it doesn't really matter where they are unless you are going to distribute the files   //
	////////////////////////////////////////////////////////////////////////////////////////////////
	[
		"CAMS_Wreck_Hist",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Car",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Truck",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Mil",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Tank",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Heli",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Plane",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_Boat",1,true,
		[
		]
	],
	[
		"CAMS_Wreck_ALL",0,true,
		[
			"CAMS_Wreck_Car", "CAMS_Wreck_Truck", "CAMS_Wreck_Mil", "CAMS_Wreck_Heli", "CAMS_Wreck_Plane", 
			"CAMS_Wreck_Hist"
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