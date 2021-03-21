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
_cartName = "apex";
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
		false,				// TRUE - Replaces vanilla class      FALSE - Appends to vanilla class
					
		[
		"U_C_Man_casual_1_F","U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_4_F",
		"U_C_Man_casual_5_F","U_C_Man_casual_6_F","U_C_man_sport_1_F","U_C_man_sport_2_F",
		"U_C_man_sport_3_F"
		]
	],

	//////////////////////////////////// Uniforms - WEST
	
	[
		"CAMS_U_Soldier_W",1,false,
		[
		"U_B_CTRG_Soldier_2_F",
		"U_B_CTRG_Soldier_3_F",
		"U_B_CTRG_Soldier_F",
		
		"U_B_GEN_Commander_F",
		"U_B_GEN_Soldier_F",
		
		"U_B_T_Soldier_AR_F",
		"U_B_T_Soldier_F",
		"U_B_T_Soldier_SL_F"
		]	
	],
	[
		"CAMS_U_Guerilla_W",1,false,
		[
		"U_B_CTRG_Soldier_urb_1_F",
		"U_B_CTRG_Soldier_urb_2_F",
		"U_B_CTRG_Soldier_urb_3_F"
		]
	],	
	[
		"CAMS_U_Ghillie_W",1,false,
		[
		"U_B_T_FullGhillie_tna_F","U_B_T_Sniper_F"
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
			"U_O_T_Officer_F",
			"U_O_T_Soldier_F"
		]	
	],
	[
		"CAMS_U_Guerilla_E",1,false,
		[
			"U_O_V_Soldier_Viper_F",
			"U_O_V_Soldier_Viper_hex_F"				
		]
	],
	[
		"CAMS_U_Ghillie_E",1,false,
		[
			"U_O_T_Sniper_F"		
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
			"U_I_C_Soldier_Camo_F",
			"U_I_C_Soldier_Para_1_F",
			"U_I_C_Soldier_Para_2_F",
			"U_I_C_Soldier_Para_3_F",
			"U_I_C_Soldier_Para_4_F",
			"U_I_C_Soldier_Para_5_F"	
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,false,
		[
			"U_I_C_Soldier_Bandit_1_F",
			"U_I_C_Soldier_Bandit_2_F",
			"U_I_C_Soldier_Bandit_3_F",
			"U_I_C_Soldier_Bandit_4_F",
			"U_I_C_Soldier_Bandit_5_F"		
		]
	],
	[	
		"CAMS_U_All_I",0,true,
		[
			"CAMS_U_Soldier_I", "CAMS_U_Guerilla_I", "CAMS_U_Ghillie_I", "CAMS_U_Wetsuit_I", "CAMS_U_Aviation_I"
		]
	],
	//////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////// Vest / Chest items
	////////////////////////////////////////////////////// May have to be broken down by EAST, WEST, IND in future or expansion packs

	[
		"CAMS_V_Bandolliers",1,true,
		[
			"V_BandollierB_ghex_F"		
		]
	],
	[
		"CAMS_V_Chestrig",1,true,
		[
			"V_TacChestrig_cbr_F",
			"V_TacChestrig_grn_F",
			"V_TacChestrig_oli_F"		
		]
	],

	[
		"CAMS_V_Vests_W",1,true,
		[
			"V_TacVest_gen_F"
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
			"V_HarnessOGL_ghex_F",
			"V_HarnessO_ghex_F"
		]
	],
	[
		"CAMS_V_Plate",1,true,
		[
			"V_PlateCarrier1_rgr_noflag_F",
			"V_PlateCarrier1_tna_F",
			"V_PlateCarrier2_rgr_noflag_F",
			"V_PlateCarrier2_tna_F",
			"V_PlateCarrierGL_tna_F",
			"V_PlateCarrierSpec_tna_F"		
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
			"H_Cap_blk_Syndikat_F",
			"H_Cap_grn_Syndikat_F",
			"H_Cap_oli_Syndikat_F",
			"H_Cap_tan_Syndikat_F",
			//"H_FakeHeadgear_Syndikat_F",
			"H_MilCap_gen_F",
			"H_MilCap_ghex_F",
			"H_MilCap_tna_F"		
		]
	],
	[
		"CAMS_H_Caps_E",1,true,
		[
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
			"H_HelmetB_Enh_tna_F",
			"H_HelmetB_TI_tna_F",
			"H_HelmetB_tna_F"
		]
	],
	[
		"CAMS_H_LightHelmet_W",1,true,///////////////////////////////////////////////////////
		[
			"H_HelmetB_Light_tna_F",
			"H_Helmet_Skate"			
		]
	],	
	[
		"CAMS_H_LightHelmet_E",1,false,///////////////////////////////////////////////////////
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
			"H_HelmetCrew_O_ghex_F",
			"H_HelmetLeaderO_ghex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetSpecO_ghex_F"
		]
	],
	[
		"CAMS_H_RegHelmet",0,true,
		[
			"CAMS_H_RegHelmet_W","CAMS_H_RegHelmet_E"
		]
	],
	
	[
		"CAMS_H_Boonie",0,true,
		[
			"CAMS_H_Boonie_W","CAMS_H_Boonie_E"
		]
	],	
	[
		"CAMS_H_Berets",1,true,
		[
			"H_Beret_gen_F"		
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
	
	
	/////////////////////////////////////////////////////
	///////////// CAMS AI Models ////////////////////////
	/////////////////////////////////////////////////////
	// This whole section should be rebuilt to your content but keep the global groupings at the end
	// Just swap out your own global names
	
	/////////////// EAST
	[
		"CAMS_AI_CSAT_Pacific",1,true,
		[
			"O_T_Soldier_A_F",
			"O_T_Soldier_AAR_F",
			"O_T_Support_AMG_F",
			"O_T_Support_AMort_F",
			"O_T_Soldier_AAA_F",
			"O_T_Soldier_AAT_F",
			"O_T_Soldier_AR_F",
			"O_T_Medic_F",
			"O_T_Crew_F",
			"O_T_Engineer_F",
			"O_T_Soldier_Exp_F",
			"O_T_Soldier_GL_F",
			"O_T_Support_GMG_F",
			"O_T_Support_MG_F",
			"O_T_Support_Mort_F",
			"O_T_Helicrew_F",
			"O_T_Helipilot_F",
			"O_T_Soldier_M_F",
			"O_T_Soldier_AA_F",
			"O_T_Soldier_AT_F",
			"O_T_Officer_F",
			"O_T_Soldier_PG_F",
			"O_T_Pilot_F",
			"O_T_Soldier_Repair_F",
			"O_T_Soldier_F",
			"O_T_Soldier_LAT_F",
			"O_T_Soldier_SL_F",
			"O_T_Soldier_TL_F",
			"O_T_Soldier_UAV_F"
		]
	],	
	[
		"CAMS_AI_CSAT_Pacific_SF",1,true,
		[
			"O_T_Diver_F",
			"O_T_Diver_Exp_F",
			"O_T_Diver_TL_F",
			"O_T_Recon_Exp_F",
			"O_T_Recon_JTAC_F",
			"O_T_Recon_M_F",
			"O_T_Recon_Medic_F",
			"O_T_Recon_F",
			"O_T_Recon_LAT_F",
			"O_T_Recon_TL_F",
			"O_T_Sniper_F",
			"O_T_ghillie_tna_F",
			"O_T_Spotter_F"
		]
	],	
	[
		"CAMS_AI_Viper_Pacific",1,true,
		[
			"O_V_Soldier_ghex_F",
			"O_V_Soldier_TL_ghex_F",
			"O_V_Soldier_Exp_ghex_F",
			"O_V_Soldier_Medic_ghex_F",
			"O_V_Soldier_M_ghex_F",
			"O_V_Soldier_LAT_ghex_F",
			"O_V_Soldier_JTAC_ghex_F"
		]
	],
	[
		"CAMS_AI_Viper",1,true,
		[
			"O_V_Soldier_hex_F",
			"O_V_Soldier_TL_hex_F",
			"O_V_Soldier_Exp_hex_F",
			"O_V_Soldier_Medic_hex_F",
			"O_V_Soldier_M_hex_F",
			"O_V_Soldier_LAT_hex_F",
			"O_V_Soldier_JTAC_hex_F"
		]
	],
	[
		"CAMS_AI_ALL_E",0,false,
		[
			"CAMS_AI_CSAT_Pacific",
			"CAMS_AI_CSAT_Pacific_SF",
			"CAMS_AI_Viper_Pacific",
			"CAMS_AI_Viper"
		]
	],			
	//////////////// WEST
	[
		"CAMS_AI_NATO_Pacific",1,true,
		[
			"B_T_Soldier_A_F","B_T_Soldier_AAR_F","B_T_Support_AMG_F","B_T_Support_AMort_F","B_T_Soldier_AAA_F","B_T_Soldier_AAT_F",
			"B_T_Soldier_AR_F","B_T_Medic_F","B_T_Crew_F","B_T_Engineer_F","B_T_Soldier_Exp_F","B_T_Soldier_GL_F","B_T_Support_GMG_F",
			"B_T_Support_MG_F","B_T_Support_Mort_F","B_T_Helicrew_F","B_T_Helipilot_F","B_T_soldier_M_F","B_T_Soldier_AA_F",
			"B_T_Soldier_AT_F","B_T_Officer_F","B_T_Soldier_PG_F","B_T_Pilot_F","B_T_Soldier_Repair_F","B_T_Soldier_F",
			"B_T_Soldier_LAT_F","B_T_Soldier_SL_F","B_T_Soldier_TL_F","B_T_Soldier_UAV_F"
		]
	],	
	[
		"CAMS_AI_NATO_Pacific_SF",1,true,
		[
			"B_T_Diver_F","B_T_Diver_Exp_F","B_T_Diver_TL_F","B_T_Recon_Exp_F","B_T_Recon_JTAC_F","B_T_Recon_M_F",
			"B_T_Recon_Medic_F","B_T_Recon_F","B_T_Recon_LAT_F","B_T_Recon_TL_F","B_T_Sniper_F","B_T_Spotter_F","B_T_ghillie_tna_F"
		]
	],	[
		"CAMS_AI_CTRG",1,true,
		[
			"B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_Exp_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_M_tna_F",
			"B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Miller_F"
		]
	],
	[
		"CAMS_AI_Gendarmerie",1,true,
		[
			"B_GEN_Soldier_F","B_GEN_Commander_F"
		]
	],
	[
		"CAMS_AI_ALL_W",0,false,
		[
			"CAMS_AI_NATO_Pacific","CAMS_AI_NATO_Pacific_SF","CAMS_AI_CTRG","CAMS_AI_Gendarmerie"
		]
	],
	
	//////////////// IND
	[
		"CAMS_AI_Syndikat",1,true,
		[
			"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
			"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Camo_F","I_C_Helipilot_F","I_C_Soldier_base_unarmed_F"
		]
	],
	[
		"CAMS_AI_Bandits",1,true,
		[
			"I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_5_F",
			"I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_8_F","I_C_Pilot_F"
		]
	],
	[
		"CAMS_AI_ALL_I",0,false,
		[
			"CAMS_AI_Syndikat","CAMS_AI_Bandits"
		]
	],
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Items ///////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////


	///////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////// Explosives ///////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////


	/////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////// Weapons ////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Weapon attachments
	[
		"CAMS_W_Bipod",1,true,
		[
			 "bipod_01_F_khk"		
		]
	],
	[
		"CAMS_W_Muzzle",1,true,
		[
			"muzzle_snds_58_blk_F",
			"muzzle_snds_58_wdm_F",
			"muzzle_snds_65_TI_blk_F",
			"muzzle_snds_65_TI_ghex_F",
			"muzzle_snds_65_TI_hex_F",
			"muzzle_snds_B_khk_F",
			"muzzle_snds_B_snd_F",
			"muzzle_snds_H_MG_blk_F",
			"muzzle_snds_H_MG_khk_F",
			"muzzle_snds_H_khk_F",
			"muzzle_snds_H_snd_F",
			"muzzle_snds_m_khk_F",
			"muzzle_snds_m_snd_F"		
		]
	],
	[
		"CAMS_W_OpticsLv1",1,true,
		[
			"optic_Arco_blk_F",
			"optic_Arco_ghex_F",
			"optic_DMS_ghex_F",
			"optic_ERCO_blk_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_snd_F",
			"optic_Hamr_khk_F",
			"optic_Holosight_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_smg_blk_F",
			"optic_LRPS_ghex_F",
			"optic_LRPS_tna_F",
			"optic_SOS_khk_F"
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
			"hgun_P07_khk_F",
			"hgun_Pistol_01_F"		
		]
	],
	[
		"CAMS_SMG_W",1,true,
		[
			"SMG_05_F"	
		]
	],
	[
		"CAMS_LMG_W",1,true,
		[
			"LMG_03_F"
		]
	],
	[
		"CAMS_AssaultRifles_W",1,true,
		[
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F",
			"arifle_CTARS_blk_F",
			"arifle_CTARS_ghex_F",
			"arifle_CTARS_hex_F",
			"arifle_CTAR_GL_blk_F",
			"arifle_CTAR_blk_F",
			"arifle_CTAR_ghex_F",
			"arifle_CTAR_hex_F",
			"arifle_MXC_khk_F",
			"arifle_MXM_khk_F",
			"arifle_MX_GL_khk_F",
			"arifle_MX_khk_F",
			"arifle_SPAR_01_GL_blk_F",
			"arifle_SPAR_01_GL_khk_F",
			"arifle_SPAR_01_GL_snd_F",
			"arifle_SPAR_01_blk_F",
			"arifle_SPAR_01_khk_F",
			"arifle_SPAR_01_snd_F",
			"arifle_SPAR_03_blk_F",
			"arifle_SPAR_03_khk_F",
			"arifle_SPAR_03_snd_F"
			/*
			"arifle_SPAR_02_blk_F",		//Exile dupe warning
			"arifle_SPAR_02_khk_F",		//Exile dupe warning
			"arifle_SPAR_02_snd_F",		//Exile dupe warning
			*/
			
		]
	],
	[
		"CAMS_SniperRifles_W",1,true,
		[
			"srifle_DMR_07_blk_F",
			"srifle_DMR_07_ghex_F",
			"srifle_DMR_07_hex_F",
			"srifle_GM6_ghex_F",
			"srifle_LRR_tna_F"		
		]
	],
	[
		"CAMS_AA_W",1,true,
		[
			"launch_B_Titan_tna_F","launch_B_Titan_short_tna_F"
		]
	],
	[
		"CAMS_AT_W",1,true,
		[
			"launch_RPG32_ghex_F","launch_RPG7_F"
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
/*
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
		"CAMS_Shotgun_E",1,true,
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
			"launch_O_Titan_ghex_F","launch_O_Titan__short_ghex_F"
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
		"CAMS_SMG_I",1,true,
		[
		]
	],
	[
		"CAMS_LMG_I",1,true,
		[
		]
	],
	[
		"CAMS_MMG_I",1,true,
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
*/


	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////

	// Water Vehicles - West
	[
		"CAMS_H20_Boats_W",1,false,
		[
			"B_T_Boat_Armed_01_minigun_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,false,
		[
			"B_T_Boat_Transport_01_F","B_T_Lifeboat"
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
		"CAMS_H20_Boats_E",1,false,
		[
			"O_T_Boat_Armed_01_hmg_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,false,
		[
			"O_T_Boat_Transport_01_F","O_T_Lifeboat","O_G_Boat_Transport_01_F","O_G_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_ALL_E",0,true,
		[
			"CAMS_H20_Boats_E", "CAMS_H20_RubberDucks_E", "CAMS_H20_SDV_E"
		]
	],	
	
	// Water Vehicles - Ind
	[
		"CAMS_H20_Boats_I",1,false,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,false,
		[
			"I_C_Boat_Transport_01_F","I_C_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_SDV_I",1,false,
		[
			"I_SDV_01_F"
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
	
	
	///////////////////////////////////////////////// Helicopters - West
	[
		"CAMS_Heli_Unarmed_W",1,false,
		[
			"B_T_VTOL_01_vehicle_F","B_T_VTOL_01_vehicle_blue_F","B_T_VTOL_01_vehicle_olive_F"
		]
	],
	[
		"CAMS_Heli_Armed_W",1,false,
		[
			"B_T_VTOL_01_armed_F","B_T_VTOL_01_armed_blue_F","B_T_VTOL_01_armed_olive_F"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,false,
		[
			"B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F",
			"B_T_VTOL_01_infantry_F", "B_T_VTOL_01_infantry_blue_F", "B_T_VTOL_01_infantry_olive_F"
		]
	],

	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_E",1,false,
		[
			"O_T_VTOL_02_vehicle_F","O_T_VTOL_02_vehicle_dynamicLoadout_F","O_T_VTOL_02_vehicle_F",
			"O_T_VTOL_02_vehicle_hex_F","O_T_VTOL_02_vehicle_ghex_F","O_T_VTOL_02_vehicle_grey_F"
		]
	],
	[
		"CAMS_Heli_Transport_E",1,false,
		[
			"O_T_VTOL_02_infantry_F","O_T_VTOL_02_infantry_dynamicLoadout_F","O_T_VTOL_02_infantry_hex_F","O_T_VTOL_02_infantry_ghex_F",
			"O_T_VTOL_02_infantry_grey_F", "O_T_VTOL_02_infantry_dynamicLoadout_F"
		]
	],
	
	/////////////////////////////////// Helicopters - Independant 
	[
		"CAMS_Heli_Unarmed_I",1,false,
		[
			"I_C_Heli_Light_01_civil_F"
		]
	],

	
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,false,
		[
			"B_Plane_CAS_01_F","B_Plane_CAS_01_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F" // Double check where I got this from
		]
	],
	[
		"CAMS_Plane_UAV_W",1,false,
		[
			"B_T_UAV_03_F","B_T_UAV_03_dynamicLoadout_F"
		]
	],
	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_UAV_E",1,false,
		[
			"O_T_UAV_04_CAS_F","O_UAV_01_F"
		]
	],
	
	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,false,
		[
			"I_C_Plane_Civil_01_F"
		]
	],
	[
		"CAMS_Plane_CAS_C",1,true,
		[
			"C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"
		]
	],	


	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Offroad_C",1,false,
		[
			"C_Offroad_02_unarmed_black_F","C_Offroad_02_unarmed_blue_F","C_Offroad_02_unarmed_F","C_Offroad_02_unarmed_green_F",
			"C_Offroad_02_unarmed_orange_F","C_Offroad_02_unarmed_red_F","C_Offroad_02_unarmed_white_F"
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
		"CAMS_Land_ArmedOffroad_W",1,false,
		[
			"B_T_LSV_01_armed_F","B_T_LSV_01_AT_F","B_T_LSV_01_armed_CTRG_F","B_LSV_01_armed_F","B_LSV_01_AT_F",
			"B_LSV_01_armed_black_F","B_LSV_01_armed_olive_F","B_LSV_01_armed_sand_F","B_T_LSV_01_armed_black_F",
			"B_T_LSV_01_armed_olive_F","B_T_LSV_01_armed_sand_F","B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F"
		
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,false,
		[
			"B_T_LSV_01_unarmed_F","B_T_LSV_01_unarmed_CTRG_F","B_LSV_01_unarmed_F","B_CTRG_LSV_01_light_F",
			"B_LSV_01_unarmed_black_F","B_LSV_01_unarmed_olive_F","B_LSV_01_unarmed_sand_F","B_T_LSV_01_unarmed_black_F",
			"B_T_LSV_01_unarmed_olive_F","B_T_LSV_01_unarmed_sand_F","B_T_MRAP_01_F","B_GEN_Offroad_01_gen_F"
		
		]
	],
	[
		"CAMS_Land_UGV_Armed_W",1,false,
		[
			"B_T_UGV_01_rcws_olive_F"		
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_W",1,false,
		[
			"B_T_UGV_01_olive_F"		
		]
	],
	[
		"CAMS_Land_Quad_W",1,false,
		[
			"B_T_Quadbike_01_F"
		]
	],
	[
		"CAMS_Land_Transport_W",1,false,
		[
			"B_T_Truck_01_transport_F","B_T_Truck_01_covered_F"			
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,false,
		[
			"B_T_Truck_01_mover_F","B_T_Truck_01_box_F",
			"B_T_Truck_01_Repair_F","B_T_Truck_01_ammo_F","B_T_Truck_01_fuel_F","B_T_Truck_01_medical_F" 		
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,false,
		[
			"B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_CRV_F","B_T_APC_Tracked_01_rcws_F","B_T_APC_Tracked_01_AA_F"

		]
	],
	[
		"CAMS_Land_Tank_W",1,false,
		[
			"B_T_MBT_01_cannon_F","B_T_MBT_01_TUSK_F"		
		]
	],
	[
		"CAMS_Land_Artillery_W",1,false,
		[
			"B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"		
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
		"CAMS_Land_ArmedOffroad_E",1,false,
		[
			"O_G_Offroad_01_armed_F",

			"O_T_LSV_02_armed_F","O_T_LSV_02_armed_viper_F","O_T_LSV_02_AT_F","O_LSV_02_armed_F","O_LSV_02_armed_viper_F","O_LSV_02_AT_F",
			"O_T_LSV_02_armed_black_F","O_T_LSV_02_armed_ghex_F","O_T_LSV_02_armed_arid_F","O_LSV_02_armed_black_F","O_LSV_02_armed_ghex_F",
			"O_LSV_02_armed_arid_F","O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F"		
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,false,
		[
			"O_G_Offroad_01_F",
			
			"O_T_LSV_02_unarmed_F","O_T_LSV_02_unarmed_viper_F","O_LSV_02_unarmed_F","O_LSV_02_unarmed_viper_F","O_T_LSV_02_unarmed_black_F",
			"O_T_LSV_02_unarmed_ghex_F","O_T_LSV_02_unarmed_arid_F","O_LSV_02_unarmed_black_F","O_LSV_02_unarmed_ghex_F","O_LSV_02_unarmed_arid_F"
		
		]
	],
	[
		"CAMS_Land_UGV_Armed_E",1,false,
		[
			"O_T_UGV_01_rcws_ghex_F"		
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_E",1,false,
		[
			"O_T_UGV_01_ghex_F"		
		]
	],
	[
		"CAMS_Land_Quad_E",1,false,
		[
			"O_G_Quadbike_01_F","O_T_Quadbike_01_ghex_F"		
		]
	],

	[
		"CAMS_Land_Transport_E",1,false,
		[
			"O_G_Van_01_transport_F",
			
			"O_T_MRAP_02_ghex_F","O_T_Truck_02_F","O_T_Truck_02_transport_F","O_T_Truck_03_covered_ghex_F",
			"O_T_Truck_03_transport_ghex_F","O_G_Van_02_transport_F","O_G_Van_02_vehicle_F"		
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,false,
		[
			"O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F","O_T_APC_Tracked_02_AA_ghex_F"
	
		]
	],
	[
		"CAMS_Land_Tank_E",1,false,
		[
			"O_T_MBT_02_cannon_ghex_F"		
		]
	],
	[
		"CAMS_Land_AA_E",1,false,
		[
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,false,
		[
			"O_T_MBT_02_arty_ghex_F"
		
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
		"CAMS_Land_UnarmedOffroad_I",1,false,
		[
			"I_C_Offroad_02_unarmed_F","I_C_Offroad_02_unarmed_brown_F","I_C_Offroad_02_unarmed_olive_F"		
		]
	],
	[
		"CAMS_Land_Transport_I",1,false,
		[
			"I_C_Van_01_transport_F","I_C_Van_01_transport_brown_F","I_C_Van_01_transport_olive_F"		
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,false,
		[
			"O_G_Van_01_fuel_F","O_Truck_03_repair_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F",
			"O_T_Truck_03_repair_ghex_F","O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_medical_ghex_F",
			"O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F",
			
			"O_T_Truck_02_Ammo_F","O_T_Truck_02_Box_F","O_T_Truck_02_fuel_F","O_T_Truck_02_Medical_F"		
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
		"CAMS_Land_StaticGuns_W",1,false,
		[
			"B_T_HMG_01_F"		
		]
	],
	[
		"CAMS_Land_StaticGL_W",1,false,
		[
			"B_T_GMG_01_F        "		
		]
	],
	[
		"CAMS_Land_StaticAA_W",1,false,
		[
			"B_T_Static_AA_F"		
		]
	],
	[
		"CAMS_Land_StaticAT_W",1,false,
		[
			"B_T_Static_AT_F"		
		]
	],
	[
		"CAMS_Land_Mortar_W",1,false,
		[
			"B_T_Mortar_01_F"		
		]
	],

	//////////////////////////////////////////// Static Guns - East
	[
		"CAMS_Land_Mortar_E",1,false,
		[
			"O_G_Mortar_01_F"				
		]
	]

	//////////////////////////////////////////// Static Guns - Ind
];




/////////////////////////////
// Cart processing //////////
/////////////////////////////
////////////////////////  NEW for today

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};
//["CAMS System",format ["Cart:%1 assets loaded",_cartName]] spawn Haz_fnc_createNotification;