// ImmersionFX.sqf
// TheOneWhoKnocks
// Overwrites the global variables used by FrSB to integrate crstom content into system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_immersionData","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "vanilla";
_debugCart = false;



_immersionData = 
[
	/////////////////////////////////////// AI Models to use
	[
		"ImFX_AiModel_E",1,true,
		[
			"O_G_Soldier_F"
		]
	],
	
	////////////////////////////////////// Air Assets
	[
		"ImFX_Air_Patrol",1,true,
		[
		// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
		// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model

			// A-164 Wipeout
			"B_Plane_CAS_01_dynamicLoadout_F",
			
			// MQ-4A Greyhawk (UAV)
			"B_UAV_02_dynamicLoadout_F",
			"O_UAV_02_dynamicLoadout_F",
			"I_UAV_02_dynamicLoadout_F"
		]
	],
	[
		"ImFX_Air_Interceptor",1,true,
		[
		// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
		// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model

			// A-143 Buzzard
			"I_Plane_Fighter_03_dynamicLoadout_F",
			//To-199 Neophron
			"O_Plane_CAS_02_dynamicLoadout_F"
		]
	],
	[
		"ImFX_Air_Airdrop",0,true,
		[
			"CAMS_Heli_Unarmed_W","CAMS_Heli_Transport_W"
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
		"ImFX_Air_Rescue_Heli",1,true,
		// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
		// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		[
			// UH-80 Ghosthawk
			"B_Heli_Transport_01_F",
			"B_Heli_Transport_01_camo_F",
			
			// CH-67 Huron
			"B_Heli_Transport_03_unarmed_F",
			
			// MH-9 Hummingbird
			"B_Heli_Light_01_F",
			
			// UH1H
			"UH1H_Closed_TK"
		]
	],

	
	/////////////////////////////////////// Land Assets

	[
		"ImFX_Land_Armed_Guard",0,true,
		[
			"CAMS_Mil_ArmedOffroad_E"
		]
	],	
	[
		"ImFX_Land_Armed_Transport",0,true,
		[
			"CAMS_Mil_ArmedTransport_W","CAMS_Mil_ArmedTransport_E","CAMS_Mil_ArmedTransport_I"
		]
	],	
	[
		"ImFX_Land_Unarmed_Transport",0,true,
		[
			"CAMS_Mil_Transport_W","CAMS_Mil_Transport_E","CAMS_Mil_Transport_I"
		]
	],	
	[
		"ImFX_Land_Civ_Truck",0,true,
		[
			"CAMS_Civ_SUV"
		]
	],	
	[
		"ImFX_Land_Medic",1,true,
		[
			"C_Van_02_medevac_F","O_Truck_02_medical_F","O_Truck_03_medical_F",
			"I_E_Van_02_medevac_F","B_Truck_01_medical_F","I_Truck_02_medical_F"
		]
	],	

	[
		"ImFX_Land_Civ_Car",0,true,
		[
			"CAMS_Civ_ALL"
		]
	],
	[	// Uniforms that "Doctor" or "Scientist" AI can wear 
		"ImFX_Uniform_Scientist",1,true,
		[
			"U_B_CBRN_Suit_01_MTP_F","U_B_CBRN_Suit_01_Tropic_F","U_B_CBRN_Suit_01_Wdl_F","U_I_CBRN_Suit_01_AAF_F",
			"U_I_E_CBRN_Suit_01_EAF_F","U_C_CBRN_Suit_01_Blue_F","U_C_CBRN_Suit_01_White_F","U_C_Uniform_Scientist_01_F",
			"U_C_Uniform_Scientist_01_formal_F","U_C_Uniform_Scientist_02_F","U_C_Uniform_Scientist_02_formal_F"
		]
	],	
	[	// Uniforms that "Bambi" class can wear 
		"ImFX_Uniform_Bambi",1,true,
		[
			"U_C_ConstructionCoverall_Red_F","U_C_ConstructionCoverall_Vrana_F",
			"U_C_ConstructionCoverall_Black_F","U_C_ConstructionCoverall_Blue_F"
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
			"CAMS_Packs_Lv1"
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
	],	
	///////////////// Weapon Specifics
	///////////////// DAPE Loot Tables
	[
		"ImFX_DAPE_lootWeapons",1,true,
		[
			"arifle_MXM_Black_F","arifle_MXM_F","srifle_DMR_01_F","srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F",
			"srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F",
			"srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f","srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F","srifle_EBR_F","srifle_GM6_camo_F","srifle_GM6_F","srifle_LRR_camo_F","srifle_LRR_F",
		 
			"arifle_MX_SW_Black_F","arifle_MX_SW_F","LMG_Mk200_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F",
			"MMG_02_sand_F","LMG_Zafir_F",
		 
			"arifle_Katiba_C_F","arifle_Katiba_F","arifle_Katiba_GL_F","arifle_Mk20_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F",
			"arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MX_Black_F","arifle_MX_F","arifle_MX_GL_Black_F",
			"arifle_MX_GL_F","arifle_MXC_Black_F","arifle_MXC_F","arifle_SDAR_F","arifle_TRG20_F","arifle_TRG21_F","arifle_TRG21_GL_F"
		]
	],
	[
		"ImFX_DAPE_lootItems",1,true,
		[
			"HandGrenade","MiniGrenade","B_IR_Grenade","O_IR_Grenade","I_IR_Grenade","1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell",
			"APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag",
			"DemoCharge_Remote_Mag","IEDLandBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDUrbanSmall_Remote_Mag",
			"SatchelCharge_Remote_Mag","SLAMDirectionalMine_Wire_Mag",
		 
			"B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_dgtl","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_rgr",
			"B_AssaultPack_sgg","B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_ocamo","B_FieldPack_oucamo","B_TacticalPack_blk",
			"B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo","B_TacticalPack_oli","B_Kitbag_cbr","B_Kitbag_mcamo",
			"B_Kitbag_sgg","B_Carryall_cbr","B_Carryall_khk","B_Carryall_mcamo","B_Carryall_ocamo","B_Carryall_oli","B_Carryall_oucamo",
			"B_Bergen_blk","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_sgg","B_HuntingBackpack","B_OutdoorPack_blk","B_OutdoorPack_blu",
		 
			"Rangefinder","NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR"
		]
	],
	/////////////////////////////////////// Misc Assets
	[
		"ImFX_Build_Mil_Tower",1,true,
		[
			"Land_BagBunker_Tower_F"
		]
	]
];

/////////////////////////////
// Cart processing //////////
/////////////////////////////
_hold = [_cartName,_immersionData,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): ImmersionFX.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};