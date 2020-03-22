// Assets.sqf
// CUP Units Version
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
_cartName = "cupu"; 	// Change this to match the directory name of the content you are adding
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
		false,				// TRUE - Replaces vanilla class      FALSE - Appends to vanilla class
					
		[
			"CUP_U_C_Pilot_01",
			"CUP_U_C_Citizen_01",
			"CUP_U_C_Citizen_02",
			"CUP_U_C_Citizen_03",
			"CUP_U_C_Citizen_04",
			"CUP_U_C_Worker_01",
			"CUP_U_C_Worker_02",
			"CUP_U_C_Worker_03",
			"CUP_U_C_Worker_04",
			"CUP_U_C_Profiteer_01",
			"CUP_U_C_Profiteer_02",
			"CUP_U_C_Profiteer_03",
			"CUP_U_C_Profiteer_04",
			"CUP_U_C_Woodlander_01",
			"CUP_U_C_Woodlander_02",
			"CUP_U_C_Woodlander_03",
			"CUP_U_C_Woodlander_04",
			"CUP_U_C_Villager_01",
			"CUP_U_C_Villager_02",
			"CUP_U_C_Villager_03",
			"CUP_U_C_Villager_04"
		]
	],

	//////////////////////////////////// Uniforms - WEST
	
	[
		"CAMS_U_Soldier_W",1,false,
		[
			"CUP_U_B_CZ_WDL_TShirt",
			
			"CUP_U_B_GER_Tropentarn_1",
			"CUP_U_B_GER_Tropentarn_2",
			"CUP_U_B_GER_Flecktarn_1",
			"CUP_U_B_GER_Flecktarn_2",
			
			"CUP_U_B_FR_SpecOps",
			"CUP_U_B_FR_Scout",
			"CUP_U_B_FR_Scout1",
			"CUP_U_B_FR_Scout2",
			"CUP_U_B_FR_Scout3",
			"CUP_U_B_FR_Officer",
			"CUP_U_B_FR_Corpsman",
			"CUP_U_B_FR_DirAction",
			"CUP_U_B_FR_DirAction2",
			"CUP_U_B_FR_Light",
			
			"CUP_U_B_BAF_DDPM_S1_RolledUp",
			"CUP_U_B_BAF_DDPM_S1_UnRolled",
			"CUP_U_B_BAF_DDPM_Tshirt",
			"CUP_U_B_BAF_DPM_S1_RolledUp",
			"CUP_U_B_BAF_DPM_S2_UnRolled",
			"CUP_U_B_BAF_DPM_Tshirt",
			"CUP_U_B_BAF_MTP_S1_RolledUp",
			"CUP_U_B_BAF_MTP_S2_UnRolled",
			"CUP_U_B_BAF_MTP_Tshirt",
			"CUP_U_B_BAF_MTP_S3_RolledUp",
			"CUP_U_B_BAF_MTP_S4_UnRolled",
			"CUP_U_B_BAF_MTP_S5_UnRolled",
			"CUP_U_B_BAF_MTP_S6_UnRolled"
		]	
	],
	[
		"CAMS_U_Guerilla_W",1,false,
		[
			"CUP_U_B_USMC_Officer",
			"CUP_U_B_USMC_Ghillie_WDL",
			"CUP_U_B_USMC_MARPAT_WDL_Sleeves",
			"CUP_U_B_USMC_MARPAT_WDL_RolledUp",
			"CUP_U_B_USMC_MARPAT_WDL_Kneepad",
			"CUP_U_B_USMC_MARPAT_WDL_TwoKneepads",
			"CUP_U_B_USMC_MARPAT_WDL_RollUpKneepad",
		
		
			"CUP_U_B_BAF_DDPM_S1_RolledUp",
			"CUP_U_B_BAF_DDPM_S1_UnRolled",
			"CUP_U_B_BAF_DDPM_Tshirt",
			"CUP_U_B_BAF_DPM_S1_RolledUp",
			"CUP_U_B_BAF_DPM_S2_UnRolled",
			"CUP_U_B_BAF_DPM_Tshirt",
			"CUP_U_B_BAF_MTP_S1_RolledUp",
			"CUP_U_B_BAF_MTP_S2_UnRolled",
			"CUP_U_B_BAF_MTP_Tshirt",
			"CUP_U_B_BAF_MTP_S3_RolledUp",
			"CUP_U_B_BAF_MTP_S4_UnRolled",
			"CUP_U_B_BAF_MTP_S5_UnRolled",
			"CUP_U_B_BAF_MTP_S6_UnRolled"	
		]
	],	
	[
		"CAMS_U_Ghillie_W",1,false,
		[
			"CUP_U_B_GER_Ghillie","CUP_U_B_GER_Fleck_Ghillie"
		]
	],
	[
		"CAMS_U_Aviation_W",1,false,
		[
			"CUP_U_B_USMC_PilotOverall"		
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
			"CUP_O_TKI_Khet_Partug_01",
			"CUP_O_TKI_Khet_Partug_02",
			"CUP_O_TKI_Khet_Partug_03",
			"CUP_O_TKI_Khet_Partug_04",
			"CUP_O_TKI_Khet_Partug_05",
			"CUP_O_TKI_Khet_Partug_06",
			"CUP_O_TKI_Khet_Partug_07",
			"CUP_O_TKI_Khet_Partug_08",
			"CUP_O_TKI_Khet_Jeans_01",
			"CUP_O_TKI_Khet_Jeans_02",
			"CUP_O_TKI_Khet_Jeans_03",
			"CUP_O_TKI_Khet_Jeans_04",
			
			"CUP_U_O_SLA_MixedCamo",
			"CUP_U_O_SLA_Green",
			"CUP_U_O_SLA_Urban",
			"CUP_U_O_SLA_Desert"
		]	
	],
	[
		"CAMS_U_Guerilla_E",1,false,
		[
			"CUP_U_O_Partisan_TTsKO",
			"CUP_U_O_Partisan_TTsKO_Mixed",
			"CUP_U_O_Partisan_VSR_Mixed1",
			"CUP_U_O_Partisan_VSR_Mixed2",
			"CUP_U_O_TK_Officer",
			"CUP_U_O_TK_MixedCamo",
			"CUP_U_O_TK_Green"
		]
	],
	[
		"CAMS_U_Ghillie_E",1,false,
		[
			"CUP_U_O_TK_Ghillie",
			"CUP_U_O_TK_Ghillie_Top"		
		]
	],
	[
		"CAMS_U_Aviation_E",1,false,
		[
			"CUP_U_O_SLA_Officer",
			"CUP_U_O_SLA_Officer_Suit",
			"CUP_U_O_SLA_Overalls_Pilot",
			"CUP_U_O_SLA_Overalls_Tank"
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
			"CUP_U_I_RACS_Desert_1",
			"CUP_U_I_RACS_Desert_2",
			"CUP_U_I_RACS_Urban_1",
			"CUP_U_I_RACS_Urban_2"
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,false,
		[
			"CUP_U_I_GUE_Flecktarn",
			"CUP_U_I_GUE_Flecktarn2",
			"CUP_U_I_GUE_Flecktarn3",
			"CUP_U_I_GUE_Woodland1"		
		]
	],
	[
		"CAMS_U_Ghillie_I",1,false,
		[
			"CUP_U_I_Ghillie_Top"		
		]
	],
	[
		"CAMS_U_Aviation_I",1,false,
		[
			"CUP_U_I_RACS_PilotOverall"		
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
			"CUP_V_O_TK_CrewBelt",
			"CUP_V_O_TK_OfficerBelt",
			"CUP_V_O_TK_OfficerBelt2",
		
			"CUP_V_O_SLA_Carrier_Belt",
			"CUP_V_O_SLA_Carrier_Belt02",
			"CUP_V_O_SLA_Carrier_Belt03",
			
			"CUP_V_I_Carrier_Belt"
		]
	],
	[
		"CAMS_V_Chestrig",1,false,
		[
			"CUP_V_BAF_Osprey_Mk2_DDPM_Grenadier",
			"CUP_V_BAF_Osprey_Mk2_DDPM_Medic",
			"CUP_V_BAF_Osprey_Mk2_DDPM_Officer",
			"CUP_V_BAF_Osprey_Mk2_DDPM_Sapper",
			"CUP_V_BAF_Osprey_Mk2_DDPM_Scout",
			"CUP_V_BAF_Osprey_Mk2_DDPM_Soldier1",
			"CUP_V_BAF_Osprey_Mk2_DDPM_Soldier2",
			"CUP_V_BAF_Osprey_Mk2_DPM_Grenadier",
			"CUP_V_BAF_Osprey_Mk2_DPM_Medic",
			"CUP_V_BAF_Osprey_Mk2_DPM_Officer",
			"CUP_V_BAF_Osprey_Mk2_DPM_Sapper",
			"CUP_V_BAF_Osprey_Mk2_DPM_Scout",
			"CUP_V_BAF_Osprey_Mk2_DPM_Soldier1",
			"CUP_V_BAF_Osprey_Mk2_DPM_Soldier2",
			"CUP_V_BAF_Osprey_Mk4_MTP_Grenadier",
			"CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner",
			"CUP_V_BAF_Osprey_Mk4_MTP_Rifleman",
			"CUP_V_BAF_Osprey_Mk4_MTP_SquadLeader"		
		]
	],

	[
		"CAMS_V_Vests_W",1,false,
		[
			"CUP_V_B_LHDVest_Blue",
			"CUP_V_B_LHDVest_Brown",
			"CUP_V_B_LHDVest_Green",
			"CUP_V_B_LHDVest_Red",
			"CUP_V_B_LHDVest_Violet",
			"CUP_V_B_LHDVest_White",
			"CUP_V_B_LHDVest_Yellow",
			"CUP_V_I_Guerilla_Jacket",
			"CUP_V_OI_TKI_Jacket1_01",
			"CUP_V_OI_TKI_Jacket1_02",
			"CUP_V_OI_TKI_Jacket1_03",
			"CUP_V_OI_TKI_Jacket1_04",
			"CUP_V_OI_TKI_Jacket1_05",
			"CUP_V_OI_TKI_Jacket1_06",
			"CUP_V_OI_TKI_Jacket2_01",
			"CUP_V_OI_TKI_Jacket2_02",
			"CUP_V_OI_TKI_Jacket2_03",
			"CUP_V_OI_TKI_Jacket2_04",
			"CUP_V_OI_TKI_Jacket2_05",
			"CUP_V_OI_TKI_Jacket2_06",
			"CUP_V_OI_TKI_Jacket3_01",
			"CUP_V_OI_TKI_Jacket3_02",
			"CUP_V_OI_TKI_Jacket3_03",
			"CUP_V_OI_TKI_Jacket3_04",
			"CUP_V_OI_TKI_Jacket3_05",
			"CUP_V_OI_TKI_Jacket3_06",
			"CUP_V_OI_TKI_Jacket4_01",
			"CUP_V_OI_TKI_Jacket4_02",
			"CUP_V_OI_TKI_Jacket4_03",
			"CUP_V_OI_TKI_Jacket4_04",
			"CUP_V_OI_TKI_Jacket4_05",
			"CUP_V_OI_TKI_Jacket4_06",
			"CUP_V_O_SLA_Flak_Vest01",
			"CUP_V_O_SLA_Flak_Vest02",
			"CUP_V_O_SLA_Flak_Vest03",
			"CUP_V_O_TK_Vest_1",
			"CUP_V_O_TK_Vest_2"
		]
	],
	[
		"CAMS_V_Vests_E",1,false,
		[		
			"CUP_V_B_GER_Carrier_Rig",
			"CUP_V_B_GER_Carrier_Rig_2",
			"CUP_V_B_GER_Carrier_Vest",
			"CUP_V_B_GER_Carrier_Vest_2",
			"CUP_V_B_GER_Carrier_Vest_3",
			"CUP_V_B_GER_Vest_1",
			"CUP_V_B_GER_Vest_2"
		]
	],
	[
		"CAMS_V_Vests",0,true,
		[
			"CAMS_V_Vests_W","CAMS_V_Vests_E"
		]
	],
	
	[
		"CAMS_V_Harness",1,true,
		[
			"CUP_V_B_MTV",
			"CUP_V_B_MTV_LegPouch",
			"CUP_V_B_MTV_MG",
			"CUP_V_B_MTV_Marksman",
			"CUP_V_B_MTV_Mine",
			"CUP_V_B_MTV_Patrol",
			"CUP_V_B_MTV_PistolBlack",
			"CUP_V_B_MTV_Pouches",
			"CUP_V_B_MTV_TL",
			"CUP_V_B_MTV_noCB",
			"CUP_V_B_PilotVest",
			"CUP_V_B_RRV_DA1",
			"CUP_V_B_RRV_DA2",
			"CUP_V_B_RRV_Light",
			"CUP_V_B_RRV_MG",
			"CUP_V_B_RRV_Medic",
			"CUP_V_B_RRV_Officer",
			"CUP_V_B_RRV_Scout",
			"CUP_V_B_RRV_Scout2",
			"CUP_V_B_RRV_Scout3",
			"CUP_V_B_RRV_TL"		
		]
	],
	[
		"CAMS_V_Plate",1,true,
		[
			"CUP_V_I_RACS_Carrier_Vest",
			"CUP_V_I_RACS_Carrier_Vest_2",
			"CUP_V_I_RACS_Carrier_Vest_3"		
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
		"CAMS_H_Caps_W",1,true,
		[
			"CUP_H_C_Beanie_01",
			"CUP_H_C_Beanie_02",
			"CUP_H_C_Beanie_03",
			"CUP_H_C_Beanie_04",
			"CUP_H_FR_BandanaGreen",
			"CUP_H_FR_BandanaWdl",
			"CUP_H_FR_Bandana_Headset",
			"CUP_H_FR_BeanieGreen",
			"CUP_H_FR_Cap_Headset_Green",
			"CUP_H_FR_Cap_Officer_Headset",
			"CUP_H_FR_ECH",
			"CUP_H_FR_Headband_Headset",
			"CUP_H_FR_Headset",
			"CUP_H_NAPA_Fedora",
			"CUP_H_PMC_Cap_Grey",
			"CUP_H_PMC_Cap_PRR_Grey",
			"CUP_H_PMC_Cap_PRR_Tan",
			"CUP_H_PMC_Cap_Tan",
			"CUP_H_PMC_EP_Headset",
			"CUP_H_PMC_PRR_Headset",
			"CUP_H_SLA_BeenieGreen",
			"CUP_H_SLA_OfficerCap",
			"CUP_H_SLA_SLCap",
			"CUP_H_TKI_Lungee_01",
			"CUP_H_TKI_Lungee_02",
			"CUP_H_TKI_Lungee_03",
			"CUP_H_TKI_Lungee_04",
			"CUP_H_TKI_Lungee_05",
			"CUP_H_TKI_Lungee_06",
			"CUP_H_TKI_Lungee_Open_01",
			"CUP_H_TKI_Lungee_Open_02",
			"CUP_H_TKI_Lungee_Open_03",
			"CUP_H_TKI_Lungee_Open_04",
			"CUP_H_TKI_Lungee_Open_05",
			"CUP_H_TKI_Lungee_Open_06",
			"CUP_H_TKI_Pakol_1_01",
			"CUP_H_TKI_Pakol_1_02",
			"CUP_H_TKI_Pakol_1_03",
			"CUP_H_TKI_Pakol_1_04",
			"CUP_H_TKI_Pakol_1_05",
			"CUP_H_TKI_Pakol_1_06",
			"CUP_H_TKI_Pakol_2_01",
			"CUP_H_TKI_Pakol_2_02",
			"CUP_H_TKI_Pakol_2_03",
			"CUP_H_TKI_Pakol_2_04",
			"CUP_H_TKI_Pakol_2_05",
			"CUP_H_TKI_Pakol_2_06",
			"CUP_H_TKI_SkullCap_01",
			"CUP_H_TKI_SkullCap_02",
			"CUP_H_TKI_SkullCap_03",
			"CUP_H_TKI_SkullCap_04",
			"CUP_H_TKI_SkullCap_05",
			"CUP_H_TKI_SkullCap_06",
			"CUP_H_TK_Lungee",
			"CUP_H_USMC_Officer_Cap"
			///"CUP_H_SLA_BeretRed",
		]
	],
	/*
	[
		"CAMS_H_Caps_E",1,true,
		[
		]
	],	
	*/
	[
		"CAMS_H_Caps",0,true,
		[
			"CAMS_H_Caps_W","CAMS_H_Caps_E"
		]
	],	
	[
		"CAMS_H_RegHelmet_W",1,true,////////////////////////////////////////////////////////
		[
			"CUP_H_BAF_Helmet_1_DDPM",
			"CUP_H_BAF_Helmet_1_DPM",
			"CUP_H_BAF_Helmet_1_MTP",
			"CUP_H_BAF_Helmet_2_DDPM",
			"CUP_H_BAF_Helmet_2_DPM",
			"CUP_H_BAF_Helmet_2_MTP",
			"CUP_H_BAF_Helmet_3_DDPM",
			"CUP_H_BAF_Helmet_3_DPM",
			"CUP_H_BAF_Helmet_3_MTP",
			"CUP_H_BAF_Helmet_4_DDPM",
			"CUP_H_BAF_Helmet_4_DPM",
			"CUP_H_BAF_Helmet_4_MTP",
		
		
			"CUP_H_Navy_CrewHelmet_Blue",
			"CUP_H_Navy_CrewHelmet_Brown",
			"CUP_H_Navy_CrewHelmet_Green",
			"CUP_H_Navy_CrewHelmet_Red",
			"CUP_H_Navy_CrewHelmet_Violet",
			"CUP_H_Navy_CrewHelmet_White",
			"CUP_H_Navy_CrewHelmet_Yellow",
		
			"CUP_H_RACS_Helmet_DPAT",
			"CUP_H_RACS_Helmet_Des",
			"CUP_H_RACS_Helmet_Goggles_DPAT",
			"CUP_H_RACS_Helmet_Goggles_Des",
			"CUP_H_RACS_Helmet_Headset_DPAT",
			"CUP_H_RACS_Helmet_Headset_Des",
		
			"CUP_H_SLA_Helmet",
			"CUP_H_SLA_Pilot_Helmet",
			"CUP_H_SLA_TankerHelmet",
			
			"CUP_H_TK_PilotHelmet",
			"CUP_H_TK_TankerHelmet",
			"CUP_H_TK_Helmet",
			
			
			"CUP_H_USMC_Goggles_HelmetWDL",
			"CUP_H_USMC_HeadSet_GoggleW_HelmetWDL",
			"CUP_H_USMC_HeadSet_HelmetWDL",
			"CUP_H_USMC_HelmetWDL",
			"CUP_H_USMC_Helmet_Pilot"
		]
	],
	/*
	[
		"CAMS_H_LightHelmet_W",1,true,///////////////////////////////////////////////////////
		[
		]
	],	
	[
		"CAMS_H_LightHelmet_E",1,true,///////////////////////////////////////////////////////
		[
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
		]
	],
	*/
	[
		"CAMS_H_RegHelmet",0,true,
		[
			"CAMS_H_RegHelmet_W","CAMS_H_RegHelmet_E"
		]
	],
	
	[
		"CAMS_H_Boonie_W",1,true,
		[
			"CUP_H_FR_BoonieMARPAT",
			"CUP_H_FR_BoonieWDL",

			"CUP_H_FR_PRR_BoonieWDL",
			
			"CUP_H_GER_Boonie_Flecktarn",
			"CUP_H_GER_Boonie_desert",
			
			"CUP_H_SLA_Boonie"	
		]
	],
	[
		"CAMS_H_Boonie_E",1,true,
		[	
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
			"CUP_H_BAF_Officer_Beret_PRR_O",

			"CUP_H_C_Beret_01",
			"CUP_H_C_Beret_02",
			"CUP_H_C_Beret_03",
			"CUP_H_C_Beret_04",
			"CUP_H_RACS_Beret_Blue",
			"CUP_H_SLA_Beret",

			"CUP_H_TK_Beret"
		]
	],
	[
		"CAMS_H_Shemags",1,true,
		[
			"CUP_H_C_Ushanka_01",
			"CUP_H_C_Ushanka_02",
			"CUP_H_C_Ushanka_03",
			"CUP_H_C_Ushanka_04"		
		]
	],
	/*
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
			"CUP_H_USMC_Crew_Helmet",
		
		]
	],
	/*
	[
		"CAMS_H_Aviation_E",1,true,
		[
		]
	],
	*/
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
	///////////////////////////////////////////////////////////// Glasses
	/*
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
			// West Radio
			"ItemRadio",
		]
	],
	
	[
		"CAMS_I_Misc",1,true,
		[
		]
	],

	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,true,
		[
			"FirstAidKit","Medikit","ToolKit"
		]
	],	
	*/
	// Backpacks
	[
		"CAMS_Packs_W",1,true,
		[
			"CUP_B_ACRPara_m95",
			"CUP_B_AssaultPack_ACU",
			"CUP_B_AssaultPack_Black",
			"CUP_B_AssaultPack_Coyote",
			"CUP_B_Bergen_BAF",
			"CUP_B_CivPack_WDL",
			"CUP_B_HikingPack_Civ",
			"CUP_B_MOLLE_WDL",
			"CUP_B_USMC_AssaultPack",
			"CUP_B_USMC_MOLLE",
			"CUP_B_USPack_Black",
			"CUP_B_USPack_Coyote"		
		]
	],
	[
		"CAMS_Packs_E",1,true,
		[
			"CUP_B_RUS_Backpack",
			"CUP_B_GER_Pack_Flecktarn",
			"CUP_B_GER_Pack_Tropentarn"
		]
	],
	[
		"CAMS_Packs_ALL",0,true,
		[
			"CAMS_Packs_W","CAMS_Packs_E"
		]
	],
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
