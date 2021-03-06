// Assets.sqf
// CUP Weapons Version
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
_cartName = "cupw"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	

	//////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Items ///////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// Navigation and Belt Items
	[
		"CAMS_I_Navigation",1,false,
		[
			// West Radio
			"ItemRadio"
		]
	],
	
	[
		"CAMS_I_Misc",1,false,
		[
		]
	],

	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,false,
		[
			"FirstAidKit","Medikit","ToolKit"
		]
	],	
	

	// Ammo
	// Setting this in the 'magazine' section of loot configuration (LootData.sqf) will ensure ammo for each weapon specified in the weapon section is also part
	//  of the loot definition.
	/*  MAY REMOVE SINCE THIS IS CORE FUNCTION
		"FuMS_AmmoForEach",1,false,
	[
		"FuMS_AmmoForEach"];
	*/
	// Flares
	[
		"CAMS_Flares_Chemical",1,false,
		[
		]
	],
	[
		"CAMS_Flares_Normal",1,false,
		[
		]
	],
	[
		"CAMS_Flares_1Rnd",1,false,
		[
		]
	],
	[
		"CAMS_Flares_3Rnd",1,false,
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
		"CAMS_Smoke_Shell",1,false,
		[
		]
	],
	[
		"CAMS_Smoke_W",1,false,
		[

		]
	],
	[
		"CAMS_Smoke_E",1,false,
		[
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
		"CAMS_Grenade_W",1,false,   ///////////////////////////////////////////////// FIX IN VANILLA
		[
		]
	],
	[
		"CAMS_Grenade_E",1,false,   ///////////////////////////////////////////////// FIX IN VANILLA
		[
		]
	],
	[
		"CAMS_Grenade_IR_W",1,false,
		[
		]
	],
	[
		"CAMS_Grenade_IR_E",1,false,
		[
		]
	],
	[
		"CAMS_Grenade_IR_I",1,false,
		[
		]
	],	
	[
		"CAMS_Grenade_ALLIR_ALL",0,true,
		[
			"CAMS_Grenade_IR_W","CAMS_Grenade_IR_E","CAMS_Grenade_IR_I"
		]
	],
	// Explosive Shells
	[
		"CAMS_Shells_1Rnd",1,false,
		[
		]
	],
	[
		"CAMS_Shells_3Rnd",1,false,
		[
		]
	],
	// Mines
	[
		"CAMS_Bombs_Mines",1,false,
		[
		]
	],// IEDs
	[
		"CAMS_Bombs_IED",1,false,
		[
		]
	],	
	[
		"CAMS_Grenade_ALL",0,true,
		[
			"CAMS_Grenade_ALL", "CAMS_Grenade_ALLIR_ALL", "CAMS_Shells_1Rnd", "CAMS_Shells_3Rnd", "CAMS_Bombs_Mines", "CAMS_Bombs_IED"
		]
	],


	/////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////// Weapons ////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Weapon attachments
	[
		"CAMS_W_Pointer",1,false,
		[
			"CUP_Mxx_camo",
			"CUP_Mxx_camo_half",
			"CUP_acc_ANPEQ_15",
			"CUP_acc_ANPEQ_15_Black",
			"CUP_acc_ANPEQ_15_OD",
			"CUP_acc_Flashlight",
			"CUP_acc_Flashlight_wdl",
			"CUP_acc_Flashlight_desert",
			"CUP_acc_ANPEQ_2_camo",
			"CUP_acc_ANPEQ_2_desert",
			"CUP_acc_ANPEQ_2_grey",
			"CUP_acc_XM8_light_module",
			"CUP_acc_LLM",
			"CUP_acc_LLM_Flashlight",
			"CUP_acc_Flashlight_MP5SD",
			"CUP_SVD_camo_g",
			"CUP_SVD_camo_d",
			"CUP_SVD_camo_g_half",
			"CUP_SVD_camo_d_half"
		]
	],
	[
		"CAMS_W_Bipod",1,false,
		[
			"CUP_bipod_G3",
			"CUP_bipod_G3SG1",
			"CUP_bipod_FNFAL"
		]
	],
	[
		"CAMS_W_Muzzle",1,false,
		[
			"CUP_muzzle_snds_MicroUzi",
			"CUP_muzzle_PB6P9",
			"CUP_muzzle_snds_M9",
			"CUP_muzzle_snds_SR3M",
			"CUP_muzzle_snds_KZRZP_AK545",
			"CUP_muzzle_mfsup_Flashhider_545x39_Black",
			"CUP_muzzle_mfsup_Flashhider_545x39_OD",
			"CUP_muzzle_mfsup_Flashhider_545x39_Tan",
			"CUP_muzzle_snds_AWM",
			"CUP_muzzle_snds_L85",
			"CUP_acc_sffh",
			"CUP_acc_bfa",
			"CUP_acc_LLM",
			"CUP_muzzle_snds_M110",
			"CUP_muzzle_snds_M110_black",
			"CUP_muzzle_snds_M110_woodland",
			"CUP_muzzle_snds_Mk12",
			"CUP_muzzle_snds_MP7",
			"CUP_muzzle_snds_SA61"
		]
	],
	[
		"CAMS_W_Optics_W",1,false,
		[
			"CUP_optic_no23mk2",
			"CUP_optic_MAAWS_Scope",
			"CUP_optic_SMAW_Scope",
			"CUP_optic_HoloBlack",
			"CUP_optic_HoloWdl",
			"CUP_optic_HoloDesert",
			"CUP_optic_Eotech533",
			"CUP_optic_Eotech533Grey",
			"CUP_optic_Eotech553_OD",
			"CUP_optic_Eotech553_Black",
			"CUP_optic_Eotech553_Coyote",
			"CUP_optic_ACOG",
			//"CUP_optic_ACOG_Reflex_Desert",
			//"CUP_optic_ACOG_Reflex_Wood",
			"CUP_optic_ACOG2",
			"CUP_optic_ACOG_TA31_KF",
			"CUP_optic_ACOG_TA31_KF_Desert",
			"CUP_optic_ACOG_TA31_KF_Wood",
			"CUP_optic_RCO",
			//"CUP_optic_ACOG_TA01NSN_Black_PIP",
			//"CUP_optic_ACOG_TA01NSN_Black_3D",
			"CUP_optic_RCO_desert",
			//"CUP_optic_ACOG_TA01NSN_Coyote_PIP",
			//"CUP_optic_ACOG_TA01NSN_Coyote_3D",
			"CUP_optic_ACOG_TA01NSN_Tan",
			//"CUP_optic_ACOG_TA01NSN_Tan_PIP",
			//"CUP_optic_ACOG_TA01NSN_Tan_3D",
			"CUP_optic_ACOG_TA01NSN_OD",
			//"CUP_optic_ACOG_TA01NSN_OD_PIP",
			//"CUP_optic_ACOG_TA01NSN_OD_3D",
			"CUP_optic_ACOG_TA01NSN_Tropic",
			//"CUP_optic_ACOG_TA01NSN_Tropic_PIP",
			//"CUP_optic_ACOG_TA01NSN_Tropic_3D",
			"CUP_optic_ACOG_TA01NSN_RMR_Black",
			//"CUP_optic_ACOG_TA01NSN_RMR_Black_PIP",
			//"CUP_optic_ACOG_TA01NSN_RMR_Black_3D",
			"CUP_optic_ACOG_TA01NSN_RMR_Coyote",
			//"CUP_optic_ACOG_TA01NSN_RMR_Coyote_PIP",
			//"CUP_optic_ACOG_TA01NSN_RMR_Coyote_3D",
			"CUP_optic_ACOG_TA01NSN_RMR_Tan",
			//"CUP_optic_ACOG_TA01NSN_RMR_Tan_PIP",
			//"CUP_optic_ACOG_TA01NSN_RMR_Tan_3D",
			"CUP_optic_ACOG_TA01NSN_RMR_OD",
			//"CUP_optic_ACOG_TA01NSN_RMR_OD_PIP",
			//"CUP_optic_ACOG_TA01NSN_RMR_OD_3D",
			"CUP_optic_ACOG_TA01NSN_RMR_Tropic",
			//"CUP_optic_ACOG_TA01NSN_RMR_Tropic_PIP",
			//"CUP_optic_ACOG_TA01NSN_RMR_Tropic_3D",
			"CUP_optic_ACOG_TA01B_Black",
			//"CUP_optic_ACOG_TA01B_Black_PIP",
			//"CUP_optic_ACOG_TA01B_Black_3D",
			"CUP_optic_ACOG_TA01B_Coyote",
			//"CUP_optic_ACOG_TA01B_Coyote_PIP",
			//"CUP_optic_ACOG_TA01B_Coyote_3D",
			"CUP_optic_ACOG_TA01B_Tan",
			//"CUP_optic_ACOG_TA01B_Tan_PIP",
			//"CUP_optic_ACOG_TA01B_Tan_3D",
			"CUP_optic_ACOG_TA01B_OD",
			//"CUP_optic_ACOG_TA01B_OD_PIP",
			//"CUP_optic_ACOG_TA01B_OD_3D",
			"CUP_optic_ACOG_TA01B_Tropic",
			//"CUP_optic_ACOG_TA01B_Tropic_PIP",
			//"CUP_optic_ACOG_TA01B_Tropic_3D",
			"CUP_optic_ACOG_TA01B_RMR_Black",
			//"CUP_optic_ACOG_TA01B_RMR_Black_PIP",
			//"CUP_optic_ACOG_TA01B_RMR_Black_3D",
			"CUP_optic_ACOG_TA01B_RMR_Coyote",
			//"CUP_optic_ACOG_TA01B_RMR_Coyote_PIP",
			//"CUP_optic_ACOG_TA01B_RMR_Coyote_3D",
			"CUP_optic_ACOG_TA01B_RMR_Tan",
			//"CUP_optic_ACOG_TA01B_RMR_Tan_PIP",
			//"CUP_optic_ACOG_TA01B_RMR_Tan_3D",
			"CUP_optic_ACOG_TA01B_RMR_OD",
			//"CUP_optic_ACOG_TA01B_RMR_OD_PIP",
			//"CUP_optic_ACOG_TA01B_RMR_OD_3D",
			"CUP_optic_ACOG_TA01B_RMR_Tropic",
			//"CUP_optic_ACOG_TA01B_RMR_Tropic_PIP",
			//"CUP_optic_ACOG_TA01B_RMR_Tropic_3D",
			"CUP_optic_Elcan_SpecterDR",
			//"CUP_optic_Elcan_SpecterDR_pip",
			"CUP_optic_Elcan_SpecterDR_RMR",
			//"CUP_optic_Elcan_SpecterDR_RMR_pip",
			"CUP_optic_Elcan_SpecterDR_black",
			//"CUP_optic_Elcan_SpecterDR_black_pip",
			"CUP_optic_Elcan_SpecterDR_RMR_black",
			//"CUP_optic_Elcan_SpecterDR_RMR_black_pip",
			"CUP_optic_Elcan_SpecterDR_od",
			//"CUP_optic_Elcan_SpecterDR_od_pip",
			"CUP_optic_Elcan_SpecterDR_RMR_od",
			//"CUP_optic_Elcan_SpecterDR_RMR_od_pip",
			"CUP_optic_ElcanM145",
			//"CUP_optic_ElcanM145_PIP",
			//"CUP_optic_ElcanM145_3D",
			"CUP_optic_Elcan",
			//"CUP_optic_Elcan_pip",
			//"CUP_optic_Elcan_3D",
			"CUP_optic_Elcan_OD",
			//"CUP_optic_Elcan_OD_pip",
			//"CUP_optic_Elcan_OD_3D",
			"CUP_optic_Elcan_Coyote",
			//"CUP_optic_Elcan_Coyote_pip",
			//"CUP_optic_Elcan_Coyote_3D",
			"CUP_optic_Elcan_reflex",
			//"CUP_optic_Elcan_reflex_pip",
			//"CUP_optic_Elcan_reflex_3D",
			"CUP_optic_Elcan_reflex_OD",
			//"CUP_optic_Elcan_reflex_OD_pip",
			//"CUP_optic_Elcan_reflex_OD_3D",
			"CUP_optic_Elcan_reflex_Coyote",
			//"CUP_optic_Elcan_reflex_Coyote_pip",
			//"CUP_optic_Elcan_reflex_Coyote_3D",
			"CUP_optic_PEM",
			//"CUP_optic_PEM_pip",
			//"CUP_optic_PEM_3D",
			"CUP_optic_Remington",
			//"CUP_optic_Remington_pip",
			"CUP_optic_PGO7V",
			"CUP_optic_PGO7V2",
			"CUP_optic_PGO7V3",
			"CUP_optic_NSPU_RPG"
		]
	],
	[
		"CAMS_W_OpticsLv2",1,false,
		[
		]
	],
	[
		"CAMS_W_OpticsLv3",1,false,
		[
		]
	],
	[
		"CAMS_W_Optics_ALL",0,true,
		[
			"CAMS_W_Optics_W", "CAMS_W_OpticsLv2", "CAMS_W_OpticsLv3"
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
		"CAMS_Pistols_W",1,false,
		[
			"CUP_hgun_BallisticShield_Armed",
			"CUP_hgun_Compact",
			"CUP_hgun_Duty",
			"CUP_hgun_Phantom",
			"CUP_hgun_Glock17",
			"CUP_hgun_Glock17_blk",
			"CUP_hgun_Glock17_tan",
			"CUP_hgun_M9",
			"CUP_hgun_Mac10",
			"CUP_hgun_Makarov",
			"CUP_hgun_PMM",
			"CUP_hgun_MicroUzi",
			"CUP_hgun_Mk23",
			"CUP_hgun_PB6P9",
			"CUP_hgun_TaurusTracker455",
			"CUP_hgun_TaurusTracker455_gold",
			"CUP_hgun_TEC9",
			"CUP_hgun_Colt1911",
			"CUP_hgun_Deagle",
			"CUP_hgun_MP7",
			"CUP_hgun_MP7_desert",
			"CUP_hgun_MP7_woodland",
			"CUP_hgun_SA61"
		]
	],
	[
		"CAMS_SMG_W",1,false,
		[
			"CUP_smg_MP5SD6",
			"CUP_smg_MP5A5",
			"CUP_smg_MP5A5_flashlight",
			"CUP_smg_bizon",
			"CUP_smg_vityaz",
			"CUP_smg_vityaz_vfg",
			"CUP_smg_vityaz_top_rail",
			"CUP_smg_vityaz_vfg_top_rail",
			"CUP_smg_vityaz_vfg_front_rail",
			"CUP_smg_saiga9",
			"CUP_smg_MP7",
			"CUP_smg_MP7_desert",
			"CUP_smg_MP7_woodland",
			"CUP_smg_EVO",
			"CUP_smg_SA61",
			"CUP_smg_Mac10",
			"CUP_smg_Mac10_rail",
			"CUP_smg_p90_olive",
			"CUP_smg_p90_black",
			"CUP_smg_PS90_olive"	
		]
	],
	[
		"CAMS_Shotgun_W",1,false,   ///////// FIX IN VANILLA
		[
			"CUP_sgun_SPAS12",
			"CUP_sgun_AA12",
			"CUP_sgun_Saiga12K",
			"CUP_sgun_Saiga12K_top_rail",
			"CUP_sgun_CZ584",
			"CUP_sgun_CZ584_RIS",
			"CUP_sgun_M1014",
			"CUP_sgun_M1014_solidstock",
			"CUP_sgun_M1014_vfg",
			"CUP_sgun_M1014_Entry",
			"CUP_sgun_M1014_Entry_vfg"
		]
	],
	[
		"CAMS_GL_W",1,false,
		[
			"CUP_glaunch_M32",
			"CUP_glaunch_M79",
			"CUP_glaunch_Mk13",
			"CUP_glaunch_6G30"
		]
	],	
	[
		"CAMS_LMG_W",1,false,
		[
			"CUP_lmg_UK59",
			"CUP_lmg_M240",
			"CUP_lmg_L7A2",
			"CUP_lmg_L7A2_Flat",
			"CUP_lmg_FNMAG",
			"CUP_lmg_FNMAG_RIS",
			"CUP_lmg_minimipara",
			"CUP_lmg_minimi",
			"CUP_lmg_m249_para",
			"CUP_lmg_m249_para_gl",
			"CUP_lmg_M249_E2",
			"CUP_lmg_minimi_railed",
			"CUP_lmg_m249_pip1",
			"CUP_lmg_M249",
			"CUP_lmg_m249_pip2",
			"CUP_lmg_m249_pip3",
			"CUP_lmg_m249_pip4",
			"CUP_lmg_m249_SQuantoon",
			"CUP_lmg_L110A1",
			"CUP_lmg_M60E4",
			"CUP_lmg_M60E4_norail",
			"CUP_lmg_M60E4_wood",
			"CUP_lmg_M60E4_norail_wood",
			"CUP_lmg_M60E4_jungle",
			"CUP_lmg_M60E4_norail_jungle",
			"CUP_lmg_M60E4_desert",
			"CUP_lmg_M60E4_norail_desert",
			"CUP_lmg_M60",
			"CUP_lmg_MG3",
			"CUP_lmg_MG3_rail",
			"CUP_lmg_Mk48",
			"CUP_lmg_Mk48_des",
			"CUP_lmg_Mk48_wdl",
			"CUP_lmg_Mk48_tan",
			"CUP_lmg_Mk48_od",
			"CUP_lmg_Mk48_nohg",
			"CUP_lmg_Mk48_nohg_des",
			"CUP_lmg_Mk48_nohg_wdl",
			"CUP_lmg_Mk48_nohg_tan",
			"CUP_lmg_Mk48_nohg_od",
			"CUP_lmg_PKM",
			"CUP_lmg_PKMN",
			"CUP_lmg_Pecheneg",
			"CUP_lmg_Pecheneg_desert",
			"CUP_lmg_Pecheneg_woodland"
		]
	],
	[
		"CAMS_MMG_W",1,false,
		[
		]
	],
	[
		"CAMS_AssaultRifles_W",1,false,
		[
			"CUP_arifle_G3A3_ris",
			"CUP_arifle_G3A3_ris_vfg",
			"CUP_arifle_G3A3_modern_ris",
			"CUP_arifle_G3A3_ris_black",
			"CUP_arifle_G3A3_ris_vfg_black",
			"CUP_arifle_G3A3_modern_ris_black",
			"CUP_arifle_ACR_blk_556",
			"CUP_arifle_ACR_tan_556",
			"CUP_arifle_ACR_wdl_556",
			"CUP_arifle_ACR_snw_556",
			"CUP_arifle_ACRC_blk_556",
			"CUP_arifle_ACRC_tan_556",
			"CUP_arifle_ACRC_wdl_556",
			"CUP_arifle_ACRC_snw_556",
			"CUP_arifle_ACR_DMR_blk_556",
			"CUP_arifle_ACR_DMR_tan_556",
			"CUP_arifle_ACR_DMR_wdl_556",
			"CUP_arifle_ACR_DMR_snw_556",
			"CUP_arifle_ACR_blk_68",
			"CUP_arifle_ACR_tan_68",
			"CUP_arifle_ACR_wdl_68",
			"CUP_arifle_ACR_snw_68",
			"CUP_arifle_ACRC_blk_68",
			"CUP_arifle_ACRC_tan_68",
			"CUP_arifle_ACRC_wdl_68",
			"CUP_arifle_ACRC_snw_68",
			"CUP_arifle_ACR_DMR_blk_68",
			"CUP_arifle_ACR_DMR_tan_68",
			"CUP_arifle_ACR_DMR_wdl_68",
			"CUP_arifle_ACR_DMR_snw_68",
			"CUP_CZ_BREN2_556_14",
			"CUP_CZ_BREN2_556_11",
			"CUP_CZ_BREN2_556_8",
			"CUP_CZ_BREN2_762_14",
			"CUP_CZ_BREN2_762_8",
			"CUP_arifle_Galil_black",
			"CUP_arifle_Galil_556_black",
			"CUP_arifle_Galil_SAR_black",
			"CUP_arifle_OTS14_GROZA_Grip",
			"CUP_arifle_OTS14_GROZA",
			"CUP_arifle_OTS14_GROZA_762_Grip",
			"CUP_arifle_OTS14_GROZA_762",
			"CUP_srifle_ksvk",
			"CUP_arifle_AUG_A1",

			"CUP_arifle_AS_VAL",
			"CUP_arifle_AS_VAL_top_rail",
			"CUP_arifle_AS_VAL_VFG",
			"CUP_arifle_AS_VAL_VFG_top_rail",
			"CUP_arifle_AS_VAL_flash",
			"CUP_arifle_AS_VAL_flash_top",
			"CUP_arifle_SR3M_Vikhr",
			"CUP_arifle_SR3M_Vikhr_top_rail",
			"CUP_arifle_SR3M_Vikhr_VFG",
			"CUP_arifle_SR3M_Vikhr_VFG_top_rail",
			"CUP_arifle_X95",
			"CUP_arifle_X95_Grippod",
			"CUP_arifle_Fort224",
			"CUP_arifle_Fort224_Grippod",
			"CUP_arifle_Fort221",
			"CUP_arifle_Fort222",
			"CUP_arifle_AKM",
			"CUP_arifle_AKM_top_rail",
			"CUP_arifle_AKM_Early",
			"CUP_arifle_AKMN_railed",
			"CUP_arifle_AKMN_railed_afg",
			"CUP_arifle_AKMN_railed_desert",
			"CUP_arifle_AKMN_railed_afg_desert",
			"CUP_arifle_AKMS",
			"CUP_arifle_AKMS_top_rail",
			"CUP_arifle_AKMS_Early",
			"CUP_arifle_AKS74U",
			"CUP_arifle_AKS74U_top_rail",
			"CUP_arifle_AKS74U_railed",
			"CUP_arifle_AK47",
			"CUP_arifle_AK47_top_rail",
			"CUP_arifle_AK47_Early",
			"CUP_arifle_AKS",
			"CUP_arifle_AKS_Gold",
			"CUP_arifle_AKS_top_rail",
			"CUP_arifle_AK74",
			"CUP_arifle_AK74_top_rail",
			"CUP_arifle_AK74_Early",
			"CUP_arifle_AKS74",
			"CUP_arifle_AKS74_top_rail",
			"CUP_arifle_AKS74_Early",
			"CUP_arifle_AK74M",
			"CUP_arifle_AK74M_top_rail",
			"CUP_arifle_AK74M_railed",
			"CUP_arifle_AK74M_railed_afg",
			"CUP_arifle_AK74M_desert",
			"CUP_arifle_AK74M_top_rail_desert",
			"CUP_arifle_AK74M_railed_desert",
			"CUP_arifle_AK74M_railed_afg_desert",
			"CUP_arifle_AK74M_camo",
			"CUP_arifle_AK74M_top_rail_camo",
			"CUP_arifle_AK74M_railed_camo",
			"CUP_arifle_AK74M_railed_afg_camo",
			"CUP_arifle_AK101",
			"CUP_arifle_AK101_top_rail",
			"CUP_arifle_AK101_railed",
			"CUP_arifle_AK103",
			"CUP_arifle_AK103_top_rail",
			"CUP_arifle_AK103_railed",
			"CUP_arifle_AK107",
			"CUP_arifle_AK107_top_rail",
			"CUP_arifle_AK107_railed",
			"CUP_arifle_AK108",
			"CUP_arifle_AK108_top_rail",
			"CUP_arifle_AK108_railed",
			"CUP_arifle_AK109",
			"CUP_arifle_AK109_top_rail",
			"CUP_arifle_AK109_railed",
			"CUP_arifle_AK102",
			"CUP_arifle_AK102_top_rail",
			"CUP_arifle_AK102_railed",
			"CUP_arifle_AK104",
			"CUP_arifle_AK104_top_rail",
			"CUP_arifle_AK104_railed",
			"CUP_arifle_AK105",
			"CUP_arifle_AK105_top_rail",
			"CUP_arifle_AK105_railed",
			"CUP_arifle_RPK74",
			"CUP_arifle_RPK74_top_rail",
			"CUP_arifle_RPK74_45",
			"CUP_arifle_RPK74_45_top_rail",
			"CUP_arifle_RPK74M",
			"CUP_arifle_RPK74M_top_rail",
			"CUP_arifle_RPK74M_railed",
			"CUP_arifle_SAIGA_MK03",
			"CUP_arifle_SAIGA_MK03_top_rail",
			"CUP_arifle_SAIGA_MK03_Wood",
			"CUP_arifle_SIAGE_MK03_Wood_top_rail",
			"CUP_arifle_TYPE_56_2",
			"CUP_arifle_TYPE_56_2_top_rail",
			"CUP_arifle_TYPE_56_2_Early",
			"CUP_arifle_CZ805_A2",
			"CUP_arifle_CZ805_A1",
			"CUP_arifle_CZ805_A2_blk",
			"CUP_arifle_CZ805_A2_coyote",
			"CUP_arifle_CZ805_A1_blk",
			"CUP_arifle_CZ805_A1_coyote",
			"CUP_Famas_F1",
			"CUP_Famas_F1_Rail",
			"CUP_Famas_F1_Wood",
			"CUP_Famas_F1_Arid",
			"CUP_Famas_F1_Rail_Wood",
			"CUP_Famas_F1_Rail_Arid",
			"CUP_arifle_FNFAL",
			"CUP_arifle_FNFAL_railed",
			"CUP_arifle_FNFAL_desert",
			"CUP_arifle_FNFAL_railed_desert",
			"CUP_arifle_FNFAL_sand",
			"CUP_arifle_FNFAL_railed_sand",
			"CUP_arifle_FNFAL_woodland",
			"CUP_arifle_FNFAL_railed_woodland",
			"CUP_arifle_FNFAL5060",
			"CUP_arifle_FNFAL5060_railed",
			"CUP_arifle_FNFAL5060_rhodesian",
			"CUP_arifle_FNFAL5060_desert",
			"CUP_arifle_FNFAL5060_sand",
			"CUP_arifle_FNFAL5060_woodland",
			"CUP_arifle_FNFAL5060_railed_desert",
			"CUP_arifle_FNFAL5060_railed_sand",
			"CUP_arifle_FNFAL5060_railed_woodland",
			"CUP_arifle_FNFAL5061",
			"CUP_arifle_FNFAL5061_railed",
			"CUP_arifle_FNFAL5061_rhodesian",
			"CUP_arifle_FNFAL5061_wooden",
			"CUP_arifle_FNFAL5061_wooden_railed",
			"CUP_arifle_FNFAL5062",
			"CUP_arifle_FNFAL5062_railed",
			"CUP_arifle_FNFAL_OSW",
			"CUP_arifle_FNFAL_OSW_railed",
			"CUP_arifle_IMI_Romat",
			"CUP_arifle_IMI_Romat_railed",
			"CUP_arifle_Steyr_Stg58",
			"CUP_arifle_Steyr_Stg58_railed",
			"CUP_arifle_Gewehr1",
			"CUP_arifle_Gewehr1_railed",
			"CUP_arifle_DSA_SA58",
			"CUP_arifle_DSA_SA58_OSW",
			"CUP_arifle_DSA_SA58_OSW_VFG",
			"CUP_arifle_DSA_SA58_DMR",
			"CUP_arifle_DSA_SA58_OSW_Sand",
			"CUP_arifle_DSA_SA58_OSW_Desert",
			"CUP_arifle_DSA_SA58_OSW_Woodland",
			"CUP_arifle_DSA_SA58_OSW_VFG_Sand",
			"CUP_arifle_DSA_SA58_OSW_VFG_Desert",
			"CUP_arifle_DSA_SA58_OSW_VFG_Woodland",
			"CUP_arifle_G36A",
			"CUP_arifle_G36A_camo",
			"CUP_arifle_G36A_wdl",
			"CUP_arifle_G36A_RIS",
			"CUP_arifle_G36A_RIS_camo",
			"CUP_arifle_G36A_RIS_wdl",
			"CUP_arifle_G36K",
			"CUP_arifle_G36K_camo",
			"CUP_arifle_G36K_wdl",
			"CUP_arifle_G36K_VFG",
			"CUP_arifle_G36K_VFG_camo",
			"CUP_arifle_G36K_VFG_wdl",
			"CUP_arifle_G36K_RIS",
			"CUP_arifle_G36K_RIS_camo",
			"CUP_arifle_G36K_RIS_wdl",
			"CUP_arifle_G36K_RIS_hex",
			"CUP_arifle_G36K_KSK",
			"CUP_arifle_G36K_KSK_camo",
			"CUP_arifle_G36K_KSK_hex",
			"CUP_arifle_G36K_KSK_VFG",
			"CUP_arifle_G36K_KSK_VFG_camo",
			"CUP_arifle_G36K_KSK_VFG_hex",
			"CUP_arifle_G36C",
			"CUP_arifle_G36C_camo",
			"CUP_arifle_G36C_wdl",
			"CUP_arifle_G36C_hex",
			"CUP_arifle_G36C_VFG",
			"CUP_arifle_G36C_VFG_camo",
			"CUP_arifle_G36C_VFG_wdl",
			"CUP_arifle_G36C_VFG_hex",
			"CUP_arifle_G36C_VFG_Carry",
			"CUP_arifle_MG36",
			"CUP_arifle_MG36_camo",
			"CUP_arifle_MG36_wdl",
			"CUP_arifle_MG36_hex",
			"CUP_arifle_HK416_CQB_Black",
			"CUP_arifle_HK416_CQB_Desert",
			"CUP_arifle_HK416_CQB_Wood",
			"CUP_arifle_HK416_Black",
			"CUP_arifle_HK416_Desert",
			"CUP_arifle_HK416_Wood",
			"CUP_arifle_HK_M27",
			"CUP_arifle_HK_M27_VFG",
			"CUP_arifle_HK417_20",
			"CUP_arifle_HK417_20_Wood",
			"CUP_arifle_HK417_20_Desert",
			"CUP_arifle_HK417_12",
			"CUP_arifle_HK417_12_Wood",
			"CUP_arifle_HK417_12_Desert",
			"CUP_l85a2",
			"CUP_l85a2_ris",
			"CUP_l85a2_ris_ng",
			"CUP_arifle_L85A2",
			"CUP_arifle_L85A2_G",
			"CUP_arifle_L85A2_NG",
			"CUP_arifle_L86A2",
			"CUP_arifle_M16A2",
			"CUP_arifle_M16A4_Grip",
			"CUP_arifle_XM16E1",
			"CUP_arifle_M16A1",
			"CUP_arifle_Colt727",
			"CUP_arifle_M4A1",
			"CUP_arifle_M4A1_desert_carryhandle",
			"CUP_arifle_M4A1_camo_carryhandle",
			"CUP_arifle_M4A1_black",
			"CUP_arifle_M4A1_camo",
			"CUP_arifle_M4A1_desert",
			"CUP_arifle_M4A3_black",
			"CUP_arifle_M4A3_desert",
			"CUP_arifle_M4A3_camo",
			"CUP_arifle_mk18_black",
			"CUP_arifle_SBR_black",
			"CUP_arifle_SBR_od",
			"CUP_arifle_M4A1_MOE_black",
			"CUP_arifle_M4A1_MOE_wdl",
			"CUP_arifle_M4A1_MOE_desert",
			"CUP_arifle_M4A1_MOE_winter",
			"CUP_arifle_M4A1_MOE_short_black",
			"CUP_arifle_M4A1_MOE_short_wdl",
			"CUP_arifle_M4A1_MOE_short_desert",
			"CUP_arifle_M4A1_MOE_short_winter",
			"CUP_arifle_M4A1_standard_black",
			"CUP_arifle_M4A1_standard_wdl",
			"CUP_arifle_M4A1_standard_dsrt",
			"CUP_arifle_M4A1_standard_winter",
			"CUP_arifle_M4A1_standard_short_black",
			"CUP_arifle_M4A1_standard_short_wdl",
			"CUP_arifle_M4A1_standard_short_dsrt",
			"CUP_arifle_M4A1_standard_short_winter",
			"CUP_arifle_M16A4_Base",
			"CUP_arifle_Sa58P",
			"CUP_arifle_Sa58P_des",
			"CUP_arifle_Sa58P_woodland",
			"CUP_arifle_Sa58V",
			"CUP_arifle_Sa58V_camo",
			"CUP_arifle_Sa58V_woodland",
			"CUP_arifle_Sa58RIS1",
			"CUP_arifle_Sa58RIS1_des",
			"CUP_arifle_Sa58RIS1_woodland",
			"CUP_arifle_Sa58RIS2",
			"CUP_arifle_Sa58RIS2_camo",
			"CUP_arifle_Sa58RIS2_woodland",
			"CUP_arifle_Sa58P_frontris",
			"CUP_arifle_Sa58P_frontris_desert",
			"CUP_arifle_Sa58P_frontris_woodland",
			"CUP_arifle_Sa58P_v2",
			"CUP_arifle_Mk16_STD",
			"CUP_arifle_Mk16_STD_FG",
			"CUP_arifle_Mk16_STD_AFG",
			"CUP_arifle_Mk16_STD_SFG",
			"CUP_arifle_Mk16_SV",
			"CUP_arifle_Mk16_CQC",
			"CUP_arifle_Mk16_CQC_FG",
			"CUP_arifle_Mk16_CQC_AFG",
			"CUP_arifle_Mk16_CQC_SFG",
			"CUP_arifle_Mk16_CQC_black",
			"CUP_arifle_Mk16_CQC_FG_black",
			"CUP_arifle_Mk16_CQC_AFG_black",
			"CUP_arifle_Mk16_CQC_SFG_black",
			"CUP_arifle_Mk16_STD_black",
			"CUP_arifle_Mk16_STD_FG_black",
			"CUP_arifle_Mk16_STD_AFG_black",
			"CUP_arifle_Mk16_STD_SFG_black",
			"CUP_arifle_Mk16_SV_black",
			"CUP_arifle_Mk16_CQC_woodland",
			"CUP_arifle_Mk16_CQC_FG_woodland",
			"CUP_arifle_Mk16_CQC_AFG_woodland",
			"CUP_arifle_Mk16_CQC_SFG_woodland",
			"CUP_arifle_Mk16_STD_woodland",
			"CUP_arifle_Mk16_STD_FG_woodland",
			"CUP_arifle_Mk16_STD_AFG_woodland",
			"CUP_arifle_Mk16_STD_SFG_woodland",
			"CUP_arifle_Mk16_SV_woodland",
			"CUP_arifle_Mk17_CQC",
			"CUP_arifle_Mk17_CQC_FG",
			"CUP_arifle_Mk17_CQC_SFG",
			"CUP_arifle_Mk17_STD",
			"CUP_arifle_Mk17_STD_FG",
			"CUP_arifle_Mk17_STD_SFG",
			"CUP_arifle_Mk20",
			"CUP_arifle_Mk17_CQC_Black",
			"CUP_arifle_Mk17_CQC_FG_black",
			"CUP_arifle_Mk17_CQC_SFG_black",
			"CUP_arifle_Mk17_STD_black",
			"CUP_arifle_Mk17_STD_FG_black",
			"CUP_arifle_Mk17_STD_SFG_black",
			"CUP_arifle_Mk20_black",
			"CUP_arifle_Mk17_CQC_woodland",
			"CUP_arifle_Mk17_CQC_FG_woodland",
			"CUP_arifle_Mk17_CQC_SFG_woodland",
			"CUP_arifle_Mk17_STD_woodland",
			"CUP_arifle_Mk17_STD_FG_woodland",
			"CUP_arifle_Mk17_STD_SFG_woodland",
			"CUP_arifle_Mk20_woodland",
			"CUP_SKS",
			"CUP_SKS_rail",
			"CUP_arifle_XM8_Carbine",
			"CUP_arifle_XM8_Carbine_FG",
			"CUP_arifle_xm8_sharpshooter",
			"CUP_arifle_xm8_SAW",
			"CUP_arifle_XM8_Compact",
			"CUP_arifle_XM8_Compact_Rail",
			"CUP_arifle_XM8_Railed",
			
			"CUP_arifle_ACR_EGLM_blk_556",
			"CUP_arifle_ACR_EGLM_tan_556",
			"CUP_arifle_ACR_EGLM_wdl_556",
			"CUP_arifle_ACR_EGLM_snw_556",
			"CUP_arifle_ACRC_EGLM_blk_556",
			"CUP_arifle_ACRC_EGLM_tan_556",
			"CUP_arifle_ACRC_EGLM_wdl_556",
			"CUP_arifle_ACRC_EGLM_snw_556",
			"CUP_arifle_ACR_EGLM_blk_68",
			"CUP_arifle_ACR_EGLM_tan_68",
			"CUP_arifle_ACR_EGLM_wdl_68",
			"CUP_arifle_ACR_EGLM_snw_68",
			"CUP_arifle_ACRC_EGLM_blk_68",
			"CUP_arifle_ACRC_EGLM_tan_68",
			"CUP_arifle_ACRC_EGLM_wdl_68",
			"CUP_arifle_ACRC_EGLM_snw_68",
			"CUP_CZ_BREN2_556_14_GL",
			"CUP_CZ_BREN2_556_11_GL",
			"CUP_CZ_BREN2_762_14_GL",
			"CUP_arifle_OTS14_GROZA_GL",
			"CUP_arifle_OTS14_GROZA_762_GL",
			"CUP_arifle_AKM_GL",
			"CUP_arifle_AKM_GL_top_rail",
			"CUP_arifle_AKM_GL_Early",
			"CUP_arifle_AKMS_GL",
			"CUP_arifle_AKMS_GL_top_rail",
			"CUP_arifle_AKMS_GL_Early",
			"CUP_arifle_AK47_GL",
			"CUP_arifle_AK47_GL_top_rail",
			"CUP_arifle_AK47_GL_Early",
			"CUP_arifle_AK74_GL",
			"CUP_arifle_AK74_GL_top_rail",
			"CUP_arifle_AK74_GL_Early",
			"CUP_arifle_AKS74_GL",
			"CUP_arifle_AKS74_GL_top_rail",
			"CUP_arifle_AKS74_GL_Early",
			"CUP_arifle_AK74M_GL",
			"CUP_arifle_AK74M_GL_top_rail",
			"CUP_arifle_AK74M_GL_railed",
			"CUP_arifle_AK74M_GL_desert",
			"CUP_arifle_AK74M_GL_top_rail_desert",
			"CUP_arifle_AK74M_GL_railed_desert",
			"CUP_arifle_AK74M_GL_camo",
			"CUP_arifle_AK74M_GL_top_rail_camo",
			"CUP_arifle_AK74M_GL_railed_camo",
			"CUP_arifle_AK101_GL",
			"CUP_arifle_AK101_GL_top_rail",
			"CUP_arifle_AK101_GL_railed",
			"CUP_arifle_AK103_GL",
			"CUP_arifle_AK103_GL_top_rail",
			"CUP_arifle_AK103_GL_railed",
			"CUP_arifle_AK107_GL",
			"CUP_arifle_AK107_GL_top_rail",
			"CUP_arifle_AK107_GL_railed",
			"CUP_arifle_AK108_GL",
			"CUP_arifle_AK108_GL_top_rail",
			"CUP_arifle_AK108_GL_railed",
			"CUP_arifle_AK109_GL",
			"CUP_arifle_AK109_GL_top_rail",
			"CUP_arifle_AK109_GL_railed",
			"CUP_arifle_CZ805_GL",
			"CUP_arifle_CZ805_GL_blk",
			"CUP_arifle_CZ805_GL_coyote",
			"CUP_arifle_DSA_SA58_OSW_M203",
			"CUP_arifle_AG36",
			"CUP_arifle_AG36_camo",
			"CUP_arifle_AG36_wdl",
			"CUP_arifle_G36A_AG36_RIS",
			"CUP_arifle_G36A_AG36_RIS_camo",
			"CUP_arifle_G36A_AG36_RIS_wdl",
			"CUP_arifle_G36K_AG36",
			"CUP_arifle_G36K_AG36_camo",
			"CUP_arifle_G36K_AG36_wdl",
			"CUP_arifle_G36K_RIS_AG36",
			"CUP_arifle_G36K_RIS_AG36_camo",
			"CUP_arifle_G36K_RIS_AG36_wdl",
			"CUP_arifle_G36K_RIS_AG36_hex",
			"CUP_arifle_HK416_M203_Black",
			"CUP_arifle_HK416_M203_Desert",
			"CUP_arifle_HK416_M203_Wood",
			"CUP_arifle_HK416_CQB_M203_Black",
			"CUP_arifle_HK416_CQB_M203_Desert",
			"CUP_arifle_HK416_CQB_M203_Wood",
			"CUP_arifle_HK416_AGL_Black",
			"CUP_arifle_HK416_AGL_Desert",
			"CUP_arifle_HK416_AGL_Wood",
			"CUP_arifle_HK416_CQB_AG36",
			"CUP_arifle_HK416_CQB_AG36_Desert",
			"CUP_arifle_HK416_CQB_AG36_Wood",
			"CUP_arifle_HK_M27_AG36",
			"CUP_arifle_HK417_12_M203",
			"CUP_arifle_HK417_12_M203_Wood",
			"CUP_arifle_HK417_12_M203_Desert",
			"CUP_arifle_HK417_12_AG36",
			"CUP_arifle_HK417_12_AG36_Wood",
			"CUP_arifle_HK417_12_AG36_Desert",
			"CUP_l85a2_ugl",
			"CUP_arifle_L85A2_GL",
			"CUP_arifle_M16A2_GL",
			"CUP_arifle_M16A4_GL",
			"CUP_arifle_M16A1GL",
			"CUP_arifle_M16A1GL_USA",
			"CUP_arifle_M16A1GL_FS",
			"CUP_arifle_Colt727_M203",
			"CUP_arifle_M4A1_GL_carryhandle",
			"CUP_arifle_M4A1_GL_carryhandle_camo",
			"CUP_arifle_M4A1_GL_carryhandle_desert",
			"CUP_arifle_M4A1_BUIS_GL",
			"CUP_arifle_M4A1_BUIS_camo_GL",
			"CUP_arifle_M4A1_BUIS_desert_GL",
			"CUP_arifle_mk18_m203_black",
			"CUP_arifle_Sa58RIS2_gl",
			"CUP_arifle_Sa58RIS2_gl_desert",
			"CUP_arifle_Sa58RIS2_gl_woodland",
			"CUP_arifle_Mk16_STD_EGLM",
			"CUP_arifle_Mk16_CQC_EGLM",
			"CUP_arifle_Mk16_CQC_EGLM_black",
			"CUP_arifle_Mk16_STD_EGLM_black",
			"CUP_arifle_Mk16_CQC_EGLM_woodland",
			"CUP_arifle_Mk16_STD_EGLM_woodland",
			"CUP_arifle_Mk17_CQC_EGLM",
			"CUP_arifle_Mk17_STD_EGLM",
			"CUP_arifle_Mk17_CQC_EGLM_black",
			"CUP_arifle_Mk17_STD_EGLM_black",
			"CUP_arifle_Mk17_CQC_EGLM_woodland",
			"CUP_arifle_Mk17_STD_EGLM_woodland",
			"CUP_arifle_XM8_Carbine_GL"
		]
	],
	[
		"CAMS_AA_W",1,false,
		[
            "CUP_launch_FIM92Stinger",
            "CUP_launch_9K32Strela"
		]
	],
	[
		"CAMS_AT_W",1,false,
		[
        	"CUP_launch_Igla",
            "CUP_launch_Javelin",
            "CUP_launch_M47",
            "CUP_launch_M136",
         	"CUP_launch_MAAWS_Scope",
            "CUP_launch_Metis",
            "CUP_launch_NLAW",
            "CUP_launch_RPG7V",
            "CUP_launch_RPG18",
         	"CUP_launch_Mk153Mod0_SMAWOptics",
            "CUP_launch_MAAWS",
            "CUP_launch_Mk153Mod0"
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
		"CAMS_Pistols_E",1,false,
		[
		]
	],
	[
		"CAMS_SMG_E",1,false,
		[
		]
	],
	[
		"CAMS_LMG_E",1,false,
		[
		]
	],
	[
		"CAMS_MMG_E",1,false,
		[
		]
	],
	[
		"CAMS_Shotgun_E",1,false,
		[
		]
	],
	[
		"CAMS_AssaultRifles_E",1,false,
		[
		]
	],
	[
		"CAMS_SniperRifles_E",1,false,
		[
		]
	],
	[
		"CAMS_AA_E",1,false,
		[
		]
	],
	[
		"CAMS_AT_E",1,false,
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
		"CAMS_Pistols_I",1,false,
		[
		]
	],
	[
		"CAMS_SMG_I",1,false,
		[
		]
	],
	[
		"CAMS_LMG_I",1,false,
		[
		]
	],
	[
		"CAMS_MMG_I",1,false,
		[
		]
	],
	[
		"CAMS_AssaultRifles_I",1,false,
		[
		]
	],
	[
		"CAMS_SniperRifles_I",1,false,
		[
		]
	],
	[
		"CAMS_AA_I",1,false,
		[
		]
	],
	[
		"CAMS_AT_I",1,false,
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
