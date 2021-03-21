// Assets.sqf
// Ravage
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
_cartName = "Ravage"; 	// Change this to match the directory name of the content you are adding
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

	//////////////////////////////////////////// Uniforms - Independant
	
	[
		"CAMS_U_Soldier_I",1,false,
		[
			"rvg_hoodie_bandit",
			"rvg_hoodie_blue",
			"rvg_hoodie_grey",
			"rvg_hoodie_kabeiroi",
			"rvg_hoodie_red",
			
			"rvg_retro_bandit",
			"rvg_retro_green",
			"rvg_retro_grey",
			"rvg_retro_kabeiroi",
			"rvg_retro_red",
			
			"rvg_shirt_bandit",
			"rvg_shirt_check",
			"rvg_shirt_kabeiroi",
			"rvg_shirt_stripe"
		]	
	],
	[
		"CAMS_U_Guerilla_I",1,false,
		[
			// Pacific
			"rvg_bandit",
			"rvg_bandit_1",
			"rvg_camo",
			"rvg_camo_1",
			"rvg_diamond",
			"rvg_diamond_1",
			"rvg_independant",
			"rvg_independant_1"
			//,
			//"rvg_survivor",	// Used for bambis
			//"rvg_survivor_1"
		]
	],
	[
		"CAMS_U_Ghillie_I",1,false,
		[
			"rvg_paramilitary_1"
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
			"rvg_bandolier_1",
			"rvg_bandolier_2",
			"rvg_bandolier_3",
			"rvg_bandolier_4"
		]
	],
	[
		"CAMS_V_Chestrig",1,false,
		[
			"rvg_chestrig"
		]
	],

	[
		"CAMS_V_Vests_W",1,false,
		[
			// West - CIV?
			"rvg_deckvest_1",
			"rvg_deckvest_2",
			
			"rvg_tacvest_1",
			"rvg_tacvest_2",
			"rvg_tacvest_3",
			"rvg_tacvest_4"
		]
	],
	[
		"CAMS_V_Vests_E",1,false,
		[	
			"rvg_eodvest_1",
			"rvg_eodvest_2",
			"rvg_eodvest_3",

			"rvg_tacvest_1",
			"rvg_tacvest_2",
			"rvg_tacvest_3",
			"rvg_tacvest_4"
			
			//"rvg_ravenvest_1"

		]
	],
	[
		"CAMS_V_Vests",0,true,
		[
			"CAMS_V_Vests_W","CAMS_V_Vests_E"
		]
	],
	
	[
		"CAMS_V_Harness",1,false,
		[
			"rvg_legstrapbag_1",
			"rvg_legstrapbag_2",
			"rvg_legstrapbag_3",
			"rvg_legstrapbag_4",
			"rvg_multipocket_1",
			"rvg_multipocket_2",
			"rvg_multipocket_3",
			"rvg_multipocket_4",
			"rvg_multipocket_5",
			"rvg_rangemaster_1",
			"rvg_rangemaster_2",
			"rvg_rangemaster_3",
			"rvg_rangemaster_4"
		]
	],
	[
		"CAMS_V_Plate",1,false,
		[
			"rvg_platecarrier_1",
			"rvg_platecarrier_2",
			"rvg_platecarrier_3",
			"rvg_platecarrier_4",
			"rvg_platecarrier_5"
		]
	],
	[
		"CAMS_V_Rebreather",1,false,
		[
			"V_O2Tank_1","V_O2Tank"
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
		"CAMS_H_Caps_W",1,false,
		[
			"H_BandCap_rvg",
			
			"rvg_bandage_1",
			"rvg_bandage_2",
			"rvg_bandage_3",
			
			"rvg_hat_brown",
			"rvg_hat_grey",
			"rvg_hat_tan"
		]
	],
	[
		"CAMS_H_Caps_E",1,false,
		[
		]
	],	
	[
		"CAMS_H_Caps",0,true,
		[
			"CAMS_H_Caps_W","CAMS_H_Caps_E"
		]
	],	
	[
		"CAMS_H_RegHelmet_W",1,false,////////////////////////////////////////////////////////
		[	
			"rvg_racing_1",
			"rvg_racing_2",
			"rvg_racing_3",
			"rvg_racing_4",
			"rvg_racing_5",		

			"rvg_presshelmet_1",
			"rvg_presshelmet_2",
			"rvg_presshelmet_3"		
		]
	],
	[
		"CAMS_H_RegHelmet_E",1,false,/////////////////////////////////////////////////////////
		[
			// East
			"rvg_safari_1",
			"rvg_safari_2",
			"rvg_safari_3"
		]
	],
	[
		"CAMS_H_LightHelmet_W",1,false,///////////////////////////////////////////////////////
		[
			"rvg_construction_1",
			"rvg_construction_2",
			"rvg_construction_3"
		]
	],	
	[
		"CAMS_H_LightHelmet_E",1,false,///////////////////////////////////////////////////////
		[
			"rvg_skate_1",
			"rvg_skate_2",
			"rvg_skate_3"	
		]
	],
	[
		"CAMS_H_LightHelmet",0,true,///////////////////////////////////////////////////////
		[
			"CAMS_H_LightHelmet_W","CAMS_H_LightHelmet_E"
		]
	],	

	[
		"CAMS_H_RegHelmet",0,true,
		[
			"CAMS_H_RegHelmet_W","CAMS_H_RegHelmet_E"
		]
	],
	
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
	[
		"CAMS_H_SuperHelmet",1,false,
		[
		]
	],
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
	[
		"CAMS_G_Regular",1,false,
		[
			"rvg_respirator_1",
			"rvg_respirator_2",
			"rvg_respirator_3",
			"rvg_respirator_4",
			"rvg_respirator_5"
		]
	],	
	[
		"CAMS_G_Tactical",1,false,
		[
			"rvg_eyeprotector"
		]
	],
	[
		"CAMS_G_Sport",1,false,
		[	
			"rvg_bandanaSport_1",
			"rvg_bandanaSport_2",
			"rvg_bandanaSport_3",
			"rvg_bandanaSport_4",
			"rvg_bandanaSport_5"
		]
	],
	[
		"CAMS_G_Shades",1,false,
		[
			"rvg_bandanaShades_1",
			"rvg_bandanaShades_2",
			"rvg_bandanaShades_3",
			"rvg_bandanaShades_4",
			"rvg_bandanaShades_5"
		]
	],
	[
		"CAMS_G_Lady",1,false,
		[		
			"rvg_bandanaAvi_1",
			"rvg_bandanaAvi_2",
			"rvg_bandanaAvi_3",
			"rvg_bandanaAvi_4",
			"rvg_bandanaAvi_5"
		]
	],	
	[
		"CAMS_G_Bandana",1,false,
		[
			"rvg_bandana_1",
			"rvg_bandana_2",
			"rvg_bandana_3",
			"rvg_bandana_4",
			"rvg_bandana_5"
		]
	],
	[
		"CAMS_G_Balaclava",1,false,
		[
			"rvg_balaclava_1",
			"rvg_balaclava_2",
			"rvg_balaclava_3",
			"rvg_balaclava_4",
			"rvg_balaclava_5",
			
			"rvg_balaclavaCombat_1",
			"rvg_balaclavaCombat_2",
			"rvg_balaclavaCombat_3",
			"rvg_balaclavaCombat_4",
			"rvg_balaclavaCombat_5",
			
			"rvg_balaclavaLow_1",
			"rvg_balaclavaLow_2",
			"rvg_balaclavaLow_3",
			"rvg_balaclavaLow_4",
			"rvg_balaclavaLow_5"
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
		"CAMS_AI_FIA_E",1,false,
		[
		]
	],
	[
		"CAMS_AI_CSAT_SOLDIER",1,false,
		[
		]
	],
	[
		"CAMS_AI_CSAT_URBAN",1,false,
		[
		]
	],
	[
		"CAMS_AI_CSAT_SF",1,false,
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
		"CAMS_AI_FIA_W",1,false,
		[
		]
	],
	[
		"CAMS_AI_NATO_SOLDIER",1,false,
		[
		]
	],
	[
		"CAMS_AI_NATO_SF",1,false,
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
		"CAMS_AI_FIA_I",1,false,
		[
		]
	],
	[
		"CAMS_AI_AAF",1,false,
		[
		]
	],
	[
		"CAMS_AI_AAF_SF",1,false,
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
	[
		"CAMS_I_Lootboxes",1,false,
		[
			"rvg_basic_box_F",
			"rvg_gear_box_F",
			"rvg_Module_F",
			"rvg_repair_box_F"
		]
	],

	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,false,
		[
			"rvg_purificationTablets",
			"rvg_antiRad"
		]
	],	
	
	// Backpacks
	[
		"CAMS_Packs_W",1,false,
		[
			"rvg_assault",
			"rvg_bergan",
			"rvg_carryall_1",
			"rvg_carryall_2",
			"rvg_field",
			"rvg_kitbag",
			"rvg_legstrappack_1",
			"rvg_legstrappack_2",
			"rvg_legstrappack_3",
			"rvg_legstrappack_4",
			"rvg_messengerbag_1",
			"rvg_messengerbag_2",
			"rvg_messengerbag_3",
			"rvg_messengerbag_4",
			"rvg_tactical"
		]
	],
	[
		"CAMS_Packs_E",1,false,
		[
			"rvg_assault",
			"rvg_bergan",
			"rvg_carryall_1",
			"rvg_carryall_2",
			"rvg_field",
			"rvg_kitbag",
			"rvg_legstrappack_1",
			"rvg_legstrappack_2",
			"rvg_legstrappack_3",
			"rvg_legstrappack_4",
			"rvg_messengerbag_1",
			"rvg_messengerbag_2",
			"rvg_messengerbag_3",
			"rvg_messengerbag_4",
			"rvg_tactical"		
		]
	],
	[
		"CAMS_Packs_ALL",0,true,
		[
			"CAMS_Packs_W","CAMS_Packs_E"
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
			"rvg_flare"
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
		]
	],
	[
		"CAMS_W_Bipod",1,false,
		[
		]
	],
	[
		"CAMS_W_Muzzle",1,false,
		[
		]
	],
	[
		"CAMS_W_OpticsLv1",1,false,
		[
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
			"CAMS_W_OpticsLv1", "CAMS_W_OpticsLv2", "CAMS_W_OpticsLv3"
		]
	],
	[
		"CAMS_W_Attachments_ALL",0,true,
		[
			"CAMS_W_Pointer", "CAMS_W_Bipod", "CAMS_W_Muzzle", "CAMS_W_Optics_ALL"
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
			"Rusty_LMG_Zafir_F"
		]
	],
	[
		"CAMS_MMG_I",1,false,
		[
			"Rusty_MMG_01_tan_F",
			"Rusty_MMG_02_black_F"

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
			"Rusty_srifle_DMR_02_F",
			"Rusty_srifle_DMR_03_F",
			"Rusty_srifle_DMR_04_F",
			"Rusty_srifle_EBR_F"
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
	/*,
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//  Water vehicles - Civ / General
	[
		"CAMS_H20_Boats_C",1,false,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_C",1,false,
		[
		]
	],
	[
		"CAMS_H20_Jetski_C",1,false,
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
		"CAMS_H20_Boats_W",1,false,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,false,
		[
		]
	],
	[
		"CAMS_H20_SDV_W",1,false,
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
		"CAMS_H20_Boats_E",1,false,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,false,
		[
		]
	],
	[
		"CAMS_H20_SDV_E",1,false,
		[
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
		"CAMS_H20_Boats_I",1,false,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,false,
		[
		]
	],
	[
		"CAMS_H20_SDV_I",1,false,
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
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////// Air Vehicles /////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_C",1,false,
		[
		]
	],	
	
	///////////////////////////////////////////////// Helicopters - West
	[
		"CAMS_Heli_Unarmed_W",1,false,
		[
		]
	],
	[
		"CAMS_Heli_Armed_W",1,false,
		[
		]
	],
	[
		"CAMS_Heli_Transport_W",1,false,
		[
		]
	],
	
	[
		"CAMS_Heli_ArmedTransport_W",1,false,
		[
		]
	],
	
	/////////////////////////////////// Helicopters - East 

	[
		"CAMS_Heli_ArmedTransport_E",1,false,
		[
		]
	],	
	[
		"CAMS_Heli_Transport_E",1,false,
		[
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
		]
	],
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,false,
		[
		]
	],

	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,false,
		[
		]
	],
	[
		"CAMS_Plane_UAV_E",1,false,
		[
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
		]
	],
	[
		"CAMS_Land_Offroad_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Transport_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_SUV_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Van_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Utility_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_C",1,false,
		[
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
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_UGV_Armed_W",1,false,
		[
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
		]
	],
	[
		"CAMS_Land_Transport_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_Tank_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_Artillery_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_AA_W",1,false,
		[
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
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,false,
		[
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
		]
	],

	[
		"CAMS_Land_Transport_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_Tank_E",1,false,
		[
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
	//////////////////////////////////////////// Static Guns - West
	[
		"CAMS_Land_StaticGuns_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAA_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_W",1,false,
		[
		]
	],
	[
		"CAMS_Land_Mortar_W",1,false,
		[
		]
	],

	//////////////////////////////////////////// Static Guns - East
	[
		"CAMS_Land_StaticGuns_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAA_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_Mortar_E",1,false,
		[
		]
	],

	//////////////////////////////////////////// Static Guns - Ind
	[
		"CAMS_Land_StaticGuns_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_I",1,false,
		[
		]
	],
			
	[
		"CAMS_Land_StaticAA_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Mortar_I",1,false,
		[
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
	*/
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
Land_OfficeCabinet_01_F
Land_LampAirport_intact_F
Land_LampHalogen_intact_F
Land_fs_feed_F
Land_FuelStation_Feed_F




// LMGs 

class Rusty_MMG_01_tan_F { quality = 3; price = 150; };
class Rusty_MMG_02_black_F { quality = 3; price = 150; };
class Rusty_LMG_Zafir_F { quality = 3; price = 150; };


//  SMGs  



// Snipers  

class Rusty_srifle_DMR_02_F { quality = 3; price = 150; };
class Rusty_srifle_DMR_03_F { quality = 3; price = 150; };
class Rusty_srifle_DMR_04_F { quality = 3; price = 150; };
class Rusty_srifle_EBR_F { quality = 3; price = 150; };


// Uniforms 

class rvg_bandit { quality = 3; price = 150; };
class rvg_bandit_1 { quality = 3; price = 150; };
class rvg_camo { quality = 3; price = 150; };
class rvg_camo_1 { quality = 3; price = 150; };
class rvg_diamond { quality = 3; price = 150; };
class rvg_diamond_1 { quality = 3; price = 150; };
class rvg_hoodie_bandit { quality = 3; price = 150; };
class rvg_hoodie_blue { quality = 3; price = 150; };
class rvg_hoodie_grey { quality = 3; price = 150; };
class rvg_hoodie_kabeiroi { quality = 3; price = 150; };
class rvg_hoodie_red { quality = 3; price = 150; };
class rvg_independant { quality = 3; price = 150; };
class rvg_independant_1 { quality = 3; price = 150; };
class rvg_paramilitary_1 { quality = 3; price = 150; };
class rvg_retro_bandit { quality = 3; price = 150; };
class rvg_retro_green { quality = 3; price = 150; };
class rvg_retro_grey { quality = 3; price = 150; };
class rvg_retro_kabeiroi { quality = 3; price = 150; };
class rvg_retro_red { quality = 3; price = 150; };
class rvg_shirt_bandit { quality = 3; price = 150; };
class rvg_shirt_check { quality = 3; price = 150; };
class rvg_shirt_kabeiroi { quality = 3; price = 150; };
class rvg_shirt_stripe { quality = 3; price = 150; };
class rvg_survivor { quality = 3; price = 150; };
class rvg_survivor_1 { quality = 3; price = 150; };


// Headgear 

class rvg_bandage_1 { quality = 3; price = 150; };
class rvg_bandage_2 { quality = 3; price = 150; };
class rvg_bandage_3 { quality = 3; price = 150; };
class rvg_construction_1 { quality = 3; price = 150; };
class rvg_construction_2 { quality = 3; price = 150; };
class rvg_construction_3 { quality = 3; price = 150; };
class rvg_hat_brown { quality = 3; price = 150; };
class rvg_hat_grey { quality = 3; price = 150; };
class rvg_hat_tan { quality = 3; price = 150; };
class rvg_presshelmet_1 { quality = 3; price = 150; };
class rvg_presshelmet_2 { quality = 3; price = 150; };
class rvg_presshelmet_3 { quality = 3; price = 150; };
class rvg_racing_1 { quality = 3; price = 150; };
class rvg_racing_2 { quality = 3; price = 150; };
class rvg_racing_3 { quality = 3; price = 150; };
class rvg_racing_4 { quality = 3; price = 150; };
class rvg_racing_5 { quality = 3; price = 150; };
class rvg_safari_1 { quality = 3; price = 150; };
class rvg_safari_2 { quality = 3; price = 150; };
class rvg_safari_3 { quality = 3; price = 150; };
class rvg_skate_1 { quality = 3; price = 150; };
class rvg_skate_2 { quality = 3; price = 150; };
class rvg_skate_3 { quality = 3; price = 150; };


// Vests 

class rvg_bandolier_1 { quality = 3; price = 150; };
class rvg_bandolier_2 { quality = 3; price = 150; };
class rvg_bandolier_3 { quality = 3; price = 150; };
class rvg_bandolier_4 { quality = 3; price = 150; };
class rvg_chestrig { quality = 3; price = 150; };
class rvg_deckvest_1 { quality = 3; price = 150; };
class rvg_deckvest_2 { quality = 3; price = 150; };
class rvg_eodvest_1 { quality = 3; price = 150; };
class rvg_eodvest_2 { quality = 3; price = 150; };
class rvg_eodvest_3 { quality = 3; price = 150; };
class rvg_legstrapbag_1 { quality = 3; price = 150; };
class rvg_legstrapbag_2 { quality = 3; price = 150; };
class rvg_legstrapbag_3 { quality = 3; price = 150; };
class rvg_legstrapbag_4 { quality = 3; price = 150; };
class rvg_multipocket_1 { quality = 3; price = 150; };
class rvg_multipocket_2 { quality = 3; price = 150; };
class rvg_multipocket_3 { quality = 3; price = 150; };
class rvg_multipocket_4 { quality = 3; price = 150; };
class rvg_multipocket_5 { quality = 3; price = 150; };
class rvg_platecarrier_1 { quality = 3; price = 150; };
class rvg_platecarrier_2 { quality = 3; price = 150; };
class rvg_platecarrier_3 { quality = 3; price = 150; };
class rvg_platecarrier_4 { quality = 3; price = 150; };
class rvg_platecarrier_5 { quality = 3; price = 150; };
class rvg_rangemaster_1 { quality = 3; price = 150; };
class rvg_rangemaster_2 { quality = 3; price = 150; };
class rvg_rangemaster_3 { quality = 3; price = 150; };
class rvg_rangemaster_4 { quality = 3; price = 150; };
class rvg_ravenvest_1 { quality = 3; price = 150; };
class rvg_tacvest_1 { quality = 3; price = 150; };
class rvg_tacvest_2 { quality = 3; price = 150; };
class rvg_tacvest_3 { quality = 3; price = 150; };
class rvg_tacvest_4 { quality = 3; price = 150; };


// Backpacks 

class rvg_assault { quality = 3; price = 150; };
class rvg_bergan { quality = 3; price = 150; };
class rvg_carryall_1 { quality = 3; price = 150; };
class rvg_carryall_2 { quality = 3; price = 150; };
class rvg_field { quality = 3; price = 150; };
class rvg_kitbag { quality = 3; price = 150; };
class rvg_legstrappack_1 { quality = 3; price = 150; };
class rvg_legstrappack_2 { quality = 3; price = 150; };
class rvg_legstrappack_3 { quality = 3; price = 150; };
class rvg_legstrappack_4 { quality = 3; price = 150; };
class rvg_messengerbag_1 { quality = 3; price = 150; };
class rvg_messengerbag_2 { quality = 3; price = 150; };
class rvg_messengerbag_3 { quality = 3; price = 150; };
class rvg_messengerbag_4 { quality = 3; price = 150; };
class rvg_tactical { quality = 3; price = 150; };


// Glasses 

class rvg_balaclava_1 { quality = 3; price = 150; };
class rvg_balaclava_2 { quality = 3; price = 150; };
class rvg_balaclava_3 { quality = 3; price = 150; };
class rvg_balaclava_4 { quality = 3; price = 150; };
class rvg_balaclava_5 { quality = 3; price = 150; };
class rvg_balaclavaCombat_1 { quality = 3; price = 150; };
class rvg_balaclavaCombat_2 { quality = 3; price = 150; };
class rvg_balaclavaCombat_3 { quality = 3; price = 150; };
class rvg_balaclavaCombat_4 { quality = 3; price = 150; };
class rvg_balaclavaCombat_5 { quality = 3; price = 150; };
class rvg_balaclavaLow_1 { quality = 3; price = 150; };
class rvg_balaclavaLow_2 { quality = 3; price = 150; };
class rvg_balaclavaLow_3 { quality = 3; price = 150; };
class rvg_balaclavaLow_4 { quality = 3; price = 150; };
class rvg_balaclavaLow_5 { quality = 3; price = 150; };
class rvg_bandana_1 { quality = 3; price = 150; };
class rvg_bandana_2 { quality = 3; price = 150; };
class rvg_bandana_3 { quality = 3; price = 150; };
class rvg_bandana_4 { quality = 3; price = 150; };
class rvg_bandana_5 { quality = 3; price = 150; };
class rvg_bandanaAvi_1 { quality = 3; price = 150; };
class rvg_bandanaAvi_2 { quality = 3; price = 150; };
class rvg_bandanaAvi_3 { quality = 3; price = 150; };
class rvg_bandanaAvi_4 { quality = 3; price = 150; };
class rvg_bandanaAvi_5 { quality = 3; price = 150; };
class rvg_bandanaShades_1 { quality = 3; price = 150; };
class rvg_bandanaShades_2 { quality = 3; price = 150; };
class rvg_bandanaShades_3 { quality = 3; price = 150; };
class rvg_bandanaShades_4 { quality = 3; price = 150; };
class rvg_bandanaShades_5 { quality = 3; price = 150; };
class rvg_bandanaSport_1 { quality = 3; price = 150; };
class rvg_bandanaSport_2 { quality = 3; price = 150; };
class rvg_bandanaSport_3 { quality = 3; price = 150; };
class rvg_bandanaSport_4 { quality = 3; price = 150; };
class rvg_bandanaSport_5 { quality = 3; price = 150; };
class rvg_eyeprotector { quality = 3; price = 150; };
class rvg_respirator_1 { quality = 3; price = 150; };
class rvg_respirator_2 { quality = 3; price = 150; };
class rvg_respirator_3 { quality = 3; price = 150; };
class rvg_respirator_4 { quality = 3; price = 150; };
class rvg_respirator_5 { quality = 3; price = 150; };


// Uniforms 

5, rvg_bandit 
5, rvg_bandit_1 
5, rvg_camo 
5, rvg_camo_1 
5, rvg_diamond 
5, rvg_diamond_1 
5, rvg_hoodie_bandit 
5, rvg_hoodie_blue 
5, rvg_hoodie_grey 
5, rvg_hoodie_kabeiroi 
5, rvg_hoodie_red 
5, rvg_independant 
5, rvg_independant_1 
5, rvg_paramilitary_1 
5, rvg_retro_bandit 
5, rvg_retro_green 
5, rvg_retro_grey 
5, rvg_retro_kabeiroi 
5, rvg_retro_red 
5, rvg_shirt_bandit 
5, rvg_shirt_check 
5, rvg_shirt_kabeiroi 
5, rvg_shirt_stripe 
5, rvg_survivor 
5, rvg_survivor_1 


// Headgear 

5, rvg_bandage_1 
5, rvg_bandage_2 
5, rvg_bandage_3 
5, rvg_construction_1 
5, rvg_construction_2 
5, rvg_construction_3 
5, rvg_hat_brown 
5, rvg_hat_grey 
5, rvg_hat_tan 
5, rvg_presshelmet_1 
5, rvg_presshelmet_2 
5, rvg_presshelmet_3 
5, rvg_racing_1 
5, rvg_racing_2 
5, rvg_racing_3 
5, rvg_racing_4 
5, rvg_racing_5 
5, rvg_safari_1 
5, rvg_safari_2 
5, rvg_safari_3 
5, rvg_skate_1 
5, rvg_skate_2 
5, rvg_skate_3 


// Vests 

5, rvg_bandolier_1 
5, rvg_bandolier_2 
5, rvg_bandolier_3 
5, rvg_bandolier_4 
5, rvg_chestrig 
5, rvg_deckvest_1 
5, rvg_deckvest_2 
5, rvg_eodvest_1 
5, rvg_eodvest_2 
5, rvg_eodvest_3 
5, rvg_legstrapbag_1 
5, rvg_legstrapbag_2 
5, rvg_legstrapbag_3 
5, rvg_legstrapbag_4 
5, rvg_multipocket_1 
5, rvg_multipocket_2 
5, rvg_multipocket_3 
5, rvg_multipocket_4 
5, rvg_multipocket_5 
5, rvg_platecarrier_1 
5, rvg_platecarrier_2 
5, rvg_platecarrier_3 
5, rvg_platecarrier_4 
5, rvg_platecarrier_5 
5, rvg_rangemaster_1 
5, rvg_rangemaster_2 
5, rvg_rangemaster_3 
5, rvg_rangemaster_4 
5, rvg_ravenvest_1 
5, rvg_tacvest_1 
5, rvg_tacvest_2 
5, rvg_tacvest_3 
5, rvg_tacvest_4 


// Backpacks 

5, rvg_assault 
5, rvg_bergan 
5, rvg_carryall_1 
5, rvg_carryall_2 
5, rvg_field 
5, rvg_kitbag 
5, rvg_legstrappack_1 
5, rvg_legstrappack_2 
5, rvg_legstrappack_3 
5, rvg_legstrappack_4 
5, rvg_messengerbag_1 
5, rvg_messengerbag_2 
5, rvg_messengerbag_3 
5, rvg_messengerbag_4 
5, rvg_tactical 


// Glasses 

5, rvg_balaclava_1 
5, rvg_balaclava_2 
5, rvg_balaclava_3 
5, rvg_balaclava_4 
5, rvg_balaclava_5 
5, rvg_balaclavaCombat_1 
5, rvg_balaclavaCombat_2 
5, rvg_balaclavaCombat_3 
5, rvg_balaclavaCombat_4 
5, rvg_balaclavaCombat_5 
5, rvg_balaclavaLow_1 
5, rvg_balaclavaLow_2 
5, rvg_balaclavaLow_3 
5, rvg_balaclavaLow_4 
5, rvg_balaclavaLow_5 
5, rvg_bandana_1 
5, rvg_bandana_2 
5, rvg_bandana_3 
5, rvg_bandana_4 
5, rvg_bandana_5 
5, rvg_bandanaAvi_1 
5, rvg_bandanaAvi_2 
5, rvg_bandanaAvi_3 
5, rvg_bandanaAvi_4 
5, rvg_bandanaAvi_5 
5, rvg_bandanaShades_1 
5, rvg_bandanaShades_2 
5, rvg_bandanaShades_3 
5, rvg_bandanaShades_4 
5, rvg_bandanaShades_5 
5, rvg_bandanaSport_1 
5, rvg_bandanaSport_2 
5, rvg_bandanaSport_3 
5, rvg_bandanaSport_4 
5, rvg_bandanaSport_5 
5, rvg_eyeprotector 
5, rvg_respirator_1 
5, rvg_respirator_2 
5, rvg_respirator_3 
5, rvg_respirator_4 
5, rvg_respirator_5 


// EdSubcat_Personnel

"rvg_dummy_man",
"rvg_hoodie_bandit",
"rvg_hoodie_base",
"rvg_hoodie_blue",
"rvg_hoodie_grey",
"rvg_hoodie_kabeiroi",
"rvg_hoodie_red",
"rvg_paramilitary_1",
"rvg_paramilitary_base",
"rvg_retro_bandit",
"rvg_retro_base",
"rvg_retro_green",
"rvg_retro_grey",
"rvg_retro_kabeiroi",
"rvg_retro_red",
"rvg_shirt_bandit",
"rvg_shirt_base",
"rvg_shirt_check",
"rvg_shirt_kabeiroi",
"rvg_shirt_stripe",
"rvg_Underwear_F",


rvg_map


// Unknown  


this forceAddUniform "U_O_Wetsuit_rvg";U_B_Wetsuit_rvg,U_I_Wetsuit_rvg

this forceAddUniform "U_C_WorkerCoverallsBandit";U_C_WorkerCoverallsBlack;U_C_WorkerCoverallsCamo

this forceAddUniform "U_C_rvg_hood_bandit";

U_I_G_Soldier_para_f,
U_BG_Guerilla_6_1NG,
U_BG_Guerilla_6_1R,
U_BG_Guerilla1_1_rvg




*/