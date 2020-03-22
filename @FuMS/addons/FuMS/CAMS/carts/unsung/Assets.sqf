// Assets.sqf
// Unsung Version
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
_cartName = "unsung"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


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
			"UNS_ARMY_BDU","UNS_ARMY_BDU_F","UNS_ARMY_BDU_65","UNS_ARMY_BDU_68",
			"UNS_DUCK_BDU",
			"UNS_USMC_BDU_65","UNS_USMC_BDU_65_2","UNS_USMC_FLAK_65","UNS_USMC_FLAK2_65",
			"UNS_USMC_BDU","UNS_USMC_BDU_S"
		]	
	],
	[
		"CAMS_U_Guerilla_W",1,true,
		[
			"UNS_TIGER_BDU","UNS_TIGER2_BDU","UNS_TIGER3_BDU",
			"UNS_USMC_Flak","UNS_USMC_Flak_F","UNS_USMC_Flak_S","UNS_USMC_Flak_E","UNS_USMC_Flak_ES",
			"UNS_USMC_LERDL"

		]
	],	
	[
		"CAMS_U_Ghillie_W",1,true,
		[
			"UNS_SOG_BDU_BK","UNS_SOG_BDU_BT","UNS_SOG_BDU_O","UNS_SOG_BDU_OP","UNS_SOG_BDU_TS"
		]
	],
	[
		"CAMS_U_Aviation_W",1,true,
		[
			"UNS_JPilot_BDU","UNS_Pilot_BDU"
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
			"UNS_NVA_G","UNS_NVA_GS","UNS_NVA_K","UNS_NVA_KS","UNS_NVA_CC"
		]	
	],
	[
		"CAMS_U_Guerilla_E",1,true,
		[
			"UNS_VC_S","UNS_VC_U","UNS_VC_K","UNS_VC_G","UNS_VC_B"
		]
	],
	[
		"CAMS_U_Ghillie_E",1,true,
		[
			"UNS_DCCR_G","UNS_DCCR_B","UNS_DCCR_TGS","UNS_DCCR_BBS","UNS_DCCR_BTS","UNS_DCCR_GTS"
		]
	],
	[
		"CAMS_U_Aviation_E",1,true,
		[
			"UNS_NVA_CG","UNS_NVA_CK","UNS_NVA_CP"
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
/*	
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
*/		
	/////////////////////////////////////////////////////// Vest / Chest items
	////////////////////////////////////////////////////// May have to be broken down by EAST, WEST, IND in future or expansion packs
/*
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
*/
	[
		"CAMS_V_Vests_W",1,true,
		[
			// West - CIV?
			"UNS_JP_Vest","UNS_FLAK",
			"UNS_M1956_P1", //Pilot
			"UNS_M1956_T1", //Tanker
			
			//West - Army
			"UNS_M1956_A1","UNS_M1956_A2","UNS_M1956_A3","UNS_M1956_A4","UNS_M1956_A5","UNS_M1956_A6",
			"UNS_M1956_A7","UNS_M1956_A8","UNS_M1956_A9","UNS_M1956_A10","UNS_M1956_A11","UNS_M1956_A12",
			
			//West - USMC
			"UNS_M1956_M1","UNS_M1956_M2","UNS_M1956_M3","UNS_M1956_M4","UNS_M1956_M5","UNS_M1956_M6",
			"UNS_M1956_M7","UNS_M1956_M8","UNS_M1956_M9","UNS_M1956_M10","UNS_M1956_M11","UNS_M1956_M12",
			"UNS_M1956_M13","UNS_M1956_M14","UNS_M1956_M15","UNS_M1956_M16","UNS_M1956_M17","UNS_M1956_M18",
			"UNS_M1956_M19",
			 
			 //West - SOG
			"UNS_M1956_S1","UNS_M1956_S2","UNS_M1956_S3","UNS_M1956_S4"
		]
	],
	[
		"CAMS_V_Vests_E",1,true,
		[			
			//East - VC
			"UNS_VC_A1","UNS_VC_A2","UNS_VC_A3","UNS_VC_S1","UNS_VC_S2",
			"UNS_VC_MG","UNS_VC_SP","UNS_VC_B1",

			//EAST - NVA
			"UNS_NVA_A1","UNS_NVA_A2","UNS_NVA_A3","UNS_NVA_S1","UNS_NVA_S2",
			"UNS_NVA_GR","UNS_NVA_MG","UNS_NVA_SP","UNS_NVA_B1","UNS_NVA_G1"
			
		]
	],
	[
		"CAMS_V_Vests",0,true,
		[
			"CAMS_V_Vests_W","CAMS_V_Vests_E"
		]
	],
	
/*	
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
*/
	[
		"CAMS_V_All",0,true,
		[
			"CAMS_V_Bandolliers", "CAMS_V_Chestrig", "CAMS_V_Vests", "CAMS_V_Harness", "CAMS_V_Plate"
		]
	],
		// Head/Hat items
	[
		"CAMS_H_Caps_W",1,true,
		[
			// West - Headbands
			"UNS_Headband_OD","UNS_Headband_OD2","UNS_Headband_ED","UNS_Headband_BK",

			// West - Bandanas
			"uns_bandana_od","uns_bandana_od2","uns_bandana_od3",
			
			// Civ - Hats
			"uns_field_cap"
		]
	],
	[
		"CAMS_H_Caps_E",1,true,
		[
			// East - Basic Hats
			"UNS_Headband_VC","UNS_Conehat_VC",
			
			// Civ - Hats
			"uns_field_cap"
		]
	],	[
		"CAMS_H_Caps",0,true,
		[
			"CAMS_H_Caps_W","CAMS_H_Caps_E"
		]
	],	
	[
		"CAMS_H_RegHelmet_W",1,true,////////////////////////////////////////////////////////
		[			
			// West - USMC
			"UNS_M1_17","UNS_M1_16","UNS_M1_15","UNS_M1_14","UNS_M1_13","UNS_M1_12","UNS_M1_11","UNS_M1_10","UNS_M1_9",
			"UNS_M1_8","UNS_M1_7","UNS_M1_6","UNS_M1_5","UNS_M1_4","UNS_M1_3","UNS_M1_2","UNS_M1_1","UNS_USMC_Cover",
			
			// West - PBR Crew
			"UNS_M1_PBR",
			
			// West - ARVN
			"UNS_M1_1V1","UNS_M1_1V2","UNS_M1_1V1N",
			
			// West - ARVN Ranger
			"UNS_M1_1V3","UNS_M1_1V4","UNS_M1_1V5","UNS_M1_1V6","UNS_M1_1V7","UNS_M1_1V8",
			
			// West - ARVN Marine
			"UNS_M1_1RM"
		]
	],
	[
		"CAMS_H_LightHelmet_W",1,true,///////////////////////////////////////////////////////
		[
			// West - Army
			"UNS_M1_9A","UNS_M1_8A","UNS_M1_7A","UNS_M1_6A","UNS_M1_5A","UNS_M1_4A","UNS_M1_3A","UNS_M1_2A","UNS_M1_1A",
			
			// West - USAF
			"UNS_M1_AFT",
			
			// West - Military Police
			"UNS_M1_MP",
			
			// West - USAF 377th
			"UNS_M1_SP"
		]
	],	
	[
		"CAMS_H_LightHelmet_E",1,true,///////////////////////////////////////////////////////
		[
			// East - PAVN Helmets
			"UNS_NVA_SSH40","UNS_NVA_SSH60","UNS_NVA_CHBG","UNS_PAVN_HN","UNS_PAVN_HC","UNS_PAVN_HG"
		]
	],
	[
		"CAMS_H_LightHelmet",0,true,///////////////////////////////////////////////////////
		[
			"CAMS_H_LightHelmet_W","CAMS_H_LightHelmet_E"
		]
	],	
	[
		"CAMS_H_RegHelmet_E",1,true,/////////////////////////////////////////////////////////
		[
			// East - NVA
			"UNS_NVA_HG","UNS_NVA_HGG","UNS_NVA_HK","UNS_NVA_HKG"
		]
	],
	[
		"CAMS_H_RegHelmet",0,true,
		[
			"CAMS_H_RegHelmet_W","CAMS_H_RegHelmet_E"
		]
	],
	
	[
		"CAMS_H_Boonie_W",1,true,
		[
			// West - Tiger
			"UNS_Boonie_TIG","UNS_Boonie_TIG1","UNS_Boonie_TIG2","UNS_Boonie_TIGF","UNS_Boonie_TIGF2",
			"UNS_Boonie_TIGF3","UNS_Boonie_TIGF4",
			
			//West - Soldier
			"UNS_Boonie_OD","UNS_Boonie_OD2","UNS_Boonie_ODF","UNS_Boonie_ODP",
			
			//West - Duck Hunter
			"UNS_Boonie_DK","UNS_Boonie_DKF",
			
			//West - LIME
			"UNS_Boonie_ERDL",
			
			// Civ - Boonie
			"uns_boonie_4"
		]
	],
	[
		"CAMS_H_Boonie_E",1,true,
		[	
			// East - VC
			"UNS_Boonie_VC","UNS_Boonie2_VC","UNS_Boonie3_VC","UNS_Boonie4_VC",
			"UNS_Boonie5_VC" // PAVN VC
		]
	],	[
		"CAMS_H_Boonie",0,true,
		[
			"CAMS_H_Boonie_W","CAMS_H_Boonie_E"
		]
	],	
	[
		"CAMS_H_Berets",1,true,
		[
			"UNS_Beret_MRF","UNS_Beret_B",
			
			"UNS_Beret_5","UNS_Beret_51LT","UNS_Beret_52LT","UNS_Beret_5CPT","UNS_Beret_5MAJ","UNS_Beret_5LTCOL","UNS_Beret_5COL",
			
			"UNS_Beret_AVAB","UNS_Beret_AVM","UNS_Beret_AVR"
		]
	],
	/*
	[
		"CAMS_H_Shemags",1,true,
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
	*/
	[
		"CAMS_H_Aviation_W",1,true,
		[
			// West - Crew 
			"UNS_TC_1","UNS_TC_2",
			
			// West - Heli
			"UNS_HP_Helmet",
			
			// West - Jet
			"UNS_JP_Helmet","UNS_JP_Helmet2"
		]
	],

	[
		"CAMS_H_Aviation_E",1,true,
		[
			// East - Crew 
			"UNS_NVA_CH","UNS_NVA_CHG","UNS_NVA_CHB",
			
			// East - Pilot
			"UNS_NVA_PL","UNS_NVA_PLC"
		]
	],
	[
		"CAMS_H_Aviation",0,true,
		[
			"CAMS_H_Aviation_W","CAMS_H_Aviation_E"
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
	/*
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
*/
	// Navigation and Belt Items
	[
		"CAMS_I_Navigation",1,true,
		[
			// West Radio
			"ItemRadio",
			"UNS_ItemRadio_PRC_25","UNS_ItemRadio_PRC_90","UNS_ItemRadio_T_884",
			"UNS_ItemRadio_Transistor_1","UNS_ItemRadio_Transistor_2",
			"UNS_ItemRadio_PRC25_TFAR","UNS_ItemRadio_PRC_90_TFAR","UNS_ItemRadio_T884_TFAR"
		]
	],
	
	[
		"CAMS_I_Misc",1,true,
		[
			"uns_leaflet8","uns_item_ashtray","uns_item_bugjuice","uns_item_bugspray","uns_item_camera",
			"uns_item_P38","uns_item_dong","uns_leaflet2","uns_item_condoms","uns_item_messtin","uns_item_pin",
			"uns_leaflet15","uns_leaflet11","uns_item_LRRPstew","uns_item_messpass","uns_leaflet10","uns_leaflet9",
			"uns_item_map1","uns_item_map2","uns_leaflet13","uns_leaflet1","uns_leaflet6","uns_leaflet12",
			"uns_leaflet5","uns_leaflet3","uns_item_MPC","uns_item_smokes","uns_leaflet4","uns_leaflet7",
			"uns_leaflet16","uns_leaflet14","uns_item_zippo",
			
			"UNS_EAM2Braft","uns_ItemFuelcan","uns_ItemFuelcanEmpty",
			"uns_ItemSiphon","uns_BA1568","uns_ItemM57clacker","UNS_sharkchaser"
		]
	],

	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,true,
		[
			"FirstAidKit","Medikit","ToolKit"
		]
	],	
	
	// Backpacks
	[
		"CAMS_Packs_W",1,true,
		[
			// West 
			"UNS_Alice_F1","UNS_Alice_F2","UNS_Alice_F3","UNS_Alice_F4","UNS_Alice_F5","UNS_Alice_F6","UNS_Alice_F7","UNS_Alice_F8","UNS_Alice_F9","UNS_Alice_FR",
			"UNS_Alice_1","UNS_Alice_2","UNS_Alice_3","UNS_Alice_4","UNS_Alice_5","UNS_Alice_6",
			"UNS_ARMY_RTO","UNS_SF_RTO","UNS_ARMY_MED",
			"UNS_USMC_E1","UNS_USMC_E2","UNS_USMC_R1","UNS_USMC_R2","UNS_USMC_R3","UNS_USMC_MED","UNS_USMC_RTO"
		]
	],
	[
		"CAMS_Packs_E",1,true,
		[
			// East
			"UNS_NVA_RTO","UNS_NVA_RPG","UNS_NVA_MED","UNS_NVA_R1","UNS_NVA_R3","UNS_NVA_RC",
			"UNS_VC_r1","UNS_VC_r1_rpg"		
		]
	],
	[
		"CAMS_Packs_ALL",0,true,
		[
			"CAMS_Packs_W", "CAMS_Packs_E"
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
/*
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
*/	
	[
		"CAMS_Smoke_W",1,true,
		[
			// West
			"uns_m18Purple","uns_m18Yellow","uns_m18Green","uns_m18red","uns_m18white","uns_m18Orange","uns_m18Blue"

		]
	],
	[
		"CAMS_Smoke_E",1,true,
		[
			// East 
			"uns_rdg2","uns_rdg3"		
		]
	],
	[
		"CAMS_Smoke_ALL",0,true,
		[
			"CAMS_Smoke_W", "CAMS_Smoke_E"
		]
	],
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////// Explosives ///////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
	

	// Grenades
	[
		"CAMS_E_Grenade_W",1,true,   ///////////////////////////////////////////////// FIX IN VANILLA
		[
			"uns_v40gren","uns_m61gren","uns_m67gren","uns_m34gren","uns_m14gren","uns_m308gren","uns_mk3a2gren","uns_mk40gren"
		]
	],
	[
		"CAMS_E_Grenade_E",1,true,   ///////////////////////////////////////////////// FIX IN VANILLA
		[
			"uns_molotov_mag","uns_f1gren","uns_rg42gren","uns_t67gren","uns_rgd33gren","uns_rgd5gren"
		]
	],
	/*
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
	*/
	// Mines
	[
		"CAMS_E_Mine",1,true,
		[
			// West - Mines
			"Mine",
			"uns_mine_ammo_mag","uns_mine_beer_mag","uns_mine_cigs_mag","uns_mine_fkit_mag","uns_mine_fuel_mag",
			"uns_mine_guitar_mag","uns_mine_radio_mag",
			
			"uns_traps_claymore_mag","uns_traps_claymore_remote_mag","uns_traps_nade_mag7","uns_traps_flare_mag",
			"uns_traps_nade_mag3","uns_traps_m7_mag","uns_traps_nade_mag",
			
			"uns_traps_punj2_mag","uns_traps_punj1_mag","uns_traps_punj4_mag","uns_traps_punj5_mag",
			
			"uns_traps_nade_mag5","uns_traps_nade_mag4","uns_traps_nade_mag6"
		]
	],// IEDs
	[
		"CAMS_E_IED",1,true,
		[
			// West - M118 C4 Charge
			"uns_M118_mag_remote",
			
			// West - Pipebomb
			"PipeBomb",
			
			// East - RKG3 Anti Tank mine
			"uns_rkg3gren"
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
			// East
			"uns_b_m70_camo","uns_b_m40_camo","uns_b_spike","uns_b_m7","uns_b_m6","uns_b_m30","uns_b_mas49","uns_b_m4",
			"uns_b_m1917","uns_b_m1884","uns_b_6h3","uns_b_1937","uns_b_spike17","uns_b_sks"
		]
	],
	[
		"CAMS_W_Bipod",1,true,
		[
			// East
			"uns_bp_DP28","uns_bp_MG42","uns_bp_PKM","uns_bp_RPD","uns_bp_RPK","uns_bp_RPK40","uns_bp_m60","uns_bp_M63"

		]
	],
	[
		"CAMS_W_Muzzle",1,true,
		[
			// West
			"uns_s_M14","uns_s_M16","uns_s_Mac10","uns_s_M3a1","uns_s_UZI","uns_s_sten","uns_s_M1911","uns_s_PPK",
			
			
			// East
			"uns_s_aps","uns_s_m45","uns_s_m14","uns_s_m16","uns_s_m3a1","uns_s_mac10","uns_s_mat49","uns_s_pbs1",
			"uns_s_ppk","uns_s_sten","uns_s_uzi"
		]
	],
	[
		"CAMS_W_OpticsLv1",1,true,
		[
			// West 
			"uns_o_colt4x","uns_o_RedfieldART","uns_o_Unertl8x","uns_o_LeatherwoodART","uns_o_LetherwoodART_m16","uns_o_colt4x",
			"uns_o_ANPVS2","uns_o_ANPVS2_m16","uns_o_APXSOM","uns_o_M63",
			
			// East
			"uns_o_APXSOM","uns_o_PSO1","uns_o_PSO1_camo","uns_o_PU"
		]
	],
	/*
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
	*/
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
			"uns_mkvFlarePistol",
			
			// West - 1911 pistols with flashlights
			"uns_MX991_m1911","uns_MX991_g","uns_MX991_w","uns_MX991_r",
			// "uns_MX991_m1911SD", // Comes with attachment
			
			// West - S&W Pistols
			"uns_38spec","uns_357m",
			
			// West - Colt Pistols
			"uns_m1911",
			"uns_m1911SD", // Comes with attachment
			"uns_coltcmdr",
			
			// West - Browning HP
			"uns_bhp",
			
			// West - Ruger
			"uns_Ruger",
			
			// West - Walther
			"uns_ppk"
			// "uns_ppkSD"	// Comes with attachment
		]
	],
	[
		"CAMS_SMG_W",1,true,
		[
			// West - Uzi
			"uns_uzi","uns_uzif",
			//"uns_uzi_SD",
			
			// West - MAC-10
			"uns_mac10",
			//"uns_mac10sd",
			
			// West - M/45
			"uns_m45","uns_m45f",
			
			// West - Sten
			"uns_sten",
			//"uns_stensd",
			
			// West - Sterling
			"uns_Sterling",
			//"uns_SterlingSD",
			
			// West - Thompson
			"uns_thompson",
			
			// West - M3A1 Greasegun
			"uns_m3a1"
			//"uns_m3sd",
		]
	],
	[
		"CAMS_Shotgun_W",1,true,   ///////// FIX IN VANILLA
		[
			// West - Ithaca 37
			"uns_ithaca37grip",
			
			// West - Winchester 1997
			"uns_m1897riot","uns_m1897",
			
			// West - Model 12 Trench Gun 
			"uns_model12",
			
			// West - Remington 870
			"uns_m870","uns_m870_mk1"
		]
	],
	[
		"CAMS_GL_W",1,true,
		[
			// West - China Lake 40mm GL
			"uns_ex41",
			
			// West - M-79 40mm GL
			"uns_m79","uns_m79p"
		]
	],	
	[
		"CAMS_LMG_W",1,true,
		[
			// West - Stoner M63
			"uns_M63a_AR","uns_m63a_drum","uns_M63a_LMG","uns_M63asupport",
			
			// West - M-1918 BAR
			"uns_bar",
			
			// West - M60
			"uns_m60shorty","uns_m60","uns_m60support",
			
			//West - RPD
			"uns_rpdsog"
		]
	],
	/*
	[
		"CAMS_MMG_W",1,true,
		[
		]
	],
	*/
	[
		"CAMS_AssaultRifles_W",1,true,
		[
			// West - M16 (Lots of flavors)
			"uns_M16","uns_M16_bayo",
			//"uns_M16_SD",
			
			"uns_M16_M203","uns_M16_XM148","uns_M16_XM148_camo",
			//"uns_M16s","uns_M16_NV","uns_M16_NVsd","uns_M16s_sd",
			
			"uns_M16A1","uns_M16A1_HBAR","uns_M16A1_bayo",
			//"uns_M16a1_SD","uns_M16A1_NV","uns_M16A1_NVsd",
			"uns_m16a1_m203",
			//"uns_M16A1s","uns_M16s","uns_M16A1s_sd",
			
			
			
			
			// West - M-1 Garand
			"uns_m1garand","uns_m1garandbayo",
			
			// West - M-1 Carbine
			"uns_m1carbine",
			//"uns_m1garands",
			
			// West - M-2 Carbine
			"uns_m2carbine",
			
			// West - L1A1 SLR
			"uns_l1a1","uns_l1a1gl",
			
			// West - M-14
			"uns_m14","uns_m14bayo"
			//"uns_m14sd",
			
			
			
		]
	],
	[
		"CAMS_SniperRifles_W",1,true,
		[
			// West - XM-21 Sniper Rifle
			"uns_m21",
			//"uns_m21sd","uns_m21nv","uns_m21nvsd",
			
			// West - Winchester Model 70
			"uns_model70"
			//,"uns_model70sd","uns_model70nv","uns_model70nvsd"
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
			"uns_M72","uns_m20_bazooka"
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
			// East - P-64 CZAK
			"uns_p64",
			
			// East - Makarov
			"uns_makarov",
			//"uns_MakarovSD",
			
			// East - Tokarev TT-30
			"uns_Tt33",
			
			// East - Stechkin APS
			"uns_APS",
			//"uns_APS_SD",
			
			// East - PM-63 CZAK
			"uns_pm63p","uns_pm63","uns_pm63f"
		]
	],
	[
		"CAMS_SMG_E",1,true,
		[
			// East - F1 SMG
			"uns_f1_smg",
			
			// East - M1928A1 Thompson (VC)
			"uns_thompsonvc",
			
			// East - MAT-49
			"uns_mat49","uns_mat49_f",
			
			// East - PPS-43
			"uns_PPS43","uns_pps43f",
			
			// East - PPS wz. 52
			"uns_PPS52",
			
			// East - K-50M
			"uns_k50m","uns_k50mdrum",
			
			// East - PPSh-41
			"uns_ppsh41"
		]
	],
	[
		"CAMS_LMG_E",1,true,
		[
			// East - RPK
			"uns_RPK_40","uns_RPK_drum",
			
			// East - DP28
			"uns_DP28",
			
			// East - RPD
			"uns_RPD","uns_RPDsupport","uns_rpdsog",
			
			// East - PK
			"uns_PK","uns_PKsupport",
			
			// East - MG42
			"uns_MG42","uns_MG42support","uns_mg42_bakelite"
		]
	],
	[
		"CAMS_MMG_E",1,true,
		[
		]
	],
	[
		"CAMS_Shotgun_E",1,true,
		[
			// East - Baikai
			"uns_baikal","uns_baikal_sawnoff"
		]
	],
	[
		"CAMS_AssaultRifles_E",1,true,
		[
			// East - StG-44
			"uns_STG_44",
			
			
			// East - AKS-47
			"uns_AKS47","uns_aks47f",
			//"uns_aks47_bayo",
			
			
			// East - AK-47/49
			"uns_AK47","uns_ak47_bayo","uns_AK47_49","uns_AK47_52",
			
			
			// East - Type 56
			"uns_type56",
			
			
			// East - SA-58
			"uns_Sa58P","uns_Sa58V","uns_sa58vf","uns_sa58p_bayo",
			//"uns_sa58v_bayo",
			
			
			// East - AKM
			"uns_AKM","uns_akm_drum",
			//"uns_akm_bayo",
			
			
			// East - AKMS
			"uns_AKMS","uns_AKMS_Drum",
			"uns_AKMSF","uns_akmsf_drum",
			//"uns_AKMS_SD","uns_AKMS_SD_drum",
			
			
			// East - Type 56
			"uns_type56_bayo",
			
			
			// East - SKS-58P
			"uns_SKS"
			//,"uns_sksbayo"
		]
	],
	[
		"CAMS_SniperRifles_E",1,true,
		[
			// East - Mosin
			"uns_mosin","uns_mosins",
			
			
			// East - MAS-36
			"uns_mas36","uns_mas36_gl","uns_mas36bayo","uns_mas36short","uns_mas36short_gl",
			
			
			// East - MAS 49/56
			"uns_mas4956","uns_mas4956_gl","uns_mas4956s",
			
			
			// East - SVD
			"uns_SVD","uns_SVD_camo"
		]
	],
	[
		"CAMS_AA_E",1,true,
		[
			"uns_sa7","uns_sa7b"
		]
	],
	[
		"CAMS_AT_E",1,true,
		[
			"uns_rpg2","uns_B40","uns_rpg7"
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
	// ******* WEAPONS - EAST ********************	
	[
		"CAMS_Pistols_I",1,true,
		[
			// East - P-64 CZAK
			"uns_p64",
			
			// East - Makarov
			"uns_makarov",
			//"uns_MakarovSD",
			
			// East - Tokarev TT-30
			"uns_Tt33",
			
			// East - Stechkin APS
			"uns_APS",
			//"uns_APS_SD",
			
			// East - PM-63 CZAK
			"uns_pm63p","uns_pm63","uns_pm63f"
		]
	],
	[
		"CAMS_SMG_I",1,true,
		[
			// East - F1 SMG
			"uns_f1_smg",
			
			// East - M1928A1 Thompson (VC)
			"uns_thompsonvc",
			
			// East - MAT-49
			"uns_mat49","uns_mat49_f",
			
			// East - PPS-43
			"uns_PPS43","uns_pps43f",
			
			// East - PPS wz. 52
			"uns_PPS52",
			
			// East - K-50M
			"uns_k50m","uns_k50mdrum",
			
			// East - PPSh-41
			"uns_ppsh41"
		]
	],
	[
		"CAMS_LMG_I",1,true,
		[
			// East - RPK
			"uns_RPK_40","uns_RPK_drum",
			
			// East - DP28
			"uns_DP28",
			
			// East - RPD
			"uns_RPD","uns_RPDsupport","uns_rpdsog",
			
			// East - PK
			"uns_PK","uns_PKsupport",
			
			// East - MG42
			"uns_MG42","uns_MG42support","uns_mg42_bakelite"
		]
	],
	[
		"CAMS_MMG_I",1,true,
		[
		]
	],
	[
		"CAMS_Shotgun_I",1,true,
		[
			// East - Baikai
			"uns_baikal","uns_baikal_sawnoff"
		]
	],
	[
		"CAMS_AssaultRifles_I",1,true,
		[
			// East - StG-44
			"uns_STG_44",
			
			
			// East - AKS-47
			"uns_AKS47","uns_aks47f",
			//"uns_aks47_bayo",
			
			
			// East - AK-47/49
			"uns_AK47","uns_ak47_bayo","uns_AK47_49","uns_AK47_52",
			
			
			// East - Type 56
			"uns_type56",
			
			
			// East - SA-58
			"uns_Sa58P","uns_Sa58V","uns_sa58vf","uns_sa58p_bayo",
			//"uns_sa58v_bayo",
			
			
			// East - AKM
			"uns_AKM","uns_akm_drum",
			//"uns_akm_bayo",
			
			
			// East - AKMS
			"uns_AKMS","uns_AKMS_Drum",
			"uns_AKMSF","uns_akmsf_drum",
			//"uns_AKMS_SD","uns_AKMS_SD_drum",
			
			
			// East - Type 56
			"uns_type56_bayo",
			
			
			// East - SKS-58P
			"uns_SKS"
			//,"uns_sksbayo"
		]
	],
	[
		"CAMS_SniperRifles_I",1,true,
		[
			// East - Mosin
			"uns_mosin","uns_mosins",
			
			
			// East - MAS-36
			"uns_mas36","uns_mas36_gl","uns_mas36bayo","uns_mas36short","uns_mas36short_gl",
			
			
			// East - MAS 49/56
			"uns_mas4956","uns_mas4956_gl","uns_mas4956s",
			
			
			// East - SVD
			"uns_SVD","uns_SVD_camo"
		]
	],
	[
		"CAMS_AA_I",1,true,
		[
			"uns_sa7","uns_sa7b"
		]
	],
	[
		"CAMS_AT_I",1,true,
		[
			"uns_rpg2","uns_B40","uns_rpg7"
		]
	],
	[
		"CAMS_MG_ALL_I",0,true,
		[
			"CAMS_SMG_I", "CAMS_MMG_I", "CAMS_LMG_E"
		]
	],	
	
	[
		"CAMS_Rifles_ALL_I",0,true,
		[
			"CAMS_MG_ALL_I", "CAMS_AssaultRifles_I", "CAMS_SniperRifles_E"
		]
	],
	
	[
		"CAMS_Guns_ALL_I",0,true,
		[
			"CAMS_Rifles_ALL_I", "CAMS_Pistols_E"
		]
	],
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//  Water vehicles - Civ / General
	[
		"CAMS_H20_Boats_C",1,true,
		[
			"UNS_VC_sampan_cargo","UNS_VC_sampan_fish1","UNS_VC_sampan_large",
			"UNS_VC_sampan_supply","UNS_VC_Sampan_Transport","UNS_VC_sampan_village",
			
			"UNS_skiff2_C","UNS_skiff_C","UNS_skiff2_cargo_C","UNS_skiff_cargo_C",
			"UNS_sampan_fish1","UNS_sampan_large","UNS_sampan_supply","UNS_Sampan_Transport","UNS_sampan_village"
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
			"uns_pbr","uns_pbr_m10","uns_pbr_mk18"
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,true,
		[
			"UNS_Zodiac_W","uns_Zodiac_w_rescue"
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
			"UNS_ASSAULT_BOAT_NVA","UNS_ASSAULT_BOAT_VC","UNS_PATROL_BOAT_NVA","UNS_PATROL_BOAT_VC"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,true,
		[
			"UNS_Zodiac_NVA","UNS_Zodiac_VC"
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
/*	
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
*/	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////// Air Vehicles /////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_C",1,true,
		[
			"uns_oh6_transport","uns_oh6_xm8",
			"uns_H13_transport_Army","uns_H13_amphib_Army",
			"uns_H13_transport_CAV","uns_H13_amphib_CAV",
			"uns_H13_transport_usaf","uns_H13_amphib_usaf",
			"uns_H13_transport_USN","uns_H13_amphib_USN"
		]
	],	
	
	///////////////////////////////////////////////// Helicopters - West
	[
		"CAMS_Heli_Unarmed_W",1,true,
		[
			"uns_oh6_transport","uns_oh6_xm8",
			"uns_H13_transport_Army","uns_H13_amphib_Army",
			"uns_H13_transport_CAV","uns_H13_amphib_CAV",
			"uns_H13_transport_usaf","uns_H13_amphib_usaf",
			"uns_H13_transport_USN","uns_H13_amphib_USN"

		]
	],
	[
		"CAMS_Heli_Armed_W",1,true,
		[
			// West - Army
			"UNS_AH1G","UNS_AH1G_M158","UNS_AH1G_M195","UNS_AH1G_M200","UNS_AH1G_SUU11","UNS_AH1G_FFAR",

			"uns_H13_gunship_Army",
			
			// West - US Air Cav
			"uns_H13_gunship_CAV",
			
			// West - USMC
			"uns_H13_gunship_USMC","uns_H13_transport_USMC","uns_H13_amphib_USMC",
			
			// West - USAF
			"uns_UH1F_M21_M158_Hornet","uns_UH1F_M6_M158_Hornet",
			
			// West - US Navy
			"uns_H13_gunship_USN",
			
			// West - RAAF
			"uns_UH1D_raaf_m60","uns_UH1D_raaf_m60_light",
			
			// West - Army
			"uns_oh6_m60","uns_oh6_m27r","uns_oh6_m27"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,true,
		[
			// West - Army
			"uns_h21c","uns_ch34_army",
			
			// West - MACV / COG
			"uns_ch34_sog",
			
			// West - USMC
			"uns_ch34_USMC","uns_uh34_USMC",
			"uns_ch53d_m2_USMC",
			"uns_ch46d",
			
			// West - USAF
			"uns_hh53b_m134_usaf",

			
			// West - Navy
			"uns_rh53a_m2_usn","uns_H13_transport_USN","uns_H13_amphib_USN"			
		]
	],
	
	[
		"CAMS_Heli_ArmedTransport_W",1,true,
		[
			// West - Army
			"uns_h21c_mg",
			"uns_ch34_army_M60","uns_ch34_sog_M60","uns_ch34_USMC_M60",
			"uns_ch47_m60_usmc","uns_ch47_m60_army","uns_ch47_m60_1AC",
			"uns_ch53a_m60_USMC",
			
			
			"uns_UH1C_M21_M158","uns_UH1C_M21_M200","uns_UH1C_M21_M200_1AC","uns_UH1C_M21_M158_M134",
			
			"uns_UH1C_M6_M158","uns_UH1C_M6_M200","uns_UH1C_M6_M200_1AC","uns_UH1C_M6_M200_M134",
			
			"UNS_UH1B_TOW",
			
			"UNS_UH1C_M3_ARA","UNS_UH1C_M3_ARA_AT","UNS_UH1C_M3_ARA_AP",
			
			"uns_uh1h_m60","uns_uh1h_m60_light",
			
			"uns_uh1d_m60","uns_uh1d_m60_light",

			// West - USMC
			"uns_UH1D_USMC_m60","uns_UH1D_USMC_m60_light",
			
			"uns_ach47_m134","uns_ach47_m200"

		]
	],
	
	/////////////////////////////////// Helicopters - East 

	[
		"CAMS_Heli_ArmedTransport_E",1,true,
		[
			"uns_Mi8TV_VPAF_MG"
		]
	],	
	[
		"CAMS_Heli_Transport_E",1,true,
		[
			"uns_Mi8T_VPAF"		
		]
	],

	///////////////////////////////////////////////// Helicopters - Ind
	[
		"CAMS_Heli_Transport_I",1,true,
		[
			"uns_ch34_VNAF"
		]
	],
	[
		"CAMS_Heli_ArmedTransport_I",1,true,
		[
			"uns_ch34_VNAF_M60",
			
			"uns_ch47_m60_arvn"
		]
	],
	[
		"CAMS_Heli_Armed_I",1,true,
		[	
			"uns_UH1D_vnaf_m60","uns_UH1D_vnaf_m60_light"
		]
	],
	
	[
		"CAMS_Plane_CAS_C",1,true,
		[
			"uns_skymast_civ_blue","uns_skymast_civ_gold","uns_skymast_civ_red",
			"uns_skymast_civ_teal","uns_skymast_civ_yellow"
		]
	],
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,true,
		[
			"CSJ_C123","CSJ_C123B","uns_C123C",
			
			"UNS_skymaster_OBS","UNS_skymaster_fac","UNS_skymaster_CAS","UNS_skymaster_CBU",
			
			"uns_A1J","uns_A1J_CAS","uns_A1J_HCAS","uns_A1J_AGM","uns_A1J_CBU",
			"uns_A1J_CMU","uns_A1J_MR","uns_A1J_BMB","uns_A1J_LBMB","uns_A1J_HBMB",
			
			"uns_A7_CAP","uns_A7_CAS","uns_A7_AGM","uns_A7_MR","uns_A7_LRBMB",
			"uns_A7_BMB","uns_A7_LBMB","uns_A7_MBMB","uns_A7_HBMB","uns_A7_CBU","uns_A7_GBU","uns_A7_SEAD",
			
			"uns_f100b_CAP","uns_f100b_CAS","uns_f100b_MR","uns_f100b_AGM","uns_f100b_LRBMB","uns_f100b_BMB",
			"uns_f100b_LBMB","uns_f100b_MBMB","uns_f100b_HBMB","uns_f100b_CBU","uns_f100b_SEAD",
			
			"uns_f105D_CAP","uns_f105D_CAS","uns_f105D_AGM","uns_f105D_MR","uns_f105D_BMB",
			"uns_f105D_CBU","uns_f105D_HCAS","uns_f105F_MR","uns_f105F_AGM","uns_f105F_BMB","uns_f105F_GBU","uns_f105F_SEAD",
			
			"UNS_F111_CAP","UNS_F111_CAS","UNS_F111_HCAS","UNS_F111_AGM","UNS_F111_MR","UNS_F111_LBMB",
			"UNS_F111_BMB","UNS_F111_HBMB","UNS_F111_LGB","UNS_F111_SEAD","UNS_F111_CBU","UNS_F111_D_CAP",
			"UNS_F111_D_CAS","UNS_F111_D_HCAS","UNS_F111_D_AGM","UNS_F111_D_MR","UNS_F111_D_LBMB","UNS_F111_D_BMB",
			"UNS_F111_D_HBMB","UNS_F111_D_LGB","UNS_F111_D_SEAD","UNS_F111_D_CBU",
			
			"uns_F4E_CHICO",
			
			"uns_ka3",
			
			"uns_a3bcamo1",
			
			"UNS_Hawkeye",
			
			"uns_c1a","uns_c1a2","uns_c1a3","uns_c1a4","uns_c1a5","uns_c1a6","uns_c1a7",
			
			"uns_c1a2cargo","uns_c1a3cargo","uns_c1a4cargo","uns_c1a5cargo","uns_c1a6cargo","uns_c1a7cargo",
			
			"uns_a3b","uns_a3bcamo1","uns_a3bvah1","uns_a3bvah2","uns_a3bvah4","uns_a3bvah6",
			"uns_a3bvah11","uns_a3avah1","uns_a3avah2","uns_a3avah4","uns_a3avah6","uns_a3avah11",
			
			"uns_A4B_skyhawk_CAP","uns_A4B_skyhawk_CAS","uns_A4B_skyhawk_BMB","uns_A4B_skyhawk_MR",
			
			"uns_A4E_skyhawk_CAP","uns_A4E_skyhawk_CAS","uns_A4E_skyhawk_HCAS","uns_A4E_skyhawk_AGM","uns_A4E_skyhawk_MR",
			"uns_A4E_skyhawk_BMB","uns_A4E_skyhawk_HBMB","uns_A4E_skyhawk_LRBMB","uns_A4E_skyhawk_MBMB","uns_A4E_skyhawk_SEAD",
			"uns_A4E_skyhawk_CBU",
			
			"uns_A6_Intruder_LBMB","uns_A6_Intruder_SEAD","uns_A6_Intruder_CAS","uns_A6_Intruder_AGM","uns_A6_Intruder_MR",
			"uns_A6_Intruder_BMB","uns_A6_Intruder_LRBMB","uns_A6_Intruder_MBMB","uns_A6_Intruder_HBMB","uns_A6_Intruder_CBU",
			"uns_A6_Intruder_GBU","uns_A6_Intruder_CAP",
			
			"uns_A7N_CAP","uns_A7N_CAS","uns_A7N_AGM","uns_A7N_MR","uns_A7N_LRBMB","uns_A7N_BMB","uns_A7N_LBMB",
			"uns_A7N_MBMB","uns_A7N_HBMB","uns_A7N_CBU","uns_A7N_GBU","uns_A7N_SEAD",
			
			"uns_F4_CAP","uns_F4_MR","uns_F4_AGM","uns_F4_LRBMB","uns_F4_LBMB",
			
			"uns_A4E_skyhawk_RAN_AGM","uns_A4E_skyhawk_RAN_BMB","uns_A4E_skyhawk_RAN_CAP","uns_A4E_skyhawk_RAN_CAS",
			"uns_A4E_skyhawk_RAN_CBU","uns_A4E_skyhawk_RAN_HBMB","uns_A4E_skyhawk_RAN_HCAS","uns_A4E_skyhawk_RAN_LRBMB",
			"uns_A4E_skyhawk_RAN_MBMB","uns_A4E_skyhawk_RAN_MR","uns_A4E_skyhawk_RAN_SEAD",
			
			"uns_A1J_navy_AGM","uns_A1J_navy_BMB","uns_A1J_navy_LBMB","uns_A1J_navy_CAS","uns_A1J_navy_CBU",
			"uns_A1J_navy_CMU","uns_A1J_navy","uns_A1J_navy_EHCAS","uns_A1J_navy_HBMB","uns_A1J_navy_HCAS",
			"uns_A1J_navy_MR",
			
			"uns_A4E_skyhawk_USMC_AGM","uns_A4E_skyhawk_USMC_BMB","uns_A4E_skyhawk_USMC_CAP","uns_A4E_skyhawk_USMC_CAS",
			"uns_A4E_skyhawk_USMC_CBU","uns_A4E_skyhawk_USMC_HBMB","uns_A4E_skyhawk_USMC_HCAS","uns_A4E_skyhawk_USMC_LRBMB",
			"uns_A4E_skyhawk_USMC_MBMB","uns_A4E_skyhawk_USMC_MR","uns_A4E_skyhawk_USMC_SEAD",
			
			"uns_A6_Intruder_USMC_AGM","uns_A6_Intruder_USMC_BMB","uns_A6_Intruder_USMC_CAS","uns_A6_Intruder_USMC_CBU",
			"uns_A6_Intruder_USMC_CAP","uns_A6_Intruder_USMC_GBU","uns_A6_Intruder_USMC_HBMB","uns_A6_Intruder_USMC_LBMB",
			"uns_A6_Intruder_USMC_LRBMB","uns_A6_Intruder_USMC_MBMB","uns_A6_Intruder_USMC_MR","uns_A6_Intruder_USMC_SEAD",

			"uns_F4B_AGM","uns_F4B_BMB","uns_F4B_CAP","uns_F4B_CAS","uns_F4B_CBU","uns_F4B_GBU",
			"uns_F4B_HBMB","uns_F4B_LBMB","uns_F4B_LRBMB","uns_F4B_MBMB","uns_F4B_MR","uns_F4B_SEAD"
		]
	],

	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,true,
		[
			// East - AN2
			"uns_an2","uns_an2_bmb","uns_an2_cas","uns_an2_transport",
			
			// East - MIG-21
			"uns_Mig21_BMB","uns_Mig21_LGB","uns_mig21_MR","uns_Mig21_SEAD","uns_Mig21_AGM",
			"uns_Mig21_HBMB","uns_Mig21_CAP","uns_Mig21_CAS","uns_Mig21_CBU","uns_Mig21_HCAS"
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
			"uns_A1H_AGM","uns_A1H_BMB","uns_A1H_CAS","uns_A1H_CBU","uns_A1H_CMU",
			"uns_A1H","uns_A1H_EHCAS","uns_A1H_HBMB","uns_A1H_HCAS","uns_A1H_LBMB","uns_A1H_MR"
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

/*	
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
*/

	////////////////////////////////////////////////////// West Vehicles
	[
		"CAMS_Land_ArmedOffroad_W",1,true,
		[
			"uns_willysmg50","uns_willysmg","uns_willysm40",
			
			"uns_willys_2_m60","uns_willys_2_m1919",
			
			"uns_m274_m40","uns_m274_m60",
			
			"uns_m37b1_m1919"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,true,
		[
			"uns_willys","uns_willys_2","uns_willys_2_usmp","uns_willys_2_usmc",
			
			"uns_m274",
			"uns_m37b1"
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
			"uns_M113_transport","uns_M577_amb","uns_m43","uns_M35A2","uns_M35A2_Open"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,true,
		[
			"uns_M113_ENG","uns_M35A2_ammo","uns_M35A2_fueltanker","uns_M35A2_fuel","uns_M35A2_repair",
			
			"uns_truck_reammo","uns_truck_refuel","uns_truck_repair"
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,true,
		[
			"uns_M113_M2","uns_M113_M60","uns_M113_XM182","uns_M113_M134","uns_M113_30cal",
			"uns_M113A1_M2","uns_M113A1_M60","uns_M113A1_XM182","uns_M113A1_M134","uns_M113A1_M40",
			
			"uns_xm706e1","uns_xm706e2"
		]
	],
	[
		"CAMS_Land_Tank_W",1,true,
		[
			"uns_M132","uns_m48a3","uns_m551","uns_M67A"
		]
	],
	[
		"CAMS_Land_Artillery_W",1,true,
		[
			"uns_M30_107mm_mortar","uns_M1_81mm_mortar","uns_M1_81mm_mortar_arty",
			"uns_M2_60mm_mortar","uns_M102_artillery","uns_m114_artillery"
		]
	],
	[
		"CAMS_Land_AA_W",1,true,
		[
			"Uns_M55_Quad","uns_m163"
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
			"uns_Type55_twinMG","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_M40"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,true,
		[
			"uns_Type55_patrol"
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
			"uns_Type55",
			
			"uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_open","uns_zil157"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,true,
		[
			"uns_zil157_refuel","uns_zil157_repair",
			
			"uns_nvatruck_reammo","uns_nvatruck_refuel","uns_nvatruck_repair"
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,true,
		[
			"uns_BTR152_DSHK",
			
			"uns_Type55_MG","uns_Type55_LMG",
			
			"uns_nvatruck_mg",
			
			"uns_type63_amb"
			
		]
	],
	[
		"CAMS_Land_Tank_E",1,true,
		[
			"uns_t34_76_vc"
		]
	],
	[
		"CAMS_Land_AA_E",1,true,
		[
			"uns_ZPU4_VC","uns_ZPU4_NVA","uns_ZU23_VC","uns_ZU23_NVA",
			"uns_S60_VC","uns_S60_NVA","uns_Type74_VC","uns_Type74_NVA",
			
			"uns_BTR152_ZPU",
			"pook_P12_NVA","pook_PU12_NVA",
			"POOK_SON50_NVA",
			"uns_Type55_ZU",
			"pook_URAL_UTILITY_NVA","pook_URAL_UTILITY_NVA",
			"uns_nvatruck_s60","uns_nvatruck_type65",
			"uns_nvatruck_zpu","uns_nvatruck_zu23"
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,true,
		[
			"uns_m1941_82mm_mortarNVA","uns_m1941_82mm_mortarNVA_arty",
			"uns_m1941_82mm_mortarVC","uns_D20_artillery","uns_D30_artillery"
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
			"uns_willys_2_m60_arvn","uns_willys_2_m1919_arvn","uns_xm706"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,true,
		[
			"uns_willys_2_arvn"		]
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
		"CAMS_Land_Quad_I",1,true,
		[
		]
	],
	/*
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
*/
	//////////////////////////////////////////// Static Guns - West
	[
		"CAMS_Land_StaticGuns_W",1,true,
		[
			"uns_M2_low","uns_M2_high","uns_M1919_low","uns_M60_low","uns_US_SearchLight","uns_M40_106mm_US","uns_US_MK18_low"	
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
			// East - VC
			"uns_dshk_high_VC","uns_dshk_low_VC","uns_dshk_armoured_VC","uns_dshk_wheeled_VC","uns_dshk_twin_VC","uns_dshk_bunker_open_VC","uns_dshk_bunker_closed_VC",
			"uns_dshk_twin_bunker_open_VC","uns_dshk_twin_bunker_closed_VC","uns_pk_low_VC","uns_pk_high_VC","uns_pk_bunker_low_VC","uns_pk_bunker_open_VC","uns_pk_bunker_closed_VC",
			"uns_pk_tower_VC","uns_mg42_low_VC","uns_M40_106mm_VC","uns_SPG9_73mm_VC","uns_Type36_57mm_VC",
			
			// East - NVA
			"uns_dshk_high_NVA","uns_dshk_low_NVA","uns_dshk_armoured_NVA","uns_dshk_wheeled_NVA","uns_dshk_twin_NVA","uns_dshk_bunker_open_NVA","uns_dshk_bunker_closed_NVA",
			"uns_dshk_twin_bunker_open_NVA","uns_dshk_twin_bunker_closed_NVA","uns_pk_low_NVA","uns_pk_high_NVA","uns_pk_bunker_low_NVA","uns_pk_bunker_open_NVA",
			"uns_pk_bunker_closed_NVA","uns_pk_tower_NVA","uns_mg42_low_NVA","uns_NVA_SearchLight","uns_M40_106mm_NVA","uns_SPG9_73mm_NVA","uns_Type36_57mm_NVA"
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
			"pook_KS12_NVA","pook_KS19_NVA","pook_PRV11_NVA","pook_PUAZO_NVA",
			"pook_S60_NVA","uns_S60_NVA",
			"pook_SA2_static_NVA","uns_sa2_static_NVA",
			"pook_SNR75_radar_NVA","uns_snr75_radar_NVA",
			"pook_SON9_NVA",
			"uns_Type74_NVA",
			"uns_ZPU2_NVA",
			"uns_ZPU4_NVA",
			"pook_ZU23_NVA","uns_ZU23_NVA",
			
			"uns_S60_VC","uns_Type74_VC","uns_ZPU2_VC","uns_ZPU4_VC","uns_ZU23_VC"
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
/*
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
*/
	[
		"CAMS_Wreck_Mil",1,false,
		[
			"m113ruin2"
		]
	],
	[
		"CAMS_Wreck_Tank",1,true,
		[
			"m113ruin2"
		]
	],
	[
		"CAMS_Wreck_Heli",1,true,
		[
			"uns_ah1g_Wreck","uns_ch47_wreck","uns_mi8_wreck","OH6_Wreck","uns_oh6_wreck","uns_uh1c_wreck",
			"UH1_Wreck","UH1_Wreck_Inv","uns_uh1d_wreck","uns_uh1_Wreck","uns_uh1h_wreck"		]
	],
	[
		"CAMS_Wreck_Plane",1,true,
		[
			"uns_a1j_Wreck","uns_a3b_Wreck","uns_A4_Wreck","uns_A6_Wreck","uns_A7_wreck","uns_an2_wreck",
			"b52_wreck","uns_c1a_wreck","uns_E2A_Wreck","uns_f100_Wreck","UNS_F111_wreck","uns_h21c_wreck",
			"uns_mig21_dragchute","uns_mig21_wreck"
		]
	],
	[
		"CAMS_Wreck_Boat",1,false,
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


/////////////////////////////
// Cart processing //////////
/////////////////////////////

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

//diag_log format ["[CAMS] CART System: %1 assets loaded",_cartName];
