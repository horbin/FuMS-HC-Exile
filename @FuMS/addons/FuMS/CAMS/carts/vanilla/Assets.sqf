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
	///////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// Uniforms
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
			"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest",
			"U_B_CombatUniform_mcam_worn","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_SpecopsUniform_sgg"
		]	
	],
	[
		"CAMS_U_Guerilla_W",1,true,
		[
			"U_BG_Guerilla2_1","U_BG_Guerrilla_6_1","U_BG_Guerilla1_1","U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_leader"
		]
	],	
	[
		"CAMS_U_Ghillie_W",1,true,
		[
			"U_B_FullGhillie_ard","U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_GhillieSuit"
		]
	],
	[
		"CAMS_U_Aviation_W",1,true,
		[
			"U_B_HeliPilotCoveralls","U_B_PilotCoveralls"
		]
	],
	[
		"CAMS_U_Wetsuit_W",1,true,
		[
			"U_B_Wetsuit","U_B_survival_uniform"
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
			"U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo","U_O_OfficerUniform_ocamo",
			"U_O_SpecopsUniform_blk","U_O_SpecopsUniform_ocamo"
		]	
	],
	[
		"CAMS_U_Guerilla_E",1,true,
		[
			"U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3",
			"U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_OG_leader","U_OG_Guerrilla_6_1"
		]
	],
	[
		"CAMS_U_Ghillie_E",1,true,
		[
			"U_O_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_GhillieSuit"
		]
	],
	[
		"CAMS_U_Aviation_E",1,true,
		[
			"U_O_PilotCoveralls"
		]
	],
	[
		"CAMS_U_Wetsuit_E",1,true,
		[
			"U_O_Wetsuit"
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
			"U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt","U_I_OfficerUniform","U_I_G_Story_Protagonist_F"
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,true,
		[
			"U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3",
			"U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_IG_leader","U_I_G_resistanceLeader_F","U_IG_Guerrilla_6_1"
		]
	],
	[
		"CAMS_U_Ghillie_I",1,true,
		[
			"U_I_FullGhillie_ard","U_I_FullGhillie_lsh","U_I_FullGhillie_sard","U_I_GhillieSuit"
		]
	],
	[
		"CAMS_U_Aviation_I",1,true,
		[
			"U_I_HeliPilotCoveralls","U_I_pilotCoveralls"
		]
	],
	[
		"CAMS_U_Wetsuit_I",1,true,
		[
			"U_I_Wetsuit"
		]
	],
	[	
		"CAMS_U_All_I",0,true,
		[
			"CAMS_U_Soldier_I", "CAMS_U_Guerilla_I", "CAMS_U_Ghillie_I", "CAMS_U_Wetsuit_I", "CAMS_U_Aviation_I"
		]
	],
		
	/////////////////////////////////////////////////////// Vest / Chest items
	////////////////////////////////////////////////////// Mayb have to be broken down by EAST, WEST, IND in future or expansion packs
	[
		"CAMS_V_Bandolliers",1,true,
		[
			"V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr"
		]
	],
	[
		"CAMS_V_Chestrig",1,true,
		[
			"V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"
		]
	],
	[
		"CAMS_V_Vests",1,true,
		[
			"V_Press_F","V_Rangemaster_belt","V_TacVest_blk","V_TacVest_blk_POLICE","V_TacVest_brn",
			"V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_TacVestCamo_khk","V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F"
		]
	],
	[
		"CAMS_V_Harness",1,true,
		[
			"V_HarnessO_brn","V_HarnessO_gry","V_HarnessOGL_brn","V_HarnessOGL_gry",
			"V_HarnessOSpec_brn","V_HarnessOSpec_gry"
		]
	],
	[
		"CAMS_V_Plate",1,true,
		[
			"V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr",
			"V_PlateCarrier3_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_rgr","V_PlateCarrierH_CTRG","V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli",
			"V_PlateCarrierL_CTRG","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp",
			"V_PlateCarrierSpec_rgr"
		]
	],
	[
		"CAMS_V_Rebreather",1,true,
		[
			"V_RebreatherB","V_RebreatherIA","V_RebreatherIR"
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
			"H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn",
			"H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red",
			"H_Cap_tan","H_Cap_tan_specops_US"
		]
	],
	[
		"CAMS_H_MilitaryCaps",1,true,
		[
			"H_MilCap_blue","H_MilCap_dgtl","H_MilCap_mcamo","H_MilCap_ocamo","H_MilCap_oucamo","H_MilCap_rucamo"
		]
	],
	[
		"CAMS_H_Beanies",1,true,
		[
			"H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_sgg"
		]
	],
	[
		"CAMS_H_Bandannas",1,true,
		[
			"H_Bandanna_camo","H_Bandanna_cbr","H_Bandanna_gry","H_Bandanna_khk",
			"H_Bandanna_khk_hs","H_Bandanna_mcamo","H_Bandanna_sgg","H_Bandanna_surfer"
		]
	],
	[
		"CAMS_H_Boonie",1,true,
		[
			"H_Booniehat_dgtl","H_Booniehat_dirty","H_Booniehat_grn","H_Booniehat_indp",
			"H_Booniehat_khk","H_Booniehat_khk_hs","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_oli"
		]
	],
	[
		"CAMS_H_Hats",1,true,
		[
			"H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_StrawHat",
			"H_StrawHat_dark"
		]
	],
	[
		"CAMS_H_Berets",1,true,
		[
			"H_Beret_02","H_Beret_blk","H_Beret_blk_POLICE","H_Beret_brn_SF","H_Beret_Colonel",
			"H_Beret_grn","H_Beret_grn_SF","H_Beret_ocamo","H_Beret_red"
		]
	],
	[
		"CAMS_H_Shemags",1,true,
		[
			"H_Shemag_khk","H_Shemag_olive","H_Shemag_olive_hs","H_Shemag_tan","H_ShemagOpen_khk",
			"H_ShemagOpen_tan","H_TurbanO_blk"
		]
	],
	[
		"CAMS_H_LightHelmet",1,true,
		[
			"H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass",
			"H_HelmetB_light_sand","H_HelmetB_light_snakeskin"
		]
	],
	[
		"CAMS_H_RegHelmet",1,true,
		[
			"H_HelmetIA","H_HelmetIA_camo","H_HelmetIA_net","H_HelmetB","H_HelmetB_black","H_HelmetB_camo",
			"H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_paint","H_HelmetB_plain_blk","H_HelmetB_sand",
			"H_HelmetB_snakeskin"
		]
	],
	[
		"CAMS_H_SuperHelmet",1,true,
		[
			"H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetSpecO_blk","H_HelmetSpecO_ocamo",
			"H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo"
		]
	],
	[
		"CAMS_H_SpecOps",1,true,
		[
			"H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_snakeskin"
		]
	],
	[
		"CAMS_H_Aviation",1,true,
		[
			"H_CrewHelmetHeli_B", "H_CrewHelmetHeli_I", "H_CrewHelmetHeli_O", "H_HelmetCrew_I", "H_HelmetCrew_B",
			"H_HelmetCrew_O", "H_PilotHelmetHeli_B", "H_PilotHelmetHeli_I", "H_PilotHelmetHeli_O",
			"H_PilotHelmetFighter_B", "H_PilotHelmetFighter_I", "H_PilotHelmetFighter_O"
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
			"G_Spectacles","G_Spectacles_Tinted","G_Squares","G_Squares_Tinted"
		]
	],	
	[
		"CAMS_G_Tactical",1,true,
		[
			"G_Aviator","G_B_Diving","G_Combat","G_Combat_Goggles_tna_F",
			"G_Diving","G_Goggles_VR","G_I_Diving","G_Lowprofile","G_O_Diving",
			"G_Tactical_Black","G_Tactical_Clear"
		]
	],
	[
		"CAMS_G_Sport",1,true,
		[
			"G_Sport_BlackWhite","G_Sport_Blackred","G_Sport_Blackyellow",
			"G_Sport_Checkered","G_Sport_Greenblack","G_Sport_Red"
		]
	],
	[
		"CAMS_G_Shades",1,true,
		[
			"G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red"
		]
	],
	[
		"CAMS_G_Lady",1,true,
		[
			"G_Lady_Blue","G_Lady_Dark","G_Lady_Mirror","G_Lady_Red"
		]
	],	
	[
		"CAMS_G_Bandana",1,true,
		[
			"G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli",
			"G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"
		]
	],
	[
		"CAMS_G_Balaclava",1,true,
		[
			"G_Balaclava_TI_G_blk_F","G_Balaclava_TI_G_tna_F","G_Balaclava_TI_blk_F","G_Balaclava_TI_tna_F",
			"G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli"
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
	///////////// CAMS AI Models 
	/////////////////////////////////////////////////////
	
	/////////////// EAST
	[
		"CAMS_AI_FIA_E",1,true,
		[
			"O_G_Soldier_F",
			"O_G_Soldier_lite_F",
			"O_G_Soldier_SL_F",
			"O_G_Soldier_TL_F",
			"O_G_Soldier_AR_F",
			"O_G_medic_F",
			"O_G_engineer_F",
			"O_G_Soldier_exp_F",
			"O_G_Soldier_GL_F",
			"O_G_Soldier_M_F",
			"O_G_Soldier_LAT_F",
			"O_G_Soldier_A_F",
			"O_G_officer_F",
			"O_G_Soldier_unarmed_F",
			"O_G_Survivor_F"
		]
	],
	[
		"CAMS_AI_CSAT_SOLDIER",1,true,
		[
			"O_Soldier_F",
			"O_officer_F",
			"O_Soldier_lite_F",
			"O_Soldier_GL_F",
			"O_Soldier_AR_F",
			"O_Soldier_SL_F",
			"O_Soldier_TL_F",
			"O_soldier_M_F",
			"O_Soldier_LAT_F",
			"O_medic_F",
			"O_soldier_repair_F",
			"O_soldier_exp_F",
			"O_helipilot_F",
			"O_Soldier_A_F",
			"O_Soldier_AT_F",
			"O_Soldier_AA_F",
			"O_engineer_F",
			"O_crew_F",
			"O_Pilot_F",
			"O_helicrew_F",
			"O_soldier_PG_F",
			"O_soldier_UAV_F",
			"O_Survivor_F",
			"O_Soldier_unarmed_F",
			"O_Soldier_AAR_F",
			"O_Soldier_AAT_F",
			"O_Soldier_AAA_F",
			"O_support_MG_F",
			"O_support_GMG_F",
			"O_support_Mort_F",
			"O_support_AMG_F",
			"O_support_AMort_F"
		]
	],
	[
		"CAMS_AI_CSAT_URBAN",1,true,
		[
			"O_soldierU_F",
			"O_soldierU_AR_F",
			"O_soldierU_AAR_F",
			"O_soldierU_LAT_F",
			"O_soldierU_AT_F",
			"O_soldierU_AAT_F",
			"O_soldierU_AA_F",
			"O_soldierU_AAA_F",
			"O_soldierU_TL_F",
			"O_SoldierU_SL_F",
			"O_soldierU_medic_F",
			"O_soldierU_repair_F",
			"O_soldierU_exp_F",
			"O_engineer_U_F",
			"O_soldierU_M_F",
			"O_soldierU_A_F",
			"O_SoldierU_GL_F",
			"O_SoldierU_unarmed_F"		
		]
	],
	[
		"CAMS_AI_CSAT_SF",1,true,
		[
			"O_diver_F",
			"O_diver_TL_F",
			"O_diver_exp_F",
			"O_spotter_F",
			"O_sniper_F",
			"O_recon_F",
			"O_recon_M_F",
			"O_recon_LAT_F",
			"O_recon_medic_F",
			"O_recon_exp_F",
			"O_recon_JTAC_F",
			"O_recon_TL_F",
			"O_ghillie_lsh_F",
			"O_ghillie_sard_F",
			"O_ghillie_ard_F"
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
			"B_G_Soldier_F","B_G_Soldier_lite_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F","B_G_Soldier_AR_F",
			"B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_M_F",
			"B_G_Soldier_LAT_F","B_G_Soldier_A_F","B_G_officer_F","B_G_Soldier_unarmed_F","B_G_Survivor_F"
		]
	],
	[
		"CAMS_AI_NATO_SOLDIER",1,true,
		[
			"B_Soldier_F","B_RangeMaster_F","B_Soldier_lite_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_SL_F",
			"B_Soldier_TL_F","B_soldier_M_F","B_soldier_LAT_F","B_medic_F","B_soldier_repair_F","B_soldier_exp_F",
			"B_Helipilot_F","B_Soldier_A_F","B_soldier_AT_F","B_soldier_AA_F","B_engineer_F","B_crew_F",
			"B_officer_F","B_Competitor_F","B_Pilot_F","B_helicrew_F","B_soldier_PG_F","B_soldier_UAV_F",
			"B_Survivor_F","B_Soldier_unarmed_F","B_soldier_AAR_F","B_soldier_AAT_F","B_soldier_AAA_F","B_support_MG_F",
			"B_support_GMG_F","B_support_Mort_F","B_support_AMG_F","B_support_AMort_F"
			]
	],
	[
		"CAMS_AI_NATO_SF",1,true,
		[
			"B_diver_F","B_diver_TL_F","B_diver_exp_F","B_recon_F","B_recon_LAT_F","B_recon_exp_F",
			"B_recon_medic_F","B_recon_TL_F","B_recon_M_F","B_recon_JTAC_F","B_spotter_F","B_sniper_F"
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
			"I_G_Soldier_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F","I_G_Soldier_AR_F",
			"I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F",
			"I_G_Soldier_LAT_F","I_G_Soldier_A_F","I_G_officer_F","I_G_Soldier_unarmed_F","I_G_Survivor_F"
		]
	],
	[
		"CAMS_AI_AAF",1,true,
		[
			"I_soldier_F","I_Soldier_lite_F","I_Soldier_A_F","I_Soldier_GL_F","I_Soldier_AR_F","I_Soldier_SL_F",
			"I_Soldier_TL_F","I_Soldier_M_F","I_Soldier_LAT_F","I_Soldier_AT_F","I_Soldier_AA_F","I_medic_F",
			"I_Soldier_repair_F","I_Soldier_exp_F","I_engineer_F","I_crew_F","I_helipilot_F","I_pilot_F",
			"I_helicrew_F","I_officer_F","I_Story_Colonel_F","I_soldier_UAV_F","I_Survivor_F","I_Soldier_unarmed_F",
			"I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AAA_F","I_support_MG_F","I_support_GMG_F","I_support_Mort_F",
			"I_support_AMG_F","I_support_AMort_F"
		]
	],
	[
		"CAMS_AI_AAF_SF",1,true,
		[
			"I_diver_F","I_diver_exp_F","I_diver_TL_F","I_Spotter_F","I_Sniper_F"
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
			"ItemWatch","ItemGPS","ItemMap","ItemCompass","ItemRadio","Binocular",
			"Rangefinder","Laserdesignator","Laserdesignator_02","Laserdesignator_03","NVGoggles",
			"NVGoggles_INDEP","NVGoggles_OPFOR"
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
		"CAMS_Packs_Lv1",1,true,
		[
			"B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_dgtl","B_AssaultPack_khk",
			"B_AssaultPack_mcamo","B_AssaultPack_rgr","B_AssaultPack_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu",
			"B_OutdoorPack_tan"
		]
	],
	[
		"CAMS_Packs_Lv2",1,true,
		[
			"B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_ocamo","B_FieldPack_oucamo",
			"B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo",
			"B_TacticalPack_oli","B_Bergen_blk","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_sgg"
		]
	],
	[
		"CAMS_Packs_Lv3",1,true,
		[
			"B_Kitbag_cbr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Carryall_cbr","B_Carryall_khk",
			"B_Carryall_mcamo","B_Carryall_ocamo","B_Carryall_oli","B_Carryall_oucamo","B_HuntingBackpack"
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
			"Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"
		]
	],
	[
		"CAMS_Flares_Normal",1,true,
		[
			"FlareGreen_F","FlareRed_F","FlareWhite_F","FlareYellow_F"
		]
	],
	[
		"CAMS_Flares_1Rnd",1,true,
		[
			"UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareWhite_F","UGL_FlareYellow_F"
		]
	],
	[
		"CAMS_Flares_3Rnd",1,true,
		[
			"3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareYellow_F"
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
			"SmokeShell","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange",
			"SmokeShellPurple","SmokeShellRed","SmokeShellYellow"
		]
	],
	[
		"CAMS_Smoke_1Rnd",1,true,
		[
			"1Rnd_Smoke_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell",
			"1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeRed_Grenade_shell",
			"1Rnd_SmokeYellow_Grenade_shell"
		]
	],
	[
		"CAMS_Smoke_3Rnd",1,true,
		[
			"3Rnd_Smoke_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell",
			"3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","3Rnd_SmokePurple_Grenade_shell",
			"3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell"
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
			"HandGrenade","MiniGrenade"
		]
	],
	[
		"CAMS_E_GrenadeIR_W",1,true,
		[
			"B_IR_Grenade"
		]
	],
	[
		"CAMS_E_GrenadeIR_E",1,true,
		[
			"O_IR_Grenade"
		]
	],
	[
		"CAMS_E_GrenadeIR_I",1,true,
		[
			"I_IR_Grenade"
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
			"1Rnd_HE_Grenade_shell"
		]
	],
	[
		"CAMS_E_3Rnd",1,true,
		[
			"3Rnd_HE_Grenade_shell"
		]
	],
	// Mines
	[
		"CAMS_E_Mine",1,true,
		[
			"APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","APERSTripMine_Wire_Mag",
			"ClaymoreDirectionalMine_Remote_Mag","SLAMDirectionalMine_Wire_Mag"
		]
	],// IEDs
	[
		"CAMS_E_IED",1,true,
		[
			"DemoCharge_Remote_Mag","IEDLandBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanBig_Remote_Mag",
			"IEDUrbanSmall_Remote_Mag","SatchelCharge_Remote_Mag"
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
			"acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol","acc_pointer_IR"
		]
	],
	[
		"CAMS_W_Bipod",1,true,
		[
			"bipod_01_F_blk","bipod_01_F_mtp","bipod_01_F_snd","bipod_01_F_khk","bipod_02_F_blk","bipod_02_F_hex",
			"bipod_02_F_tan","bipod_03_F_blk","bipod_03_F_oli"
		]
	],
	[
		"CAMS_W_Muzzle",1,true,
		[
			"muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand",
			"muzzle_snds_570",
			"muzzle_snds_58_blk_F","muzzle_snds_58_wdm_F","muzzle_snds_58_ghex_F","muzzle_snds_58_hex_F",
			"muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F",
			"muzzle_snds_93mmg","muzzle_snds_93mmg_tan",
			"muzzle_snds_acp",
			"muzzle_snds_B","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_B_lush_F","muzzle_snds_B_arid_F",
			"muzzle_snds_H","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F",
			"muzzle_snds_L",
			"muzzle_snds_M","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F"
		]
	],
	[
		"CAMS_W_OpticsLv1",1,true,
		[
			"optic_Aco","optic_ACO_grn","optic_ACO_grn_smg","optic_Aco_smg",
			"optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F",
			"optic_Holosight","optic_Holosight_smg","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","optic_Holosight_smg_khk_F",
			"optic_Yorris","optic_MRD","optic_MRCO"
		]
	],
	[
		"CAMS_W_OpticsLv2",1,true,
		[
			"optic_LRPS","optic_LRPS_tna_F","optic_LRPS_ghex_F",
			"optic_NVS",
			"optic_SOS","optic_SOS_khk_F"
		]
	],
	[
		"CAMS_W_OpticsLv3",1,true,
		[
			"optic_AMS","optic_AMS_khk","optic_AMS_snd",
			"optic_DMS","optic_DMS_ghex_F",
			"optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F",
			"optic_Hamr","optic_Hamr_khk_F",
			"optic_KHS_blk",
			"optic_KHS_hex","optic_KHS_old","optic_KHS_tan","optic_Nightstalker","optic_tws","optic_tws_mg"
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
			"hgun_ACPC2_F", //ALL
			"hgun_P07_F","hgun_P07_khk_F", //W
			"hgun_Pistol_heavy_01_F", //W
			"hgun_Pistol_heavy_02_F", //ALL
			"hgun_Pistol_Signal_F"
		]
	],
	[
		"CAMS_SMG_W",1,true,
		[
			"SMG_01_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03_TR_khaki","SMG_03_TR_hex","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03C_TR_khaki",
			"SMG_03C_TR_hex","SMG_03_black","SMG_03_camo","SMG_03_khaki","SMG_03_hex","SMG_03C_black","SMG_03C_camo","SMG_03C_khaki","SMG_03C_hex",
			"SMG_05_F"
		]
	],
	[
		"CAMS_LMG_W",1,true,
		[
			"arifle_MX_SW_Black_F","arifle_MX_SW_F","arifle_MX_SW_khk_F",
			"arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F",
			"LMG_Mk200_F","LMG_Mk200_BI_F" 
		]
	],
	[
		"CAMS_MMG_W",1,true,
		[
			"MMG_01_hex_F","MMG_01_tan_F"
		]
	],
	[
		"CAMS_AssaultRifles_W",1,true,
		[
			"arifle_Mk20_F", "arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F", "arifle_Mk20_plain_F", //ALL
			//"arifle_Mk20C_F", "arifle_Mk20C_plain_F",//I
			"arifle_MX_Black_F", "arifle_MX_F", "arifle_MX_GL_Black_F", "arifle_MX_GL_F", //W
			"arifle_MXC_Black_F","arifle_MXC_F", //W
			//"arifle_SDAR_F", //UNDERWATER GUN
			"arifle_TRG20_F", //ALL
			"arifle_TRG21_F", "arifle_TRG21_GL_F"//all
		]
	],
	[
		"CAMS_SniperRifles_W",1,true,
		[
			"srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F", //W
			"srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F", //W
			"srifle_DMR_06_camo_F","srifle_DMR_06_olive_F", //ALL
			"srifle_EBR_F", //W
			
			"srifle_LRR_camo_F","srifle_LRR_F","srifle_LRR_tna_F", //W
			"arifle_MXM_Black_F", "arifle_MXM_F",//W
			"arifle_SPAR_03_blk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F" //W
		]
	],
	[
		"CAMS_AA_W",1,true,
		[
			"launch_B_Titan_F","launch_B_Titan_short_F","launch_B_Titan_olive_F","launch_B_Titan_tna_F","launch_B_Titan_short_tna_F"
		]
	],
	[
		"CAMS_AT_W",1,true,
		[
			"launch_NLAW_F",
			"launch_RPG32_F","launch_RPG32_camo_F",
			"launch_MRAWS_olive_F","launch_MRAWS_olive_rail_F","launch_MRAWS_green_F","launch_MRAWS_green_rail_F","launch_MRAWS_sand_F","launch_MRAWS_sand_rail_F"
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
			"hgun_ACPC2_F", //ALL
			"hgun_Pistol_heavy_02_F", //ALL
			"hgun_Rook40_F", //E
			"hgun_Pistol_Signal_F"
		]
	],
	[
		"CAMS_SMG_E",1,true,
		[
			"SMG_01_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03_TR_khaki","SMG_03_TR_hex","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03C_TR_khaki",
			"SMG_03C_TR_hex","SMG_03_black","SMG_03_camo","SMG_03_khaki","SMG_03_hex","SMG_03C_black","SMG_03C_camo","SMG_03C_khaki","SMG_03C_hex",
			"SMG_05_F"
		]
	],
	[
		"CAMS_LMG_E",1,true,
		[
			"arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F",
			"LMG_Zafir_F",
			"LMG_Mk200_F","LMG_Mk200_BI_F" //Not sure if these stay
		]
	],
	[
		"CAMS_MMG_E",1,true,
		[
			"MMG_02_black_F","MMG_02_camo_F","MMG_02_sand_F"
		]
	],
	[
		"CAMS_AssaultRifles_E",1,true,
		[
			"arifle_Katiba_C_F", "arifle_Katiba_F", "arifle_Katiba_GL_F", //E
			"arifle_Mk20_F", "arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F", "arifle_Mk20_plain_F", //ALL
			//"arifle_Mk20C_F", "arifle_Mk20C_plain_F",//I
			"arifle_SDAR_F", //uNDERWATER GUN
			"arifle_TRG20_F", //ALL
			"arifle_TRG21_F", "arifle_TRG21_GL_F"//all
		]
	],
	[
		"CAMS_SniperRifles_E",1,true,
		[
			"srifle_DMR_01_F", //E
			"srifle_DMR_04_F","srifle_DMR_04_Tan_F", //E
			"srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f",//E
			"srifle_DMR_06_camo_F","srifle_DMR_06_olive_F", //ALL
			"srifle_DMR_07_blk_F","srifle_DMR_07_hex_F","srifle_DMR_07_ghex_F",//E
			"srifle_GM6_camo_F","srifle_GM6_ghex_F"//E
		]
	],
	[
		"CAMS_AA_E",1,true,
		[
			"launch_O_Titan_F","launch_O_Titan_short_F","launch_O_Titan_ghex_F","launch_O_Titan_short_ghex_F"
		]
	],
	[
		"CAMS_AT_E",1,true,
		[
			"launch_RPG32_F","launch_RPG32_ghex_F","launch_RPG32_green_F","launch_RPG32_camo_F",
			"launch_MRAWS_olive_F","launch_MRAWS_olive_rail_F","launch_MRAWS_green_rail_F","launch_MRAWS_sand_rail_F",
			"launch_O_Vorona_brown_F","launch_O_Vorona_green_F"
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
			"hgun_ACPC2_F", //ALL
			"hgun_Pistol_01_F", //I
			"hgun_Pistol_heavy_01_green_F", //I
			"hgun_Pistol_heavy_02_F", //ALL
			"hgun_PDW2000_F", //I
			"hgun_Pistol_Signal_F"
		]
	],
	[
		"CAMS_SMG_I",1,true,
		[
			"SMG_01_F","SMG_03_TR_black","SMG_03_TR_camo","SMG_03_TR_khaki","SMG_03_TR_hex","SMG_03C_TR_black","SMG_03C_TR_camo","SMG_03C_TR_khaki",
			"SMG_03C_TR_hex","SMG_03_black","SMG_03_camo","SMG_03_khaki","SMG_03_hex","SMG_03C_black","SMG_03C_camo","SMG_03C_khaki","SMG_03C_hex",
			"SMG_05_F"
		]
	],
	[
		"CAMS_LMG_I",1,true,
		[
			"LMG_03_F",
			"LMG_Mk200_F","LMG_Mk200_BI_F" //Not sure if these stay
		]
	],
	[
		"CAMS_MMG_I",1,true,
		[
			"MMG_01_hex_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F","MMG_02_sand_F"
		]
	],
	[
		"CAMS_AssaultRifles_I",1,true,
		[
			"arifle_Mk20_F", "arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F", "arifle_Mk20_plain_F", //ALL
			"arifle_Mk20C_F", "arifle_Mk20C_plain_F",//I
			"arifle_SDAR_F", //uNDERWATER GUN
			"arifle_TRG20_F", //ALL
			"arifle_TRG21_F", "arifle_TRG21_GL_F"//all
		]
	],
	[
		"CAMS_SniperRifles_I",1,true,
		[
			"srifle_DMR_06_camo_F","srifle_DMR_06_olive_F", //ALL
			"srifle_DMR_06_hunter_F", //I
			"srifle_GM6_F"//I
		]
	],
	[
		"CAMS_AA_I",1,true,
		[
			"launch_I_Titan_F","launch_I_Titan_short_F","launch_I_Titan_eaf_F"
		]
	],
	[
		"CAMS_AT_I",1,true,
		[
			"launch_NLAW_F",
			"launch_RPG32_F","launch_RPG7_F","launch_RPG32_camo_F",
			"launch_MRAWS_olive_F","launch_MRAWS_olive_rail_F","launch_MRAWS_green_F","launch_MRAWS_green_rail_F","launch_MRAWS_sand_rail_F","launch_MRAWS_sand_F"
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
			"C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","C_Boat_Civil_01_police_F",
			"C_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_C",1,true,
		[
			"C_Rubberboat"
		]
	],
	[
		"CAMS_H20_Jetski_C",1,true,
		[
			"C_Scooter_Transport_01_F"
		]
	],
	[
		"CAMS_H20_All_C",0,true,
		[
			"CAMS_H20_Boats_C", "CAMS_H20_RubberDucks_C", "CAMS_H20_SDV_C", "CAMS_H20_Jetski_C"
		]
	],
	///////////////////////////////// Water Vehicles - West
	[
		"CAMS_H20_Boats_W",1,true,
		[
			"B_Boat_Armed_01_minigun_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,true,
		[
			"B_Boat_Transport_01_F","B_Lifeboat","B_G_Boat_Transport_01_F","B_G_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_SDV_W",1,true,
		[
			"B_SDV_01_F"
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
			"O_Boat_Armed_01_hmg_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,true,
		[
			"O_Boat_Transport_01_F","O_Lifeboat","O_G_Boat_Transport_01_F"
		]
	],
	[
		"CAMS_H20_SDV_E",1,true,
		[
			"O_SDV_01_F"
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
			"I_Boat_Armed_01_minigun_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,true,
		[
			"I_Boat_Transport_01_F","I_G_Boat_Transport_01_F","I_G_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_SDV_I",1,true,
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
		"CAMS_Heli_Unarmed_W",1,true,
		[
			"B_Heli_Light_01_F","B_Heli_Light_01_stripped_F"
		]
	],
	[
		"CAMS_Heli_Armed_W",1,true,
		[
			"B_Heli_Light_01_armed_F","B_Heli_Light_01_dynamicLoadout_F","B_Heli_Attack_01_F","B_Heli_Attack_01_dynamicLoadout_F"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,true,
		[
			"B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"
		]
	],

	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_E",1,true,
		[
			 "O_Heli_Light_02_unarmed_F", "O_Heli_Light_02_dynamicLoadout_F"
		]
	],
	[
		"CAMS_Heli_Armed_E",1,true,
		[
			"O_Heli_Light_02_F","O_Heli_Light_02_v2_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F", 
			"O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Attack_02_dynamicLoadout_black_F"
		]
	],
	/////////////////////////////////// Helicopters - Independant 
	[
		"CAMS_Heli_Unarmed_I",1,true,
		[
			"I_Heli_light_03_unarmed_F"
		]
	],
	[
		"CAMS_Heli_Armed_I",1,true,
		[
			"I_Heli_light_03_F","I_Heli_light_03_dynamicLoadout_F"
		]
	],	
	[
		"CAMS_Heli_Transport_I",1,true,
		[
			"I_Heli_Transport_02_F","I_E_Heli_light_03_dynamicLoadout_F","I_E_Heli_light_03_unarmed_F"
		]
	],
	
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,true,
		[
			"B_Plane_CAS_01_F","B_Plane_CAS_01_dynamicLoadout_F","B_Plane_CAS_01_Cluster_F"
		]
	],
	[
		"CAMS_Plane_UAV_W",1,true,
		[
			"B_UAV_01_F","B_UAV_02_F","B_UAV_02_CAS_F","B_UAV_02_dynamicLoadout_F"
		]
	],
	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,true,
		[
			"O_Plane_CAS_02_F", "O_Plane_CAS_02_dynamicLoadout_F", "O_UAV_02_CAS_F"
		]
	],
	[
		"CAMS_Plane_UAV_E",1,true,
		[
			"O_UAV_AI", "O_UAV_AI_F", 	//Not sure which works right
			"O_UAV_01_F", "O_UAV_02_F","O_UAV_02_dynamicLoadout_F"
		]
	],
	
	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,true,
		[
			"I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_CAS_F", "I_Plane_Fighter_03_dynamicLoadout_F", "I_UAV_02_CAS_F", 
			"I_UAV_02_dynamicLoadout_F","I_C_Plane_Civil_01_F","I_Plane_Fighter_03_Cluster_F"
		]
	],
	[
		"CAMS_Plane_UAV_I",1,true,
		[
			"I_UAV_01_F", "I_UAV_02_F", "I_UAV_AI", "I_UAV_AI_F"
		]
	],
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,true,
		[
			"C_Hatchback_01_F", "C_Hatchback_01_beigecustom_F", "C_Hatchback_01_black_F", "C_Hatchback_01_blue_F", "C_Hatchback_01_bluecustom_F", 
			"C_Hatchback_01_dark_F", "C_Hatchback_01_green_F", "C_Hatchback_01_grey_F", "C_Hatchback_01_sport_F", "C_Hatchback_01_sport_blue_F",
			"C_Hatchback_01_sport_green_F", "C_Hatchback_01_sport_grey_F", "C_Hatchback_01_sport_orange_F", "C_Hatchback_01_sport_red_F",
			"C_Hatchback_01_sport_white_F", "C_Hatchback_01_white_F", "C_Hatchback_01_yellow_F"
		]
	],
	[
		"CAMS_Land_Offroad_C",1,true,
		[
			"C_Offroad_01_F", "C_Offroad_01_blue_F", "C_Offroad_01_bluecustom_F", "C_Offroad_01_darkred_F", "C_Offroad_01_red_F", 
			"C_Offroad_01_sand_F", "C_Offroad_01_white_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_black_F",
			"C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_red_F",
			"C_Offroad_02_unarmed_white_F", "C_Offroad_default_F", "C_Offroad_luxe_F", "C_Offroad_stripped_F"
		]
	],
	[
		"CAMS_Land_Transport_C",1,true,
		[
			"C_Truck_02_covered_F", "C_Truck_02_transport_F"
		]
	],
	[
		"CAMS_Land_SUV_C",1,true,
		[
			"C_SUV_01_F","SUV_01_base_red_F","SUV_01_base_black_F","SUV_01_base_grey_F","SUV_01_base_orange_F"
		]
	],
	[
		"CAMS_Land_Van_C",1,true,
		[
			"C_Van_01_box_F", "C_Van_01_box_red_F", "C_Van_01_box_white_F", "C_Van_01_transport_F", "C_Van_01_transport_red_F", "C_Van_01_transport_white_F",
			"C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_Van_02_medevac_F", "C_Van_02_service_F"
		]
	],
	[
		"CAMS_Land_Utility_C",1,true,
		[
			"C_Offroad_01_repair_F", "C_Truck_02_fuel_F", "C_Van_01_fuel_F", "C_Van_01_fuel_red_F", "C_Van_01_fuel_red_v2_F", 
			"C_Truck_02_box_F", "C_Van_01_fuel_white_F", "C_Van_01_fuel_white_v2_F"
		]
	],
	[
		"CAMS_Land_Quad_C",1,true,
		[
			"C_Quadbike_01_F", "C_Quadbike_01_black_F", "C_Quadbike_01_blue_F", "C_Quadbike_01_red_F", "C_Quadbike_01_white_F"
		]
	],
	[
		"CAMS_Land_Kart_C",1,true,
		[
			"C_Kart_01_black_F","C_Kart_01_Blu_F","C_Kart_01_F","C_Kart_01_Fuel_F","C_Kart_01_green_F",
			"C_Kart_01_orange_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_white_F","C_Kart_01_yellow_F"
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
			"B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_AT_F"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,true,
		[
			"B_MRAP_01_F","B_G_Offroad_01_F",
			"B_GEN_Offroad_01_covered_F","B_Truck_01_flatbed_F","B_T_Truck_01_flatbed_F","B_Truck_01_cargo_F","B_T_Truck_01_cargo_F"
		]
	],
	[
		"CAMS_Land_UGV_Armed_W",1,true,
		[
			"B_UGV_01_rcws_F"
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_W",1,true,
		[
			"B_UGV_01_F"
		]
	],
	[
		"CAMS_Land_Quad_W",1,true,
		[
			"B_Quadbike_01_F","B_G_Quadbike_01_F"
		]
	],
	[
		"CAMS_Land_Transport_W",1,true,
		[
			"B_Truck_01_transport_F","B_G_Van_01_transport_F","B_Truck_01_covered_F",
			"B_GEN_Van_02_transport_F","B_G_Van_02_vehicle_F","B_GEN_Van_02_vehicle_F"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,true,
		[
			"B_G_Offroad_01_repair_F","B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F",
			"B_Truck_01_mover_F","B_Truck_01_box_F","B_G_Van_01_fuel_F",
			"B_GEN_Offroad_01_comms_F"
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,true,
		[
			"B_APC_Tracked_01_AA_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F",
			"B_APC_Wheeled_03_cannon_F"  //Where did this come from?
		]
	],
	[
		"CAMS_Land_Tank_W",1,true,
		[
			"B_MBT_01_TUSK_F","B_MBT_01_cannon_F"
		]
	],
	[
		"CAMS_Land_Artillery_W",1,true,
		[
			"B_MBT_01_arty_F","B_MBT_01_mlrs_F"
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
			"O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_G_Offroad_01_armed_F", "O_G_Offroad_01_AT_F"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,true,
		[
			"O_MRAP_02_F", "O_G_Offroad_01_F"
		]
	],
	[
		"CAMS_Land_UGV_Armed_E",1,true,
		[
			"O_UGV_01_rcws_F"
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_E",1,true,
		[
			"O_UGV_01_F"
		]
	],
	[
		"CAMS_Land_Quad_E",1,true,
		[
			"O_Quadbike_01_F"
		]
	],

	[
		"CAMS_Land_Transport_E",1,true,
		[
			"O_Truck_02_transport_F", "O_G_Van_01_transport_F", "O_T_Truck_03_transport_ghex_F","O_Truck_02_covered_F", 
			"O_T_Truck_03_covered_ghex_F","O_Truck_03_transport_F","O_Truck_03_covered_F"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,true,
		[
			"O_G_Offroad_01_repair_F", "O_Truck_02_Ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F"
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,true,
		[
			"O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_v2_F", "O_APC_Wheeled_02_rcws_F"
		]
	],
	[
		"CAMS_Land_Tank_E",1,true,
		[
			"O_MBT_02_cannon_F"
		]
	],
	[
		"CAMS_Land_AA_E",1,true,
		[
			"O_APC_Tracked_02_AA_F"
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,true,
		[
			"O_MBT_02_arty_F"
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
			"I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_AT_F"	
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,true,
		[
			"I_G_Offroad_01_F","I_MRAP_03_F"
		]
	],
	[
		"CAMS_Land_UGV_Armed_I",1,true,
		[
			"I_UGV_01_rcws_F"
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_I",1,true,
		[
			"I_UGV_01_F"
		]
	],
	[
		"CAMS_Land_Quad_E",1,true,
		[
			"I_G_Quadbike_01_F", "I_Quadbike_01_F"
		]
	],
	[
		"CAMS_Land_Transport_I",1,true,
		[
			 "I_Truck_02_transport_F", "I_G_Van_01_transport_F", "I_Truck_02_covered_F"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,true,
		[
			"I_G_Offroad_01_repair_F", "I_Truck_02_ammo_F", "I_Truck_02_box_F", "I_Truck_02_fuel_F", "I_Truck_02_medical_F", "I_G_Van_01_fuel_F"
		]
	],
	[
		"CAMS_Land_ArmedTransport_I",1,true,
		[
			"I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"
		]
	],
	[
		"CAMS_Land_Tank_I",1,true,
		[
			"I_MBT_03_cannon_F"
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

	//////////////////////////////////////////// Static Guns
	[
		"CAMS_Land_StaticGuns_W",1,true,
		[
			"B_HMG_01_A_F", "B_HMG_01_F", "B_HMG_01_high_F"
		]
	],
	[
		"CAMS_Land_StaticGL_W",1,true,
		[
			"B_GMG_01_A_F", "B_GMG_01_F", "B_GMG_01_high_F"
		]
	],
	[
		"CAMS_Land_StaticAA_W",1,true,
		[
			"B_static_AA_F"
		]
	],
	[
		"CAMS_Land_StaticAT_W",1,true,
		[
			"B_static_AT_F"
		]
	],
	[
		"CAMS_Land_Mortar_W",1,true,
		[
			"B_G_Mortar_01_F","B_Mortar_01_F"
		]
	],


	[
		"CAMS_Land_StaticGuns_E",1,true,
		[
			"O_HMG_01_F", "O_HMG_01_high_F", "O_HMG_01_A_F"
		]
	],
	[
		"CAMS_Land_StaticGL_E",1,true,
		[
			"O_GMG_01_F", "O_GMG_01_high_F", "O_GMG_01_A_F"
		]
	],
	[
		"CAMS_Land_StaticAA_E",1,true,
		[
			"O_static_AA_F"
		]
	],
	[
		"CAMS_Land_StaticAT_E",1,true,
		[
			"O_static_AT_F"
		]
	],
	[
		"CAMS_Land_Mortar_E",1,true,
		[
			"O_Mortar_01_F"
		]
	],

	[
		"CAMS_Land_StaticGuns_I",1,true,
		[
			"I_HMG_01_A_F", "I_HMG_01_F", "I_HMG_01_high_F"
		]
	],
	[
		"CAMS_Land_StaticGL_I",1,true,
		[
			"I_GMG_01_A_F", "I_GMG_01_F", "I_GMG_01_high_F"
		]
	],
			
	[
		"CAMS_Land_StaticAA_I",1,true,
		[
			"I_static_AA_F"
		]
	],
	[
		"CAMS_Land_StaticAT_I",1,true,
		[
			"I_static_AT_F"
		]
	],
	[
		"CAMS_Land_Mortar_I",1,true,
		[
			"I_Mortar_01_F", "I_G_Mortar_01_F"
		]
	],


	////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////// Misc Content ////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////
	// If it doesnt havea classname, I suggest you use the ImmersionFX files just for continuity  //
	// but it doesn't really matter where they are unless you are going to distribute the files   //
	////////////////////////////////////////////////////////////////////////////////////////////////
	[
		"CAMS_Wreck_Hist",1,true,
		[
			"Land_HistoricalPlaneWreck_01_F","Land_HistoricalPlaneWreck_02_front_F","Land_HistoricalPlaneWreck_03_F"
		]
	],
	[
		"CAMS_Wreck_Car",1,true,
		[
			"Land_Wreck_Car_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_CarDismantled_F","Land_Wreck_Skodovka_F"
		]
	],
	[
		"CAMS_Wreck_Truck",1,true,
		[
			"Land_Wreck_Offroad_F","Land_Wreck_Offroad2_F"
		]
	],
	[
		"CAMS_Wreck_Mil",1,true,
		[
			"Land_Wreck_BMP2_F","Land_Wreck_HMMWV_F","Land_Wreck_BRDM2_F","Land_Wreck_Ural_F","Land_Wreck_Hunter_F"
		]
	],
	[
		"CAMS_Wreck_Tank",1,true,
		[
			"Land_Wreck_Slammer_F","Land_Wreck_Slammer_hull_F","Land_Wreck_T72_hull_F"
		]
	],
	[
		"CAMS_Wreck_Heli",1,true,
		[
			"Land_Wreck_Heli_Attack_02_F","Land_UWreck_Heli_Attack_02_F","Land_Wreck_Heli_Attack_01_F"
		]
	],
	[
		"CAMS_Wreck_Plane",1,true,
		[
			"Land_UWreck_MV22_F","Plane_Fighter_03_wreck_F","Land_Wreck_Plane_Transport_01_F"
		]
	],
	[
		"CAMS_Wreck_Boat",1,true,
		[
			"Land_UWreck_FishingBoat_F","Land_Wreck_Traw_F","Land_Wreck_Traw2_F"
		]
	],
	[
		"CAMS_Wreck_Land",0,true,
		[
			"CAMS_Wreck_Car","CAMS_Wreck_Truck","CAMS_Wreck_Mil"
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