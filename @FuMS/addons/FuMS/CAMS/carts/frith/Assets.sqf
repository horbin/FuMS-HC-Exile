// Assets.sqf
// Friths
// TheOneWhoKnocks
// Overwrites the global variables used by FuMS to generate various elements of the system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

/*





*/



private ["_cartContents","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "Friths"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;			// Setting this to true adds additional info to log for troubleshooting purposes


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
			"U_C_Scientist","U_OrestesBody","U_Rangemaster","U_NikosAgedBody","U_NikosBody","U_Competitor",
			
			// Underwear
			"U_FRITH_RUIN_undbld_ref",
			"U_FRITH_RUIN_undfab_ref",
			"U_FRITH_RUIN_undltr_ref",

			// Workers
			"U_FRITH_RUIN_WKR_dark",
			"U_FRITH_RUIN_WKR_lite",
			"U_FRITH_RUIN_WKR_tan"

		]
	],


	//////////////////////////////////////////// Uniforms - Independant
	
	[
		"CAMS_U_Soldier_I",1,true,
		[


			// Combat Rags Fabric
			"U_FRITH_RUIN_sdr_fab",
			"U_FRITH_RUIN_sdr_fab_rs",
			"U_FRITH_RUIN_sdr_fabbrn",
			"U_FRITH_RUIN_sdr_fabbrn_rs",
			"U_FRITH_RUIN_sdr_fabdpm",
			"U_FRITH_RUIN_sdr_fabdpm_rs",
			"U_FRITH_RUIN_sdr_fabgrn",
			"U_FRITH_RUIN_sdr_fabgrn_rs",
			"U_FRITH_RUIN_sdr_fabkak",
			"U_FRITH_RUIN_sdr_fabkak_rs",
			"U_FRITH_RUIN_sdr_fabmtp",
			"U_FRITH_RUIN_sdr_fabmtp_rs",
			"U_FRITH_RUIN_sdr_faboli",
			"U_FRITH_RUIN_sdr_faboli_rs",
			"U_FRITH_RUIN_sdr_fabrus",
			"U_FRITH_RUIN_sdr_fabrus_rs",
			"U_FRITH_RUIN_sdr_fabtan",
			"U_FRITH_RUIN_sdr_fabtan_rs",

			// Combat Rags Leather
			"U_FRITH_RUIN_sdr_ltr",
			"U_FRITH_RUIN_sdr_ltr_rs",
			"U_FRITH_RUIN_sdr_ltrdrk",
			"U_FRITH_RUIN_sdr_ltrdrk_rs",
			"U_FRITH_RUIN_sdr_ltrred",
			"U_FRITH_RUIN_sdr_ltrred_rs",



			// Combat Rags T-shirt
			"U_FRITH_RUIN_SDR_Tshirt_blk_boy",
			"U_FRITH_RUIN_SDR_Tshirt_blk_cyp",
			"U_FRITH_RUIN_SDR_Tshirt_blk_drj",
			"U_FRITH_RUIN_SDR_Tshirt_cry",
			"U_FRITH_RUIN_SDR_Tshirt_oli",
			"U_FRITH_RUIN_SDR_Tshirt_oli_bet",
			"U_FRITH_RUIN_SDR_Tshirt_wht",
			"U_FRITH_RUIN_SDR_Tshirt_wht_fpk",
			"U_FRITH_RUIN_SDR_Tshirt_wht_stk",
			"U_FRITH_RUIN_SDR_Tshirt_wht_zap",


			// Combat Rags T-shirt
			"U_FRITH_RUIN_TSH_blk_boy",
			"U_FRITH_RUIN_TSH_blk_cyp",
			"U_FRITH_RUIN_TSH_blk_drj",
			"U_FRITH_RUIN_TSH_cry",
			"U_FRITH_RUIN_TSH_oli",
			"U_FRITH_RUIN_TSH_oli_bet",
			"U_FRITH_RUIN_TSH_wht",
			"U_FRITH_RUIN_TSH_wht_fpk",
			"U_FRITH_RUIN_TSH_wht_stk",
			"U_FRITH_RUIN_TSH_wht_zap"
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,true,
		[
				
			// Combat officer
			"U_FRITH_RUIN_coffdpm",
			"U_FRITH_RUIN_coffgrn",
			"U_FRITH_RUIN_cofftan",

			// Officer Jacket
			"U_FRITH_RUIN_offdpm",
			"U_FRITH_RUIN_offgrn",
			"U_FRITH_RUIN_offtan"
		]
	],
	[
		"CAMS_U_Ghillie_I",1,true,
		[
			// Combat Sniper
			"U_FRITH_RUIN_SDR_snip_bld",
			"U_FRITH_RUIN_SDR_snip_crow",
			"U_FRITH_RUIN_SDR_snip_hawk"
		]
	],
	[
		"CAMS_U_Aviation_I",1,false,
		[
		]
	],
	[
		"CAMS_U_Wetsuit_I",1,false,
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
		"CAMS_V_Bandolliers",1,false,
		[
			// Light Plate Carrier
			"FRITH_ruin_vestia_lite_ghm",
			"FRITH_ruin_vestia_lite_grn",
			"FRITH_ruin_vestia_lite_ltr",
			"FRITH_ruin_vestia_lite_nja",
			"FRITH_ruin_vestia_lite_tar"
		]
	],
	[
		"CAMS_V_Chestrig",1,false,
		[
			// Light Plate Carrier
			"FRITH_ruin_vestia_ghm",
			"FRITH_ruin_vestia_grn",
			"FRITH_ruin_vestia_ltr",
			"FRITH_ruin_vestia_nja",
			"FRITH_ruin_vestia_tar"
		]
	],
	/*
	[
		"CAMS_V_Vests_W",1,false,
		[
			// West - CIV?
		]
	],
	[
		"CAMS_V_Vests_E",1,false,
		[			
		]
	],
	[
		"CAMS_V_Vests",0,true,
		[
			"CAMS_V_Vests_W","CAMS_V_Vests_E"
		]
	],
	*/
	[
		"CAMS_V_Harness",1,false,
		[
			// Plate Carrier GL
			"FRITH_ruin_vestiaGL_ghm",
			"FRITH_ruin_vestiaGL_grn",
			"FRITH_ruin_vestiaGL_ltr",
			"FRITH_ruin_vestiaGL_nja",
			"FRITH_ruin_vestiaGL_tar"
		]
	],
	[
		"CAMS_V_Plate",1,false,
		[		
			// Plate Carrier GL Fabric
			"FRITH_ruin_vestiaGL_ghmchk",
			"FRITH_ruin_vestiaGL_grnmtp",
			"FRITH_ruin_vestiaGL_ltrmtp",
			"FRITH_ruin_vestiaGL_njadpm",
			"FRITH_ruin_vestiaGL_tartar"		
		]
	],
	[
		"CAMS_V_Rebreather",1,false,
		[
		]
	],
	[
		"CAMS_V_All",0,true,
		[
			"CAMS_V_Bandolliers", "CAMS_V_Chestrig", "CAMS_V_Vests", "CAMS_V_Harness", "CAMS_V_Plate"
		]
	],
	/*
		// Head/Hat items
	[
		"CAMS_H_Caps_W",1,false,
		[
		

		
		]
	],
	[
		"CAMS_H_Caps_E",1,false,
		[
		]
	],	[
		"CAMS_H_Caps",0,true,
		[
			"CAMS_H_Caps_W","CAMS_H_Caps_E"
		]
	],	
	*/
	[
		"CAMS_H_RegHelmet_W",1,false,////////////////////////////////////////////////////////
		[	
			"FRITH_ruin_modhat_ltr",
			"FRITH_ruin_modhat_ltrpntblk",
			"FRITH_ruin_modhat_ltrpntgrn",
			"FRITH_ruin_modhat_ltrpntred",
			"FRITH_ruin_modhat_ltrpntwht"
		]
	],
	[
		"CAMS_H_LightHelmet_W",1,false,///////////////////////////////////////////////////////
		[
			"FRITH_ruin_modhat_fabaaf",
			"FRITH_ruin_modhat_fabdes",
			"FRITH_ruin_modhat_fabdpm",
			"FRITH_ruin_modhat_fabflw",
			"FRITH_ruin_modhat_fabjap",
			"FRITH_ruin_modhat_fabmtp",
			"FRITH_ruin_modhat_fabrus",
			"FRITH_ruin_modhat_fabtar"
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
		"CAMS_H_RegHelmet_E",1,false,/////////////////////////////////////////////////////////
		[
			// East - NVA
		]
	],
	[
		"CAMS_H_RegHelmet",0,true,
		[
			"CAMS_H_RegHelmet_W","CAMS_H_RegHelmet_E"
		]
	],
	/*
	[
		"CAMS_H_Boonie_W",1,false,
		[
		]
	],
	[
		"CAMS_H_Boonie_E",1,false,
		[	
		]
	],	[
		"CAMS_H_Boonie",0,true,
		[
			"CAMS_H_Boonie_W","CAMS_H_Boonie_E"
		]
	],	
	[
		"CAMS_H_Berets",1,false,
		[
		]
	],
	[
		"CAMS_H_Shemags",1,false,
		[
		]
	],
	*/
	[
		"CAMS_H_SuperHelmet",1,false,
		[
			"FRITH_ruin_modhat_metgrn",
			"FRITH_ruin_modhat_mettan"
		]
	],
	/*
	[
		"CAMS_H_SpecOps",1,false,
		[
		]
	],
	[
		"CAMS_H_Aviation_W",1,false,
		[
		]
	],

	[
		"CAMS_H_Aviation_E",1,false,
		[
		]
	],
	[
		"CAMS_H_Aviation",0,true,
		[
			"CAMS_H_Aviation_W","CAMS_H_Aviation_E"
		]
	],
	*/
	
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
