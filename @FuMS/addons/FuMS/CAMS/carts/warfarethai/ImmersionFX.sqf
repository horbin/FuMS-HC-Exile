// ImmersionFX.sqf
// ThaiWarfare
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
_cartName = "warfarethai"; 	// Change this to match the directory name of the content you are adding
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
		"ImFX_Air_Patrol",1,false,
		[
			// Aircrat that should be used in air patrol roles (Used specificaly by DAPE)
			// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
			// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		]
	],
	[
		"ImFX_Air_Interceptor",1,false,
		[
			// Aircraft that should be used as interceptors (Used specificaly by DAPE)
			// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
			// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		]
	],
	[
		"ImFX_Air_Airdrop",1,false,
		[
			// Helos you want to use for airdrop type roles
		]
	],
	/////////////////////////////////////// Heli Assets
	[
		"ImFX_Heli_Escort",0,true,
		[
			"CAMS_Heli_Armed_E"
		]
	],
	[
		"ImFX_Heli_Transport",0,true,
		[
			"CAMS_Heli_Transport_W"
		]
	],
	[
		"ImFX_Heli_Troops",0,true,
		[
			"CAMS_Heli_Unarmed_E","CAMS_Heli_Unarmed_I","CAMS_Heli_Unarmed_W"
		]
	],
	[
		"ImFX_Air_Rescue_Heli",0,true,
		// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
		// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		[
			"CAMS_Heli_ArmedTransport_W"
		]
	],

	
	/////////////////////////////////////// Land Assets

	[
		"ImFX_Land_Armed_Guard",1,false,
		[
			// Vehicles that will serve as armed guard roles
		]
	],	
	[
		"ImFX_Land_Armed_Transport",1,false,
		[
			// Vehicle that will serve as armed troop transports
		]
	],	
	[
		"ImFX_Land_Unarmed_Transport",1,false,
		[
			// Vehicle that will serve as unarmed troop transports
		]
	],	
	[
		"ImFX_Land_Civ_Truck",1,false,
		[
			// Vehicle that will serve as civilian transports
		]
	],	
	[
		"ImFX_Land_Civ_Car",1,false,
		[
			// Vehicle that will serve as civilian cars
		]
	],
	///////////////// DAPE Loot Tables
	[
		"ImFX_DAPE_lootWeapons",1,false,
		[
			// Weapons you want included as part of DAPE loot weapons found in rescue helicopter
		]
	],
	[
		"ImFX_DAPE_lootItems",1,false,
		[
			// Weapons you want included as part of DAPE loot items found in rescue helicopter
		]
	],
	/////////////////////////////////////// Misc Assets
	// Add any other groupings you want here
	[
		"ImFX_U_Special",1,true,
		[
			// Grey Jumpsuit
			"U_Coveralls_C",

			// Scientist Jumpsuit
			"U_Coveralls_D",

			// Civilian Office Outfit
			"U_Office_A",
			"U_Office_B",
			"U_Office_C",

			// Civilian Skater Gear
			"U_Skater_A",
			"U_Skater_B",

			// Business Suits
			"U_CivilianSuit_A",
			"U_CivilianSuit_B",
			"U_CivilianSuit_C",
			"U_CivilianSuit_D",
			
			"V_BombJacket"
		]
	],	
	
	[
		"ImFX_U_Insurgent",1,true,
		[
			// Insurgent Outfit
			"U_MilitiaUniTShirt_A",
			"U_MilitiaUniTShirt_B",
			"U_MilitiaUniTShirt_C",
			"U_MilitiaUniTShirt_D",
			"U_MilitiaUniTShirt_E",
			"U_MilitiaUniTShirt_F",
			"U_MilitiaUniTShirt_G",

			// Insurgent Uniform 
			"U_InsUniShirt_A",
			"U_InsUniShirt_B",
			"U_InsUniShirt_C",
			"U_InsUniShirt_Leader"
		]
	],		
	[
		"ImFX_U_Merc",1,true,
		[
			// Mercenary Outfit
			"U_CombatUniLeadMerc_A",
			"U_CombatUniLeadMerc_B",
			"U_CombatUniLeadMerc_C",
			"U_CombatUniLeadMerc_D",
			"U_CombatUniLeadMerc_E",
			"U_CombatUniLeadMerc_F",

			// Mercenary Shirt and Sandals
			"U_CombatUniShirtMercA_A",
			"U_CombatUniShirtMercA_B",
			"U_CombatUniShirtMercA_C",
			"U_CombatUniShirtMercA_D",
			"U_CombatUniShirtMercA_E",
			"U_CombatUniShirtMercA_F",
			"U_CombatUniShirtMercA_G",

			// Mercenary Shirt and Boots
			"U_CombatUniShirtMercB_A",
			"U_CombatUniShirtMercB_B",
			"U_CombatUniShirtMercB_C",
			"U_CombatUniShirtMercB_D",
			"U_CombatUniShirtMercB_E",
			"U_CombatUniShirtMercB_F",
			"U_CombatUniShirtMercB_G",
			"U_CombatUniShirtMercB_H",
			"U_CombatUniShirtMercB_I",
			"U_CombatUniShirtMercB_J",

			// Mercenary Sleeves and Boots
			"U_CombatUniShirtMercC_A",
			"U_CombatUniShirtMercC_B",
			"U_CombatUniShirtMercC_C",
			"U_CombatUniShirtMercC_D",

			// Mercenary Shirt and Sport Shoes
			"U_CombatUniShirtMercD_A",
			"U_CombatUniShirtMercD_B",
			"U_CombatUniShirtMercD_C",
			"U_CombatUniShirtMercD_D",
			"U_CombatUniShirtMercD_E",
			"U_CombatUniShirtMercD_F",
			"U_CombatUniShirtMercD_G"
		]
	],	
	[
		"ImFX_U_Winter",1,true,
		[
			// Middle East Burqua
			"U_TKLocalUniLong_A",
			"U_TKLocalUniLong_B",
			"U_TKLocalUniLong_C",
			"U_TKLocalUniLong_D",
			"U_TKLocalUniLong_E",

			// Middle East (Thawb)
			"U_DressTKLocalUni_A_A",
			"U_DressTKLocalUni_A_B",
			"U_DressTKLocalUni_A_C",
			"U_DressTKLocalUni_A_D",
			"U_DressTKLocalUni_A_E",
			"U_DressTKLocalUni_B_A",
			"U_DressTKLocalUni_B_B",
			"U_DressTKLocalUni_B_C",
			"U_DressTKLocalUni_B_D",
			"U_DressTKLocalUni_B_E",
			"U_DressTKLocalUni_C_A",
			"U_DressTKLocalUni_C_B",
			"U_DressTKLocalUni_C_C",
			"U_DressTKLocalUni_C_D",
			"U_DressTKLocalUni_C_E",
			"U_DressTKLocalUni_D_A",
			"U_DressTKLocalUni_D_B",
			"U_DressTKLocalUni_D_C",
			"U_DressTKLocalUni_D_D",
			"U_DressTKLocalUni_D_E",
			"U_DressTKLocalUni_E_A",
			"U_DressTKLocalUni_E_B",
			"U_DressTKLocalUni_E_C",
			"U_DressTKLocalUni_E_D",
			"U_DressTKLocalUni_E_E",

			// Middle East Thawb (Militia)
			"U_TKLocalCombat_A",
			"U_TKLocalCombat_B",
			"U_TKLocalCombat_C",
			"U_TKLocalCombat_D",
			"U_TKLocalCombat_E",
			"U_TKLocalTactic_A",
			"U_TKLocalTactic_B",
			"U_TKLocalTactic_C",
			"U_TKLocalTactic_D",
			"U_TKLocalTactic_E",
			"U_TKLocalUni_A",
			"U_TKLocalUni_B",
			"U_TKLocalUni_C",
			"U_TKLocalUni_D",
			"U_TKLocalUni_E",
			"U_TKLocalUni_F",

			// Terrorist
			"U_TerrorCombat_A",
			"U_TerrorCombat_B",
			"U_TerrorCombat_Black"

		]
	],	

	[
		"ImFX_U_Matrix",1,true,
		[
			// Civilan Coat (Looks like Matrix)
			"U_CivilianCoat_A",
			"U_CivilianCoat_B",
			"U_CivilianCoat_C",
			"U_CivilianCoat_D",
			"U_CivilianCoat_E",
			"U_CivilianCoat_F",
			// Long Military Coat (More Matrix)
			"U_MilitaryCoat_A",
			"U_MilitaryCoat_B",
			"U_MilitaryCoat_C",
			"U_MilitaryCoat_D"
		]
	],	
	[
		"ImFX_U_Rangemaster",1,true,
		[
			"U_Rangemaster",

			// Rangemaster Outfits
			"U_Rangemaster_A",
			"U_Rangemaster_B",
			"U_Rangemaster_C",
			"U_Rangemaster_D",
			"U_Rangemaster_E",
			"U_Rangemaster_F",
			"U_Rangemaster_G",
			"U_Rangemaster_H"
		]
	],	
	
	[
		"ImFX_U_Special",1,true,
		[
			// Grey Jumpsuit
			"U_Coveralls_C",

			// Scientist Jumpsuit
			"U_Coveralls_D",

			// Civilian Office Outfit
			"U_Office_A",
			"U_Office_B",
			"U_Office_C",

			// Civilian Skater Gear
			"U_Skater_A",
			"U_Skater_B",

			// Business Suits
			"U_CivilianSuit_A",
			"U_CivilianSuit_B",
			"U_CivilianSuit_C",
			"U_CivilianSuit_D",

			// Prisoner
			"U_Captive_A"
		]
	],	
	
	[
		"ImFX_U_Rangemaster",1,true,
		[
			"U_Rangemaster",

			// Rangemaster Outfits
			"U_Rangemaster_A",
			"U_Rangemaster_B",
			"U_Rangemaster_C",
			"U_Rangemaster_D",
			"U_Rangemaster_E",
			"U_Rangemaster_F",
			"U_Rangemaster_G",
			"U_Rangemaster_H"	
		]
	],	

	[
		"ImFX_U_Thai",1,true,
		[
			// Thai Shirt Uniform
			"U_CombatUniShirt_A",
			"U_CombatUniShirt_B",
			"U_CombatUniShirt_C",
			"U_CombatUniShirt_D",
			"U_CombatUniShirt_E",
			"U_CombatUniShirt_F",
			"U_CombatUniShirtAlt_A",
			"U_CombatUniShirtAlt_B",
			"U_CombatUniShirtAlt_C",
			"U_CombatUniShirtAlt_D",
			"U_CombatUniShirtAlt_E",
			"U_CombatUniShirtAlt_F",


			// Thai combat uniform
			"U_CombatUniSleeves_A",
			"U_CombatUniSleeves_B",
			"U_CombatUniSleeves_C",
			"U_CombatUniSleeves_D",
			"U_CombatUniSleeves_E",
			"U_CombatUniSleeves_F",
			"U_CombatUniSleevesShort_A",
			"U_CombatUniSleevesShort_B",
			"U_CombatUniSleevesShort_C",
			"U_CombatUniSleevesShort_D",
			"U_CombatUniSleevesShort_E",
			"U_CombatUniSleevesShort_F",
			"U_CombatUniTShirt_A",
			"U_CombatUniTShirt_B",
			"U_CombatUniTShirt_C",
			"U_CombatUniTShirt_D",
			"U_CombatUniTShirt_E",
			"U_CombatUniTShirt_F"
		]
	],
	/*
// Crafting Loot
	[
		"ImFX_Crafting_Wood",1,false,
		[
			"ItmTol_Woodlog"

		]
	],
	[
		"ImFX_Crafting_Metal",1,false,
		[
		]
	],
	[
		"ImFX_Crafting_Raw",1,false,
		[
		]
	],	
	[
		"ImFX_Crafting_Kits",1,false,
		[
			"ItmTol_TentPortable"

		]
	],
	[
		"ImFX_Crafting_ALL",0,true,
		[
			"ImFX_Crafting_Wood","ImFX_Crafting_Metal","ImFX_Crafting_Raw","ImFX_Crafting_Kits"
		]
	],
	[
		"ImFX_Crafting_Tools",1,false,
		[
			"ItmTol_Cushion_B",
			"ItmTol_Cushion_A",
			"ItmTol_Fuelcan_A",
			"ItmTol_Fuelcan_B",
			"ItmTol_Lantern",
			"ItmTol_Bandage",
			"ItmTol_Crate"

		]
	],



	[
		"ImFX_Food_Drink",1,false,
		[
			"ItmDrk_Drink_SodaCan_D",
			"ItmDrk_Drink_SodaCan_A",
			"ItmDrk_Canteen_A",
			"ItmDrk_Canteen_B",
			"ItmDrk_Drink_SodaCan_C",
			"ItmDrk_Drink_SodaCan_B",
			"ItmDrk_WaterBottle_A",
			"ItmDrk_WaterBottle_B"
		]
	],
	[
		"ImFX_Food_Raw",1,false,
		[
			"ItmFod_Fish_CS_A",
			"ItmFod_Chicken_A",
			"ItmFod_Corn_A",
			"ItmFod_Fish_A",
			"ItmFod_Fish_Mc_A",
			"ItmFod_Meat_A",
			"ItmFod_Fish_Mu_A",
			"ItmFod_Fish_Or_A",
			"ItmFod_Rabbit_A",
			"ItmFod_Ribs_A",
			"ItmFod_Fish_Sa_A",
			"ItmFod_Fish_Tu_A",
			"ItmFod_Turtle_A"
		]
	],
	[
		"ImFX_Food_Cooked",1,false,
		[
			"ItmFod_Chicken_B",
			"ItmFod_Corn_B",
			"ItmFod_Fish_B",
			"ItmFod_Fish_Mc_B",
			"ItmFod_Meat_B",
			"ItmFod_Fish_Mu_B",
			"ItmFod_Fish_Or_B",
			"ItmFod_Rabbit_B",
			"ItmFod_Ribs_B",
			"ItmFod_Fish_Sa_B",
			"ItmFod_Fish_Tu_B",
			"ItmFod_Turtle_B",
			"ItmFod_Fish_CS_B"
		]
	],
	[
		"ImFX_Food_MRE",1,false,
		[
			"ItmFod_Can_G",
			"ItmFod_Can_F",
			"ItmFod_Can_B",
			"ItmFod_Can_E",
			"ItmFod_Can_C",
			"ItmFod_Can_D",
			"ItmFod_Can_A",
			"ItmFod_Box_A",
			"ItmFod_Box_B",

			"ItmFod_Ration_A",
			"ItmFod_Ration_B",
			"ItmFod_Ration_C",

			"ItmFod_Misc_A",
			"ItmFod_Misc_B",
			"ItmFod_Misc_C",
			"ItmFod_Misc_D",
			"ItmFod_Misc_E",
			"ItmFod_Misc_F",
			"ItmFod_Misc_G",
			"ItmFod_Misc_H",
			"ItmFod_Misc_I",
			"ItmFod_Misc_J",
			"ItmFod_Misc_K",
			"ItmFod_Misc_L"
		]
	],

	[
		"ImFX_Cosmetic",1,false,
		[


		]
	],

	[
		"ImFX_Loot",1,false,
		[
			"ItmTol_Money_10",
			"ItmTol_Money_100",
			"ItmTol_Money_1000",
			"ItmTol_Money_Million",
			"ItmObj_Documents",
			"ItmObj_Drug",
			"ItmObj_Evidence",
			"ItmObj_Photo",
			"ItmObj_Key_C",
			"ItmObj_Key_A",
			"ItmObj_Key_B",
			"ItmObj_Key_D",
			"ItmObj_GoldBar",
			"ItmObj_KeyCard_C",
			"ItmObj_KeyCard_B",
			"ItmObj_KeyCard_A",
			"ItmObj_KeyCard_E",
			"ItmObj_KeyCard_D",
			"ItmObj_Disc",
			"ItmObj_Suitcase",
			"ItmObj_Tablet",
			"ItmObj_FlashDrive",
			"ItmObj_Key_Veh",

			"ItmTol_UAVMiniBomb",
			"ItmTol_UAVMini",


			"ItmMag_AmmoBoxM2",
			"ItmMag_AmmoBoxDshK",
			"ItmMag_AmmoMortar82",
			"ItmMag_AmmoOG9HE",
			"ItmMag_AmmoPG9AT",




			"1Rnd_54mm_APMine",
			"CameraMagazine",
			"1Rnd_54mm_Flechette",
			"1Rnd_54mm_Grenade",
			"1Rnd_54mm_Solid"

		]
	],
	
	[
		"ImFX_Lootboxes",1,false,
		[

		]
	],
	*/
	[	// Uniforms that "Doctor" or "Scientist" AI can wear 
		"ImFX_Uniform_Scientist",1,false,
		[
		]
	],	
	[	// Uniforms that "Bambi" class can wear 
		"ImFX_Uniform_Bambi",1,false,
		[
		]
	],
	[	// Uniforms that "Survivor" class can wear (Other NPC's acting as "Players")
		"ImFX_Uniform_Survivor",0,true,
		[
			"CAMS_U_Civ","CAMS_U_Guerilla_W","CAMS_U_Guerilla_E","CAMS_U_Guerilla_I"
		]
	],
	[	// Uniforms that "Survivor" class can wear (Independant side)
		"ImFX_Vest_Survivor",0,true,
		[
			"CAMS_V_Vests","CAMS_V_Harness","CAMS_V_Chestrig","CAMS_V_Bandolliers"
		]
	],
	[	// Uniforms that "Survivor" class can wear (Independant side)
		"ImFX_Helmet_Survivor",0,true,
		[
			"CAMS_H_Civ","CAMS_H_Hunter"
		]
	],
	[	// Uniforms that "Survivor" class can wear (Independant side)
		"ImFX_Pack_Survivor",0,true,
		[
			"CAMS_Packs_ALL"
		]
	],
	[	// Uniforms that "Survivor" class can wear (Independant side)
		"ImFX_Rifle_Survivor",0,true,
		[
			"CAMS_Rifles_ALL_I","CAMS_Rifles_ALL_E","CAMS_Rifles_ALL_W"
		]
	],
	[	// Uniforms that "Survivor" class can wear (Independant side)
		"ImFX_Pistol_Survivor",0,true,
		[
			"CAMS_Pistols_I","CAMS_Pistols_E","CAMS_Pistols_W"
		]
	]	
////////////////////////////////////////////////////////////	
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