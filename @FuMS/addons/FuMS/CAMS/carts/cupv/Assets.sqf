// Assets.sqf
// CUP Vehicles Version
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
_cartName = "cupv"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//  Water vehicles - Civ / General
	[
		"CAMS_H20_Boats_C",1,false,
		[
			// Civilian
			"CUP_C_Fishing_Boat_Chernarus","CUP_C_PBX_CIV","CUP_C_Zodiac_CIV"
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
		"CAMS_H20_Boats_W",1,false,
		[
			// Royal New Zealand Navy
			"CUP_B_Frigate_ANZAC",			
			
			// USMC
			"CUP_B_LCU1600_USMC","CUP_B_Seafox_USMC",			
			"CUP_B_USMC_DYN_MQ9"			
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,false,
		[
			// British Armed Forces
			"CUP_B_MK10_GB",		
		
			// USMC
			"CUP_B_RHIB_USMC","CUP_B_RHIB2Turret_USMC",
			"CUP_B_Zodiac_USMC"		
		]
	],
	[
		"CAMS_H20_ALL_W",0,true,
		[
			"CAMS_H20_Boats_W", "CAMS_H20_RubberDucks_W", "CAMS_H20_SDV_W"
		]
	],		
	
	///////////////////////////////// Water Vehicles - East
	[
		"CAMS_H20_Boats_E",1,false,
		[
			// Sahrani Liberation Army
			"CUP_O_LCVP_SLA","CUP_O_LCVP_VIV_SLA"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_PBX_RU",		

			// Sahrani Liberation Army
			"CUP_O_PBX_SLA"
		]
	],
	[
		"CAMS_H20_ALL_E",0,true,
		[
			"CAMS_H20_Boats_E", "CAMS_H20_RubberDucks_E", "CAMS_H20_SDV_E"
		]
	],		
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////// Air Vehicles /////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_C",1,false,
		[
			// Civilian
			"CUP_C_MI6A_RU","CUP_C_MI6T_RU",
			"CUP_C_Mi17_Civilian_RU","CUP_C_Mi17_VIV_RU",
			"CUP_C_SA330_Puma_HC1_ChernAvia"			
		]
	],	
	
	///////////////////////////////////////////////// Helicopters - West
	[
		"CAMS_Heli_Unarmed_W",1,false,
		[
			// British Armed Forces
			"CUP_B_AW159_Unarmed_RN_Blackcat","CUP_B_AW159_Unarmed_GB","CUP_B_AW159_Unarmed_RN_Grey"
		]
	],
	[
		"CAMS_Heli_Armed_W",1,false,
		[
			// West - ACR
			"CUP_B_Mi35_Dynamic_CZ","CUP_B_Mi35_Dynamic_CZ_Dark","CUP_B_Mi35_Dynamic_CZ_Des","CUP_B_Mi35_Dynamic_CZ_Tiger","CUP_B_Mi35_Dynamic_CZ_Ram",		
		
			// British Armed Forces
			"CUP_B_AH1_DL_BAF",	
			"CUP_B_AW159_RN_Blackcat","CUP_B_AW159_GB",
			"CUP_B_Merlin_HC3_Armed_GB","CUP_B_Merlin_HC3A_Armed_GB",
		
			// Chernarus Defense Forces
			"CUP_B_Mi24_D_Dynamic_CDF","CUP_B_Mi24_D_MEV_Dynamic_CDF",

			// USMC
			"CUP_B_AH1Z_Dynamic_USMC"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,false,
		[
			// West - ACR
			"CUP_B_Mi171Sh_Unarmed_ACR",		
		
			// British Armed Forces
			"CUP_B_Merlin_HC3_GB",
			"CUP_B_Merlin_HC3_VIV_GB",
			"CUP_B_Merlin_HC3A_GB",
			"CUP_B_Merlin_HC4_GB",		
		
			"CUP_B_SA330_Puma_HC1_BAF","CUP_B_SA330_Puma_HC2_BAF",		
			
			// Bundeswehr
			"CUP_B_CH53E_GER","CUP_B_CH53E_VIV_GER",		
		
			// Chernarus Defense Forces
			"CUP_B_MI6A_CDF","CUP_B_MI6T_CDF",		
		
			"CUP_B_Mi17_VIV_CDF","CUP_B_Mi17_medevac_CDF",			
		
			// USMC
			"CUP_B_CH53E_USMC","CUP_B_CH53E_VIV_USMC",		
			"CUP_B_MH60L_DAP_2x_USN",		
		
			"CUP_B_UH1Y_MEV_USMC","CUP_B_UH1Y_UNA_USMC"		
		]
	],
	
	[
		"CAMS_Heli_ArmedTransport_W",1,false,
		[
			// West - ACR
			"CUP_B_Mi171Sh_ACR",			
			
			// British Armed Forced
			"CUP_B_CH47F_GB","CUP_B_CH47F_VIV_GB","CUP_B_MH47E_GB",			
			
			// Bundeswehr
			"CUP_B_UH1D_GER_KSK",
			"CUP_B_UH1D_armed_GER_KSK","CUP_B_UH1D_armed_GER_KSK_Des",
			"CUP_B_UH1D_GER_KSK_Des",
			"CUP_B_UH1D_gunship_GER_KSK","CUP_B_UH1D_gunship_GER_KSK_Des",
			"CUP_B_UH1D_slick_GER_KSK","CUP_B_UH1D_slick_GER_KSK_Des",			
			
			// Chernarus Defense Forces
			"CUP_B_Mi17_CDF",
			
			// USMC
			"CUP_B_MH60L_DAP_4x_USN",

			"CUP_B_MH60S_USMC","CUP_B_MH60S_FFV_USMC","CUP_B_UH60S_USN",

			"CUP_B_UH1Y_Gunship_Dynamic_USMC"			
		]
	],
	
	/////////////////////////////////// Helicopters - East 

	[
		"CAMS_Heli_Unarmed_E",1,false,
		[
		
		
		]
	],
	[
		"CAMS_Heli_Armed_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_Ka50_DL_RU","CUP_O_Ka52_RU","CUP_O_Ka60_Grey_RU",
			"CUP_O_Mi24_P_Dynamic_RU","CUP_O_Mi24_V_Dynamic_RU",
			
			// CSAT
			"CUP_O_Ka60_GL_Blk_CSAT","CUP_O_Ka60_Blk_CSAT","CUP_O_Ka60_GL_Hex_CSAT",
			"CUP_O_Ka60_Hex_CSAT","CUP_O_Ka60_GL_Whale_CSAT","CUP_O_Ka60_Whale_CSAT",
			
			// CSAT (Pacific)
			"CUP_O_Mi24_Mk3_CSAT_T","CUP_O_Mi24_Mk4_CSAT_T",
			"CUP_O_Mi24_D_Dynamic_CSAT_T","CUP_O_Mi24_P_Dynamic_CSAT_T","CUP_O_Mi24_V_Dynamic_CSAT_T",
			
			// Sahrani Liberation Army
			"CUP_O_Ka50_DL_SLA","CUP_O_Mi24_D_Dynamic_SLA",	

			// Takistani Army
			"CUP_O_SUV_TKA"
		]
	],
	[
		"CAMS_Heli_Transport_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_MI6A_RU","CUP_O_MI6T_RU",
			
			"CUP_O_Mi8AMT_RU","CUP_O_Mi8_medevac_RU",
			
			// Chernarus Movement of the Red Star
			"CUP_O_MI6A_CHDKZ","CUP_O_MI6T_CHDKZ",			
			"CUP_O_Mi8_VIV_CHDKZ","CUP_O_Mi8_medevac_CHDKZ",
			
			// CSAT (Pacific)
			"CUP_O_MI6A_CSAT_T","CUP_O_MI6T_CSAT_T",			
			
			// Sahrani Liberation Army
			"CUP_O_MI6A_SLA","CUP_O_MI6T_SLA",
			"CUP_O_Mi8_VIV_SLA",
			
			// Takistani Army
			"CUP_O_MI6A_TKA","CUP_O_MI6T_TKA",
			"CUP_O_Mi17_VIV_TK"
		]
	],
	
	[
		"CAMS_Heli_ArmedTransport_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_Mi8_VIV_RU","CUP_O_Mi8_RU",
			
			// Chernarus Movement of the Red Star
			"CUP_O_Mi8_CHDKZ",		

			// Sahrani Liberation Army
			"CUP_O_Mi8_SLA_1","CUP_O_Mi8_SLA_2",
			"CUP_O_UH1H_SLA","CUP_O_UH1H_armed_SLA","CUP_O_UH1H_gunship_SLA","CUP_O_UH1H_slick_SLA",
			
			// Takistani Army
			"CUP_O_Mi17_TK",			
			"CUP_O_UH1H_TKA","CUP_O_UH1H_armed_TKA","CUP_O_UH1H_gunship_TKA","CUP_O_UH1H_slick_TKA"
		]
	],
	

	///////////////////////////////////////////////// Helicopters - Ind
	[
		"CAMS_Heli_Transport_I",1,false,
		[
		]
	],
	[
		"CAMS_Heli_ArmedTransport_I",1,false,
		[
		]
	],
	[
		"CAMS_Heli_Armed_I",1,false,
		[	
		]
	],
	
	[
		"CAMS_Plane_CAS_C",1,false,
		[
			// Civilian
			"CUP_C_C47_CIV",
			"CUP_C_Plane_Orbit",
			"CUP_C_DC3_CIV",
			"CUP_C_DC3_TanoAir_CIV",
			"CUP_C_A300_CIV",
			"CUP_C_B737_CIV",
			"CUP_C_Cessna_172_CIV_BLUE","CUP_C_Cessna_172_CIV_GREEN","CUP_C_Cessna_172_CIV",
			
			"CUP_C_AN2_CIV","CUP_C_DC3_ChernAvia_CIV",
			
			"CUP_C_AN2_AEROSCHROT_TK_CIV","CUP_C_AN2_AIRTAK_TK_CIV"
		]
	],
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,false,
		[
			// West - ACR
			"CUP_B_L39_CZ","CUP_B_L39_CZ_GREY",
			
			// British Armed Forces
			"CUP_B_C130J_GB","CUP_B_C130J_Cargo_GB",
			"CUP_B_F35B_BAF","CUP_B_F35B_Stealth_BAF",
			"CUP_B_GR9_DYN_GB",
			
			// Chernarus Defense Forces
			"CUP_B_Su25_Dyn_CDF","CUP_B_SU34_CDF",
			
			//Royal New Zealand Navy
			"CUP_B_P8Poseidon_RAAF",			
			
			// USMC
			"CUP_B_AV8B_DYN_USMC",
			"CUP_B_C130J_USMC","CUP_B_C130J_Cargo_USMC",
			"CUP_B_F35B_USMC","CUP_B_F35B_Stealth_USMC",
			"CUP_B_P8Poseidon_USN",
			
			"CUP_B_MV22_USMC","CUP_B_MV22_USMC_RAMPGUN","CUP_B_MV22_VIV_USMC"
		],
	[
		"CAMS_Plane_UAV_W",1,false,
		[
			// Chernarus Defense Forces
			"CUP_B_Pchela1T_CDF",
			
			// US Army
			"CUP_B_AH6X_USA",
			
			// US Army
			"CUP_B_USMC_DYN_MQ9"			
			
		]
	],
		
	],

	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_Su25_Dyn_RU",
			"CUP_O_SU34_RU",
			
			// CSAT
			"CUP_O_SU34_CSAT",

			// CSAT (Pacific)
			"CUP_O_Su25_Dyn_CSAT_T",	

			// Sahrani Liberation Army
			"CUP_O_C47_SLA","CUP_O_Su25_Dyn_SLA","CUP_O_SU34_SLA",
			
			// Takistani Army
			"CUP_O_AN2_TK","CUP_O_C130J_TKA","CUP_O_C130J_Cargo_TKA","CUP_O_L39_TK","CUP_O_Su25_Dyn_TKA"
		]
	],
	[
		"CAMS_Plane_UAV_E",1,false,
		[
			// Armed Forces of the Russian Fedearation
			"CUP_O_Pchela1T_RU"
		]
	],
	
	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,false,
		[
		]
	],
	[
		"CAMS_Plane_UAV_I",1,false,
		[
		]
	],
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,false,
		[
			// Civlian
			"CUP_C_Golf4_black_Civ","CUP_C_Golf4_blue_Civ","CUP_C_Golf4_green_Civ","CUP_C_Golf4_random_Civ",
			"CUP_C_Golf4_white_Civ","CUP_C_Golf4_yellow_Civ","CUP_C_Golf4_camo_Civ","CUP_C_Golf4_camodark_Civ",
			"CUP_C_Golf4_camodigital_Civ","CUP_C_Golf4_crowe_Civ","CUP_C_Golf4_kitty_Civ","CUP_C_Golf4_reptile_Civ",
			"CUP_C_Golf4_whiteblood_Civ",
			
			"CUP_C_Skoda_Blue_CIV","CUP_C_Skoda_Green_CIV","CUP_C_Skoda_Red_CIV","CUP_C_Skoda_White_CIV",
			
			"CUP_C_S1203_Militia_CIV",
			"CUP_C_Golf4_red_Civ",
			
			"CUP_C_Lada_White_CIV","CUP_LADA_LM_CIV","CUP_C_Lada_Red_CIV","CUP_C_Lada_GreenTK_CIV","CUP_C_Lada_TK2_CIV",
			
			"CUP_C_Volha_Blue_TKCIV","CUP_C_Volha_Gray_TKCIV","CUP_C_Volha_Limo_TKCIV",
			
			"CUP_O_Volha_SLA"
		],	
	],
	[
		"CAMS_Land_Offroad_C",1,false,
		[
			// Civilian
			"CUP_C_Datsun","CUP_C_Datsun_4seat","CUP_C_Datsun_Covered","CUP_C_Datsun_Plain","CUP_C_Datsun_Tubeframe",
			
			"CUP_C_LR_Transport_CTK",
			"CUP_C_UAZ_Unarmed_TK_CIV","CUP_C_UAZ_Open_TK_CIV","CUP_C_TK_Man_01"
		]
	],
	[
		"CAMS_Land_Transport_C",1,false,
		[
			// Civilian
			"CUP_C_Ikarus_Chernarus",
			"CUP_C_Ural_Civ_03","CUP_C_Ural_Open_Civ_03","CUP_C_Ural_Open_Civ_01","CUP_C_Ural_Civ_02","CUP_C_Ural_Open_Civ_02",
			
			"CUP_C_Ikarus_TKC",
			"CUP_C_V3S_Open_TKC","CUP_C_V3S_Covered_TKC","CUP_C_Ural_Civ_01"			
		]
	],
	[
		"CAMS_Land_SUV_C",1,false,
		[
			// Civilian
			"CUP_C_SUV_CIV","CUP_C_SUV_TK",
			
			// Takistani Army
			"CUP_O_SUV_TKA"
		]
	],
	[
		"CAMS_Land_Van_C",1,false,
		[
			// Civilian
			"CUP_C_S1203_CIV","CUP_C_S1203_Ambulance_CIV"
		]
	],
	[
		"CAMS_Land_Utility_C",1,false,
		[
			// Civilian
			"CUP_C_TowingTractor_CIV","CUP_C_Tractor_CIV","CUP_C_Tractor_Old_CIV"
		]
	],
	[
		"CAMS_Land_Quad_C",1,false,
		[
			// Civilian
			"CUP_C_TT650_CIV","CUP_C_TT650_RU","CUP_C_TT650_TK_CIV"
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
	],	

	////////////////////////////////////////////////////// West Vehicles
	[
		"CAMS_Land_ArmedOffroad_W",1,false,
		[
			// West - ACR
			"CUP_B_Dingo_GL_CZ_Des","CUP_B_Dingo_GL_CZ_Wdl","CUP_B_Dingo_CZ_Des","CUP_B_Dingo_CZ_Wdl",
			"CUP_B_HMMWV_AGS_GPK_ACR","CUP_B_HMMWV_DSHKM_GPK_ACR","CUP_B_HMMWV_M2_GPK_ACR",
			"CUP_B_LR_MG_CZ_W","CUP_B_CZ_Soldier_SL_WDL","CUP_B_CZ_Soldier_SL_WDL","CUP_B_CZ_SpecOps_DES","CUP_B_CZ_SpecOps_DES",
			"CUP_B_LR_Transport_CZ_D","CUP_B_LR_Transport_CZ_W",

			// British Armed Forces
			"CUP_B_BAF_Coyote_GMG_D","CUP_B_BAF_Coyote_GMG_W","CUP_B_BAF_Coyote_L2A1_D","CUP_B_BAF_Coyote_L2A1_W",
			"CUP_B_Jackal2_GMG_GB_W","CUP_B_Jackal2_L2A1_GB_D","CUP_B_Jackal2_GMG_GB_D","CUP_B_Jackal2_L2A1_GB_W",
			"CUP_B_LR_Special_GMG_GB_D","CUP_B_LR_Special_GMG_GB_W","CUP_B_LR_Special_M2_GB_D","CUP_B_LR_Special_M2_GB_W",
			"CUP_B_LR_MG_GB_D","CUP_B_LR_MG_GB_W",
			
			"CUP_B_Mastiff_GMG_GB_D","CUP_B_Mastiff_GMG_GB_W",
			"CUP_B_Mastiff_HMG_GB_D","CUP_B_Mastiff_HMG_GB_W",
			"CUP_B_Mastiff_LMG_GB_D","CUP_B_Mastiff_LMG_GB_W",
			
			"CUP_B_Ridgback_GMG_GB_D","CUP_B_Ridgback_GMG_GB_W",
			"CUP_B_Ridgback_HMG_GB_D",
			"CUP_B_Ridgback_LMG_GB_D","CUP_B_Ridgback_LMG_GB_W",
			
			"CUP_B_Wolfhound_GMG_GB_D","CUP_B_Wolfhound_GMG_GB_W",
			"CUP_B_Wolfhound_HMG_GB_D","CUP_B_Wolfhound_HMG_GB_W",
			"CUP_B_Wolfhound_LMG_GB_D","CUP_B_Wolfhound_LMG_GB_W",		

			// Bundeswehr
			"CUP_B_Dingo_GL_GER_Des","CUP_B_Dingo_GL_GER_Wdl",
			"CUP_B_Dingo_GER_Des","CUP_B_Dingo_GER_Wdl",
			"CUP_B_FENNEK_GER_Des","CUP_B_FENNEK_GER_Wdl",	

			// Chernarus Armed Forces
			"CUP_B_UAZ_AGS30_CDF","CUP_B_UAZ_MG_CDF","CUP_B_UAZ_METIS_CDF",
			"CUP_B_UAZ_Open_CDF","CUP_B_UAZ_SPG9_CDF",		

			// FIA
			"CUP_B_Jackal2_GMG_FIA","CUP_B_Jackal2_L2A1_FIA",
			
			// NATO (Pacific)
			"CUP_B_HMMWV_MK19_NATO_T","CUP_B_HMMWV_TOW_NATO_T",
			"CUP_B_HMMWV_Crows_M2_NATO_T","CUP_B_HMMWV_Crows_MK19_NATO_T",
			"CUP_B_HMMWV_M2_GPK_NATO_T",
			"CUP_B_HMMWV_M2_NATO_T","CUP_B_HMMWV_SOV_M2_NATO_T","CUP_B_HMMWV_SOV_NATO_T",
			"CUP_B_M1151_M2_NATO_T","CUP_B_M1151_Deploy_NATO_T",
			"CUP_B_M1151_Mk19_NATO_T","CUP_B_M1165_GMV_NATO_T","CUP_B_M1167_NATO_T",
			
			// US Army
			"CUP_B_HMMWV_MK19_USA","CUP_B_HMMWV_TOW_USA",

			"CUP_B_HMMWV_Crows_M2_USA","CUP_B_HMMWV_Crows_MK19_USA",
			"CUP_B_HMMWV_M2_GPK_USA","CUP_B_HMMWV_M2_USA",
			"CUP_B_HMMWV_SOV_M2_USA","CUP_B_HMMWV_SOV_USA",
			"CUP_B_M1151_M2_USA","CUP_B_M1151_Deploy_USA","CUP_B_M1151_Mk19_USA",
			"CUP_B_M1165_GMV_USA","CUP_B_M1167_USA",
			
			"CUP_B_RG31_Mk19_USA","CUP_B_RG31E_M2_USA","CUP_B_RG31_M2_USA","CUP_B_RG31_M2_GC_USA",
			
			"CUP_B_M1151_Deploy_WDL_USA","CUP_B_M1151_Mk19_WDL_USA","CUP_B_M1151_WDL_USA",
			"CUP_B_M1152_WDL_USA",
			"CUP_B_M1165_GMV_WDL_USA",
			"CUP_B_M1167_WDL_USA",
			"CUP_B_RG31_Mk19_OD_USA","CUP_B_RG31E_M2_OD_USA",
			"CUP_B_RG31_M2_OD_USA","CUP_B_RG31_M2_OD_GC_USA",	

			// USMC
			"CUP_B_HMMWV_M1114_USMC",
			"CUP_B_HMMWV_MK19_USMC",
			"CUP_B_HMMWV_TOW_USMC","CUP_B_HMMWV_M2_USMC",
			"CUP_B_M1151_M2_USMC","CUP_B_M1151_Deploy_USMC","CUP_B_M1151_Mk19_USMC",
			"CUP_B_M1165_GMV_USMC",
			"CUP_B_M1167_USMC",			

			"CUP_B_RG31_Mk19_OD_USMC","CUP_B_RG31E_M2_OD_USMC",
			"CUP_B_RG31_M2_OD_USMC","CUP_B_RG31_M2_OD_GC_USMC",
			
			"CUP_B_M1151_M2_DSRT_USMC","CUP_B_M1151_Deploy_DSRT_USMC",
			"CUP_B_M1151_Mk19_DSRT_USMC","CUP_B_M1165_GMV_DSRT_USMC",
			"CUP_B_M1167_DSRT_USMC",
			"CUP_B_RG31_Mk19_USMC","CUP_B_RG31E_M2_USMC",
			"CUP_B_RG31_M2_USMC","CUP_B_RG31_M2_GC_USMC"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,false,
		[
			// West - ACR
			"CUP_B_HMMWV_Ambulance_ACR",
			
			"CUP_B_LR_Ambulance_CZ_D","CUP_B_LR_Ambulance_CZ_W",
			
			// British Armed Forces
			"CUP_B_LR_Ambulance_GB_D","CUP_B_LR_Ambulance_GB_W",
			"CUP_B_LR_Transport_GB_D","CUP_B_LR_Transport_GB_W",
			
			// Chernarus Defense Forces
			"CUP_B_S1203_Ambulance_CDF",
			"CUP_B_UAZ_Unarmed_CDF",
			
			// NATO (Pacific) 
			"CUP_B_HMMWV_Ambulance_NATO_T","CUP_B_HMMWV_Transport_NATO_T",
			"CUP_B_HMMWV_Unarmed_NATO_T","CUP_B_HMMWV_Terminal_NATO_T",
			"CUP_B_M1151_NATO_T","CUP_B_M1152_NATO_T",
			
			// US Army
			"CUP_B_HMMWV_Transport_USA","CUP_B_HMMWV_Unarmed_USA",			
			
			"CUP_B_HMMWV_Terminal_USA",
			"CUP_B_M1151_USA","CUP_B_M1152_USA",			
			
			"CUP_B_M1151_M2_WDL_USA",

			// USMC
			"CUP_B_HMMWV_Ambulance_USMC",
			"CUP_B_HMMWV_Unarmed_USMC",
			"CUP_B_M1151_USMC",
			"CUP_B_M1152_USMC",
			"CUP_B_MTVR_USMC"

			"CUP_B_M1151_DSRT_USMC","CUP_B_M1152_DSRT_USMC"			
		]
	],
	[
		"CAMS_Land_UGV_Armed_W",1,false,
		[
			// West - ACR
			"CUP_B_UAZ_MG_ACR","CUP_B_UAZ_METIS_ACR","CUP_B_UAZ_SPG9_ACR","CUP_B_CZ_Soldier_WDL","CUP_B_CZ_Soldier_WDL"
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_W",1,false,
		[
			// US Army
			"CUP_B_M1030_USA",
			
			// USMC
			"CUP_B_M1030_USMC"
		]
	],
	[
		"CAMS_Land_Transport_W",1,false,
		[
			// West - ACR
			"CUP_B_BMP2_AMB_CZ_Des","CUP_B_BMP2_AMB_CZ",
			
			// British Armed Forces
			"CUP_B_FV432_GB_Ambulance",
			
			// Chernarus Defense Forces
			"CUP_B_BMP2_AMB_CDF",
			
			// Chernarus Defense Forces
			"CUP_B_Kamaz_CDF",
			"CUP_B_Kamaz_Open_CDF",
			
			"CUP_B_Ural_CDF",
			"CUP_B_Ural_Open_CDF",
			
			// US Army
			"CUP_B_M1133_MEV_Desert_Slat","CUP_B_M1133_MEV_Desert",
			"CUP_B_M1133_MEV_Woodland_Slat","CUP_B_M1133_MEV_Woodland",
			"CUP_B_M1135_ATGMV_Desert_Slat","CUP_B_M1135_ATGMV_Desert",
			"CUP_B_M1135_ATGMV_Woodland_Slat","CUP_B_M1135_ATGMV_Woodland",

			"CUP_B_HMMWV_Ambulance_USA",	

			// US Army
			"CUP_B_MTVR_USA",
			
			// USMC
			"CUP_B_AAV_Unarmed_USMC"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,false,
		[
			// West - ACR
			"CUP_B_T810_Reammo_CZ_WDL","CUP_B_T810_Reammo_CZ_DES",	
			"CUP_B_T810_Refuel_CZ_DES","CUP_B_T810_Refuel_CZ_WDL",
			"CUP_B_T810_Repair_CZ_DES","CUP_B_T810_Repair_CZ_WDL",

			"CUP_B_TowingTractor_CZ",
			
			// British Armed Forces
			"CUP_B_MTVR_Ammo_BAF_WOOD","CUP_B_MTVR_Ammo_BAF_DES",
			"CUP_B_MTVR_Refuel_BAF_DES","CUP_B_MTVR_Refuel_BAF_WOOD",
			"CUP_B_MTVR_Repair_BAF_DES","CUP_B_MTVR_Repair_BAF_WOOD",
			
			"CUP_B_TowingTractor_GB",	
			
			// Chernarus Defense Forces
			"CUP_B_Kamaz_Reammo_CDF","CUP_B_Kamaz_Refuel_CDF",
			"CUP_B_Kamaz_Repair_CDF",
			
			"CUP_B_Tractor_CDF",
			
			"CUP_B_Ural_Reammo_CDF",
			"CUP_B_Ural_Refuel_CDF","CUP_B_Ural_Repair_CDF",
			
			// NATO
			"CUP_B_TowingTractor_NATO",
			
			// US Army
			"CUP_B_MTVR_Ammo_USA","CUP_B_MTVR_Refuel_USA","CUP_B_MTVR_Repair_USA",
			
			"CUP_B_TowingTractor_USA",
			
			// USMC
			"CUP_B_MTVR_Ammo_USMC","CUP_B_MTVR_Refuel_USMC","CUP_B_MTVR_Repair_USMC",
			
			"CUP_B_TowingTractor_USMC"
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,false,
		[
			// West - ACR
			"CUP_B_BRDM2_CZ","CUP_B_BRDM2_CZ_Des","CUP_B_BRDM2_HQ_CZ","CUP_B_BRDM2_HQ_CZ_Des",
			"CUP_B_BMP2_CZ","CUP_B_BMP2_CZ_Des","CUP_B_BMP_HQ_CZ_Des","CUP_B_BMP_HQ_CZ",
			"CUP_B_T810_Armed_CZ_DES","CUP_B_T810_Armed_CZ_WDL",

			// British Armed Forces
			"CUP_B_FV432_Bulldog_GB_D_RWS","CUP_B_FV432_Bulldog_GB_W_RWS","CUP_B_FV432_Bulldog_GB_D","CUP_B_FV432_Bulldog_GB_W",
			"CUP_B_FV432_GB_GPMG","CUP_B_FV432_Mortar",
			"CUP_B_FV510_GB_D","CUP_B_FV510_GB_D_SLAT","CUP_B_FV510_GB_W_SLAT","CUP_B_FV510_GB_W",
			"CUP_B_MCV80_GB_D","CUP_B_MCV80_GB_D_SLAT","CUP_B_MCV80_GB_W_SLAT","CUP_B_MCV80_GB_W",
			"CUP_B_MTVR_BAF_WOOD","CUP_B_MTVR_BAF_DES",

			// Chernarus Defense Forces
			"CUP_B_BMP2_CDF","CUP_B_BMP_HQ_CDF",
			"CUP_B_BRDM2_CDF","CUP_B_BRDM2_ATGM_CDF","CUP_B_BRDM2_HQ_CDF",
			"CUP_B_BTR60_CDF",
			"CUP_B_BTR80_CDF","CUP_B_BTR80A_CDF",
			"CUP_B_MTLB_pk_CDF","CUP_B_MTLB_pk_Winter_CDF"	

			// FIA
			"CUP_B_BTR60_FIA",
			"CUP_B_BTR80_FIA","CUP_B_BTR80A_FIA",
			"CUP_B_MTLB_pk_FIA",
			
			// NATO (Pacific)
			"CUP_B_M2Bradley_NATO_T","CUP_B_M2A3Bradley_NATO_T",
			
			// US Army
			"CUP_B_M1126_ICV_M2_Desert_Slat","CUP_B_M1126_ICV_M2_Desert",
			"CUP_B_M1126_ICV_M2_Woodland_Slat","CUP_B_M1126_ICV_M2_Woodland",
			"CUP_B_M1126_ICV_MK19_Desert_Slat","CUP_B_M1126_ICV_MK19_Desert",
			"CUP_B_M1126_ICV_MK19_Woodland_Slat","CUP_B_M1126_ICV_MK19_Woodland",
			"CUP_B_M1128_MGS_Desert_Slat","CUP_B_M1128_MGS_Desert",
			"CUP_B_M1128_MGS_Woodland_Slat","CUP_B_M1128_MGS_Woodland",
			"CUP_B_M113_USA",
			"CUP_B_M1130_CV_M2_Desert_Slat","CUP_B_M1130_CV_M2_Desert",
			"CUP_B_M1130_CV_M2_Woodland_Slat","CUP_B_M1130_CV_M2_Woodland",
			
			"CUP_B_M113_desert_USA","CUP_B_M113_Med_USA",
			"CUP_B_M2Bradley_USA_D","CUP_B_M2Bradley_USA_W",
			"CUP_B_M2A3Bradley_USA_D","CUP_B_M2A3Bradley_USA_W",
			"CUP_B_M7Bradley_USA_D","CUP_B_M7Bradley_USA_W",
			
			// USMC
			"CUP_B_AAV_Unarmed_USMC",
			"CUP_B_AAV_USMC",
			"CUP_B_LAV25_USMC","CUP_B_LAV25_desert_USMC",
			"CUP_B_LAV25M240_USMC","CUP_B_LAV25M240_desert_USMC","CUP_B_LAV25M240_green",
			"CUP_B_LAV25_green",
			"CUP_B_LAV25_HQ_USMC","CUP_B_LAV25_HQ_desert_USMC","CUP_B_LAV25_HQ_green"
		]
	],
	[
		"CAMS_Land_Tank_W",1,false,
		[
			// West - ACR
			"CUP_B_T72_CZ",
			
			// British Armed Forces
			"CUP_B_Challenger2_Desert_BAF","CUP_B_Challenger2_Snow_BAF",
			"CUP_B_Challenger2_2CS_BAF","CUP_B_Challenger2_2CW_BAF",
			"CUP_B_Challenger2_2CD_BAF",
			"CUP_B_Challenger2_Woodland_BAF",		

			// Bundeswehr
			"CUP_B_Leopard2A6_GER","CUP_B_Leopard2A6DST_GER",
			
			// Chernarus Defense Forces
			"CUP_B_T72_CDF",

			// CTRG
			"CUP_B_Challenger2_Sand_CTRG","CUP_B_Challenger2_Green_CTRG",	

			// NATO
			"CUP_B_Challenger2_NATO",
			
			// NATO (Pacific)
			"CUP_B_M1A1_NATO_T","CUP_B_M1A_TUSK_NATO_T",
			
			// USMC
			"CUP_B_M1A1_DES_USMC","CUP_B_M1A1_Woodland_USMC",
			"CUP_B_M1A2_TUSK_MG_DES_USMC","CUP_B_M1A2_TUSK_MG_USMC",
			"CUP_B_M60A3_USMC","CUP_B_M60A3_TTS_USMC"			
		]
	],
	[
		"CAMS_Land_Artillery_W",1,false,
		[
			// West - ACR
			"CUP_B_RM70_CZ"
			
			// British Armed Forced
			"CUP_B_M270_DPICM_BAF_WOOD","CUP_B_M270_DPICM_BAF_DES",
			"CUP_B_M270_HE_BAF_DES","CUP_B_M270_HE_BAF_WOOD",
			
			// Chernarus Defnese Forces
			"CUP_B_BM21_CDF",
			
			// US Army
			"CUP_B_M1129_MC_MK19_Desert_Slat","CUP_B_M1129_MC_MK19_Desert",
			"CUP_B_M1129_MC_MK19_Woodland_Slat","CUP_B_M1129_MC_MK19_Woodland",
			"CUP_B_M270_DPICM_USA","CUP_B_M270_HE_USA",

			// USMC
			"CUP_B_M270_DPICM_USMC","CUP_B_M270_HE_USMC"			
		]
	],
	[
		"CAMS_Land_AA_W",1,false,
		[
			// Chenaurus Defense Forces
			"CUP_B_UAZ_AA_CDF",
			"CUP_B_Ural_ZU23_CDF",
			"CUP_B_ZSU23_CDF","CUP_B_ZSU23_Afghan_CDF"

			// NATO (Pacific)
			"CUP_B_HMMWV_Avenger_NATO_T","CUP_B_M6LineBacker_NATO_T",
			
			// US Army
			"CUP_B_HMMWV_Avenger_USA","CUP_B_M163_USA","CUP_B_M6LineBacker_USA_D","CUP_B_M6LineBacker_USA_W",
			
			// USMC 
			"CUP_B_HMMWV_Avenger_USMC"			
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
			// Chernarus Movement of the Red Star
			"CUP_O_UAZ_AGS30_CHDKZ","CUP_O_UAZ_MG_CHDKZ","CUP_O_UAZ_METIS_CHDKZ","CUP_O_UAZ_SPG9_CHDKZ",
			
			// CSAT
			"CUP_O_UAZ_AGS30_CSAT","CUP_O_UAZ_MG_CSAT","CUP_O_UAZ_METIS_CSAT",
			"CUP_O_UAZ_SPG9_CSAT",
			
			// Sahrani Liberation Army
			"CUP_O_UAZ_AGS30_SLA","CUP_O_UAZ_MG_SLA","CUP_O_UAZ_METIS_SLA","CUP_O_UAZ_SPG9_SLA",
			
			// Takistani Army
			"CUP_O_LR_MG_TKA","CUP_O_LR_SPG9_TKA",
			"CUP_O_UAZ_AGS30_TKA","CUP_O_UAZ_MG_TKA",
			"CUP_O_UAZ_METIS_TKA","CUP_O_UAZ_SPG9_TKA",		

			// Takistani Militia
			"CUP_O_Hilux_AGS30_TK_INS","CUP_O_Hilux_BMP1_TK_INS","CUP_O_Hilux_btr60_TK_INS",
			"CUP_O_Hilux_DSHKM_TK_INS","CUP_O_Hilux_igla_TK_INS","CUP_O_Hilux_M2_TK_INS",
			"CUP_O_Hilux_metis_TK_INS","CUP_O_Hilux_MLRS_TK_INS","CUP_O_Hilux_podnos_TK_INS",
			"CUP_O_Hilux_SPG9_TK_INS","CUP_O_Hilux_UB32_TK_INS","CUP_O_Hilux_zu23_TK_INS",
			"CUP_O_Hilux_armored_AGS30_TK_INS","CUP_O_Hilux_armored_BMP1_TK_INS","CUP_O_Hilux_armored_BTR60_TK_INS",
			"CUP_O_Hilux_armored_DSHKM_TK_INS","CUP_O_Hilux_armored_igla_TK_INS","CUP_O_Hilux_armored_M2_TK_INS",
			"CUP_O_Hilux_armored_metis_TK_INS","CUP_O_Hilux_armored_MLRS_TK_INS","CUP_O_Hilux_armored_podnos_TK_INS",
			"CUP_O_Hilux_armored_SPG9_TK_INS","CUP_O_Hilux_armored_UB32_TK_INS","CUP_O_Hilux_armored_zu23_TK_INS",
			"CUP_O_LR_MG_TKM","CUP_O_LR_SPG9_TKM"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,false,
		[
			// Chernarus Movement of the Red Star
			"CUP_O_UAZ_Unarmed_CHDKZ","CUP_O_UAZ_Open_CHDKZ",

			// CSAT
			"CUP_O_UAZ_Unarmed_CSAT","CUP_O_UAZ_Open_CSAT",
			
			// Sahrani Liberation Army
			"CUP_O_UAZ_Unarmed_SLA","CUP_O_UAZ_Militia_SLA",
			
			// Takistani Army
			"CUP_O_LR_Transport_TKA","CUP_O_UAZ_Unarmed_TKA","CUP_O_UAZ_Open_TKA",
			
			// Takistani Militia
			"CUP_O_Hilux_unarmed_TK_INS","CUP_O_Hilux_armored_unarmed_TK_INS"
		]
	],
	[
		"CAMS_Land_UGV_Armed_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_E",1,false,
		[
			// Chernarus Movement of the Red Star
			"CUP_O_TT650_CHDKZ",	

			// Takistani Army
			"CUP_O_TT650_TKA"
		]
	],

	[
		"CAMS_Land_Transport_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_BMP2_AMB_RU","CUP_O_GAZ_Vodnik_MedEvac_RU"

			"CUP_O_Kamaz_RU","CUP_O_Kamaz_Open_RU",
			
			"CUP_O_UAZ_Unarmed_RU","CUP_O_UAZ_AMB_RU",

			"CUP_O_Ural_RU","CUP_O_Ural_Open_RU",

			// Chernarus Movement of the Red Star
			"CUP_O_BMP2_AMB_CHDKZ",

			"CUP_O_Ural_CHDKZ","CUP_O_Ural_Open_CHDKZ",
			
			// CSAT
			"CUP_O_BMP2_AMB_CSAT",
			
			// CSAT (Pacific)
			"CUP_O_BMP2_AMB_CSAT_T",	

			// Sahrani Liberation Army
			"CUP_O_BMP2_AMB_sla",
			
			"CUP_O_Ural_SLA","CUP_O_Ural_Open_SLA",

			// Takistani Army
			"CUP_O_BMP2_AMB_TKA","CUP_O_BTR40_TKA",
			"CUP_O_M113_Med_TKA",
			
			"CUP_O_LR_Ambulance_TKA",
			"CUP_O_V3S_Open_TKA","CUP_O_V3S_Covered_TKA",
			"CUP_O_Ural_TKA","CUP_O_Ural_Open_TKA",
			
			// Takistani Militia
			"CUP_O_BTR40_TKM",
			"CUP_O_V3S_Open_TKM","CUP_O_V3S_Covered_TKM"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_Kamaz_Reammo_RU","CUP_O_Kamaz_Refuel_RU",
			"CUP_O_Kamaz_Repair_RU",
			
			"CUP_O_TowingTractor_RU",	

			"CUP_O_Ural_Reammo_RU","CUP_O_Ural_Refuel_RU","CUP_O_Ural_Repair_RU",			

			// Chernarus Movement of the Red Star
			"CUP_O_Ural_Reammo_CHDKZ",
			"CUP_O_Ural_Empty_CHDKZ",
			"CUP_O_Ural_Refuel_CHDKZ","CUP_O_Ural_Repair_CHDKZ",
			
			// CSAT
			"CUP_O_TowingTractor_CSAT",	

			// Sahrani Liberation Army
			"CUP_O_Ural_Reammo_SLA","CUP_O_Ural_Empty_SLA","CUP_O_Ural_Refuel_SLA","CUP_O_Ural_Repair_SLA",	

			"CUP_O_Tractor_SLA",	

			// Takistani Army
			"CUP_O_V3S_Rearm_TKA","CUP_O_V3S_Refuel_TKA","CUP_O_V3S_Repair_TKA",
			"CUP_O_Ural_Reammo_TKA","CUP_O_Ural_Empty_TKA","CUP_O_Ural_Refuel_TKA","CUP_O_Ural_Repair_TKA",
			
			"CUP_O_Tractor_Old_TKA",
			
			//Takistani Militia
			"CUP_O_V3S_Rearm_TKM","CUP_O_V3S_Refuel_TKM","CUP_O_V3S_Repair_TKM"
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_BMP2_RU","CUP_O_BMP_HQ_RU","CUP_O_BMP3_RU",
			"CUP_O_BRDM2_RUS","CUP_O_BRDM2_ATGM_RUS","CUP_O_BRDM2_HQ_RUS",
			"CUP_O_BTR60_Green_RU","CUP_O_BTR60_Winter_RU","CUP_O_BTR60_RU",
			"CUP_O_BTR80_CAMO_RU","CUP_O_BTR80_DESERT_RU","CUP_O_BTR80_GREEN_RU","CUP_O_BTR80_WINTER_RU",
			"CUP_O_BTR80A_CAMO_RU","CUP_O_BTR80A_DESERT_RU","CUP_O_BTR80A_GREEN_RU","CUP_O_BTR80A_WINTER_RU",
			"CUP_O_BTR90_RU","CUP_O_BTR90_HQ_RU",
			"CUP_O_GAZ_Vodnik_PK_RU","CUP_O_GAZ_Vodnik_AGS_RU","CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_GAZ_Vodnik_MedEvac_RU",
			"CUP_O_MTLB_pk_WDL_RU","CUP_O_MTLB_pk_Green_RU","CUP_O_MTLB_pk_Winter_RU",
			
			"CUP_O_UAZ_AGS30_RU","CUP_O_UAZ_MG_RU","CUP_O_UAZ_METIS_RU","CUP_O_UAZ_Open_RU","CUP_O_UAZ_SPG9_RU",

			// Chernarus Movement of the Red Star
			"CUP_O_BMP2_CHDKZ","CUP_O_BMP_HQ_CHDKZ",
			"CUP_O_BRDM2_CHDKZ","CUP_O_BRDM2_ATGM_CHDKZ",
			"CUP_O_BRDM2_HQ_CHDKZ","CUP_O_BTR60_CHDKZ",
			"CUP_O_BTR80_CHDKZ","CUP_O_BTR80A_CHDKZ",
			"CUP_O_MTLB_pk_ChDKZ",	

			// CSAT
			"CUP_O_BMP1_CSAT","CUP_O_BMP1P_CSAT",
			"CUP_O_BMP2_CSAT","CUP_O_BMP2_ZU_CSAT",
			"CUP_O_BMP_HQ_CSAT",
			"CUP_O_BRDM2_CSAT","CUP_O_BRDM2_ATGM_CSAT","CUP_O_BRDM2_HQ_CSAT",
			"CUP_O_BTR60_CSAT",
			"CUP_O_BTR80_CSAT","CUP_O_BTR80A_CSAT",
			
			// CSAT (Pacific)
			"CUP_O_BMP1_CSAT_T","CUP_O_BMP1P_CSAT_T",
			"CUP_O_BMP2_CSAT_T","CUP_O_BMP2_ZU_CSAT_T",
			"CUP_O_BMP_HQ_CSAT_T","CUP_O_BMP3_CSAT_T",
			"CUP_O_BRDM2_CSAT_T","CUP_O_BRDM2_ATGM_CSAT_T","CUP_O_BRDM2_HQ_CSAT_T",
			"CUP_O_BTR80_CSAT_T","CUP_O_BTR80A_CSAT_T",
			
			// Sahrani Liberation Army
			"CUP_O_BMP2_SLA","CUP_O_BMP_HQ_sla",
			"CUP_O_BRDM2_SLA","CUP_O_BRDM2_ATGM_SLA","CUP_O_BRDM2_HQ_SLA",
			"CUP_O_BTR60_SLA",
			"CUP_O_BTR80_SLA","CUP_O_BTR80A_SLA",
			"CUP_O_MTLB_pk_SLA",
			
			// Takistani Army
			"CUP_O_BMP1_TKA","CUP_O_BMP1P_TKA",
			"CUP_O_BMP2_TKA","CUP_O_BMP2_ZU_TKA",
			"CUP_O_BMP_HQ_TKA",
			"CUP_O_BRDM2_TKA","CUP_O_BRDM2_ATGM_TKA","CUP_O_BRDM2_HQ_TKA",
			"CUP_O_BTR40_MG_TKA",
			"CUP_O_M113_TKA",
			"CUP_O_MTLB_pk_TKA",
			
			// Takistani Military
			"CUP_O_BTR40_MG_TKM","CUP_O_MTLB_pk_TK_MILITIA"
		]
	],
	[
		"CAMS_Land_Tank_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_T72_RU","CUP_O_T90_RU",

			// Chernarus Movement of the Red Star
			"CUP_O_T55_CHDKZ","CUP_O_T72_CHDKZ",
			
			// CSAT
			"CUP_O_T55_CSAT","CUP_O_T72_CSAT",
			
			// CSAT (Pacific)
			"CUP_O_T55_CSAT_T","CUP_O_T72_CSAT_T",
			
			// Sahrani Liberation Army
			"CUP_O_T55_SLA","CUP_O_T72_SLA",
			
			// Takistani Army
			"CUP_O_T34_TKA","CUP_O_T55_TK","CUP_O_T72_TKA"
		]
	],
	[
		"CAMS_Land_AA_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_2S6_RU","CUP_O_2S6M_RU",
			"CUP_O_UAZ_AA_RU",
			"CUP_O_Ural_ZU23_RU",
			
			// Chernarus Movement of the Red Star
			"CUP_O_Datsun_AA","CUP_O_Datsun_AA_Random",
			"CUP_O_UAZ_AA_CHDKZ","CUP_O_Ural_ZU23_CHDKZ",
			"CUP_O_ZSU23_ChDKZ","CUP_O_ZSU23_Afghan_ChDKZ",
			
			// CSAT
			"CUP_O_UAZ_AA_CSAT","CUP_O_ZSU23_CSAT","CUP_O_ZSU23_Afghan_CSAT",	

			// Sahrani Liberation Army
			"CUP_O_UAZ_AA_SLA","CUP_O_Ural_ZU23_SLA","CUP_O_ZSU23_SLA","CUP_O_ZSU23_Afghan_SLA",
			
			// Takistani Army
			"CUP_O_LR_AA_TKA",
			"CUP_O_UAZ_AA_TKA",
			"CUP_O_Ural_ZU23_TKA",
			"CUP_O_ZSU23_TK","CUP_O_ZSU23_Afghan_TK",	

			// Takistani Militia
			"CUP_O_LR_AA_TKM","CUP_O_Ural_ZU23_TKM"
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,false,
		[
			// Armed Forces of the Russian Federation
			"CUP_O_BM21_RU",			

			// Chernarus Movement of the Red Star
			"CUP_O_BM21_CHDKZ",		

			// Sahrani Liberation Army
			"CUP_O_BM21_SLA",
			
			// Takistani Army
			"CUP_O_BM21_TKA"
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
		"CAMS_Land_ArmedOffroad_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,false,
		[
	],
	[
		"CAMS_Land_UGV_Armed_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Transport_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Tank_I",1,false,
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

	////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////// Misc Content ////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////
	// If it doesnt have a classname, I suggest you use the ImmersionFX files just for continuity  //
	// but it doesn't really matter where they are unless you are going to distribute the files   //
	////////////////////////////////////////////////////////////////////////////////////////////////
	[
		"CAMS_Wreck_Hist",1,false,
		[
		]
	],
	[
		"CAMS_Wreck_Car",1,false,
		[
		]
	],
	[
		"CAMS_Wreck_Truck",1,false,
		[
		]
	],
	[
		"CAMS_Wreck_Mil",1,false,
		[
		]
	],
	[
		"CAMS_Wreck_Tank",1,false,
		[
		]
	],
	[
		"CAMS_Wreck_Heli",1,false,
		[
			"CUP_MH47E_Wreck2","CUP_MH47E_Wreck"
		]
	],
	[
		"CAMS_Wreck_Plane",1,false,
		[
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
