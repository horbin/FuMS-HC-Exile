// Assets.sqf
// NIArms AR-15 Addon
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
_cartName = "niarms-ar15"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	

	[
		"CAMS_AssaultRifles_I",1,false,
		[
			"hlc_rifle_RU556",
			"hlc_rifle_RU5562",
			"hlc_rifle_CQBR",
			"hlc_rifle_M4",
			"hlc_rifle_bcmjack",
			"hlc_rifle_bcmblackjack",
			"hlc_rifle_Colt727",
			"hlc_rifle_Colt727_x15",
			"hlc_rifle_Bushmaster300",
			"hlc_rifle_Bushmaster300_x15",
			"hlc_rifle_vendimus",
			"hlc_rifle_vendimus_x15",
			"hlc_rifle_SAMR",
			"hlc_rifle_samr2",
			"hlc_rifle_honeybadger",
			"hlc_rifle_mk18mod0",
			"hlc_rifle_M4a1carryhandle"
			
			/*,
			
			"hlc_wp_m16a2",
			"hlc_wp_m16a2_x15",
			"hlc_wp_XM177E2",
			"hlc_wp_XM177E2_x15",
			"hlc_wp_mod727",
			"hlc_wp_mod727_x15",
			"hlc_wp_mod733",
			"hlc_wp_mod733_x15",
			"hlc_wp_m16A1",
			"hlc_wp_m16A1_x15",
			"hlc_wp_xm4",
			"hlc_wp_xm4_x15",


			// Assault Rifles with GL 

			"hlc_rifle_m4m203",
			"hlc_rifle_Colt727_GL",
			"hlc_rifle_Colt727_GL_x15",
			"hlc_rifle_m203",
			"hlc_rifle_m203_x15",
			"hlc_rifle_A1m203",
			"hlc_rifle_A1m203_x15"
			*/
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
/*

// Magazines  

"hlc_30rnd_556x45_EPR",
"hlc_30rnd_556x45_SOST",
"hlc_30rnd_556x45_SPR",
"hlc_30rnd_556x45_S",
"hlc_30rnd_556x45_M",
"hlc_30rnd_556x45_t",
"hlc_30rnd_556x45_MDim",
"hlc_30rnd_556x45_TDim",
"hlc_50rnd_556x45_EPR",
"hlc_50rnd_556x45_SOST",
"hlc_50rnd_556x45_SPR",
"hlc_50rnd_556x45_M",
"hlc_50rnd_556x45_MDim",
"hlc_30rnd_556x45_EPR_PMAG",
"hlc_30rnd_556x45_SOST_PMAG",
"hlc_30rnd_556x45_SPR_PMAG",
"hlc_30rnd_556x45_S_PMAG",
"hlc_30rnd_556x45_M_PMAG",
"hlc_30rnd_556x45_t_PMAG",
"hlc_30rnd_556x45_MDim_PMAG",
"hlc_30rnd_556x45_TDim_PMAG",
"hlc_30rnd_556x45_EPR_STANAGHD",
"hlc_30rnd_556x45_SOST_STANAGHD",
"hlc_30rnd_556x45_SPR_STANAGHD",
"hlc_30rnd_556x45_S_STANAGHD",
"hlc_30rnd_556x45_M_STANAGHD",
"hlc_30rnd_556x45_t_STANAGHD",
"hlc_30rnd_556x45_MDim_STANAGHD",
"hlc_30rnd_556x45_TDim_STANAGHD",
"hlc_30rnd_556x45_EPR_L5",
"hlc_30rnd_556x45_SOST_L5",
"hlc_30rnd_556x45_SPR_L5",
"hlc_30rnd_556x45_S_L5",
"hlc_30rnd_556x45_M_L5",
"hlc_30rnd_556x45_t_L5",
"hlc_30rnd_556x45_MDim_L5",
"hlc_30rnd_556x45_TDim_L5",
"hlc_30rnd_556x45_EPR_EMAG",
"hlc_30rnd_556x45_SOST_EMAG",
"hlc_30rnd_556x45_SPR_EMAG",
"hlc_30rnd_556x45_S_EMAG",
"hlc_30rnd_556x45_M_EMAG",
"hlc_30rnd_556x45_t_EMAG",
"hlc_30rnd_556x45_MDim_EMAG",
"hlc_30rnd_556x45_TDim_EMAG",
"hlc_50rnd_300BLK_STANAG_EPR",
*/