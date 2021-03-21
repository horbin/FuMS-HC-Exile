// Assets.sqf
// ThaiWarfare
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
_cartName = "warfarethai"; 	// Change this to match the directory name of the content you are adding
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
			// Business Casual (Pimp, Urban)
			"U_Hipster_A",
			"U_Hipster_B",

			// Civilan Jersey 
			"U_CivilianJerseyCasual_A",
			"U_CivilianJerseyCasual_B",
			"U_CivilianJerseyCasual_C",
			"U_CivilianJerseyCasual_D",
			"U_CivilianJerseyCasual_E",
			"U_CivilianJerseyCasual_F",
			"U_CivilianJerseyCasual_G",

			// Civilian T-Shirt
			"U_CivilianTShirtCasual_A",
			"U_CivilianTShirtCasual_B",
			"U_CivilianTShirtCasual_C",
			"U_CivilianTShirtCasual_D",
			"U_CivilianTShirtCasual_E",
			"U_CivilianTShirtCasual_F",
			"U_CivilianTShirtCasual_G",
			"U_CivilianTShirtCasual_H",
			"U_CivilianTShirtCasual_I",

			// Metro Outfit
			"U_CivilianMetro_A",
			"U_CivilianMetro_B",
			"U_CivilianMetro_C",
			"U_CivilianMetro_D",

			// Civilain Polo
			"U_CivilianPolo_A",
			"U_CivilianPolo_B",
			"U_CivilianPolo_C",
			"U_CivilianPolo_D",
			"U_CivilianPolo_E",
			"U_CivilianPolo_F",

			// Sport Outfit
			"U_CivilianSport_A",
			"U_CivilianSport_B",
			"U_CivilianSport_C",
			"U_CivilianSport_D",

			// Civilian Cropped Pants
			"U_CivilianCroppedPants_A",
			"U_CivilianCroppedPants_B",
			"U_CivilianCroppedPants_C",
			"U_CivilianCroppedPants_D",
			"U_CivilianCroppedPants_E",


			// Civilian Tank Top
			"U_CivilianTankTop_A",
			"U_CivilianTankTop_B",
			"U_CivilianTankTop_C",
			"U_CivilianTankTop_D",
			"U_CivilianTankTop_E",

			// Civilian T-Shirt
			"U_CivilianTShirt_A",
			"U_CivilianTShirt_B",
			"U_CivilianTShirt_C",
			"U_CivilianTShirt_D",
			"U_CivilianTShirt_E",
			"U_CivilianTShirt_F",
			"U_CivilianTShirt_G"
		]
	],

	//////////////////////////////////// Uniforms - WEST
	
	[
		"CAMS_U_Soldier_W",1,true,
		[
			// ASDF Unifom
			"U_AFAOfficerUni_A",
			"U_AFASoldierUni_A",
			"U_AFASpecialUni_A",
			
			// Thai Shirt Uniform
			"U_CombatUniShirt_D",
			"U_CombatUniShirt_E",
			"U_CombatUniShirtAlt_D",
			"U_CombatUniShirtAlt_E",

			// Thai combat uniform
			"U_CombatUniSleeves_D",
			"U_CombatUniSleeves_E",
			"U_CombatUniSleevesShort_D",
			"U_CombatUniSleevesShort_E",
			"U_CombatUniTShirt_D",
			"U_CombatUniTShirt_E"		
		]	
	],
	[
		"CAMS_U_Guerilla_W",1,true,
		[

			// Civilian Hunter Outfit
			"U_CivilianHunter_A",
			"U_CivilianHunter_B",
			"U_CivilianHunter_C",
			"U_CivilianHunter_D",

			// Militia Uniform
			"U_MilitiaUniShirt_A",
			"U_MilitiaUniShirt_B",
			"U_MilitiaUniShirt_C",
			"U_MilitiaUniShirt_D",
			"U_MilitiaUniShirt_E",
			"U_MilitiaUniShirt_F",
			"U_MilitiaUniShirt_G"
		]
	],	
	[
		"CAMS_U_Ghillie_W",1,false,
		[
			// Guerilla Apparel
			"U_CDGCombatUni_D",
			
			// Black Ops Jumpsuit
			"U_Coveralls_B"
		]
	],
	[
		"CAMS_U_Aviation_W",1,false,
		[
			// Leather Jumpsuit
			"U_Coveralls_A",
			

			// Grey Jumpsuit
			"U_Coveralls_C",
			
			// Casual Civilian Pilot
			"U_CivilianPilot_A"
		]
	],
	[
		"CAMS_U_Wetsuit_W",1,false,
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
			// EEAF Uniform
			"U_CDFOfficerUni_A",
			"U_CDFSoldierUni_A",

			// MEAF Uniform
			"U_TKOfficerUni_A",
			"U_TKOfficerUni_B",
			"U_TKSoldierUni_A",
			"U_TKSoldierUni_B",
			"U_TKSpecialUni_A",
			"U_TKSpecialUni_B",
			
			// Thai Shirt Uniform
			"U_CombatUniShirt_A",
			"U_CombatUniShirt_B",
			"U_CombatUniShirt_C",
			"U_CombatUniShirtAlt_A",
			"U_CombatUniShirtAlt_B",
			"U_CombatUniShirtAlt_C",
			
			// Thai combat uniform
			"U_CombatUniSleeves_A",
			"U_CombatUniSleeves_B",
			"U_CombatUniSleeves_C",
			"U_CombatUniSleevesShort_A",
			"U_CombatUniSleevesShort_B",
			"U_CombatUniSleevesShort_C",
			"U_CombatUniTShirt_A",
			"U_CombatUniTShirt_B",
			"U_CombatUniTShirt_C"
		]	
	],
	[
		"CAMS_U_Guerilla_E",1,true,
		[
			// Combat Outdoor (Hunter gear, Vest, camo pants)
			"U_CombatOutdoor_A",
			"U_CombatOutdoor_B",
			"U_CombatOutdoor_C",
			"U_CombatOutdoor_D",



			// Guerilla Apparel
			"U_CDGCombatUni_A",
			"U_CDGCombatUni_B",
			"U_CDGCombatUni_C",
			
			// Outdoor Outfit
			"U_CivilianOutdoor_A",
			"U_CivilianOutdoor_B",
			"U_CivilianOutdoor_C",
			"U_CivilianOutdoor_D",
			

			// Military Jacket
			"U_MilitiaSport_A",
			"U_MilitiaSport_B",
			"U_MilitiaSport_C"

		]
	],
	[
		"CAMS_U_Ghillie_E",1,false,
		[
			// Combat Uniform (Digital Woodland)
			"U_CombatUniVest_A",
			// Combat Fatigue (CSAT)
			"U_CombatUniFatigue_A",			
			
			// Fatigue Uniform (Digital Woodland, Guerilla)
			"U_CombatUniLong_A",
			"U_CombatUniLong_B"			
			
		]
	],
	[
		"CAMS_U_Aviation_E",1,false,
		[
			"U_CombatUniShirt_F",
			"U_CombatUniShirtAlt_F",
			"U_CombatUniSleeves_F",
			"U_CombatUniSleevesShort_F",
			"U_CombatUniTShirt_F"
		]
	],
	[
		"CAMS_U_Wetsuit_E",1,false,
		[
		]
	],
	[	
		"CAMS_U_All_E",0,true,
		[
			"CAMS_U_Soldier_E", "CAMS_U_Guerilla_E", "CAMS_U_Ghillie_E", "CAMS_U_Wetsuit_E", "CAMS_U_Aviation_E"
		]
	],
		
	/////////////////////////////////////////////////////// Vest / Chest items
	////////////////////////////////////////////////////// May have to be broken down by EAST, WEST, IND in future or expansion packs

	[
		"CAMS_V_Bandolliers",1,true,
		[
			// Light Pounch
			"V_Pouch_light_A",
			"V_Pouch_light_B",
			"V_Pouch_light_C"
		]
	],
	[
		"CAMS_V_Chestrig",1,true,
		[
			// Soviet Chest Rig
			"V_ChestRig_heavy_A",
			"V_ChestRig_heavy_B",
			"V_ChestRig_heavy_C",
			"V_ChestRig_heavy_D",

			// Guerilla Chest Rog
			"V_ChestRig_light_A",
			"V_ChestRig_light_B",
			"V_ChestRig_light_C",
			"V_ChestRig_light_D",
			"V_ChestRig_light_E"
		]
	],

	[
		"CAMS_V_Vests_W",1,true,
		[
			// Flack Jacket
			"V_FlakJacket_Black",
			"V_FlakJacket_Blue",
			"V_FlakJacket_Green",
			"V_FlakJacket_Tan",


			// Tactical Flack Jacket 
			"V_FlakJacket_KP_Black",
			"V_FlakJacket_KP_Blue",
			"V_FlakJacket_KP_Green",
			"V_FlakJacket_KP_Tan",

			// Tactical Flak Jacket (Pistol)
			"V_FlakJacket_Pliskin_Black",
			"V_FlakJacket_Pliskin_Blue",
			"V_FlakJacket_Pliskin_Green",
			"V_FlakJacket_Pliskin_Tan",

			// Tactical Flak Jacket (Shemag)
			"V_FlakJacket_SH_Black",
			"V_FlakJacket_SH_Blue",
			"V_FlakJacket_SH_Green",
			"V_FlakJacket_SH_Tan",

			// Tactical Vest EX
			"V_TacVestEX_B",
			"V_TacVestEX_D",
			"V_TacVestEX_F",
			"V_TacVestEX_G",


			// Tactical Vest UP
			"V_TacVestUP_B",
			"V_TacVestUP_D",
			"V_TacVestUP_F",
			"V_TacVestUP_G",


			"V_Vest_AI_Invisible_Heavy",
			"V_Vest_AI_Invisible_Light",
			"V_Vest_AI_Invisible_Medium",

			// Undervests (Invisible)
			"V_Vest_light_Invisible",
			"V_Vest_light_InvNoArmor",

			// Police Vest
			"V_Police_heavy",
			"V_Police_light",
			"V_Police_medium"
		]
	],
	[
		"CAMS_V_Vests_E",1,true,
		[			

			// Flack Jacket
			"V_FlakJacket_digiCamo",
			"V_FlakJacket_Woodland",

			// Tactical Flack Jacket 
			"V_FlakJacket_KP_digiCamo",
			"V_FlakJacket_KP_Woodland",

			// Tactical Flak Jacket (Pistol)
			"V_FlakJacket_Pliskin_digiCamo",
			"V_FlakJacket_Pliskin_HunterGreen",
			"V_FlakJacket_Pliskin_Woodland",

			// Tactical Flak Jacket (Shemag)
			"V_FlakJacket_SH_digiCamo",
			"V_FlakJacket_SH_Woodland",

			// Tacical Vest
			"V_TacVest_TK",

			// Tactical Vest EX
			"V_TacVestEX_A",
			"V_TacVestEX_C",
			"V_TacVestEX_E",


			// Tactical Vest UP
			"V_TacVestUP_A",
			"V_TacVestUP_C",
			"V_TacVestUP_E",


			"V_Vest_AI_Invisible_Heavy",
			"V_Vest_AI_Invisible_Light",
			"V_Vest_AI_Invisible_Medium",

			// Undervests (Invisible)
			"V_Vest_light_Invisible",
			"V_Vest_light_InvNoArmor",

			// Police Vest
			"V_Police_heavy",
			"V_Police_light",
			"V_Police_medium"
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
		
		]
	],
	[
		"CAMS_V_Plate",1,true,
		[
		
			// Ballistic Vests
			"V_Ballistic_A",
			"V_Ballistic_B",
			"V_Ballistic_C",
			"V_Ballistic_D",
			"V_Ballistic_E",

			// Body Armor
			"V_PlateCarrier_heavy_A",
			"V_PlateCarrier_heavy_B",
			"V_PlateCarrier_heavy_C",
			"V_PlateCarrier_heavy_D",
			"V_PlateCarrier_heavy_digiCamo",
			"V_PlateCarrier_heavy_E",
			"V_PlateCarrier_heavy_F",
			"V_PlateCarrier_heavy_G",

			// Carrier Rig
			"V_PlateCarrier_medium_A",
			"V_PlateCarrier_medium_B",
			"V_PlateCarrier_medium_C",
			"V_PlateCarrier_medium_D",
			"V_PlateCarrier_medium_E"
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
		// Head/Hat items
	[
		"CAMS_H_Caps_W",1,true,
		[
			// Bag over head
			"H_hat_HeadBag",
			
			// Russian Cap
			"H_Hat_Cap_RU",

			// Thai Cap
			"H_Hat_Cap_Thai",

			//"H_Hat_CapCover_A",
			"H_Hat_CapCover_B",

			// Revelutionist Cap
			"H_Hat_CapSov_A",
			"H_Hat_CapSov_B",
			"H_Hat_CapSov_C",

			// Golf caps
			"H_Hat_Golf",
			"H_Hat_Golf_Black",
			"H_Hat_Golf_Blue",

			// Headphones
			"H_Hat_Headphones"
		]
	],
	[
		"CAMS_H_Caps_E",1,true,
		[
			// Head tie 
			"H_Hat_HeadTie_A",
			"H_Hat_HeadTie_B",
			"H_Hat_HeadTie_C",
			"H_Hat_HeadTie_D",
			"H_Hat_HeadTie_E",
			"H_Hat_HeadTie_F",
			"H_Hat_HeadTie_G",		

			// Headband (Short)
			"H_Hat_Headband_A",
			"H_Hat_Headband_B",
			"H_Hat_Headband_C",
			"H_Hat_Headband_D",
			"H_Hat_Headband_E",
			"H_Hat_Headband_F",
			"H_Hat_Headband_G",


			// Headband (Long)
			"H_Hat_HeadbandL_A",
			"H_Hat_HeadbandL_B",
			"H_Hat_HeadbandL_C",
			"H_Hat_HeadbandL_D",
			"H_Hat_HeadbandL_E",
			"H_Hat_HeadbandL_F",
			"H_Hat_HeadbandL_G"
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
			// Cold War Helmets
			"H_Hat_HelmetT",
			"H_Hat_HelmetC"
		]
	],
	[
		"CAMS_H_LightHelmet_W",1,true,///////////////////////////////////////////////////////
		[
			// Masaka Helmet
			"H_Hat_HelmetR"
		]
	],	
	[
		"CAMS_H_LightHelmet_E",1,true,///////////////////////////////////////////////////////
		[
			// Masaka Helmet
			"H_Hat_HelmetR"
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
			// MICH 
			"H_Hat_HelmetD",
			"H_Hat_HelmetS",
			"H_Hat_HelmetF",
			"H_Hat_HelmetU",
			"H_Hat_HelmetK",
			"H_Hat_HelmetJ"		
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
			// Boonie Hats
			"H_Hat_Boonie_Cowboy",
			"H_Hat_Boonie_Green",
			"H_Hat_Boonie_Tiger"
		]
	],
	[
		"CAMS_H_Boonie_E",1,true,
		[	
			// Boonie Hats
			"H_Hat_Boonie_Flecktarn",
			"H_Hat_Boonie_Marpat",
			"H_Hat_Boonie_Woodland"
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
			// Beret
			"H_Beret_A",
			"H_Beret_B",
			"H_Beret_C",

			// Beret (Basque)
			"H_Hat_Beret_Basque_A",
			"H_Hat_Beret_Basque_B",
			"H_Hat_Beret_Basque_C",
			"H_Hat_Beret_Basque_D"
		]
	],
	[
		"CAMS_H_Shemags",1,true,
		[
		
			// Face cover
			"H_Hat_Face_Cover_Black",
			"H_Hat_Face_Cover_Gold",
			"H_Hat_Face_Cover_Green",



			// Shemag 
			"H_Hat_Face_Wrap",
			"H_Hat_Face_Wrap_Desert",
			"H_Hat_Face_Wrap_Olive",
			"H_Hat_Face_Wrap_Red",

			// Cloth Wrapped Face
			"H_Hat_Face_Wrap_Black",
			"H_Hat_Face_Wrap_Dark",
			"H_Hat_Face_Wrap_DPM",
			"H_Hat_Face_Wrap_Flecktarn",
			"H_Hat_Face_Wrap_Gold",
			"H_Hat_Face_Wrap_Sand",
			"H_Hat_Face_Wrap_White",


			// Balaclava
			"H_Hat_Face_Balaclava_T",

			"H_Hat_Face_Cover"


			// Ghutra (Sheik cover)
			//"H_Hat_Ghutra",
			//"H_Hat_Ghutra_A",

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
		"CAMS_H_Aviation_W",1,true,
		[
			// Pilot Helmet
			"H_Hat_HelmetPilotR",
			"H_Hat_HelmetCrewR"
		]
	],

	[
		"CAMS_H_Aviation_E",1,true,
		[
			"H_Hat_HelmetPilotR",
			"H_Hat_HelmetCrewR"		
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
			// Wigs
			"COREV_G_Wig_A",
			"COREV_G_Wig_Az",
			"COREV_G_Wig_Ba",
			"COREV_G_Wig_Bb",
			"COREV_G_Wig_Bc"		
		]
	],	
	[
		"CAMS_G_Tactical",1,false,
		[
			// Beards
			"COREV_G_Beard_A",
			"COREV_G_Beard_Azz",
			"COREV_G_Beard_B",
			"COREV_G_Beard_Baddazz",
			"COREV_G_Beard_C",
			"COREV_G_Beard_D"
		]
	],
	[
		"CAMS_G_Sport",1,false,
		[
			// Headphones
			"COREV_G_Headphone",
			"COREV_G_None"
		]
	],
	[
		"CAMS_G_Shades",1,false,
		[
			// Reading Glasses
			"COREV_G_Reading_A"
		]
	],
	[
		"CAMS_G_Lady",1,false,
		[
			// Halo
			"COREV_G_Halo_Ring"
		]
	],	
	[
		"CAMS_G_Bandana",1,false,
		[
		]
	],
	[
		"CAMS_G_Balaclava",1,false,
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

	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,false,
		[
			"FirstAidKit","Medikit","ToolKit"
		]
	],	
	
	// Backpacks
	[
		"CAMS_Packs_W",1,true,
		[			
			// ALICE Backpack
			"B_AliceBag_A",

			// Giant Backpack
			"B_GiantBag_A",
			"B_GiantBag_B",
			"B_GiantBag_C",
			"B_GiantBag_D",
			"B_GiantBag_E",
			"B_GiantBag_F",
			// Hiking Backpack
			"B_HikingBag_A",
			"B_HikingBag_B",
			"B_HikingBag_C",
			"B_HikingBag_D",
			"B_HikingBag_E",
			"B_HikingBag_F",


			// Munitions Bag
			"B_RPGBag_A",

			// Rucksacks
			"B_RucksackBag_A",
			"B_RucksackBag_B",
			"B_RucksackBag_C",
			"B_RucksackBag_D"
		]
	],
	[
		"CAMS_Packs_E",1,true,
		[
		
			// Carryall Backpack
			"B_Carryall_A",
			"B_Carryall_B",
			"B_Carryall_C",		



			// Field Pack
			"B_FieldPack_A",
			"B_FieldPack_B",


			// Kitbags
			"B_Kitbag_A",
			"B_Kitbag_B",
			"B_Kitbag_C",
			"B_Kitbag_D",
			"B_Kitbag_E",

			// Tactical Backpack
			"B_TacticalPack_A",
			"B_TacticalPack_B",
			"B_TacticalPack_C"
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
	
	// ******* WEAPONS - WEST ********************	
	[
		"CAMS_Pistols_W",1,false,
		[
			// Handguns  

			//"PstlTool_Flashlight",
			//"PstlTool_Spotlight",
			"Pstl9x19_P99",
			"Pstl9x19_FNGP35",
			"Pstl9x19_92FS",
			"Pstl9x19_MicroUzi",
			"Pstl9x19_MAC11",
			"Pstl11x23_M1911",
			"Pstl11x23_Revolver",
			"Pstl11x23_SAARevolver"
		]
	],
	[
		"CAMS_SMG_W",1,true,
		[
			"Smg9x19_DOE", 
			"Smg9x19_PP19", // Bizon -2-01

			"Auto556x45_N23PDW_BetaC",
			"Auto556x45_M231_BetaC"
		]
	],
	[
		"CAMS_Shotgun_W",1,false,   ///////// FIX IN VANILLA
		[
		// Assault Rifles with GL 

			"Shotgun12Ga_M870",	// Remington 870
			"Shotgun12Ga_MB590" //Mossberg 590
		]
	],
	[
		"CAMS_GL_W",1,false,
		[
			// Assault Rifles with GL 

			"Grnd40mm_MK13EGLM",

			"Launch54mm_CanLaucnher"
		]
	],	
	[
		"CAMS_LMG_W",1,true,
		[
			"Auto556x45_Minimi_A",//FN Minimi Para (Belt)
			"Auto762x51_MAG58", //FN Mag 58
			"Auto762x51_M60E4", //M60E4
			"Auto762x51_MG3" //MG3
		]
	],
	[
		"CAMS_MMG_W",1,true,
		[
		"Smg762x25_PPK74U" //PPK 74u

		]
	],
	[
		"CAMS_AssaultRifles_W",1,true,
		[	
			"Auto556x45_TAR21",
			"Auto556x45_TAR20",
			"Auto556x45_F2000",
			"Auto556x45_F2000C",
			"Auto556x45_G36C",
			"Auto556x45_G36KV",
			"Auto556x45_HK416",
			"Auto556x45_M4A3",
			"Auto556x45_CQM4",
			"Auto556x45_SCARL",
			"Auto556x45_SCARL_DES",
			"Auto556x45_MK18SBR",
			"Auto556x45_N23PDW",
			"Auto556x45_M231",
			"Auto556x45_M16A1_RIS",
			"Auto556x45_M16A2_RIS",
			"Auto556x45_M16A4",
			"Auto556x45_FAMASG2",
			"Auto556x45_FAMASG2_C",
			"Auto556x45_HK33_B",
			"Auto556x45_HK33A3_B",
			"Auto792x33_MP44",


			// Assault Rifles with GL 

			"Auto556x45_TAR21_GL",
			"Auto556x45_F2000_GL",
			"Auto556x45_G36KV_GL",
			"Auto556x45_HK416_GL",
			"Auto556x45_M4A3_GL",
			"Auto556x45_CQM4_GL",
			"Auto556x45_SCARL_GL",
			"Auto556x45_SCARL_DES_GL",
			"Auto556x45_M16A1_RIS_GL",
			"Auto556x45_M16A2_RIS_GL",
			"Auto556x45_M16A2_GL",
			"Auto556x45_M16A4_GL",
			"Auto556x45_FAMASG2_GL"
		]
	],
	[
		"CAMS_SniperRifles_W",1,true,
		[
			"Auto762x51_M14_RIS", //Springfield M14
			"Auto762x51_SCARH",
			"Auto762x51_SCARH_DES",
			"Auto762x51_SCARH_GL",
			"Auto762x51_SCARH_DES_GL",
			"Auto762x51_FAL",
			"Auto762x51_FALPara",
			"Auto762x51_G3A3",
			"Auto762x51_G3A3_GL",
			"Auto762x51_G3A4",
			"Auto762x51_G3A4_GL",


			// Snipers  

			"Bolt762x51_M24SWS_Grn",
			"Bolt762x51_M24SWS_Des",
			"Bolt762x51_M24SWS_Blk"
		]
	],
	[
		"CAMS_AA_W",1,false,
		[
		]
	],
	[
		"CAMS_AT_W",1,false,
		[

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
			// Handguns  

			//"PstlTool_Flashlight",
			//"PstlTool_Spotlight",
			"hgun_P07_F",
			"Pstl9x19_NP22",
			"Pstl9x19_NP42",
			"Pstl9x19_N213B",
			"Pstl9x19_CZSP01",
			"Pstl9x19_CZ75B",
			"Pstl765x17_VZ61",
			"Pstl9x18_PP9",
			"Pstl762x25_TT33",
			"Pstl762x25_CZ52"
		]
	],
	[
		"CAMS_SMG_E",1,true,
		[
			"Smg9x19_MP5A5", //Norinnco
			"Smg9x19_PP19" // Bizon -2-01


		]
	],
	[
		"CAMS_LMG_E",1,true,
		[

			"Auto556x45_Negev", // IWI Negev SF (556)
			"Auto762x51_NG7", //IWI Negev NG7
			"Auto762x54_PKM", //PKM
			"Auto762x54_PKP", //PKP
			"Auto762x54_UK59L" //UK-L vz59		
		]
	],
	[
		"CAMS_MMG_E",1,true,
		[
			"Smg762x25_PPK74U", //PPK 74u
			"Smg762x25_PPSh41_B", //PPS-41D
			"Smg762x25_PPS43" //PPS 43
		]
	],
	[
		"CAMS_Shotgun_E",1,false,
		[
			"Shotgun12Ga_SPAS12", //Franchi SPAS 12
			"Shotgun12Ga_M37" //Ithaca 37
		]
	],
	
	[
		"CAMS_GL_E",1,true,
		[
		// Assault Rifles with GL 

			"Grnd40mm_M79"
		]
	],	
	
	[
		"CAMS_AssaultRifles_E",1,true,
		[
			"Auto65x39_AK108M",
			"Auto65x39_AK102M",
			"Auto65x39_AK108M_GL",
			"Auto65x39_AK102M_GL",

			"Auto762x39_AK104",
			"Auto762x39_AKM_RIS_GL",
			"Auto762x39_AKMS_RIS_GL",

			"Auto545x39_AK74M",
			"Auto545x39_AKS74_RIS",
			"Auto545x39_AK105",
			"Auto545x39_AK74M_GL",
			"Auto545x39_AKS74_RIS_GL",

			"Auto762x39_Type63",

			"Auto762x39_AKM_RIS",
			"Auto762x39_AKMS_RIS",
			"Auto762x39_AKMSU_RIS",
			"Auto545x39_AKS74U_RIS"
		]
	],
	[
		"CAMS_SniperRifles_E",1,true,
		[
			"Auto762x51_SR25", //SR-25
			"Auto762x51_SR25EC", //SR-25
			"Auto762x51_NDM86",//Norinco
			"Auto762x54_SVD63",//Drugonav


			// Snipers  

			"Bolt762x54_M9130_RIS", //Mosin Nagent
			"Bolt77x56_SMLE_RIS", //SMLE No. 4 MK1
			"Bolt792x57_Kar98K_RIS", //Mauser 98k
			"Bolt792x57_CZ550" //CZ-550
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
/*
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
	],
	*/
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//  Water vehicles - Civ / General
	[
		"CAMS_H20_Boats_C",1,false,
		[
			"COREV_I_CartelA_Boat_Transport",
			//"COREV_I_CartelA_Boat_Transport_AI",
			"COREV_I_PirateAf_Boat_Transport",
			//"COREV_I_PirateAf_Boat_Transport_AI",
			"COREV_IR_Boat_Transport_01_F",
			"COREV_O_CartelA_Boat_Transport",
			//"COREV_O_CartelA_Boat_Transport_AI",
			"COREV_O_PirateAf_Boat_Transport",
			//"COREV_O_PirateAf_Boat_Transport_AI",



			"COREV_I_CartelA_FishingBoat",
			//"COREV_I_CartelA_FishingBoat_AI",
			"COREV_I_CDG_FishingBoat",
			//"COREV_I_CDG_FishingBoat_AI",
			"COREV_I_PirateAf_FishingBoat",
			//"COREV_I_PirateAf_FishingBoat_AI",
			"COREV_I_TAF_FishingBoat",
			//"COREV_I_TAF_FishingBoat_AI",
			"COREV_I_TKG_FishingBoat",
			//"COREV_I_TKG_FishingBoat_AI",
			"COREV_O_CartelA_FishingBoat",
			//"COREV_O_CartelA_FishingBoat_AI",
			"COREV_O_CDG_FishingBoat",
			//"COREV_O_CDG_FishingBoat_AI",
			"COREV_O_FishingBoat",
			//"COREV_O_FishingBoat_AI",
			"COREV_O_PirateAf_FishingBoat",
			//"COREV_O_PirateAf_FishingBoat_AI",
			"COREV_O_TAF_FishingBoat",
			//"COREV_O_TAF_FishingBoat_AI",
			"COREV_O_TKG_FishingBoat",
			//"COREV_O_TKG_FishingBoat_AI",


			"COREV_I_CartelA_SmallBoat",
			//"COREV_I_CartelA_SmallBoat_AI",
			"COREV_I_CDG_SmallBoat",
			//"COREV_I_CDG_SmallBoat_AI",
			"COREV_I_PirateAf_SmallBoat",
			//"COREV_I_PirateAf_SmallBoat_AI",
			"COREV_I_TAF_SmallBoat",
			//"COREV_I_TAF_SmallBoat_AI",
			"COREV_I_TKG_SmallBoat",
			//"COREV_I_TKG_SmallBoat_AI",
			"COREV_O_CartelA_SmallBoat",
			//"COREV_O_CartelA_SmallBoat_AI",
			"COREV_O_CDG_SmallBoat",
			//"COREV_O_CDG_SmallBoat_AI",
			"COREV_O_PirateAf_SmallBoat",
			//"COREV_O_PirateAf_SmallBoat_AI",
			"COREV_O_SmallBoat",
			//"COREV_O_SmallBoat_AI",
			"COREV_O_TAF_SmallBoat",
			//"COREV_O_TAF_SmallBoat_AI",
			"COREV_O_TKG_SmallBoat"
			//"COREV_O_TKG_SmallBoat_AI"
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
			"COREV_I_TAF_FishingBoat_Armed",
			"COREV_I_TKG_FishingBoat_Armed",
					
			"COREV_O_TAF_FishingBoat_Armed",
			"COREV_O_TKG_FishingBoat_Armed"
		
		
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
			"COREV_IR_SDV_01_F"

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
			"COREV_I_CDG_FishingBoat_Armed",
			"COREV_O_CDG_FishingBoat_Armed",
			"COREV_IR_Boat_Armed_01_minigun_F",
			"COREV_O_FishingBoat_Armed"


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
			"COREV_IR_SDV_01_F"
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
			"COREV_I_PirateAf_FishingBoat_Armed",
			"COREV_I_CartelA_FishingBoat_Armed",
			"COREV_O_PirateAf_FishingBoat_Armed",
			"COREV_O_CartelA_FishingBoat_Armed"
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
			"COREV_IR_Heli_light_03_F",
			"COREV_IR_Heli_Transport_02_F"
		]
	],	
	
	///////////////////////////////////////////////// Helicopters - West

	[
		"CAMS_Heli_Armed_W",1,false,
		[
			"COREV_I_CDF_Heli_Attack_Kajman"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,false,
		[
			"COREV_I_CDF_Heli_Light_Orca_unarmed",
			"COREV_I_AFA_Heli_Light_Orca_unarmed",

			"COREV_I_CDF_Heli_Transport_Taru",
			"COREV_I_CDF_Heli_Transport_Taru_ammo",
			"COREV_I_CDF_Heli_Transport_Taru_bench",
			"COREV_I_CDF_Heli_Transport_Taru_box",
			"COREV_I_CDF_Heli_Transport_Taru_covered",
			"COREV_I_CDF_Heli_Transport_Taru_fuel",
			"COREV_I_CDF_Heli_Transport_Taru_medevac",
			"COREV_I_CDF_Heli_Transport_Taru_repair",
			"COREV_I_CDG_Heli_Transport_Mohawk",

			"COREV_I_AFA_Heli_Transport_Mohawk"

		]
	],
	
	[
		"CAMS_Heli_ArmedTransport_W",1,false,
		[
			"COREV_I_CDF_Heli_Light_Orca",
			"COREV_I_AFA_Heli_Light_Hellcat",
			"COREV_I_AFA_Heli_Light_Orca"
		]
	],
	
	/////////////////////////////////// Helicopters - East 
	[
		"CAMS_Heli_Armed_E",1,false,
		[
			"COREV_O_CDF_Heli_Attack_Kajman",
			"COREV_O_TKA_Heli_Attack_Blackfoot"
		]
	],
	[
		"CAMS_Heli_ArmedTransport_E",1,false,
		[
			"COREV_O_AFA_Heli_Light_Hellcat",
			"COREV_O_TKA_Heli_Light_Hellcat",
			"COREV_O_AFA_Heli_Light_Orca",
			"COREV_O_CDF_Heli_Light_Orca"

		]
	],	
	[
		"CAMS_Heli_Transport_E",1,false,
		[
			"COREV_O_AFA_Heli_Light_Hellcat_unarmed",
			"COREV_O_TKA_Heli_Light_Hellcat_unarmed",
			"COREV_O_AFA_Heli_Light_Orca_unarmed",
			"COREV_O_CDF_Heli_Light_Orca_unarmed",
			"COREV_O_CDF_Heli_Transport_Taru",
			"COREV_O_CDF_Heli_Transport_Taru_ammo",
			"COREV_O_CDF_Heli_Transport_Taru_bench",
			"COREV_O_CDF_Heli_Transport_Taru_box",
			"COREV_O_CDF_Heli_Transport_Taru_covered",
			"COREV_O_CDF_Heli_Transport_Taru_fuel",
			"COREV_O_CDF_Heli_Transport_Taru_medevac",
			"COREV_O_CDF_Heli_Transport_Taru_repair",
			"COREV_O_CDG_Heli_Transport_Mohawk",
			"COREV_O_AFA_Heli_Transport_Mohawk",
			"COREV_O_TKA_Heli_Transport_Mohawk"

		]
	],

	/*
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
	*/
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,false,
		[
			"COREV_I_AFA_Plane_Fighter_L39_AA",
			"COREV_I_AFA_Plane_Fighter_L39_CAS",
			"COREV_I_CDF_Plane_CAS_Neophron"
		]
	],

	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,false,
		[
			"COREV_O_AFA_Plane_Fighter_L39_AA",
			"COREV_O_AFA_Plane_Fighter_L39_CAS",
			"COREV_O_CDF_Plane_CAS_Neophron",
			"COREV_O_TKA_Plane_CAS_Wipeout"
		]
	],
	[
		"CAMS_Plane_UAV_E",1,false,
		[
			"COREV_B_UAV_Explosive",
			"COREV_B_UAV_Recon",		
			"COREV_O_UAV_Explosive",
			"COREV_O_UAV_Recon"
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
			"COREV_I_UAV_Explosive",
			"COREV_I_UAV_Recon"
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
			"COREV_I_TME_Truck_Van",
			"COREV_I_TME_Truck_Van_Box",
			"COREV_I_TME_Truck_Van_Fuel",

			"COREV_I_TKG_Truck_Van",
			"COREV_I_TKG_Truck_Van_Box",
			"COREV_I_TKG_Truck_Van_Fuel",

			"COREV_I_TAF_Truck_Van",
			"COREV_I_TAF_Truck_Van_Box",
			"COREV_I_TAF_Truck_Van_Fuel",

			"COREV_I_PirateAf_Truck_Van",
			"COREV_I_PirateAf_Truck_Van_Box",
			"COREV_I_PirateAf_Truck_Van_Fuel",

			"COREV_I_AFG_Truck_Van",
			"COREV_I_AFG_Truck_Van_Box",
			"COREV_I_AFG_Truck_Van_Fuel",

			"COREV_I_CartelA_Truck_Van",
			"COREV_I_CartelA_Truck_Van_Box",

			"COREV_I_CDG_Truck_Van",

			"COREV_O_TAF_Truck_Van",
			"COREV_O_TAF_Truck_Van_Box",
			"COREV_O_TAF_Truck_Van_Fuel",

			"COREV_O_AFG_Truck_Van",
			"COREV_O_AFG_Truck_Van_Box",
			"COREV_O_AFG_Truck_Van_Fuel",
			"COREV_O_CartelA_Truck_Van",
			"COREV_O_CartelA_Truck_Van_Box",
			"COREV_O_CDG_Truck_Van",
			"COREV_O_PirateAf_Truck_Van",
			"COREV_O_PirateAf_Truck_Van_Box",
			"COREV_O_PirateAf_Truck_Van_Fuel",

			"COREV_O_TME_Truck_Van",
			"COREV_O_TME_Truck_Van_Box",
			"COREV_O_TME_Truck_Van_Fuel",
			"COREV_O_TKG_Truck_Van",
			"COREV_O_TKG_Truck_Van_Box",
			"COREV_O_TKG_Truck_Van_Fuel"
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
			"COREV_I_AFA_LandRover_DAR",
			"COREV_I_AFA_LandRover_IglaAA",
			"COREV_I_AFA_LandRover_MetisAT",
			"COREV_I_AFA_LandRover_MG",

			"COREV_I_AFG_LandRover_DAR",
			"COREV_I_AFG_LandRover_IglaAA",
			"COREV_I_AFG_LandRover_MetisAT",
			"COREV_I_AFG_LandRover_MG",
			"COREV_I_AFG_Offroad_Pickup_HMG",
			"COREV_I_CartelA_Offroad_Pickup_HMG",

			"COREV_I_CDF_MRAP_Ifrit_GMG",
			"COREV_I_CDF_MRAP_Ifrit_HMG",


			"COREV_I_AFA_Offroad_Pickup_HMG",

			"COREV_I_CDG_LandRover_DAR",
			"COREV_I_CDG_LandRover_IglaAA",
			"COREV_I_CDG_LandRover_MetisAT",
			"COREV_I_CDG_LandRover_MG",
			"COREV_I_CDG_MRAP_Strider_GMG",
			"COREV_I_CDG_MRAP_Strider_HMG",
			"COREV_I_CDG_Offroad_Pickup_HMG",

			"COREV_I_PirateAf_Offroad_Pickup_HMG",
			"COREV_I_TAF_LandRover_DAR",
			"COREV_I_TAF_LandRover_IglaAA",
			"COREV_I_TAF_LandRover_MetisAT",
			"COREV_I_TAF_LandRover_MG",
			"COREV_I_TAF_Offroad_Pickup_HMG",

			"COREV_I_TKG_LandRover_DAR",
			"COREV_I_TKG_LandRover_IglaAA",
			"COREV_I_TKG_LandRover_MetisAT",
			"COREV_I_TKG_LandRover_MG",
			"COREV_I_TKG_Offroad_Pickup_HMG",

			"COREV_I_TME_LandRover_DAR",
			"COREV_I_TME_LandRover_IglaAA",
			"COREV_I_TME_LandRover_MetisAT",
			"COREV_I_TME_LandRover_MG",
			"COREV_I_TME_Offroad_Pickup_HMG"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,false,
		[
			"COREV_I_AFA_LandRover",

			"COREV_I_AFA_Offroad_Pickup",

			"COREV_I_AFG_LandRover",

			"COREV_I_AFG_Offroad_Pickup",

			"COREV_I_CDF_MRAP_Ifrit",

			"COREV_I_CDG_LandRover",

			"COREV_I_CartelA_Offroad_Pickup",

			"COREV_I_CDG_MRAP_Hunter",
			"COREV_I_CDG_MRAP_Strider",

			"COREV_I_TAF_LandRover",
			"COREV_I_TME_LandRover",

			"COREV_I_TME_Offroad_Pickup",

			"COREV_I_TKG_Offroad_Pickup",

			"COREV_I_TAF_Offroad_Pickup",
			"COREV_I_PirateAf_Offroad_Pickup",

			"COREV_I_CDG_Offroad_Pickup"
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
			"COREV_I_AFA_Truck_Zamak_covered",
			"COREV_I_AFA_Truck_Zamak_transport",
			"COREV_I_TME_Truck_Zamak_transport",
			"COREV_I_AFG_Truck_Zamak_transport",
			"COREV_I_TKG_Truck_Zamak_transport",
			"COREV_I_TAF_Truck_Zamak_transport",
			"COREV_I_PirateAf_Truck_Zamak_transport",
			"COREV_I_CDG_Truck_Zamak_covered",
			"COREV_I_CDG_Truck_Zamak_transport"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,false,
		[
			"COREV_I_CDF_Truck_Tempest_ammo",
			"COREV_I_CDF_Truck_Tempest_covered",
			"COREV_I_CDF_Truck_Tempest_device",
			"COREV_I_CDF_Truck_Tempest_fuel",
			"COREV_I_CDF_Truck_Tempest_medical",
			"COREV_I_CDF_Truck_Tempest_repair",
			"COREV_I_CDF_Truck_Tempest_transport"
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,false,
		[
			"COREV_I_AFA_APC_Wheeled_Marshall",
			"COREV_I_TME_APC_Wheeled_Marid",
			"COREV_I_TAF_APC_Wheeled_Marid",
			"COREV_I_CDF_APC_Wheeled_Marid",
			"COREV_B_Enforcer_APC_Wheeled_Marid",
			"COREV_I_CDG_APC_Wheeled_Marid"
		]
	],
	[
		"CAMS_Land_Tank_W",1,false,
		[
			"COREV_I_AFA_APC_Tracked_Kamysh",
			"COREV_I_AFA_MBT_Kuma",
			"COREV_I_CDF_APC_Tracked_Kamysh",
			"COREV_I_CDF_MBT_Varsuk",
			"COREV_I_CDG_APC_Tracked_Kamysh",
			"COREV_IR_APC_tracked_03_cannon_F",
			"COREV_IR_MBT_03_cannon_F"
		]
	],
	[
		"CAMS_Land_Artillery_W",1,false,
		[
			"COREV_I_CDF_Arty_Sochor"	
		]
	],
	[
		"CAMS_Land_AA_W",1,false,
		[
			"COREV_I_CDF_APC_Tracked_TigrisAA",
			"COREV_I_AFA_APC_Tracked_TigrisAA",
			"COREV_I_CDG_APC_Tracked_TigrisAA"
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
		
			"COREV_O_AFA_LandRover_DAR",
			"COREV_O_AFA_LandRover_IglaAA",
			"COREV_O_AFA_LandRover_MetisAT",
			"COREV_O_AFA_LandRover_MG",
			"COREV_O_AFA_Offroad_Pickup_HMG",
			"COREV_O_AFG_LandRover_DAR",
			"COREV_O_AFG_LandRover_IglaAA",
			"COREV_O_AFG_LandRover_MetisAT",
			"COREV_O_AFG_LandRover_MG",
			"COREV_O_AFG_Offroad_Pickup_HMG",
			"COREV_O_CartelA_Offroad_Pickup_HMG",
			"COREV_O_CDF_MRAP_Ifrit_GMG",
			"COREV_O_CDF_MRAP_Ifrit_HMG",

			"COREV_O_CDG_LandRover_DAR",
			"COREV_O_CDG_LandRover_IglaAA",
			"COREV_O_CDG_LandRover_MetisAT",
			"COREV_O_CDG_LandRover_MG",
			"COREV_O_CDG_MRAP_Strider_GMG",
			"COREV_O_CDG_MRAP_Strider_HMG",
			"COREV_O_CDG_Offroad_Pickup_HMG",
			"COREV_O_LandRover_DAR",
			"COREV_O_LandRover_IglaAA",
			"COREV_O_LandRover_MetisAT",
			"COREV_O_LandRover_MG",
			"COREV_O_PirateAf_Offroad_Pickup_HMG",
			"COREV_O_TAF_LandRover_DAR",
			"COREV_O_TAF_LandRover_IglaAA",
			"COREV_O_TAF_LandRover_MetisAT",
			"COREV_O_TAF_LandRover_MG",
			"COREV_O_TAF_Offroad_Pickup_HMG",
			"COREV_O_TKA_MRAP_Strider_GMG",
			"COREV_O_TKA_MRAP_Strider_HMG",
			"COREV_O_TKA_Offroad_Pickup_HMG",
			"COREV_O_TKG_LandRover_DAR",
			"COREV_O_TKG_LandRover_IglaAA",
			"COREV_O_TKG_LandRover_MetisAT",
			"COREV_O_TKG_LandRover_MG",
			"COREV_O_TKG_Offroad_Pickup_HMG",
			"COREV_O_TME_LandRover_DAR",
			"COREV_O_TME_LandRover_IglaAA",
			"COREV_O_TME_LandRover_MetisAT",
			"COREV_O_TME_LandRover_MG",
			"COREV_O_TME_Offroad_Pickup_HMG"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,false,
		[
			"COREV_O_AFA_LandRover",
			"COREV_O_AFA_Offroad_Pickup",
			"COREV_O_AFG_LandRover",
			"COREV_O_AFG_Offroad_Pickup",
			"COREV_O_CartelA_Offroad_Pickup",
			"COREV_O_CDF_MRAP_Ifrit",
			"COREV_O_CDG_LandRover",
			"COREV_O_CDG_MRAP_Hunter",
			"COREV_O_CDG_MRAP_Strider",
			"COREV_O_CDG_Offroad_Pickup",
			"COREV_O_LandRover",
			"COREV_O_PirateAf_Offroad_Pickup",
			"COREV_O_TAF_LandRover",
			"COREV_O_TAF_Offroad_Pickup",
			"COREV_O_TKA_MRAP_Strider",
			"COREV_O_TKA_Offroad_Pickup",
			"COREV_O_TKG_LandRover",
			"COREV_O_TKG_Offroad_Pickup",
			"COREV_O_TME_LandRover",
			"COREV_O_TME_Offroad_Pickup"
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
			"COREV_O_TME_Truck_Zamak_transport",
			"COREV_O_TKG_Truck_Zamak_transport",
			"COREV_O_TKA_Truck_Zamak_covered",
			"COREV_O_TKA_Truck_Zamak_transport",
			"COREV_O_TAF_Truck_Zamak_transport",
			"COREV_O_PirateAf_Truck_Zamak_transport",
			"COREV_O_CDG_Truck_Zamak_covered",
			"COREV_O_CDG_Truck_Zamak_transport",
			"COREV_O_AFG_Truck_Zamak_transport",
			"COREV_O_AFA_Truck_Zamak_covered",
			"COREV_O_AFA_Truck_Zamak_transport"
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,false,
		[
			"COREV_O_CDF_Truck_Tempest_ammo",
			"COREV_O_CDF_Truck_Tempest_covered",
			"COREV_O_CDF_Truck_Tempest_device",
			"COREV_O_CDF_Truck_Tempest_fuel",
			"COREV_O_CDF_Truck_Tempest_medical",
			"COREV_O_CDF_Truck_Tempest_repair",
			"COREV_O_CDF_Truck_Tempest_transport"
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,false,
		[
			"COREV_O_AFA_APC_Wheeled_Marshall",
			"COREV_O_CDG_APC_Wheeled_Marid",
			"COREV_O_TKA_APC_Wheeled_Marshall",
			"COREV_O_TME_APC_Wheeled_Marid",
			"COREV_O_TAF_APC_Wheeled_Marid",
			"COREV_O_CDF_APC_Wheeled_Marid"
		]
	],
	[
		"CAMS_Land_Tank_E",1,false,
		[
			"COREV_O_AFA_APC_Tracked_Kamysh",
			"COREV_O_AFA_MBT_Kuma",
			"COREV_O_CDF_APC_Tracked_Kamysh",
			"COREV_O_CDF_MBT_Varsuk",
			"COREV_O_CDG_APC_Tracked_Kamysh",
			"COREV_O_TKA_APC_Tracked_Mora",
			"COREV_O_TKA_MBT_Kuma"
		]
	],
	[
		"CAMS_Land_AA_E",1,false,
		[
			"COREV_O_TKA_APC_Tracked_TigrisAA",
			"COREV_O_CDG_APC_Tracked_TigrisAA",
			"COREV_O_CDF_APC_Tracked_TigrisAA",
			"COREV_O_AFA_APC_Tracked_TigrisAA"
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,false,
		[
			"COREV_O_CDF_Arty_Sochor",
			"COREV_O_TKA_Arty_Sochor"
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
			"COREV_IR_APC_Wheeled_03_cannon_F",
			"COREV_IR_MRAP_03_gmg_F",
			"COREV_IR_MRAP_03_hmg_F"
		]
		
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,false,
		[
			"COREV_IR_MRAP_03_F"
		]
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
			"COREV_IR_Quadbike_01_F"

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
			"COREV_IR_Truck_02_ammo_F",
			"COREV_IR_Truck_02_box_F",
			"COREV_IR_Truck_02_covered_F",
			"COREV_IR_Truck_02_fuel_F",
			"COREV_IR_Truck_02_medical_F",
			"COREV_IR_Truck_02_transport_F"
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

/*	//////////////////////////////////////////// Static Guns - West
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

	*/
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

        Exile Pricelists



// Cars

class COREV_B_Enforcer_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_I_AFA_APC_Wheeled_Marshall { quality = 3; price = 150; };
class COREV_I_AFA_LandRover { quality = 3; price = 150; };
class COREV_I_AFA_LandRover_DAR { quality = 3; price = 150; };
class COREV_I_AFA_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_I_AFA_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_I_AFA_LandRover_MG { quality = 3; price = 150; };
class COREV_I_AFA_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_AFA_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_AFA_Truck_Zamak_covered { quality = 3; price = 150; };
class COREV_I_AFA_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_I_AFG_LandRover { quality = 3; price = 150; };
class COREV_I_AFG_LandRover_DAR { quality = 3; price = 150; };
class COREV_I_AFG_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_I_AFG_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_I_AFG_LandRover_MG { quality = 3; price = 150; };
class COREV_I_AFG_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_AFG_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_AFG_Truck_Van { quality = 3; price = 150; };
class COREV_I_AFG_Truck_Van_Box { quality = 3; price = 150; };
class COREV_I_AFG_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_I_AFG_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_I_CartelA_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_CartelA_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_CartelA_Truck_Van { quality = 3; price = 150; };
class COREV_I_CartelA_Truck_Van_Box { quality = 3; price = 150; };
class COREV_I_CDF_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_I_CDF_MRAP_Ifrit { quality = 3; price = 150; };
class COREV_I_CDF_MRAP_Ifrit_GMG { quality = 3; price = 150; };
class COREV_I_CDF_MRAP_Ifrit_HMG { quality = 3; price = 150; };
class COREV_I_CDF_Truck_Tempest_ammo { quality = 3; price = 150; };
class COREV_I_CDF_Truck_Tempest_covered { quality = 3; price = 150; };
class COREV_I_CDF_Truck_Tempest_device { quality = 3; price = 150; };
class COREV_I_CDF_Truck_Tempest_fuel { quality = 3; price = 150; };
class COREV_I_CDF_Truck_Tempest_medical { quality = 3; price = 150; };
class COREV_I_CDF_Truck_Tempest_repair { quality = 3; price = 150; };
class COREV_I_CDF_Truck_Tempest_transport { quality = 3; price = 150; };
class COREV_I_CDG_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_I_CDG_LandRover { quality = 3; price = 150; };
class COREV_I_CDG_LandRover_DAR { quality = 3; price = 150; };
class COREV_I_CDG_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_I_CDG_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_I_CDG_LandRover_MG { quality = 3; price = 150; };
class COREV_I_CDG_MRAP_Hunter { quality = 3; price = 150; };
class COREV_I_CDG_MRAP_Strider { quality = 3; price = 150; };
class COREV_I_CDG_MRAP_Strider_GMG { quality = 3; price = 150; };
class COREV_I_CDG_MRAP_Strider_HMG { quality = 3; price = 150; };
class COREV_I_CDG_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_CDG_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_CDG_Truck_Van { quality = 3; price = 150; };
class COREV_I_CDG_Truck_Zamak_covered { quality = 3; price = 150; };
class COREV_I_CDG_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_I_PirateAf_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_PirateAf_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_PirateAf_Truck_Van { quality = 3; price = 150; };
class COREV_I_PirateAf_Truck_Van_Box { quality = 3; price = 150; };
class COREV_I_PirateAf_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_I_PirateAf_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_I_TAF_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_I_TAF_LandRover { quality = 3; price = 150; };
class COREV_I_TAF_LandRover_DAR { quality = 3; price = 150; };
class COREV_I_TAF_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_I_TAF_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_I_TAF_LandRover_MG { quality = 3; price = 150; };
class COREV_I_TAF_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_TAF_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_TAF_Truck_Van { quality = 3; price = 150; };
class COREV_I_TAF_Truck_Van_Box { quality = 3; price = 150; };
class COREV_I_TAF_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_I_TAF_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_I_TKG_LandRover { quality = 3; price = 150; };
class COREV_I_TKG_LandRover_DAR { quality = 3; price = 150; };
class COREV_I_TKG_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_I_TKG_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_I_TKG_LandRover_MG { quality = 3; price = 150; };
class COREV_I_TKG_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_TKG_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_TKG_Truck_Van { quality = 3; price = 150; };
class COREV_I_TKG_Truck_Van_Box { quality = 3; price = 150; };
class COREV_I_TKG_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_I_TKG_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_I_TME_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_I_TME_LandRover { quality = 3; price = 150; };
class COREV_I_TME_LandRover_DAR { quality = 3; price = 150; };
class COREV_I_TME_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_I_TME_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_I_TME_LandRover_MG { quality = 3; price = 150; };
class COREV_I_TME_Offroad_Pickup { quality = 3; price = 150; };
class COREV_I_TME_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_I_TME_Truck_Van { quality = 3; price = 150; };
class COREV_I_TME_Truck_Van_Box { quality = 3; price = 150; };
class COREV_I_TME_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_I_TME_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_IR_APC_Wheeled_03_cannon_F { quality = 3; price = 150; };
class COREV_IR_MRAP_03_F { quality = 3; price = 150; };
class COREV_IR_MRAP_03_gmg_F { quality = 3; price = 150; };
class COREV_IR_MRAP_03_hmg_F { quality = 3; price = 150; };
class COREV_IR_Quadbike_01_F { quality = 3; price = 150; };
class COREV_IR_Truck_02_ammo_F { quality = 3; price = 150; };
class COREV_IR_Truck_02_box_F { quality = 3; price = 150; };
class COREV_IR_Truck_02_covered_F { quality = 3; price = 150; };
class COREV_IR_Truck_02_fuel_F { quality = 3; price = 150; };
class COREV_IR_Truck_02_medical_F { quality = 3; price = 150; };
class COREV_IR_Truck_02_transport_F { quality = 3; price = 150; };
class COREV_O_AFA_APC_Wheeled_Marshall { quality = 3; price = 150; };
class COREV_O_AFA_LandRover { quality = 3; price = 150; };
class COREV_O_AFA_LandRover_DAR { quality = 3; price = 150; };
class COREV_O_AFA_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_O_AFA_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_O_AFA_LandRover_MG { quality = 3; price = 150; };
class COREV_O_AFA_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_AFA_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_AFA_Truck_Zamak_covered { quality = 3; price = 150; };
class COREV_O_AFA_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_O_AFG_LandRover { quality = 3; price = 150; };
class COREV_O_AFG_LandRover_DAR { quality = 3; price = 150; };
class COREV_O_AFG_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_O_AFG_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_O_AFG_LandRover_MG { quality = 3; price = 150; };
class COREV_O_AFG_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_AFG_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_AFG_Truck_Van { quality = 3; price = 150; };
class COREV_O_AFG_Truck_Van_Box { quality = 3; price = 150; };
class COREV_O_AFG_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_O_AFG_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_O_CartelA_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_CartelA_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_CartelA_Truck_Van { quality = 3; price = 150; };
class COREV_O_CartelA_Truck_Van_Box { quality = 3; price = 150; };
class COREV_O_CDF_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_O_CDF_MRAP_Ifrit { quality = 3; price = 150; };
class COREV_O_CDF_MRAP_Ifrit_GMG { quality = 3; price = 150; };
class COREV_O_CDF_MRAP_Ifrit_HMG { quality = 3; price = 150; };
class COREV_O_CDF_Truck_Tempest_ammo { quality = 3; price = 150; };
class COREV_O_CDF_Truck_Tempest_covered { quality = 3; price = 150; };
class COREV_O_CDF_Truck_Tempest_device { quality = 3; price = 150; };
class COREV_O_CDF_Truck_Tempest_fuel { quality = 3; price = 150; };
class COREV_O_CDF_Truck_Tempest_medical { quality = 3; price = 150; };
class COREV_O_CDF_Truck_Tempest_repair { quality = 3; price = 150; };
class COREV_O_CDF_Truck_Tempest_transport { quality = 3; price = 150; };
class COREV_O_CDG_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_O_CDG_LandRover { quality = 3; price = 150; };
class COREV_O_CDG_LandRover_DAR { quality = 3; price = 150; };
class COREV_O_CDG_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_O_CDG_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_O_CDG_LandRover_MG { quality = 3; price = 150; };
class COREV_O_CDG_MRAP_Hunter { quality = 3; price = 150; };
class COREV_O_CDG_MRAP_Strider { quality = 3; price = 150; };
class COREV_O_CDG_MRAP_Strider_GMG { quality = 3; price = 150; };
class COREV_O_CDG_MRAP_Strider_HMG { quality = 3; price = 150; };
class COREV_O_CDG_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_CDG_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_CDG_Truck_Van { quality = 3; price = 150; };
class COREV_O_CDG_Truck_Zamak_covered { quality = 3; price = 150; };
class COREV_O_CDG_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_O_LandRover { quality = 3; price = 150; };
class COREV_O_LandRover_DAR { quality = 3; price = 150; };
class COREV_O_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_O_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_O_LandRover_MG { quality = 3; price = 150; };
class COREV_O_PirateAf_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_PirateAf_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_PirateAf_Truck_Van { quality = 3; price = 150; };
class COREV_O_PirateAf_Truck_Van_Box { quality = 3; price = 150; };
class COREV_O_PirateAf_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_O_PirateAf_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_O_TAF_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_O_TAF_LandRover { quality = 3; price = 150; };
class COREV_O_TAF_LandRover_DAR { quality = 3; price = 150; };
class COREV_O_TAF_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_O_TAF_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_O_TAF_LandRover_MG { quality = 3; price = 150; };
class COREV_O_TAF_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_TAF_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_TAF_Truck_Van { quality = 3; price = 150; };
class COREV_O_TAF_Truck_Van_Box { quality = 3; price = 150; };
class COREV_O_TAF_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_O_TAF_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_O_TKA_APC_Wheeled_Marshall { quality = 3; price = 150; };
class COREV_O_TKA_MRAP_Strider { quality = 3; price = 150; };
class COREV_O_TKA_MRAP_Strider_GMG { quality = 3; price = 150; };
class COREV_O_TKA_MRAP_Strider_HMG { quality = 3; price = 150; };
class COREV_O_TKA_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_TKA_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_TKA_Truck_Zamak_covered { quality = 3; price = 150; };
class COREV_O_TKA_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_O_TKG_LandRover { quality = 3; price = 150; };
class COREV_O_TKG_LandRover_DAR { quality = 3; price = 150; };
class COREV_O_TKG_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_O_TKG_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_O_TKG_LandRover_MG { quality = 3; price = 150; };
class COREV_O_TKG_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_TKG_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_TKG_Truck_Van { quality = 3; price = 150; };
class COREV_O_TKG_Truck_Van_Box { quality = 3; price = 150; };
class COREV_O_TKG_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_O_TKG_Truck_Zamak_transport { quality = 3; price = 150; };
class COREV_O_TME_APC_Wheeled_Marid { quality = 3; price = 150; };
class COREV_O_TME_LandRover { quality = 3; price = 150; };
class COREV_O_TME_LandRover_DAR { quality = 3; price = 150; };
class COREV_O_TME_LandRover_IglaAA { quality = 3; price = 150; };
class COREV_O_TME_LandRover_MetisAT { quality = 3; price = 150; };
class COREV_O_TME_LandRover_MG { quality = 3; price = 150; };
class COREV_O_TME_Offroad_Pickup { quality = 3; price = 150; };
class COREV_O_TME_Offroad_Pickup_HMG { quality = 3; price = 150; };
class COREV_O_TME_Truck_Van { quality = 3; price = 150; };
class COREV_O_TME_Truck_Van_Box { quality = 3; price = 150; };
class COREV_O_TME_Truck_Van_Fuel { quality = 3; price = 150; };
class COREV_O_TME_Truck_Zamak_transport { quality = 3; price = 150; };


// Tanks

class COREV_I_AFA_APC_Tracked_Kamysh { quality = 3; price = 150; };
class COREV_I_AFA_APC_Tracked_TigrisAA { quality = 3; price = 150; };
class COREV_I_AFA_MBT_Kuma { quality = 3; price = 150; };
class COREV_I_CDF_APC_Tracked_Kamysh { quality = 3; price = 150; };
class COREV_I_CDF_APC_Tracked_TigrisAA { quality = 3; price = 150; };
class COREV_I_CDF_Arty_Sochor { quality = 3; price = 150; };
class COREV_I_CDF_MBT_Varsuk { quality = 3; price = 150; };
class COREV_I_CDG_APC_Tracked_Kamysh { quality = 3; price = 150; };
class COREV_I_CDG_APC_Tracked_TigrisAA { quality = 3; price = 150; };
class COREV_IR_APC_tracked_03_cannon_F { quality = 3; price = 150; };
class COREV_IR_MBT_03_cannon_F { quality = 3; price = 150; };
class COREV_O_AFA_APC_Tracked_Kamysh { quality = 3; price = 150; };
class COREV_O_AFA_APC_Tracked_TigrisAA { quality = 3; price = 150; };
class COREV_O_AFA_MBT_Kuma { quality = 3; price = 150; };
class COREV_O_CDF_APC_Tracked_Kamysh { quality = 3; price = 150; };
class COREV_O_CDF_APC_Tracked_TigrisAA { quality = 3; price = 150; };
class COREV_O_CDF_Arty_Sochor { quality = 3; price = 150; };
class COREV_O_CDF_MBT_Varsuk { quality = 3; price = 150; };
class COREV_O_CDG_APC_Tracked_Kamysh { quality = 3; price = 150; };
class COREV_O_CDG_APC_Tracked_TigrisAA { quality = 3; price = 150; };
class COREV_O_TKA_APC_Tracked_Mora { quality = 3; price = 150; };
class COREV_O_TKA_APC_Tracked_TigrisAA { quality = 3; price = 150; };
class COREV_O_TKA_Arty_Sochor { quality = 3; price = 150; };
class COREV_O_TKA_MBT_Kuma { quality = 3; price = 150; };


// Boats

class COREV_I_CartelA_Boat_Transport { quality = 3; price = 150; };
class COREV_I_CartelA_Boat_Transport_AI { quality = 3; price = 150; };
class COREV_I_CartelA_FishingBoat { quality = 3; price = 150; };
class COREV_I_CartelA_FishingBoat_AI { quality = 3; price = 150; };
class COREV_I_CartelA_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_I_CartelA_SmallBoat { quality = 3; price = 150; };
class COREV_I_CartelA_SmallBoat_AI { quality = 3; price = 150; };
class COREV_I_CDG_FishingBoat { quality = 3; price = 150; };
class COREV_I_CDG_FishingBoat_AI { quality = 3; price = 150; };
class COREV_I_CDG_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_I_CDG_SmallBoat { quality = 3; price = 150; };
class COREV_I_CDG_SmallBoat_AI { quality = 3; price = 150; };
class COREV_I_PirateAf_Boat_Transport { quality = 3; price = 150; };
class COREV_I_PirateAf_Boat_Transport_AI { quality = 3; price = 150; };
class COREV_I_PirateAf_FishingBoat { quality = 3; price = 150; };
class COREV_I_PirateAf_FishingBoat_AI { quality = 3; price = 150; };
class COREV_I_PirateAf_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_I_PirateAf_SmallBoat { quality = 3; price = 150; };
class COREV_I_PirateAf_SmallBoat_AI { quality = 3; price = 150; };
class COREV_I_TAF_FishingBoat { quality = 3; price = 150; };
class COREV_I_TAF_FishingBoat_AI { quality = 3; price = 150; };
class COREV_I_TAF_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_I_TAF_SmallBoat { quality = 3; price = 150; };
class COREV_I_TAF_SmallBoat_AI { quality = 3; price = 150; };
class COREV_I_TKG_FishingBoat { quality = 3; price = 150; };
class COREV_I_TKG_FishingBoat_AI { quality = 3; price = 150; };
class COREV_I_TKG_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_I_TKG_SmallBoat { quality = 3; price = 150; };
class COREV_I_TKG_SmallBoat_AI { quality = 3; price = 150; };
class COREV_IR_Boat_Armed_01_minigun_F { quality = 3; price = 150; };
class COREV_IR_Boat_Transport_01_F { quality = 3; price = 150; };
class COREV_IR_SDV_01_F { quality = 3; price = 150; };
class COREV_O_CartelA_Boat_Transport { quality = 3; price = 150; };
class COREV_O_CartelA_Boat_Transport_AI { quality = 3; price = 150; };
class COREV_O_CartelA_FishingBoat { quality = 3; price = 150; };
class COREV_O_CartelA_FishingBoat_AI { quality = 3; price = 150; };
class COREV_O_CartelA_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_O_CartelA_SmallBoat { quality = 3; price = 150; };
class COREV_O_CartelA_SmallBoat_AI { quality = 3; price = 150; };
class COREV_O_CDG_FishingBoat { quality = 3; price = 150; };
class COREV_O_CDG_FishingBoat_AI { quality = 3; price = 150; };
class COREV_O_CDG_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_O_CDG_SmallBoat { quality = 3; price = 150; };
class COREV_O_CDG_SmallBoat_AI { quality = 3; price = 150; };
class COREV_O_FishingBoat { quality = 3; price = 150; };
class COREV_O_FishingBoat_AI { quality = 3; price = 150; };
class COREV_O_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_O_PirateAf_Boat_Transport { quality = 3; price = 150; };
class COREV_O_PirateAf_Boat_Transport_AI { quality = 3; price = 150; };
class COREV_O_PirateAf_FishingBoat { quality = 3; price = 150; };
class COREV_O_PirateAf_FishingBoat_AI { quality = 3; price = 150; };
class COREV_O_PirateAf_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_O_PirateAf_SmallBoat { quality = 3; price = 150; };
class COREV_O_PirateAf_SmallBoat_AI { quality = 3; price = 150; };
class COREV_O_SmallBoat { quality = 3; price = 150; };
class COREV_O_SmallBoat_AI { quality = 3; price = 150; };
class COREV_O_TAF_FishingBoat { quality = 3; price = 150; };
class COREV_O_TAF_FishingBoat_AI { quality = 3; price = 150; };
class COREV_O_TAF_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_O_TAF_SmallBoat { quality = 3; price = 150; };
class COREV_O_TAF_SmallBoat_AI { quality = 3; price = 150; };
class COREV_O_TKG_FishingBoat { quality = 3; price = 150; };
class COREV_O_TKG_FishingBoat_AI { quality = 3; price = 150; };
class COREV_O_TKG_FishingBoat_Armed { quality = 3; price = 150; };
class COREV_O_TKG_SmallBoat { quality = 3; price = 150; };
class COREV_O_TKG_SmallBoat_AI { quality = 3; price = 150; };


// Helis

class COREV_B_UAV_Explosive { quality = 3; price = 150; };
class COREV_B_UAV_Recon { quality = 3; price = 150; };
class COREV_I_AFA_Heli_Light_Hellcat { quality = 3; price = 150; };
class COREV_I_AFA_Heli_Light_Orca { quality = 3; price = 150; };
class COREV_I_AFA_Heli_Light_Orca_unarmed { quality = 3; price = 150; };
class COREV_I_AFA_Heli_Transport_Mohawk { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Attack_Kajman { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Light_Orca { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Light_Orca_unarmed { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru_ammo { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru_bench { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru_box { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru_covered { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru_fuel { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru_medevac { quality = 3; price = 150; };
class COREV_I_CDF_Heli_Transport_Taru_repair { quality = 3; price = 150; };
class COREV_I_CDG_Heli_Transport_Mohawk { quality = 3; price = 150; };
class COREV_I_UAV_Explosive { quality = 3; price = 150; };
class COREV_I_UAV_Recon { quality = 3; price = 150; };
class COREV_IR_Heli_light_03_F { quality = 3; price = 150; };
class COREV_IR_Heli_Transport_02_F { quality = 3; price = 150; };
class COREV_O_AFA_Heli_Light_Hellcat { quality = 3; price = 150; };
class COREV_O_AFA_Heli_Light_Hellcat_unarmed { quality = 3; price = 150; };
class COREV_O_AFA_Heli_Light_Orca { quality = 3; price = 150; };
class COREV_O_AFA_Heli_Light_Orca_unarmed { quality = 3; price = 150; };
class COREV_O_AFA_Heli_Transport_Mohawk { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Attack_Kajman { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Light_Orca { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Light_Orca_unarmed { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru_ammo { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru_bench { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru_box { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru_covered { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru_fuel { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru_medevac { quality = 3; price = 150; };
class COREV_O_CDF_Heli_Transport_Taru_repair { quality = 3; price = 150; };
class COREV_O_CDG_Heli_Transport_Mohawk { quality = 3; price = 150; };
class COREV_O_TKA_Heli_Attack_Blackfoot { quality = 3; price = 150; };
class COREV_O_TKA_Heli_Light_Hellcat { quality = 3; price = 150; };
class COREV_O_TKA_Heli_Light_Hellcat_unarmed { quality = 3; price = 150; };
class COREV_O_TKA_Heli_Transport_Mohawk { quality = 3; price = 150; };
class COREV_O_UAV_Explosive { quality = 3; price = 150; };
class COREV_O_UAV_Recon { quality = 3; price = 150; };


// Planes

class COREV_I_AFA_Plane_Fighter_L39_AA { quality = 3; price = 150; };
class COREV_I_AFA_Plane_Fighter_L39_CAS { quality = 3; price = 150; };
class COREV_I_CDF_Plane_CAS_Neophron { quality = 3; price = 150; };
class COREV_IR_Plane_Fighter_03_AA_F { quality = 3; price = 150; };
class COREV_IR_Plane_Fighter_03_CAS_F { quality = 3; price = 150; };
class COREV_O_AFA_Plane_Fighter_L39_AA { quality = 3; price = 150; };
class COREV_O_AFA_Plane_Fighter_L39_CAS { quality = 3; price = 150; };
class COREV_O_CDF_Plane_CAS_Neophron { quality = 3; price = 150; };
class COREV_O_TKA_Plane_CAS_Wipeout { quality = 3; price = 150; };




        Exile Pricelists



// Assault Rifles  

class Auto556x45_TAR21 { quality = 3; price = 150; };
class Auto556x45_TAR20 { quality = 3; price = 150; };
class arifle_TRG20_F { quality = 3; price = 150; };
class arifle_TRG21_F { quality = 3; price = 150; };
class Auto556x45_F2000 { quality = 3; price = 150; };
class Auto556x45_F2000C { quality = 3; price = 150; };
class arifle_Mk20C_F { quality = 3; price = 150; };
class arifle_Mk20_F { quality = 3; price = 150; };
class Auto556x45_G36C { quality = 3; price = 150; };
class Auto556x45_G36KV { quality = 3; price = 150; };
class Auto556x45_HK416 { quality = 3; price = 150; };
class Auto556x45_M4A3 { quality = 3; price = 150; };
class Auto556x45_CQM4 { quality = 3; price = 150; };
class Auto556x45_SCARL { quality = 3; price = 150; };
class Auto556x45_SCARL_DES { quality = 3; price = 150; };
class Auto556x45_MK18SBR { quality = 3; price = 150; };
class Auto556x45_N23PDW { quality = 3; price = 150; };
class Auto556x45_M231 { quality = 3; price = 150; };
class Auto556x45_M16A1_RIS { quality = 3; price = 150; };
class Auto556x45_M16A2_RIS { quality = 3; price = 150; };
class Auto556x45_M16A4 { quality = 3; price = 150; };
class Auto556x45_FAMASG2 { quality = 3; price = 150; };
class Auto556x45_FAMASG2_C { quality = 3; price = 150; };
class Auto556x45_HK33_B { quality = 3; price = 150; };
class Auto556x45_HK33A3_B { quality = 3; price = 150; };
class Auto65x39_AK108M { quality = 3; price = 150; };
class Auto65x39_AK102M { quality = 3; price = 150; };
class Auto762x39_Type63 { quality = 3; price = 150; };
class Auto762x39_AKM_RIS { quality = 3; price = 150; };
class Auto762x39_AKMS_RIS { quality = 3; price = 150; };
class Auto762x39_AK104 { quality = 3; price = 150; };
class Auto762x39_AKMSU_RIS { quality = 3; price = 150; };
class Auto545x39_AK74M { quality = 3; price = 150; };
class Auto545x39_AKS74_RIS { quality = 3; price = 150; };
class Auto545x39_AK105 { quality = 3; price = 150; };
class Auto545x39_AKS74U_RIS { quality = 3; price = 150; };
class Auto792x33_MP44 { quality = 3; price = 150; };


// Assault Rifles with GL 

class Auto556x45_TAR21_GL { quality = 3; price = 150; };
class arifle_TRG21_GL_F { quality = 3; price = 150; };
class Auto556x45_F2000_GL { quality = 3; price = 150; };
class arifle_Mk20_GL_F { quality = 3; price = 150; };
class Auto556x45_G36KV_GL { quality = 3; price = 150; };
class Auto556x45_HK416_GL { quality = 3; price = 150; };
class Auto556x45_M4A3_GL { quality = 3; price = 150; };
class Auto556x45_CQM4_GL { quality = 3; price = 150; };
class Auto556x45_SCARL_GL { quality = 3; price = 150; };
class Auto556x45_SCARL_DES_GL { quality = 3; price = 150; };
class Auto556x45_M16A1_RIS_GL { quality = 3; price = 150; };
class Auto556x45_M16A2_RIS_GL { quality = 3; price = 150; };
class Auto556x45_M16A2_GL { quality = 3; price = 150; };
class Auto556x45_M16A4_GL { quality = 3; price = 150; };
class Auto556x45_FAMASG2_GL { quality = 3; price = 150; };
class Auto65x39_AK108M_GL { quality = 3; price = 150; };
class Auto65x39_AK102M_GL { quality = 3; price = 150; };
class Auto762x39_AKM_RIS_GL { quality = 3; price = 150; };
class Auto762x39_AKMS_RIS_GL { quality = 3; price = 150; };
class Auto545x39_AK74M_GL { quality = 3; price = 150; };
class Auto545x39_AKS74_RIS_GL { quality = 3; price = 150; };


// LMGs 

class Auto556x45_N23PDW_BetaC { quality = 3; price = 150; };
class Auto556x45_M231_BetaC { quality = 3; price = 150; };
class Auto556x45_Negev { quality = 3; price = 150; };
class Auto556x45_Minimi_A { quality = 3; price = 150; };
class Auto762x51_MAG58 { quality = 3; price = 150; };
class Auto762x51_M60E4 { quality = 3; price = 150; };
class Auto762x51_MG3 { quality = 3; price = 150; };
class Auto762x51_NG7 { quality = 3; price = 150; };
class Auto762x54_PKM { quality = 3; price = 150; };
class Auto762x54_PKP { quality = 3; price = 150; };
class Auto762x54_UK59L { quality = 3; price = 150; };


//  SMGs  



// Snipers  

class Auto762x51_M14_RIS { quality = 3; price = 150; };
class Auto762x51_SR25 { quality = 3; price = 150; };
class Auto762x51_SR25EC { quality = 3; price = 150; };
class Auto762x51_SCARH { quality = 3; price = 150; };
class Auto762x51_SCARH_DES { quality = 3; price = 150; };
class Auto762x51_SCARH_GL { quality = 3; price = 150; };
class Auto762x51_SCARH_DES_GL { quality = 3; price = 150; };
class Auto762x51_FAL { quality = 3; price = 150; };
class Auto762x51_FALPara { quality = 3; price = 150; };
class Auto762x51_G3A3 { quality = 3; price = 150; };
class Auto762x51_G3A3_GL { quality = 3; price = 150; };
class Auto762x51_G3A4 { quality = 3; price = 150; };
class Auto762x51_G3A4_GL { quality = 3; price = 150; };
class Auto762x51_NDM86 { quality = 3; price = 150; };
class Auto762x54_SVD63 { quality = 3; price = 150; };



// Assault Rifles  

5, Auto556x45_TAR21 
5, Auto556x45_TAR20 
5, arifle_TRG20_F 
5, arifle_TRG21_F 
5, Auto556x45_F2000 
5, Auto556x45_F2000C 
5, arifle_Mk20C_F 
5, arifle_Mk20_F 
5, Auto556x45_G36C 
5, Auto556x45_G36KV 
5, Auto556x45_HK416 
5, Auto556x45_M4A3 
5, Auto556x45_CQM4 
5, Auto556x45_SCARL 
5, Auto556x45_SCARL_DES 
5, Auto556x45_MK18SBR 
5, Auto556x45_N23PDW 
5, Auto556x45_M231 
5, Auto556x45_M16A1_RIS 
5, Auto556x45_M16A2_RIS 
5, Auto556x45_M16A4 
5, Auto556x45_FAMASG2 
5, Auto556x45_FAMASG2_C 
5, Auto556x45_HK33_B 
5, Auto556x45_HK33A3_B 
5, Auto65x39_AK108M 
5, Auto65x39_AK102M 
5, Auto762x39_Type63 
5, Auto762x39_AKM_RIS 
5, Auto762x39_AKMS_RIS 
5, Auto762x39_AK104 
5, Auto762x39_AKMSU_RIS 
5, Auto545x39_AK74M 
5, Auto545x39_AKS74_RIS 
5, Auto545x39_AK105 
5, Auto545x39_AKS74U_RIS 
5, Auto792x33_MP44 


// Assault Rifles with GL 

5, Auto556x45_TAR21_GL 
5, arifle_TRG21_GL_F 
5, Auto556x45_F2000_GL 
5, arifle_Mk20_GL_F 
5, Auto556x45_G36KV_GL 
5, Auto556x45_HK416_GL 
5, Auto556x45_M4A3_GL 
5, Auto556x45_CQM4_GL 
5, Auto556x45_SCARL_GL 
5, Auto556x45_SCARL_DES_GL 
5, Auto556x45_M16A1_RIS_GL 
5, Auto556x45_M16A2_RIS_GL 
5, Auto556x45_M16A2_GL 
5, Auto556x45_M16A4_GL 
5, Auto556x45_FAMASG2_GL 
5, Auto65x39_AK108M_GL 
5, Auto65x39_AK102M_GL 
5, Auto762x39_AKM_RIS_GL 
5, Auto762x39_AKMS_RIS_GL 
5, Auto545x39_AK74M_GL 
5, Auto545x39_AKS74_RIS_GL 


// LMGs 

5, Auto556x45_N23PDW_BetaC 
5, Auto556x45_M231_BetaC 
5, Auto556x45_Negev 
5, Auto556x45_Minimi_A 
5, Auto762x51_MAG58 
5, Auto762x51_M60E4 
5, Auto762x51_MG3 
5, Auto762x51_NG7 
5, Auto762x54_PKM 
5, Auto762x54_PKP 
5, Auto762x54_UK59L 


//  SMGs  



// Snipers  

5, Auto762x51_M14_RIS 
5, Auto762x51_SR25 
5, Auto762x51_SR25EC 
5, Auto762x51_SCARH 
5, Auto762x51_SCARH_DES 
5, Auto762x51_SCARH_GL 
5, Auto762x51_SCARH_DES_GL 
5, Auto762x51_FAL 
5, Auto762x51_FALPara 
5, Auto762x51_G3A3 
5, Auto762x51_G3A3_GL 
5, Auto762x51_G3A4 
5, Auto762x51_G3A4_GL 
5, Auto762x51_NDM86 
5, Auto762x54_SVD63 



// Assault Rifles  

class SMG_03_TR_black { quality = 3; price = 150; };
class SMG_03_TR_camo { quality = 3; price = 150; };
class SMG_03_TR_khaki { quality = 3; price = 150; };
class SMG_03_TR_hex { quality = 3; price = 150; };
class SMG_03C_TR_black { quality = 3; price = 150; };
class SMG_03C_TR_camo { quality = 3; price = 150; };
class SMG_03C_TR_khaki { quality = 3; price = 150; };
class SMG_03C_TR_hex { quality = 3; price = 150; };
class SMG_03_black { quality = 3; price = 150; };
class SMG_03_camo { quality = 3; price = 150; };
class SMG_03_khaki { quality = 3; price = 150; };
class SMG_03_hex { quality = 3; price = 150; };
class SMG_03C_black { quality = 3; price = 150; };
class SMG_03C_camo { quality = 3; price = 150; };
class SMG_03C_khaki { quality = 3; price = 150; };
class SMG_03C_hex { quality = 3; price = 150; };
class Smg9x19_BTMP9 { quality = 3; price = 150; };


// Assault Rifles with GL 



// LMGs 



//  SMGs  

class SMG_01_F { quality = 3; price = 150; };
class SMG_02_F { quality = 3; price = 150; };
class SMG_05_F { quality = 3; price = 150; };
class Smg9x19_MP5A5 { quality = 3; price = 150; };
class Smg9x19_DOE { quality = 3; price = 150; };
class Smg9x19_PP19 { quality = 3; price = 150; };
class Smg762x25_PPK74U { quality = 3; price = 150; };
class Smg762x25_PPSh41_B { quality = 3; price = 150; };
class Smg762x25_PPS43 { quality = 3; price = 150; };




// Assault Rifles  

5, SMG_03_TR_black 
5, SMG_03_TR_camo 
5, SMG_03_TR_khaki 
5, SMG_03_TR_hex 
5, SMG_03C_TR_black 
5, SMG_03C_TR_camo 
5, SMG_03C_TR_khaki 
5, SMG_03C_TR_hex 
5, SMG_03_black 
5, SMG_03_camo 
5, SMG_03_khaki 
5, SMG_03_hex 
5, SMG_03C_black 
5, SMG_03C_camo 
5, SMG_03C_khaki 
5, SMG_03C_hex 
5, Smg9x19_BTMP9 


// Assault Rifles with GL 



// LMGs 



//  SMGs  

5, SMG_01_F 
5, SMG_02_F 
5, SMG_05_F 
5, Smg9x19_MP5A5 
5, Smg9x19_DOE 
5, Smg9x19_PP19 
5, Smg762x25_PPK74U 
5, Smg762x25_PPSh41_B 
5, Smg762x25_PPS43 




/*


class Bolt762x51_M24SWS_Grn { quality = 3; price = 150; };
class Bolt762x51_M24SWS_Des { quality = 3; price = 150; };
class Bolt762x51_M24SWS_Blk { quality = 3; price = 150; };
class Bolt762x54_M9130_RIS { quality = 3; price = 150; };
class Bolt77x56_SMLE_RIS { quality = 3; price = 150; };
class Bolt792x57_Kar98K_RIS { quality = 3; price = 150; };
class Bolt792x57_CZ550 { quality = 3; price = 150; };




// Snipers  

5, Bolt762x51_M24SWS_Grn 
5, Bolt762x51_M24SWS_Des 
5, Bolt762x51_M24SWS_Blk 
5, Bolt762x54_M9130_RIS 
5, Bolt77x56_SMLE_RIS 
5, Bolt792x57_Kar98K_RIS 
5, Bolt792x57_CZ550 








// Assault Rifles with GL 

class Shotgun12Ga_M870 { quality = 3; price = 150; };
class Shotgun12Ga_MB590 { quality = 3; price = 150; };
class Shotgun12Ga_SPAS12 { quality = 3; price = 150; };
class Shotgun12Ga_M37 { quality = 3; price = 150; };



// Assault Rifles with GL 

5, Shotgun12Ga_M870 
5, Shotgun12Ga_MB590 
5, Shotgun12Ga_SPAS12 
5, Shotgun12Ga_M37 









// Assault Rifles with GL 

class Grnd40mm_MK13EGLM { quality = 3; price = 150; };
class Grnd40mm_M79 { quality = 3; price = 150; };





// Assault Rifles with GL 

5, Grnd40mm_MK13EGLM 
5, Grnd40mm_M79 



// Assault Rifles  




// Launchers  

"Launcher",
"launch_NLAW_F",
"launch_RPG32_F",
"launch_B_Titan_F",
"launch_I_Titan_F",
"launch_O_Titan_F",
"launch_Titan_F",
"launch_B_Titan_short_F",
"launch_I_Titan_short_F",
"launch_O_Titan_short_F",
"launch_Titan_short_F",
"launch_RPG32_ghex_F",
"launch_RPG7_F",
"launch_B_Titan_tna_F",
"launch_B_Titan_short_tna_F",
"launch_O_Titan_ghex_F",
"launch_O_Titan_short_ghex_F",
"Launch64mm_RPG18",
"Launch85mm_Type69",
"Launch84mm_M3",
"Launch72mm_9K38",
"Launch130mm_9K115",
"Launch_Camera",
"launch_MRAWS_olive_F",
"launch_MRAWS_olive_rail_F",
"launch_MRAWS_green_F",
"launch_MRAWS_green_rail_F",
"launch_MRAWS_sand_F",
"launch_MRAWS_sand_rail_F",
"launch_O_Vorona_brown_F",
"launch_O_Vorona_green_F",
"launch_RPG32_green_F",
"launch_RPG32_camo_F",
"launch_I_Titan_eaf_F",
"launch_B_Titan_olive_F",




// Assault Rifles  

class Launch54mm_CanLaucnher { quality = 3; price = 150; };



// Launchers  

class Launcher { quality = 3; price = 150; };
class launch_NLAW_F { quality = 3; price = 150; };
class launch_RPG32_F { quality = 3; price = 150; };
class launch_B_Titan_F { quality = 3; price = 150; };
class launch_I_Titan_F { quality = 3; price = 150; };
class launch_O_Titan_F { quality = 3; price = 150; };
class launch_Titan_F { quality = 3; price = 150; };
class launch_B_Titan_short_F { quality = 3; price = 150; };
class launch_I_Titan_short_F { quality = 3; price = 150; };
class launch_O_Titan_short_F { quality = 3; price = 150; };
class launch_Titan_short_F { quality = 3; price = 150; };
class launch_RPG32_ghex_F { quality = 3; price = 150; };
class launch_RPG7_F { quality = 3; price = 150; };
class launch_B_Titan_tna_F { quality = 3; price = 150; };
class launch_B_Titan_short_tna_F { quality = 3; price = 150; };
class launch_O_Titan_ghex_F { quality = 3; price = 150; };
class launch_O_Titan_short_ghex_F { quality = 3; price = 150; };
class Launch64mm_RPG18 { quality = 3; price = 150; };
class Launch85mm_Type69 { quality = 3; price = 150; };
class Launch84mm_M3 { quality = 3; price = 150; };
class Launch72mm_9K38 { quality = 3; price = 150; };
class Launch130mm_9K115 { quality = 3; price = 150; };
class Launch_Camera { quality = 3; price = 150; };
class launch_MRAWS_olive_F { quality = 3; price = 150; };
class launch_MRAWS_olive_rail_F { quality = 3; price = 150; };
class launch_MRAWS_green_F { quality = 3; price = 150; };
class launch_MRAWS_green_rail_F { quality = 3; price = 150; };
class launch_MRAWS_sand_F { quality = 3; price = 150; };
class launch_MRAWS_sand_rail_F { quality = 3; price = 150; };
class launch_O_Vorona_brown_F { quality = 3; price = 150; };
class launch_O_Vorona_green_F { quality = 3; price = 150; };
class launch_RPG32_green_F { quality = 3; price = 150; };
class launch_RPG32_camo_F { quality = 3; price = 150; };
class launch_I_Titan_eaf_F { quality = 3; price = 150; };
class launch_B_Titan_olive_F { quality = 3; price = 150; };



// Assault Rifles  

5, Launch54mm_CanLaucnher 


// Assault Rifles with GL 



// Launchers  

5, Launcher 
5, launch_NLAW_F 
5, launch_RPG32_F 
5, launch_B_Titan_F 
5, launch_I_Titan_F 
5, launch_O_Titan_F 
5, launch_Titan_F 
5, launch_B_Titan_short_F 
5, launch_I_Titan_short_F 
5, launch_O_Titan_short_F 
5, launch_Titan_short_F 
5, launch_RPG32_ghex_F 
5, launch_RPG7_F 
5, launch_B_Titan_tna_F 
5, launch_B_Titan_short_tna_F 
5, launch_O_Titan_ghex_F 
5, launch_O_Titan_short_ghex_F 
5, Launch64mm_RPG18 
5, Launch85mm_Type69 
5, Launch84mm_M3 
5, Launch72mm_9K38 
5, Launch130mm_9K115 
5, Launch_Camera 
5, launch_MRAWS_olive_F 
5, launch_MRAWS_olive_rail_F 
5, launch_MRAWS_green_F 
5, launch_MRAWS_green_rail_F 
5, launch_MRAWS_sand_F 
5, launch_MRAWS_sand_rail_F 
5, launch_O_Vorona_brown_F 
5, launch_O_Vorona_green_F 
5, launch_RPG32_green_F 
5, launch_RPG32_camo_F 
5, launch_I_Titan_eaf_F 
5, launch_B_Titan_olive_F 




// Handguns  

class PstlTool_Flashlight { quality = 3; price = 150; };
class PstlTool_Spotlight { quality = 3; price = 150; };
class Pstl9x19_P99 { quality = 3; price = 150; };
class hgun_P07_F { quality = 3; price = 150; };
class Pstl9x19_NP22 { quality = 3; price = 150; };
class Pstl9x19_NP42 { quality = 3; price = 150; };
class Pstl9x19_N213B { quality = 3; price = 150; };
class Pstl9x19_FNGP35 { quality = 3; price = 150; };
class Pstl9x19_92FS { quality = 3; price = 150; };
class Pstl9x19_CZSP01 { quality = 3; price = 150; };
class Pstl9x19_CZ75B { quality = 3; price = 150; };
class Pstl765x17_VZ61 { quality = 3; price = 150; };
class Pstl9x18_PP9 { quality = 3; price = 150; };
class Pstl9x19_MicroUzi { quality = 3; price = 150; };
class Pstl9x19_MAC11 { quality = 3; price = 150; };
class Pstl762x25_TT33 { quality = 3; price = 150; };
class Pstl762x25_CZ52 { quality = 3; price = 150; };
class Pstl11x23_M1911 { quality = 3; price = 150; };
class Pstl11x23_Revolver { quality = 3; price = 150; };
class Pstl11x23_SAARevolver { quality = 3; price = 150; };


// Handguns  

5, PstlTool_Flashlight 
5, PstlTool_Spotlight 
5, Pstl9x19_P99 
5, hgun_P07_F 
5, Pstl9x19_NP22 
5, Pstl9x19_NP42 
5, Pstl9x19_N213B 
5, Pstl9x19_FNGP35 
5, Pstl9x19_92FS 
5, Pstl9x19_CZSP01 
5, Pstl9x19_CZ75B 
5, Pstl765x17_VZ61 
5, Pstl9x18_PP9 
5, Pstl9x19_MicroUzi 
5, Pstl9x19_MAC11 
5, Pstl762x25_TT33 
5, Pstl762x25_CZ52 
5, Pstl11x23_M1911 
5, Pstl11x23_Revolver 
5, Pstl11x23_SAARevolver 


// Shotguns  








"B_Kitbag_mcamo",
"B_Kitbag_mcamo_Eng",
"B_Kitbag_rgr",
"B_Kitbag_rgr_AAR",
"B_Kitbag_rgr_BTAA_F",
"B_Kitbag_rgr_BTAT_F",
"B_Kitbag_rgr_BTEng_F",
"B_Kitbag_rgr_BTExp_F",
"B_Kitbag_rgr_BTReconExp_F",
"B_Kitbag_rgr_BWAAR",
"B_Kitbag_rgr_CTRGExp_F",
"B_Kitbag_rgr_Exp",
"B_Kitbag_rgr_Mine",
"B_Kitbag_rgr_Para_3_F",
"B_Kitbag_rgr_Para_8_F",
"B_Kitbag_sgg",
"B_Kitbag_tan",
"B_LegStrapBag_black_F",
"B_LegStrapBag_black_repair_F",
"B_LegStrapBag_coyote_F",
"B_LegStrapBag_coyote_repair_F",
"B_LegStrapBag_olive_F",
"B_LegStrapBag_olive_repair_F",
"B_Messenger_Black_F",
"B_Messenger_Coyote_F",
"B_Messenger_Gray_F",
"B_Messenger_Gray_Medical_F",
"B_Messenger_IDAP_F",
"B_Messenger_IDAP_Medical_F",
"B_Messenger_IDAP_TrainingMines_F",
"B_Messenger_Olive_F",
"B_Mortar_01_support_F",
"B_Mortar_01_support_grn_F",
"B_Mortar_01_weapon_F",
"B_Mortar_01_Weapon_grn_F",
"B_O_Parachute_02_F",
"B_OutdoorPack_blk",
"B_OutdoorPack_blu",
"B_OutdoorPack_tan",
"B_Parachute",
"B_Patrol_Carryall_green_Ammo_F",
"B_Patrol_Carryall_taiga_medic_F",
"B_Patrol_FieldPack_green_eng_F",
"B_Patrol_Launcher_bag_F",
"B_Patrol_Leader_bag_F",
"B_Patrol_Medic_bag_F",
"B_Patrol_Respawn_bag_F",
"B_Patrol_Supply_bag_F",
"B_RadioBag_01_black_F",
"B_RadioBag_01_digi_F",
"B_RadioBag_01_eaf_F",
"B_RadioBag_01_eaf_FAK_F",
"B_RadioBag_01_ghex_F",
"B_RadioBag_01_hex_F",
"B_RadioBag_01_mtp_F",
"B_RadioBag_01_oucamo_F",
"B_RadioBag_01_tropic_F",
"B_RadioBag_01_wdl_F",
"B_RadioBag_01_wdl_FAK_F",

// Radio Bag
"B_RadioBag_A",



"B_Respawn_Sleeping_bag_blue_F",
"B_Respawn_Sleeping_bag_brown_F",
"B_Respawn_Sleeping_bag_F",
"B_Respawn_TentA_F",
"B_Respawn_TentDome_F",









"B_SCBA_01_F",
"B_Static_Designator_01_weapon_F",





"B_TacticalPack_mcamo",
"B_TacticalPack_ocamo",
"B_TacticalPack_ocamo_AA_F",
"B_TacticalPack_ocamo_AT_F",
"B_TacticalPack_oli",
"B_TacticalPack_oli_AAR",
"B_TacticalPack_rgr",
"B_UAV_01_backpack_F",
"B_UAV_06_backpack_F",
"B_UAV_06_medical_backpack_F",
"B_UGV_02_Demining_backpack_F",
"B_UGV_02_Science_backpack_F",
"B_ViperHarness_blk_F",
"B_ViperHarness_ghex_Exp_F",
"B_ViperHarness_ghex_F",
"B_ViperHarness_ghex_JTAC_F",
"B_ViperHarness_ghex_LAT_F",
"B_ViperHarness_ghex_M_F",
"B_ViperHarness_ghex_Medic_F",
"B_ViperHarness_ghex_TL_F",
"B_ViperHarness_hex_Exp_F",
"B_ViperHarness_hex_F",
"B_ViperHarness_hex_JTAC_F",
"B_ViperHarness_hex_LAT_F",
"B_ViperHarness_hex_M_F",
"B_ViperHarness_hex_Medic_F",
"B_ViperHarness_hex_TL_F",
"B_ViperHarness_khk_F",
"B_ViperHarness_oli_F",
"B_ViperLightHarness_blk_F",
"B_ViperLightHarness_ghex_F",
"B_ViperLightHarness_hex_F",
"B_ViperLightHarness_khk_F",
"B_ViperLightHarness_oli_F",
"B_W_Static_Designator_01_weapon_F",
"C_Bergen_blu",
"C_Bergen_grn",
"C_Bergen_red",
"C_IDAP_UAV_01_backpack_F",
"C_IDAP_UAV_06_antimine_backpack_F",
"C_IDAP_UAV_06_backpack_F",
"C_IDAP_UAV_06_medical_backpack_F",
"C_IDAP_UGV_02_Demining_backpack_F",
"C_UAV_06_backpack_F",
"C_UAV_06_medical_backpack_F",
"G_AssaultPack",
"G_Bergen",
"G_Carryall_Ammo",
"G_Carryall_Exp",
"G_FieldPack_LAT",
"G_FieldPack_LAT2",
"G_FieldPack_Medic",
"G_TacticalPack_Eng",
"I_AA_01_weapon_F",
"I_Assault_Diver",
"I_AT_01_weapon_F",
"I_C_HMG_02_high_weapon_F",
"I_C_HMG_02_support_F",
"I_C_HMG_02_support_high_F",
"I_C_HMG_02_weapon_F",
"I_Carryall_oli_AAA",
"I_Carryall_oli_AAT",
"I_Carryall_oli_Eng",
"I_Carryall_oli_Exp",
"I_E_AA_01_weapon_F",
"I_E_AT_01_weapon_F",
"I_E_GMG_01_A_Weapon_F",
"I_E_GMG_01_high_Weapon_F",
"I_E_GMG_01_Weapon_F",
"I_E_HMG_01_A_Weapon_F",
"I_E_HMG_01_high_Weapon_F",
"I_E_HMG_01_support_F",
"I_E_HMG_01_support_high_F",
"I_E_HMG_01_Weapon_F",
"I_E_HMG_02_high_weapon_F",
"I_E_HMG_02_support_F",
"I_E_HMG_02_support_high_F",
"I_E_HMG_02_weapon_F",
"I_E_Mortar_01_support_F",
"I_E_Mortar_01_Weapon_F",
"I_E_UAV_01_backpack_F",
"I_E_UAV_06_backpack_F",
"I_E_UAV_06_medical_backpack_F",
"I_E_UGV_02_Demining_backpack_F",
"I_E_UGV_02_Science_backpack_F",
"I_Fieldpack_oli_AA",
"I_Fieldpack_oli_AAR",
"I_Fieldpack_oli_Ammo",
"I_Fieldpack_oli_AT",
"I_Fieldpack_oli_LAT",
"I_Fieldpack_oli_LAT2",
"I_Fieldpack_oli_Medic",
"I_Fieldpack_oli_Repair",
"I_G_HMG_02_high_weapon_F",
"I_G_HMG_02_support_F",
"I_G_HMG_02_support_high_F",
"I_G_HMG_02_weapon_F",
"I_GMG_01_A_weapon_F",
"I_GMG_01_high_weapon_F",
"I_GMG_01_weapon_F",
"I_HMG_01_A_weapon_F",
"I_HMG_01_high_weapon_F",
"I_HMG_01_support_F",
"I_HMG_01_support_high_F",
"I_HMG_01_weapon_F",
"I_HMG_02_high_weapon_F",
"I_HMG_02_support_F",
"I_HMG_02_support_high_F",
"I_HMG_02_weapon_F",
"I_Mortar_01_support_F",
"I_Mortar_01_weapon_F",
"I_UAV_01_backpack_F",
"I_UAV_06_backpack_F",
"I_UAV_06_medical_backpack_F",
"I_UGV_02_Demining_backpack_F",
"I_UGV_02_Science_backpack_F",
"O_AA_01_weapon_F",
"O_Assault_Diver",
"O_AT_01_weapon_F",
"O_G_HMG_02_high_weapon_F",
"O_G_HMG_02_support_F",
"O_G_HMG_02_support_high_F",
"O_G_HMG_02_weapon_F",
"O_GMG_01_A_weapon_F",
"O_GMG_01_high_weapon_F",
"O_GMG_01_weapon_F",
"O_HMG_01_A_weapon_F",
"O_HMG_01_high_weapon_F",
"O_HMG_01_support_F",
"O_HMG_01_support_high_F",
"O_HMG_01_weapon_F",
"O_HMG_02_high_weapon_F",
"O_HMG_02_support_F",
"O_HMG_02_support_high_F",
"O_HMG_02_weapon_F",
"O_Mortar_01_support_F",
"O_Mortar_01_weapon_F",
"O_Static_Designator_02_weapon_F",
"O_UAV_01_backpack_F",
"O_UAV_06_backpack_F",
"O_UAV_06_medical_backpack_F",
"O_UGV_02_Demining_backpack_F",
"O_UGV_02_Science_backpack_F",


// Glasses 






// Uniforms 

class U_AFAOfficerUni_A { quality = 3; price = 150; };
class U_AFASoldierUni_A { quality = 3; price = 150; };
class U_AFASpecialUni_A { quality = 3; price = 150; };
class U_AntigonaBody { quality = 3; price = 150; };
class U_AttisBody { quality = 3; price = 150; };
class U_B_CBRN_Suit_01_MTP_F { quality = 3; price = 150; };
class U_B_CBRN_Suit_01_Tropic_F { quality = 3; price = 150; };
class U_B_CBRN_Suit_01_Wdl_F { quality = 3; price = 150; };
class U_B_CombatUniform_mcam { quality = 3; price = 150; };
class U_B_CombatUniform_mcam_tshirt { quality = 3; price = 150; };
class U_B_CombatUniform_mcam_vest { quality = 3; price = 150; };
class U_B_CombatUniform_mcam_wdl_f { quality = 3; price = 150; };
class U_B_CombatUniform_mcam_worn { quality = 3; price = 150; };
class U_B_CombatUniform_sgg { quality = 3; price = 150; };
class U_B_CombatUniform_sgg_tshirt { quality = 3; price = 150; };
class U_B_CombatUniform_sgg_vest { quality = 3; price = 150; };
class U_B_CombatUniform_tshirt_mcam_wdL_f { quality = 3; price = 150; };
class U_B_CombatUniform_vest_mcam_wdl_f { quality = 3; price = 150; };
class U_B_CombatUniform_wdl { quality = 3; price = 150; };
class U_B_CombatUniform_wdl_tshirt { quality = 3; price = 150; };
class U_B_CombatUniform_wdl_vest { quality = 3; price = 150; };
class U_B_CTRG_1 { quality = 3; price = 150; };
class U_B_CTRG_2 { quality = 3; price = 150; };
class U_B_CTRG_3 { quality = 3; price = 150; };
class U_B_CTRG_Soldier_2_F { quality = 3; price = 150; };
class U_B_CTRG_Soldier_3_F { quality = 3; price = 150; };
class U_B_CTRG_Soldier_F { quality = 3; price = 150; };
class U_B_CTRG_Soldier_urb_1_F { quality = 3; price = 150; };
class U_B_CTRG_Soldier_urb_2_F { quality = 3; price = 150; };
class U_B_CTRG_Soldier_urb_3_F { quality = 3; price = 150; };
class U_B_FullGhillie_ard { quality = 3; price = 150; };
class U_B_FullGhillie_lsh { quality = 3; price = 150; };
class U_B_FullGhillie_sard { quality = 3; price = 150; };
class U_B_G_Captain_Ivan_F { quality = 3; price = 150; };
class U_B_GEN_Commander_F { quality = 3; price = 150; };
class U_B_GEN_Soldier_F { quality = 3; price = 150; };
class U_B_GhillieSuit { quality = 3; price = 150; };
class U_B_HeliPilotCoveralls { quality = 3; price = 150; };
class U_B_PilotCoveralls { quality = 3; price = 150; };
class U_B_Protagonist_VR { quality = 3; price = 150; };
class U_B_Soldier_VR { quality = 3; price = 150; };
class U_B_SpecopsUniform_sgg { quality = 3; price = 150; };
class U_B_survival_uniform { quality = 3; price = 150; };
class U_B_T_FullGhillie_tna_F { quality = 3; price = 150; };
class U_B_T_Sniper_F { quality = 3; price = 150; };
class U_B_T_Soldier_AR_F { quality = 3; price = 150; };
class U_B_T_Soldier_F { quality = 3; price = 150; };
class U_B_T_Soldier_SL_F { quality = 3; price = 150; };
class U_B_Wetsuit { quality = 3; price = 150; };
class U_BasicBody { quality = 3; price = 150; };
class U_BG_Guerilla1_1 { quality = 3; price = 150; };
class U_BG_Guerilla1_2_F { quality = 3; price = 150; };
class U_BG_Guerilla2_1 { quality = 3; price = 150; };
class U_BG_Guerilla2_2 { quality = 3; price = 150; };
class U_BG_Guerilla2_3 { quality = 3; price = 150; };
class U_BG_Guerilla3_1 { quality = 3; price = 150; };
class U_BG_Guerilla3_2 { quality = 3; price = 150; };
class U_BG_Guerrilla_6_1 { quality = 3; price = 150; };
class U_BG_leader { quality = 3; price = 150; };
class U_C_CBRN_Suit_01_Blue_F { quality = 3; price = 150; };
class U_C_CBRN_Suit_01_White_F { quality = 3; price = 150; };
class U_C_Commoner1_1 { quality = 3; price = 150; };
class U_C_Commoner1_2 { quality = 3; price = 150; };
class U_C_Commoner1_3 { quality = 3; price = 150; };
class U_C_Commoner2_1 { quality = 3; price = 150; };
class U_C_Commoner2_2 { quality = 3; price = 150; };
class U_C_Commoner2_3 { quality = 3; price = 150; };
class U_C_Commoner_shorts { quality = 3; price = 150; };
class U_C_ConstructionCoverall_Black_F { quality = 3; price = 150; };
class U_C_ConstructionCoverall_Blue_F { quality = 3; price = 150; };
class U_C_ConstructionCoverall_Red_F { quality = 3; price = 150; };
class U_C_ConstructionCoverall_Vrana_F { quality = 3; price = 150; };
class U_C_Driver_1 { quality = 3; price = 150; };
class U_C_Driver_1_black { quality = 3; price = 150; };
class U_C_Driver_1_blue { quality = 3; price = 150; };
class U_C_Driver_1_green { quality = 3; price = 150; };
class U_C_Driver_1_orange { quality = 3; price = 150; };
class U_C_Driver_1_red { quality = 3; price = 150; };
class U_C_Driver_1_white { quality = 3; price = 150; };
class U_C_Driver_1_yellow { quality = 3; price = 150; };
class U_C_Driver_2 { quality = 3; price = 150; };
class U_C_Driver_3 { quality = 3; price = 150; };
class U_C_Driver_4 { quality = 3; price = 150; };
class U_C_E_LooterJacket_01_F { quality = 3; price = 150; };
class U_C_Farmer { quality = 3; price = 150; };
class U_C_Fisherman { quality = 3; price = 150; };
class U_C_FishermanOveralls { quality = 3; price = 150; };
class U_C_HunterBody_brn { quality = 3; price = 150; };
class U_C_HunterBody_grn { quality = 3; price = 150; };
class U_C_IDAP_Man_cargo_F { quality = 3; price = 150; };
class U_C_IDAP_Man_casual_F { quality = 3; price = 150; };
class U_C_IDAP_Man_Jeans_F { quality = 3; price = 150; };
class U_C_IDAP_Man_shorts_F { quality = 3; price = 150; };
class U_C_IDAP_Man_Tee_F { quality = 3; price = 150; };
class U_C_IDAP_Man_TeeShorts_F { quality = 3; price = 150; };
class U_C_Journalist { quality = 3; price = 150; };
class U_C_Man_casual_1_F { quality = 3; price = 150; };
class U_C_Man_casual_1_sick_F { quality = 3; price = 150; };
class U_C_Man_casual_2_F { quality = 3; price = 150; };
class U_C_Man_casual_2_sick_F { quality = 3; price = 150; };
class U_C_Man_casual_3_F { quality = 3; price = 150; };
class U_C_Man_casual_3_sick_F { quality = 3; price = 150; };
class U_C_Man_casual_4_F { quality = 3; price = 150; };
class U_C_Man_casual_4_sick_F { quality = 3; price = 150; };
class U_C_Man_casual_5_F { quality = 3; price = 150; };
class U_C_Man_casual_5_sick_F { quality = 3; price = 150; };
class U_C_Man_casual_6_F { quality = 3; price = 150; };
class U_C_Man_casual_6_sick_F { quality = 3; price = 150; };
class U_C_man_sport_1_F { quality = 3; price = 150; };
class U_C_man_sport_2_F { quality = 3; price = 150; };
class U_C_man_sport_2_sick_F { quality = 3; price = 150; };
class U_C_man_sport_3_F { quality = 3; price = 150; };
class U_C_Mechanic_01_F { quality = 3; price = 150; };
class U_C_Novak { quality = 3; price = 150; };
class U_C_Paramedic_01_F { quality = 3; price = 150; };
class U_C_Poloshirt_blue { quality = 3; price = 150; };
class U_C_Poloshirt_blue_sick { quality = 3; price = 150; };
class U_C_Poloshirt_burgundy { quality = 3; price = 150; };
class U_C_Poloshirt_burgundy_sick { quality = 3; price = 150; };
class U_C_Poloshirt_redwhite { quality = 3; price = 150; };
class U_C_Poloshirt_redwhite_sick { quality = 3; price = 150; };
class U_C_Poloshirt_salmon { quality = 3; price = 150; };
class U_C_Poloshirt_stripped { quality = 3; price = 150; };
class U_C_Poloshirt_stripped_sick { quality = 3; price = 150; };
class U_C_Poloshirt_tricolour { quality = 3; price = 150; };
class U_C_Poor_1 { quality = 3; price = 150; };
class U_C_Poor_2 { quality = 3; price = 150; };
class U_C_Poor_2_sick { quality = 3; price = 150; };
class U_C_Poor_shorts_1 { quality = 3; price = 150; };
class U_C_Poor_shorts_2 { quality = 3; price = 150; };
class U_C_PriestBody { quality = 3; price = 150; };
class U_C_Protagonist_VR { quality = 3; price = 150; };
class U_C_Scavenger_1 { quality = 3; price = 150; };
class U_C_Scavenger_2 { quality = 3; price = 150; };
class U_C_Scientist { quality = 3; price = 150; };
class U_C_ShirtSurfer_shorts { quality = 3; price = 150; };
class U_C_Soldier_VR { quality = 3; price = 150; };
class U_C_TeeSurfer_shorts_1 { quality = 3; price = 150; };
class U_C_TeeSurfer_shorts_2 { quality = 3; price = 150; };
class U_C_Uniform_Farmer_01_F { quality = 3; price = 150; };
class U_C_Uniform_Scientist_01_F { quality = 3; price = 150; };
class U_C_Uniform_Scientist_01_formal_F { quality = 3; price = 150; };
class U_C_Uniform_Scientist_02_F { quality = 3; price = 150; };
class U_C_Uniform_Scientist_02_formal_F { quality = 3; price = 150; };
class U_C_WorkerCoveralls { quality = 3; price = 150; };
class U_C_WorkerOveralls { quality = 3; price = 150; };
class U_Captive_A { quality = 3; price = 150; };
class U_CDFOfficerUni_A { quality = 3; price = 150; };
class U_CDFSoldierUni_A { quality = 3; price = 150; };
class U_CDGCombatUni_A { quality = 3; price = 150; };
class U_CDGCombatUni_B { quality = 3; price = 150; };
class U_CDGCombatUni_C { quality = 3; price = 150; };
class U_CDGCombatUni_D { quality = 3; price = 150; };
class U_CivilianCoat_A { quality = 3; price = 150; };
class U_CivilianCoat_B { quality = 3; price = 150; };
class U_CivilianCoat_C { quality = 3; price = 150; };
class U_CivilianCoat_D { quality = 3; price = 150; };
class U_CivilianCoat_E { quality = 3; price = 150; };
class U_CivilianCoat_F { quality = 3; price = 150; };
class U_CivilianCroppedPants_A { quality = 3; price = 150; };
class U_CivilianCroppedPants_B { quality = 3; price = 150; };
class U_CivilianCroppedPants_C { quality = 3; price = 150; };
class U_CivilianCroppedPants_D { quality = 3; price = 150; };
class U_CivilianCroppedPants_E { quality = 3; price = 150; };
class U_CivilianHunter_A { quality = 3; price = 150; };
class U_CivilianHunter_B { quality = 3; price = 150; };
class U_CivilianHunter_C { quality = 3; price = 150; };
class U_CivilianHunter_D { quality = 3; price = 150; };
class U_CivilianJerseyCasual_A { quality = 3; price = 150; };
class U_CivilianJerseyCasual_B { quality = 3; price = 150; };
class U_CivilianJerseyCasual_C { quality = 3; price = 150; };
class U_CivilianJerseyCasual_D { quality = 3; price = 150; };
class U_CivilianJerseyCasual_E { quality = 3; price = 150; };
class U_CivilianJerseyCasual_F { quality = 3; price = 150; };
class U_CivilianJerseyCasual_G { quality = 3; price = 150; };
class U_CivilianMetro_A { quality = 3; price = 150; };
class U_CivilianMetro_B { quality = 3; price = 150; };
class U_CivilianMetro_C { quality = 3; price = 150; };
class U_CivilianMetro_D { quality = 3; price = 150; };
class U_CivilianOutdoor_A { quality = 3; price = 150; };
class U_CivilianOutdoor_B { quality = 3; price = 150; };
class U_CivilianOutdoor_C { quality = 3; price = 150; };
class U_CivilianOutdoor_D { quality = 3; price = 150; };
class U_CivilianPilot_A { quality = 3; price = 150; };
class U_CivilianPolo_A { quality = 3; price = 150; };
class U_CivilianPolo_B { quality = 3; price = 150; };
class U_CivilianPolo_C { quality = 3; price = 150; };
class U_CivilianPolo_D { quality = 3; price = 150; };
class U_CivilianPolo_E { quality = 3; price = 150; };
class U_CivilianPolo_F { quality = 3; price = 150; };
class U_CivilianSport_A { quality = 3; price = 150; };
class U_CivilianSport_B { quality = 3; price = 150; };
class U_CivilianSport_C { quality = 3; price = 150; };
class U_CivilianSport_D { quality = 3; price = 150; };
class U_CivilianSuit_A { quality = 3; price = 150; };
class U_CivilianSuit_B { quality = 3; price = 150; };
class U_CivilianSuit_C { quality = 3; price = 150; };
class U_CivilianSuit_D { quality = 3; price = 150; };
class U_CivilianTankTop_A { quality = 3; price = 150; };
class U_CivilianTankTop_B { quality = 3; price = 150; };
class U_CivilianTankTop_C { quality = 3; price = 150; };
class U_CivilianTankTop_D { quality = 3; price = 150; };
class U_CivilianTankTop_E { quality = 3; price = 150; };
class U_CivilianTShirt_A { quality = 3; price = 150; };
class U_CivilianTShirt_B { quality = 3; price = 150; };
class U_CivilianTShirt_C { quality = 3; price = 150; };
class U_CivilianTShirt_D { quality = 3; price = 150; };
class U_CivilianTShirt_E { quality = 3; price = 150; };
class U_CivilianTShirt_F { quality = 3; price = 150; };
class U_CivilianTShirt_G { quality = 3; price = 150; };
class U_CivilianTShirtCasual_A { quality = 3; price = 150; };
class U_CivilianTShirtCasual_B { quality = 3; price = 150; };
class U_CivilianTShirtCasual_C { quality = 3; price = 150; };
class U_CivilianTShirtCasual_D { quality = 3; price = 150; };
class U_CivilianTShirtCasual_E { quality = 3; price = 150; };
class U_CivilianTShirtCasual_F { quality = 3; price = 150; };
class U_CivilianTShirtCasual_G { quality = 3; price = 150; };
class U_CivilianTShirtCasual_H { quality = 3; price = 150; };
class U_CivilianTShirtCasual_I { quality = 3; price = 150; };
class U_CombatOutdoor_A { quality = 3; price = 150; };
class U_CombatOutdoor_B { quality = 3; price = 150; };
class U_CombatOutdoor_C { quality = 3; price = 150; };
class U_CombatOutdoor_D { quality = 3; price = 150; };
class U_CombatUniFatigue_A { quality = 3; price = 150; };
class U_CombatUniLeadMerc_A { quality = 3; price = 150; };
class U_CombatUniLeadMerc_B { quality = 3; price = 150; };
class U_CombatUniLeadMerc_C { quality = 3; price = 150; };
class U_CombatUniLeadMerc_D { quality = 3; price = 150; };
class U_CombatUniLeadMerc_E { quality = 3; price = 150; };
class U_CombatUniLeadMerc_F { quality = 3; price = 150; };
class U_CombatUniLong_A { quality = 3; price = 150; };
class U_CombatUniLong_B { quality = 3; price = 150; };
class U_CombatUniShirt_A { quality = 3; price = 150; };
class U_CombatUniShirt_B { quality = 3; price = 150; };
class U_CombatUniShirt_C { quality = 3; price = 150; };
class U_CombatUniShirt_D { quality = 3; price = 150; };
class U_CombatUniShirt_E { quality = 3; price = 150; };
class U_CombatUniShirt_F { quality = 3; price = 150; };
class U_CombatUniShirtAlt_A { quality = 3; price = 150; };
class U_CombatUniShirtAlt_B { quality = 3; price = 150; };
class U_CombatUniShirtAlt_C { quality = 3; price = 150; };
class U_CombatUniShirtAlt_D { quality = 3; price = 150; };
class U_CombatUniShirtAlt_E { quality = 3; price = 150; };
class U_CombatUniShirtAlt_F { quality = 3; price = 150; };
class U_CombatUniShirtMercA_A { quality = 3; price = 150; };
class U_CombatUniShirtMercA_B { quality = 3; price = 150; };
class U_CombatUniShirtMercA_C { quality = 3; price = 150; };
class U_CombatUniShirtMercA_D { quality = 3; price = 150; };
class U_CombatUniShirtMercA_E { quality = 3; price = 150; };
class U_CombatUniShirtMercA_F { quality = 3; price = 150; };
class U_CombatUniShirtMercA_G { quality = 3; price = 150; };
class U_CombatUniShirtMercB_A { quality = 3; price = 150; };
class U_CombatUniShirtMercB_B { quality = 3; price = 150; };
class U_CombatUniShirtMercB_C { quality = 3; price = 150; };
class U_CombatUniShirtMercB_D { quality = 3; price = 150; };
class U_CombatUniShirtMercB_E { quality = 3; price = 150; };
class U_CombatUniShirtMercB_F { quality = 3; price = 150; };
class U_CombatUniShirtMercB_G { quality = 3; price = 150; };
class U_CombatUniShirtMercB_H { quality = 3; price = 150; };
class U_CombatUniShirtMercB_I { quality = 3; price = 150; };
class U_CombatUniShirtMercB_J { quality = 3; price = 150; };
class U_CombatUniShirtMercC_A { quality = 3; price = 150; };
class U_CombatUniShirtMercC_B { quality = 3; price = 150; };
class U_CombatUniShirtMercC_C { quality = 3; price = 150; };
class U_CombatUniShirtMercC_D { quality = 3; price = 150; };
class U_CombatUniShirtMercD_A { quality = 3; price = 150; };
class U_CombatUniShirtMercD_B { quality = 3; price = 150; };
class U_CombatUniShirtMercD_C { quality = 3; price = 150; };
class U_CombatUniShirtMercD_D { quality = 3; price = 150; };
class U_CombatUniShirtMercD_E { quality = 3; price = 150; };
class U_CombatUniShirtMercD_F { quality = 3; price = 150; };
class U_CombatUniShirtMercD_G { quality = 3; price = 150; };
class U_CombatUniSleeves_A { quality = 3; price = 150; };
class U_CombatUniSleeves_B { quality = 3; price = 150; };
class U_CombatUniSleeves_C { quality = 3; price = 150; };
class U_CombatUniSleeves_D { quality = 3; price = 150; };
class U_CombatUniSleeves_E { quality = 3; price = 150; };
class U_CombatUniSleeves_F { quality = 3; price = 150; };
class U_CombatUniSleevesShort_A { quality = 3; price = 150; };
class U_CombatUniSleevesShort_B { quality = 3; price = 150; };
class U_CombatUniSleevesShort_C { quality = 3; price = 150; };
class U_CombatUniSleevesShort_D { quality = 3; price = 150; };
class U_CombatUniSleevesShort_E { quality = 3; price = 150; };
class U_CombatUniSleevesShort_F { quality = 3; price = 150; };
class U_CombatUniTShirt_A { quality = 3; price = 150; };
class U_CombatUniTShirt_B { quality = 3; price = 150; };
class U_CombatUniTShirt_C { quality = 3; price = 150; };
class U_CombatUniTShirt_D { quality = 3; price = 150; };
class U_CombatUniTShirt_E { quality = 3; price = 150; };
class U_CombatUniTShirt_F { quality = 3; price = 150; };
class U_CombatUniVest_A { quality = 3; price = 150; };
class U_Competitor { quality = 3; price = 150; };
class U_Coveralls_A { quality = 3; price = 150; };
class U_Coveralls_B { quality = 3; price = 150; };
class U_Coveralls_C { quality = 3; price = 150; };
class U_Coveralls_D { quality = 3; price = 150; };
class U_DressTKLocalUni_A_A { quality = 3; price = 150; };
class U_DressTKLocalUni_A_B { quality = 3; price = 150; };
class U_DressTKLocalUni_A_C { quality = 3; price = 150; };
class U_DressTKLocalUni_A_D { quality = 3; price = 150; };
class U_DressTKLocalUni_A_E { quality = 3; price = 150; };
class U_DressTKLocalUni_B_A { quality = 3; price = 150; };
class U_DressTKLocalUni_B_B { quality = 3; price = 150; };
class U_DressTKLocalUni_B_C { quality = 3; price = 150; };
class U_DressTKLocalUni_B_D { quality = 3; price = 150; };
class U_DressTKLocalUni_B_E { quality = 3; price = 150; };
class U_DressTKLocalUni_C_A { quality = 3; price = 150; };
class U_DressTKLocalUni_C_B { quality = 3; price = 150; };
class U_DressTKLocalUni_C_C { quality = 3; price = 150; };
class U_DressTKLocalUni_C_D { quality = 3; price = 150; };
class U_DressTKLocalUni_C_E { quality = 3; price = 150; };
class U_DressTKLocalUni_D_A { quality = 3; price = 150; };
class U_DressTKLocalUni_D_B { quality = 3; price = 150; };
class U_DressTKLocalUni_D_C { quality = 3; price = 150; };
class U_DressTKLocalUni_D_D { quality = 3; price = 150; };
class U_DressTKLocalUni_D_E { quality = 3; price = 150; };
class U_DressTKLocalUni_E_A { quality = 3; price = 150; };
class U_DressTKLocalUni_E_B { quality = 3; price = 150; };
class U_DressTKLocalUni_E_C { quality = 3; price = 150; };
class U_DressTKLocalUni_E_D { quality = 3; price = 150; };
class U_DressTKLocalUni_E_E { quality = 3; price = 150; };
class U_Hipster_A { quality = 3; price = 150; };
class U_Hipster_B { quality = 3; price = 150; };
class U_I_C_Soldier_Bandit_1_F { quality = 3; price = 150; };
class U_I_C_Soldier_Bandit_2_F { quality = 3; price = 150; };
class U_I_C_Soldier_Bandit_3_F { quality = 3; price = 150; };
class U_I_C_Soldier_Bandit_4_F { quality = 3; price = 150; };
class U_I_C_Soldier_Bandit_5_F { quality = 3; price = 150; };
class U_I_C_Soldier_Camo_F { quality = 3; price = 150; };
class U_I_C_Soldier_Para_1_F { quality = 3; price = 150; };
class U_I_C_Soldier_Para_2_F { quality = 3; price = 150; };
class U_I_C_Soldier_Para_3_F { quality = 3; price = 150; };
class U_I_C_Soldier_Para_4_F { quality = 3; price = 150; };
class U_I_C_Soldier_Para_5_F { quality = 3; price = 150; };
class U_I_CBRN_Suit_01_AAF_F { quality = 3; price = 150; };
class U_I_CombatUniform { quality = 3; price = 150; };
class U_I_CombatUniform_shortsleeve { quality = 3; price = 150; };
class U_I_CombatUniform_tshirt { quality = 3; price = 150; };
class U_I_E_CBRN_Suit_01_EAF_F { quality = 3; price = 150; };
class U_I_E_Uniform_01_coveralls_F { quality = 3; price = 150; };
class U_I_E_Uniform_01_F { quality = 3; price = 150; };
class U_I_E_Uniform_01_officer_F { quality = 3; price = 150; };
class U_I_E_Uniform_01_shortsleeve_F { quality = 3; price = 150; };
class U_I_E_Uniform_01_sweater_F { quality = 3; price = 150; };
class U_I_E_Uniform_01_tanktop_F { quality = 3; price = 150; };
class U_I_FullGhillie_ard { quality = 3; price = 150; };
class U_I_FullGhillie_lsh { quality = 3; price = 150; };
class U_I_FullGhillie_sard { quality = 3; price = 150; };
class U_I_G_resistanceLeader_F { quality = 3; price = 150; };
class U_I_G_Story_Protagonist_F { quality = 3; price = 150; };
class U_I_GhillieSuit { quality = 3; price = 150; };
class U_I_HeliPilotCoveralls { quality = 3; price = 150; };
class U_I_L_Uniform_01_camo_F { quality = 3; price = 150; };
class U_I_L_Uniform_01_deserter_F { quality = 3; price = 150; };
class U_I_L_Uniform_01_tshirt_black_F { quality = 3; price = 150; };
class U_I_L_Uniform_01_tshirt_olive_F { quality = 3; price = 150; };
class U_I_L_Uniform_01_tshirt_skull_F { quality = 3; price = 150; };
class U_I_L_Uniform_01_tshirt_sport_F { quality = 3; price = 150; };
class U_I_OfficerUniform { quality = 3; price = 150; };
class U_I_pilotCoveralls { quality = 3; price = 150; };
class U_I_Protagonist_VR { quality = 3; price = 150; };
class U_I_Soldier_VR { quality = 3; price = 150; };
class U_I_Wetsuit { quality = 3; price = 150; };
class U_IG_Guerilla1_1 { quality = 3; price = 150; };
class U_IG_Guerilla2_1 { quality = 3; price = 150; };
class U_IG_Guerilla2_2 { quality = 3; price = 150; };
class U_IG_Guerilla2_3 { quality = 3; price = 150; };
class U_IG_Guerilla3_1 { quality = 3; price = 150; };
class U_IG_Guerilla3_2 { quality = 3; price = 150; };
class U_IG_Guerrilla_6_1 { quality = 3; price = 150; };
class U_IG_leader { quality = 3; price = 150; };
class U_IG_Menelaos { quality = 3; price = 150; };
class U_InsUniShirt_A { quality = 3; price = 150; };
class U_InsUniShirt_B { quality = 3; price = 150; };
class U_InsUniShirt_C { quality = 3; price = 150; };
class U_InsUniShirt_Leader { quality = 3; price = 150; };
class U_KerryBody { quality = 3; price = 150; };
class U_LampreyBody { quality = 3; price = 150; };
class U_Marshal { quality = 3; price = 150; };
class U_MilitaryCoat_A { quality = 3; price = 150; };
class U_MilitaryCoat_B { quality = 3; price = 150; };
class U_MilitaryCoat_C { quality = 3; price = 150; };
class U_MilitaryCoat_D { quality = 3; price = 150; };
class U_MilitiaSport_A { quality = 3; price = 150; };
class U_MilitiaSport_B { quality = 3; price = 150; };
class U_MilitiaSport_C { quality = 3; price = 150; };
class U_MilitiaUniShirt_A { quality = 3; price = 150; };
class U_MilitiaUniShirt_B { quality = 3; price = 150; };
class U_MilitiaUniShirt_C { quality = 3; price = 150; };
class U_MilitiaUniShirt_D { quality = 3; price = 150; };
class U_MilitiaUniShirt_E { quality = 3; price = 150; };
class U_MilitiaUniShirt_F { quality = 3; price = 150; };
class U_MilitiaUniShirt_G { quality = 3; price = 150; };
class U_MilitiaUniTShirt_A { quality = 3; price = 150; };
class U_MilitiaUniTShirt_B { quality = 3; price = 150; };
class U_MilitiaUniTShirt_C { quality = 3; price = 150; };
class U_MilitiaUniTShirt_D { quality = 3; price = 150; };
class U_MilitiaUniTShirt_E { quality = 3; price = 150; };
class U_MilitiaUniTShirt_F { quality = 3; price = 150; };
class U_MilitiaUniTShirt_G { quality = 3; price = 150; };
class U_MillerBody { quality = 3; price = 150; };
class U_NikosAgedBody { quality = 3; price = 150; };
class U_NikosBody { quality = 3; price = 150; };
class U_O_CombatUniform_ocamo { quality = 3; price = 150; };
class U_O_CombatUniform_oucamo { quality = 3; price = 150; };
class U_O_FullGhillie_ard { quality = 3; price = 150; };
class U_O_FullGhillie_lsh { quality = 3; price = 150; };
class U_O_FullGhillie_sard { quality = 3; price = 150; };
class U_O_GEN_Commander_F { quality = 3; price = 150; };
class U_O_GEN_Soldier_F { quality = 3; price = 150; };
class U_O_GhillieSuit { quality = 3; price = 150; };
class U_O_officer_noInsignia_hex_F { quality = 3; price = 150; };
class U_O_OfficerUniform_ocamo { quality = 3; price = 150; };
class U_O_PilotCoveralls { quality = 3; price = 150; };
class U_O_Protagonist_VR { quality = 3; price = 150; };
class U_O_R_Gorka_01_black_F { quality = 3; price = 150; };
class U_O_R_Gorka_01_brown_F { quality = 3; price = 150; };
class U_O_R_Gorka_01_camo_F { quality = 3; price = 150; };
class U_O_R_Gorka_01_F { quality = 3; price = 150; };
class U_O_Soldier_VR { quality = 3; price = 150; };
class U_O_SpecopsUniform_blk { quality = 3; price = 150; };
class U_O_SpecopsUniform_ocamo { quality = 3; price = 150; };
class U_O_T_FullGhillie_tna_F { quality = 3; price = 150; };
class U_O_T_Officer_F { quality = 3; price = 150; };
class U_O_T_Sniper_F { quality = 3; price = 150; };
class U_O_T_Soldier_F { quality = 3; price = 150; };
class U_O_V_Soldier_Viper_F { quality = 3; price = 150; };
class U_O_V_Soldier_Viper_hex_F { quality = 3; price = 150; };
class U_O_Wetsuit { quality = 3; price = 150; };
class U_Office_A { quality = 3; price = 150; };
class U_Office_B { quality = 3; price = 150; };
class U_Office_C { quality = 3; price = 150; };
class U_OG_Guerilla1_1 { quality = 3; price = 150; };
class U_OG_Guerilla2_1 { quality = 3; price = 150; };
class U_OG_Guerilla2_2 { quality = 3; price = 150; };
class U_OG_Guerilla2_3 { quality = 3; price = 150; };
class U_OG_Guerilla3_1 { quality = 3; price = 150; };
class U_OG_Guerilla3_2 { quality = 3; price = 150; };
class U_OG_Guerrilla_6_1 { quality = 3; price = 150; };
class U_OG_leader { quality = 3; price = 150; };
class U_OI_Scientist { quality = 3; price = 150; };
class U_OrestesBody { quality = 3; price = 150; };
class U_Rangemaster { quality = 3; price = 150; };
class U_Rangemaster_A { quality = 3; price = 150; };
class U_Rangemaster_B { quality = 3; price = 150; };
class U_Rangemaster_C { quality = 3; price = 150; };
class U_Rangemaster_D { quality = 3; price = 150; };
class U_Rangemaster_E { quality = 3; price = 150; };
class U_Rangemaster_F { quality = 3; price = 150; };
class U_Rangemaster_G { quality = 3; price = 150; };
class U_Rangemaster_H { quality = 3; price = 150; };
class U_Skater_A { quality = 3; price = 150; };
class U_Skater_B { quality = 3; price = 150; };
class U_Tank_green_F { quality = 3; price = 150; };
class U_TerrorCombat_A { quality = 3; price = 150; };
class U_TerrorCombat_B { quality = 3; price = 150; };
class U_TerrorCombat_Black { quality = 3; price = 150; };
class U_TKLocalCombat_A { quality = 3; price = 150; };
class U_TKLocalCombat_B { quality = 3; price = 150; };
class U_TKLocalCombat_C { quality = 3; price = 150; };
class U_TKLocalCombat_D { quality = 3; price = 150; };
class U_TKLocalCombat_E { quality = 3; price = 150; };
class U_TKLocalTactic_A { quality = 3; price = 150; };
class U_TKLocalTactic_B { quality = 3; price = 150; };
class U_TKLocalTactic_C { quality = 3; price = 150; };
class U_TKLocalTactic_D { quality = 3; price = 150; };
class U_TKLocalTactic_E { quality = 3; price = 150; };
class U_TKLocalUni_A { quality = 3; price = 150; };
class U_TKLocalUni_B { quality = 3; price = 150; };
class U_TKLocalUni_C { quality = 3; price = 150; };
class U_TKLocalUni_D { quality = 3; price = 150; };
class U_TKLocalUni_E { quality = 3; price = 150; };
class U_TKLocalUni_F { quality = 3; price = 150; };
class U_TKLocalUniLong_A { quality = 3; price = 150; };
class U_TKLocalUniLong_B { quality = 3; price = 150; };
class U_TKLocalUniLong_C { quality = 3; price = 150; };
class U_TKLocalUniLong_D { quality = 3; price = 150; };
class U_TKLocalUniLong_E { quality = 3; price = 150; };
class U_TKOfficerUni_A { quality = 3; price = 150; };
class U_TKOfficerUni_B { quality = 3; price = 150; };
class U_TKSoldierUni_A { quality = 3; price = 150; };
class U_TKSoldierUni_B { quality = 3; price = 150; };
class U_TKSpecialUni_A { quality = 3; price = 150; };
class U_TKSpecialUni_B { quality = 3; price = 150; };
class U_VirtualMan_F { quality = 3; price = 150; };


// Headgear 

class H_Bandanna_blu { quality = 3; price = 150; };
class H_Bandanna_camo { quality = 3; price = 150; };
class H_Bandanna_cbr { quality = 3; price = 150; };
class H_Bandanna_gry { quality = 3; price = 150; };
class H_Bandanna_khk { quality = 3; price = 150; };
class H_Bandanna_khk_hs { quality = 3; price = 150; };
class H_Bandanna_mcamo { quality = 3; price = 150; };
class H_Bandanna_sand { quality = 3; price = 150; };
class H_Bandanna_sgg { quality = 3; price = 150; };
class H_Bandanna_surfer { quality = 3; price = 150; };
class H_Bandanna_surfer_blk { quality = 3; price = 150; };
class H_Bandanna_surfer_grn { quality = 3; price = 150; };
class H_BandMask_blk { quality = 3; price = 150; };
class H_BandMask_demon { quality = 3; price = 150; };
class H_BandMask_khk { quality = 3; price = 150; };
class H_BandMask_reaper { quality = 3; price = 150; };
class H_Beret_02 { quality = 3; price = 150; };
class H_Beret_A { quality = 3; price = 150; };
class H_Beret_B { quality = 3; price = 150; };
class H_Beret_blk { quality = 3; price = 150; };
class H_Beret_blk_POLICE { quality = 3; price = 150; };
class H_Beret_brn_SF { quality = 3; price = 150; };
class H_Beret_C { quality = 3; price = 150; };
class H_Beret_Colonel { quality = 3; price = 150; };
class H_Beret_CSAT_01_F { quality = 3; price = 150; };
class H_Beret_EAF_01_F { quality = 3; price = 150; };
class H_Beret_gen_F { quality = 3; price = 150; };
class H_Beret_grn { quality = 3; price = 150; };
class H_Beret_grn_SF { quality = 3; price = 150; };
class H_Beret_ocamo { quality = 3; price = 150; };
class H_Beret_red { quality = 3; price = 150; };
class H_Booniehat_dgtl { quality = 3; price = 150; };
class H_Booniehat_dirty { quality = 3; price = 150; };
class H_Booniehat_eaf { quality = 3; price = 150; };
class H_Booniehat_grn { quality = 3; price = 150; };
class H_Booniehat_indp { quality = 3; price = 150; };
class H_Booniehat_khk { quality = 3; price = 150; };
class H_Booniehat_khk_hs { quality = 3; price = 150; };
class H_Booniehat_mcamo { quality = 3; price = 150; };
class H_Booniehat_mgrn { quality = 3; price = 150; };
class H_Booniehat_oli { quality = 3; price = 150; };
class H_Booniehat_taiga { quality = 3; price = 150; };
class H_Booniehat_tan { quality = 3; price = 150; };
class H_Booniehat_tna_F { quality = 3; price = 150; };
class H_Booniehat_wdl { quality = 3; price = 150; };
class H_Cap_Black_IDAP_F { quality = 3; price = 150; };
class H_Cap_blk { quality = 3; price = 150; };
class H_Cap_blk_CMMG { quality = 3; price = 150; };
class H_Cap_blk_ION { quality = 3; price = 150; };
class H_Cap_blk_Raven { quality = 3; price = 150; };
class H_Cap_blk_Syndikat_F { quality = 3; price = 150; };
class H_Cap_blu { quality = 3; price = 150; };
class H_Cap_brn_SPECOPS { quality = 3; price = 150; };
class H_Cap_grn { quality = 3; price = 150; };
class H_Cap_grn_BI { quality = 3; price = 150; };
class H_Cap_grn_Syndikat_F { quality = 3; price = 150; };
class H_Cap_headphones { quality = 3; price = 150; };
class H_Cap_khaki_specops_UK { quality = 3; price = 150; };
class H_Cap_marshal { quality = 3; price = 150; };
class H_Cap_oli { quality = 3; price = 150; };
class H_Cap_oli_hs { quality = 3; price = 150; };
class H_Cap_oli_Syndikat_F { quality = 3; price = 150; };
class H_Cap_Orange_IDAP_F { quality = 3; price = 150; };
class H_Cap_police { quality = 3; price = 150; };
class H_Cap_press { quality = 3; price = 150; };
class H_Cap_red { quality = 3; price = 150; };
class H_Cap_surfer { quality = 3; price = 150; };
class H_Cap_tan { quality = 3; price = 150; };
class H_Cap_tan_specops_US { quality = 3; price = 150; };
class H_Cap_tan_Syndikat_F { quality = 3; price = 150; };
class H_Cap_usblack { quality = 3; price = 150; };
class H_Cap_White_IDAP_F { quality = 3; price = 150; };
class H_Construction_basic_black_F { quality = 3; price = 150; };
class H_Construction_basic_orange_F { quality = 3; price = 150; };
class H_Construction_basic_red_F { quality = 3; price = 150; };
class H_Construction_basic_vrana_F { quality = 3; price = 150; };
class H_Construction_basic_white_F { quality = 3; price = 150; };
class H_Construction_basic_yellow_F { quality = 3; price = 150; };
class H_Construction_earprot_black_F { quality = 3; price = 150; };
class H_Construction_earprot_orange_F { quality = 3; price = 150; };
class H_Construction_earprot_red_F { quality = 3; price = 150; };
class H_Construction_earprot_vrana_F { quality = 3; price = 150; };
class H_Construction_earprot_white_F { quality = 3; price = 150; };
class H_Construction_earprot_yellow_F { quality = 3; price = 150; };
class H_Construction_headset_black_F { quality = 3; price = 150; };
class H_Construction_headset_orange_F { quality = 3; price = 150; };
class H_Construction_headset_red_F { quality = 3; price = 150; };
class H_Construction_headset_vrana_F { quality = 3; price = 150; };
class H_Construction_headset_white_F { quality = 3; price = 150; };
class H_Construction_headset_yellow_F { quality = 3; price = 150; };
class H_CrewHelmetHeli_B { quality = 3; price = 150; };
class H_CrewHelmetHeli_I { quality = 3; price = 150; };
class H_CrewHelmetHeli_I_E { quality = 3; price = 150; };
class H_CrewHelmetHeli_O { quality = 3; price = 150; };
class H_EarProtectors_black_F { quality = 3; price = 150; };
class H_EarProtectors_orange_F { quality = 3; price = 150; };
class H_EarProtectors_red_F { quality = 3; price = 150; };
class H_EarProtectors_white_F { quality = 3; price = 150; };
class H_EarProtectors_yellow_F { quality = 3; price = 150; };
class H_Hat_Beret_Basque_A { quality = 3; price = 150; };
class H_Hat_Beret_Basque_B { quality = 3; price = 150; };
class H_Hat_Beret_Basque_C { quality = 3; price = 150; };
class H_Hat_Beret_Basque_D { quality = 3; price = 150; };
class H_Hat_blue { quality = 3; price = 150; };
class H_Hat_Boonie { quality = 3; price = 150; };
class H_Hat_Boonie_Cowboy { quality = 3; price = 150; };
class H_Hat_Boonie_Flecktarn { quality = 3; price = 150; };
class H_Hat_Boonie_Green { quality = 3; price = 150; };
class H_Hat_Boonie_Marpat { quality = 3; price = 150; };
class H_Hat_Boonie_Tiger { quality = 3; price = 150; };
class H_Hat_Boonie_Woodland { quality = 3; price = 150; };
class H_Hat_brown { quality = 3; price = 150; };
class H_Hat_camo { quality = 3; price = 150; };
class H_Hat_Cap_RU { quality = 3; price = 150; };
class H_Hat_Cap_Thai { quality = 3; price = 150; };
//class H_Hat_CapCover_A { quality = 3; price = 150; };
class H_Hat_CapCover_B { quality = 3; price = 150; };
class H_Hat_CapSov_A { quality = 3; price = 150; };
class H_Hat_CapSov_B { quality = 3; price = 150; };
class H_Hat_CapSov_C { quality = 3; price = 150; };
class H_Hat_checker { quality = 3; price = 150; };
class H_Hat_Face_Balaclava_T { quality = 3; price = 150; };
class H_Hat_Face_Cover { quality = 3; price = 150; };
class H_Hat_Face_Cover_Black { quality = 3; price = 150; };
class H_Hat_Face_Cover_Gold { quality = 3; price = 150; };
class H_Hat_Face_Cover_Green { quality = 3; price = 150; };
class H_Hat_Face_Wrap { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Black { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Dark { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Desert { quality = 3; price = 150; };
class H_Hat_Face_Wrap_DPM { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Flecktarn { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Gold { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Olive { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Red { quality = 3; price = 150; };
class H_Hat_Face_Wrap_Sand { quality = 3; price = 150; };
class H_Hat_Face_Wrap_White { quality = 3; price = 150; };
class H_Hat_Ghutra { quality = 3; price = 150; };
class H_Hat_Ghutra_A { quality = 3; price = 150; };
class H_Hat_Golf { quality = 3; price = 150; };
class H_Hat_Golf_Black { quality = 3; price = 150; };
class H_Hat_Golf_Blue { quality = 3; price = 150; };
class H_Hat_grey { quality = 3; price = 150; };
class H_Hat_Headbag { quality = 3; price = 150; };
class H_Hat_Headband_A { quality = 3; price = 150; };
class H_Hat_Headband_B { quality = 3; price = 150; };
class H_Hat_Headband_C { quality = 3; price = 150; };
class H_Hat_Headband_D { quality = 3; price = 150; };
class H_Hat_Headband_E { quality = 3; price = 150; };
class H_Hat_Headband_F { quality = 3; price = 150; };
class H_Hat_Headband_G { quality = 3; price = 150; };
class H_Hat_HeadbandL_A { quality = 3; price = 150; };
class H_Hat_HeadbandL_B { quality = 3; price = 150; };
class H_Hat_HeadbandL_C { quality = 3; price = 150; };
class H_Hat_HeadbandL_D { quality = 3; price = 150; };
class H_Hat_HeadbandL_E { quality = 3; price = 150; };
class H_Hat_HeadbandL_F { quality = 3; price = 150; };
class H_Hat_HeadbandL_G { quality = 3; price = 150; };
class H_Hat_Headphones { quality = 3; price = 150; };
class H_Hat_HeadTie_A { quality = 3; price = 150; };
class H_Hat_HeadTie_B { quality = 3; price = 150; };
class H_Hat_HeadTie_C { quality = 3; price = 150; };
class H_Hat_HeadTie_D { quality = 3; price = 150; };
class H_Hat_HeadTie_E { quality = 3; price = 150; };
class H_Hat_HeadTie_F { quality = 3; price = 150; };
class H_Hat_HeadTie_G { quality = 3; price = 150; };
class H_Hat_HelmetA { quality = 3; price = 150; };
class H_Hat_HelmetC { quality = 3; price = 150; };
class H_Hat_HelmetConical { quality = 3; price = 150; };
class H_Hat_HelmetCrewR { quality = 3; price = 150; };
class H_Hat_HelmetD { quality = 3; price = 150; };
class H_Hat_HelmetF { quality = 3; price = 150; };
class H_Hat_HelmetJ { quality = 3; price = 150; };
class H_Hat_HelmetK { quality = 3; price = 150; };
class H_Hat_HelmetPilotR { quality = 3; price = 150; };
class H_Hat_HelmetR { quality = 3; price = 150; };
class H_Hat_HelmetS { quality = 3; price = 150; };
class H_Hat_HelmetT { quality = 3; price = 150; };
class H_Hat_HelmetU { quality = 3; price = 150; };
class H_Hat_Kufiya { quality = 3; price = 150; };
class H_Hat_Kufiya_B { quality = 3; price = 150; };
class H_Hat_Kufiya_C { quality = 3; price = 150; };
class H_Hat_Kufiya_D { quality = 3; price = 150; };
class H_Hat_Kufiya_F { quality = 3; price = 150; };
class H_Hat_Kufiya_G { quality = 3; price = 150; };
class H_Hat_Kufiya_R { quality = 3; price = 150; };
class H_Hat_Pagri { quality = 3; price = 150; };
class H_Hat_Pagri_B { quality = 3; price = 150; };
class H_Hat_Pagri_C { quality = 3; price = 150; };
class H_Hat_Pakol { quality = 3; price = 150; };
class H_Hat_Safari_olive_F { quality = 3; price = 150; };
class H_Hat_Safari_sand_F { quality = 3; price = 150; };
class H_Hat_tan { quality = 3; price = 150; };
class H_Hat_Taqiyah_A { quality = 3; price = 150; };
class H_Hat_Taqiyah_B { quality = 3; price = 150; };
class H_Hat_Taqiyah_C { quality = 3; price = 150; };
class H_Hat_Taqiyah_D { quality = 3; price = 150; };
class H_Hat_Taqiyah_E { quality = 3; price = 150; };
class H_Hat_Tinfoil_F { quality = 3; price = 150; };
class H_Hat_Turban_A { quality = 3; price = 150; };
class H_Hat_Turban_B { quality = 3; price = 150; };
class H_Hat_Turban_C { quality = 3; price = 150; };
class H_Hat_Turban_D { quality = 3; price = 150; };
class H_Hat_Turban_E { quality = 3; price = 150; };
class H_Hat_Ushanka { quality = 3; price = 150; };
class H_Hat_Ushanka_Rnd_A { quality = 3; price = 150; };
class H_Hat_Ushanka_Rnd_B { quality = 3; price = 150; };
class H_Hat_Ushanka_Rnd_C { quality = 3; price = 150; };
class H_Hat_Ushanka_Rnd_D { quality = 3; price = 150; };
class H_Hat_Wig_A { quality = 3; price = 150; };
class H_Hat_Wig_Az { quality = 3; price = 150; };
class H_Hat_Wig_Ba { quality = 3; price = 150; };
class H_Hat_Wig_Bb { quality = 3; price = 150; };
class H_Hat_Wig_Bc { quality = 3; price = 150; };
class H_HeadBandage_bloody_F { quality = 3; price = 150; };
class H_HeadBandage_clean_F { quality = 3; price = 150; };
class H_HeadBandage_stained_F { quality = 3; price = 150; };
class H_HeadSet_black_F { quality = 3; price = 150; };
class H_HeadSet_orange_F { quality = 3; price = 150; };
class H_HeadSet_red_F { quality = 3; price = 150; };
class H_HeadSet_white_F { quality = 3; price = 150; };
class H_HeadSet_yellow_F { quality = 3; price = 150; };
class H_Helmet_Kerry { quality = 3; price = 150; };
class H_Helmet_Skate { quality = 3; price = 150; };
class H_HelmetAggressor_cover_F { quality = 3; price = 150; };
class H_HelmetAggressor_cover_taiga_F { quality = 3; price = 150; };
class H_HelmetAggressor_F { quality = 3; price = 150; };
class H_HelmetB { quality = 3; price = 150; };
class H_HelmetB_black { quality = 3; price = 150; };
class H_HelmetB_camo { quality = 3; price = 150; };
class H_HelmetB_desert { quality = 3; price = 150; };
class H_HelmetB_Enh_tna_F { quality = 3; price = 150; };
class H_HelmetB_grass { quality = 3; price = 150; };
class H_HelmetB_light { quality = 3; price = 150; };
class H_HelmetB_light_black { quality = 3; price = 150; };
class H_HelmetB_light_desert { quality = 3; price = 150; };
class H_HelmetB_light_grass { quality = 3; price = 150; };
class H_HelmetB_light_sand { quality = 3; price = 150; };
class H_HelmetB_light_snakeskin { quality = 3; price = 150; };
class H_HelmetB_Light_tna_F { quality = 3; price = 150; };
class H_HelmetB_light_wdl { quality = 3; price = 150; };
class H_HelmetB_paint { quality = 3; price = 150; };
class H_HelmetB_plain_blk { quality = 3; price = 150; };
class H_HelmetB_plain_mcamo { quality = 3; price = 150; };
class H_HelmetB_plain_wdl { quality = 3; price = 150; };
class H_HelmetB_sand { quality = 3; price = 150; };
class H_HelmetB_snakeskin { quality = 3; price = 150; };
class H_HelmetB_TI_tna_F { quality = 3; price = 150; };
class H_HelmetB_tna_F { quality = 3; price = 150; };
class H_HelmetCrew_B { quality = 3; price = 150; };
class H_HelmetCrew_I { quality = 3; price = 150; };
class H_HelmetCrew_I_E { quality = 3; price = 150; };
class H_HelmetCrew_O { quality = 3; price = 150; };
class H_HelmetCrew_O_ghex_F { quality = 3; price = 150; };
class H_HelmetHBK_chops_F { quality = 3; price = 150; };
class H_HelmetHBK_ear_F { quality = 3; price = 150; };
class H_HelmetHBK_F { quality = 3; price = 150; };
class H_HelmetHBK_headset_F { quality = 3; price = 150; };
class H_HelmetIA { quality = 3; price = 150; };
class H_HelmetIA_camo { quality = 3; price = 150; };
class H_HelmetIA_net { quality = 3; price = 150; };
class H_HelmetLeaderO_ghex_F { quality = 3; price = 150; };
class H_HelmetLeaderO_ocamo { quality = 3; price = 150; };
class H_HelmetLeaderO_oucamo { quality = 3; price = 150; };
class H_HelmetO_ghex_F { quality = 3; price = 150; };
class H_HelmetO_ocamo { quality = 3; price = 150; };
class H_HelmetO_oucamo { quality = 3; price = 150; };
class H_HelmetO_ViperSP_ghex_F { quality = 3; price = 150; };
class H_HelmetO_ViperSP_hex_F { quality = 3; price = 150; };
class H_HelmetSpecB { quality = 3; price = 150; };
class H_HelmetSpecB_blk { quality = 3; price = 150; };
class H_HelmetSpecB_paint1 { quality = 3; price = 150; };
class H_HelmetSpecB_paint2 { quality = 3; price = 150; };
class H_HelmetSpecB_sand { quality = 3; price = 150; };
class H_HelmetSpecB_snakeskin { quality = 3; price = 150; };
class H_HelmetSpecB_wdl { quality = 3; price = 150; };
class H_HelmetSpecO_blk { quality = 3; price = 150; };
class H_HelmetSpecO_ghex_F { quality = 3; price = 150; };
class H_HelmetSpecO_ocamo { quality = 3; price = 150; };
class H_MilCap_blue { quality = 3; price = 150; };
class H_MilCap_dgtl { quality = 3; price = 150; };
class H_MilCap_eaf { quality = 3; price = 150; };
class H_MilCap_gen_F { quality = 3; price = 150; };
class H_MilCap_ghex_F { quality = 3; price = 150; };
class H_MilCap_grn { quality = 3; price = 150; };
class H_MilCap_gry { quality = 3; price = 150; };
class H_MilCap_mcamo { quality = 3; price = 150; };
class H_MilCap_ocamo { quality = 3; price = 150; };
class H_MilCap_oucamo { quality = 3; price = 150; };
class H_MilCap_rucamo { quality = 3; price = 150; };
class H_MilCap_taiga { quality = 3; price = 150; };
class H_MilCap_tna_F { quality = 3; price = 150; };
class H_MilCap_wdl { quality = 3; price = 150; };
class H_PASGT_basic_black_F { quality = 3; price = 150; };
class H_PASGT_basic_blue_F { quality = 3; price = 150; };
class H_PASGT_basic_blue_press_F { quality = 3; price = 150; };
class H_PASGT_basic_olive_F { quality = 3; price = 150; };
class H_PASGT_basic_white_F { quality = 3; price = 150; };
class H_PASGT_neckprot_blue_press_F { quality = 3; price = 150; };
class H_PilotHelmetFighter_B { quality = 3; price = 150; };
class H_PilotHelmetFighter_I { quality = 3; price = 150; };
class H_PilotHelmetFighter_I_E { quality = 3; price = 150; };
class H_PilotHelmetFighter_O { quality = 3; price = 150; };
class H_PilotHelmetHeli_B { quality = 3; price = 150; };
class H_PilotHelmetHeli_I { quality = 3; price = 150; };
class H_PilotHelmetHeli_I_E { quality = 3; price = 150; };
class H_PilotHelmetHeli_O { quality = 3; price = 150; };
class H_RacingHelmet_1_black_F { quality = 3; price = 150; };
class H_RacingHelmet_1_blue_F { quality = 3; price = 150; };
class H_RacingHelmet_1_F { quality = 3; price = 150; };
class H_RacingHelmet_1_green_F { quality = 3; price = 150; };
class H_RacingHelmet_1_orange_F { quality = 3; price = 150; };
class H_RacingHelmet_1_red_F { quality = 3; price = 150; };
class H_RacingHelmet_1_white_F { quality = 3; price = 150; };
class H_RacingHelmet_1_yellow_F { quality = 3; price = 150; };
class H_RacingHelmet_2_F { quality = 3; price = 150; };
class H_RacingHelmet_3_F { quality = 3; price = 150; };
class H_RacingHelmet_4_F { quality = 3; price = 150; };
class H_Shemag_khk { quality = 3; price = 150; };
class H_Shemag_olive { quality = 3; price = 150; };
class H_Shemag_olive_hs { quality = 3; price = 150; };
class H_Shemag_tan { quality = 3; price = 150; };
class H_ShemagOpen_khk { quality = 3; price = 150; };
class H_ShemagOpen_tan { quality = 3; price = 150; };
class H_StrawHat { quality = 3; price = 150; };
class H_StrawHat_dark { quality = 3; price = 150; };
class H_Tank_black_F { quality = 3; price = 150; };
class H_Tank_eaf_F { quality = 3; price = 150; };
class H_TurbanO_blk { quality = 3; price = 150; };
class H_Watchcap_blk { quality = 3; price = 150; };
class H_Watchcap_camo { quality = 3; price = 150; };
class H_Watchcap_cbr { quality = 3; price = 150; };
class H_Watchcap_khk { quality = 3; price = 150; };
class H_Watchcap_sgg { quality = 3; price = 150; };
class H_WirelessEarpiece_F { quality = 3; price = 150; };


// Vests 

class V_Ballistic_A { quality = 3; price = 150; };
class V_Ballistic_B { quality = 3; price = 150; };
class V_Ballistic_C { quality = 3; price = 150; };
class V_Ballistic_D { quality = 3; price = 150; };
class V_Ballistic_E { quality = 3; price = 150; };
class V_BandollierB_blk { quality = 3; price = 150; };
class V_BandollierB_cbr { quality = 3; price = 150; };
class V_BandollierB_ghex_F { quality = 3; price = 150; };
class V_BandollierB_khk { quality = 3; price = 150; };
class V_BandollierB_oli { quality = 3; price = 150; };
class V_BandollierB_rgr { quality = 3; price = 150; };
class V_BombJacket { quality = 3; price = 150; };
class V_CarrierRigKBT_01_EAF_F { quality = 3; price = 150; };
class V_CarrierRigKBT_01_heavy_EAF_F { quality = 3; price = 150; };
class V_CarrierRigKBT_01_heavy_Olive_F { quality = 3; price = 150; };
class V_CarrierRigKBT_01_light_EAF_F { quality = 3; price = 150; };
class V_CarrierRigKBT_01_light_Olive_F { quality = 3; price = 150; };
class V_CarrierRigKBT_01_Olive_F { quality = 3; price = 150; };
class V_Chestrig_blk { quality = 3; price = 150; };
class V_ChestRig_heavy_A { quality = 3; price = 150; };
class V_ChestRig_heavy_B { quality = 3; price = 150; };
class V_ChestRig_heavy_C { quality = 3; price = 150; };
class V_ChestRig_heavy_D { quality = 3; price = 150; };
class V_Chestrig_khk { quality = 3; price = 150; };
class V_ChestRig_light_A { quality = 3; price = 150; };
class V_ChestRig_light_B { quality = 3; price = 150; };
class V_ChestRig_light_C { quality = 3; price = 150; };
class V_ChestRig_light_D { quality = 3; price = 150; };
class V_ChestRig_light_E { quality = 3; price = 150; };
class V_Chestrig_oli { quality = 3; price = 150; };
class V_Chestrig_rgr { quality = 3; price = 150; };
class V_DeckCrew_blue_F { quality = 3; price = 150; };
class V_DeckCrew_brown_F { quality = 3; price = 150; };
class V_DeckCrew_green_F { quality = 3; price = 150; };
class V_DeckCrew_red_F { quality = 3; price = 150; };
class V_DeckCrew_violet_F { quality = 3; price = 150; };
class V_DeckCrew_white_F { quality = 3; price = 150; };
class V_DeckCrew_yellow_F { quality = 3; price = 150; };
class V_EOD_blue_F { quality = 3; price = 150; };
class V_EOD_coyote_F { quality = 3; price = 150; };
class V_EOD_IDAP_blue_F { quality = 3; price = 150; };
class V_EOD_olive_F { quality = 3; price = 150; };
class V_FlakJacket_Black { quality = 3; price = 150; };
class V_FlakJacket_Blue { quality = 3; price = 150; };
class V_FlakJacket_digiCamo { quality = 3; price = 150; };
class V_FlakJacket_Green { quality = 3; price = 150; };
class V_FlakJacket_KP_Black { quality = 3; price = 150; };
class V_FlakJacket_KP_Blue { quality = 3; price = 150; };
class V_FlakJacket_KP_digiCamo { quality = 3; price = 150; };
class V_FlakJacket_KP_Green { quality = 3; price = 150; };
class V_FlakJacket_KP_Tan { quality = 3; price = 150; };
class V_FlakJacket_KP_Woodland { quality = 3; price = 150; };
class V_FlakJacket_Pliskin_Black { quality = 3; price = 150; };
class V_FlakJacket_Pliskin_Blue { quality = 3; price = 150; };
class V_FlakJacket_Pliskin_digiCamo { quality = 3; price = 150; };
class V_FlakJacket_Pliskin_Green { quality = 3; price = 150; };
class V_FlakJacket_Pliskin_HunterGreen { quality = 3; price = 150; };
class V_FlakJacket_Pliskin_Tan { quality = 3; price = 150; };
class V_FlakJacket_Pliskin_Woodland { quality = 3; price = 150; };
class V_FlakJacket_SH_Black { quality = 3; price = 150; };
class V_FlakJacket_SH_Blue { quality = 3; price = 150; };
class V_FlakJacket_SH_digiCamo { quality = 3; price = 150; };
class V_FlakJacket_SH_Green { quality = 3; price = 150; };
class V_FlakJacket_SH_Tan { quality = 3; price = 150; };
class V_FlakJacket_SH_Woodland { quality = 3; price = 150; };
class V_FlakJacket_Tan { quality = 3; price = 150; };
class V_FlakJacket_Woodland { quality = 3; price = 150; };
class V_HarnessO_brn { quality = 3; price = 150; };
class V_HarnessO_ghex_F { quality = 3; price = 150; };
class V_HarnessO_gry { quality = 3; price = 150; };
class V_HarnessOGL_brn { quality = 3; price = 150; };
class V_HarnessOGL_ghex_F { quality = 3; price = 150; };
class V_HarnessOGL_gry { quality = 3; price = 150; };
class V_HarnessOSpec_brn { quality = 3; price = 150; };
class V_HarnessOSpec_gry { quality = 3; price = 150; };
class V_I_G_resistanceLeader_F { quality = 3; price = 150; };
class V_LegStrapBag_black_F { quality = 3; price = 150; };
class V_LegStrapBag_coyote_F { quality = 3; price = 150; };
class V_LegStrapBag_olive_F { quality = 3; price = 150; };
class V_Plain_crystal_F { quality = 3; price = 150; };
class V_Plain_medical_F { quality = 3; price = 150; };
class V_PlateCarrier1_blk { quality = 3; price = 150; };
class V_PlateCarrier1_rgr { quality = 3; price = 150; };
class V_PlateCarrier1_rgr_noflag_F { quality = 3; price = 150; };
class V_PlateCarrier1_tna_F { quality = 3; price = 150; };
class V_PlateCarrier1_wdl { quality = 3; price = 150; };
class V_PlateCarrier2_blk { quality = 3; price = 150; };
class V_PlateCarrier2_rgr { quality = 3; price = 150; };
class V_PlateCarrier2_rgr_noflag_F { quality = 3; price = 150; };
class V_PlateCarrier2_tna_F { quality = 3; price = 150; };
class V_PlateCarrier2_wdl { quality = 3; price = 150; };
class V_PlateCarrier3_rgr { quality = 3; price = 150; };
class V_PlateCarrier_heavy_A { quality = 3; price = 150; };
class V_PlateCarrier_heavy_B { quality = 3; price = 150; };
class V_PlateCarrier_heavy_C { quality = 3; price = 150; };
class V_PlateCarrier_heavy_D { quality = 3; price = 150; };
class V_PlateCarrier_heavy_digiCamo { quality = 3; price = 150; };
class V_PlateCarrier_heavy_E { quality = 3; price = 150; };
class V_PlateCarrier_heavy_F { quality = 3; price = 150; };
class V_PlateCarrier_heavy_G { quality = 3; price = 150; };
class V_PlateCarrier_Kerry { quality = 3; price = 150; };
class V_PlateCarrier_light_digiCamo { quality = 3; price = 150; };
class V_PlateCarrier_medium_A { quality = 3; price = 150; };
class V_PlateCarrier_medium_B { quality = 3; price = 150; };
class V_PlateCarrier_medium_C { quality = 3; price = 150; };
class V_PlateCarrier_medium_D { quality = 3; price = 150; };
class V_PlateCarrier_medium_E { quality = 3; price = 150; };
class V_PlateCarrierGL_blk { quality = 3; price = 150; };
class V_PlateCarrierGL_mtp { quality = 3; price = 150; };
class V_PlateCarrierGL_rgr { quality = 3; price = 150; };
class V_PlateCarrierGL_tna_F { quality = 3; price = 150; };
class V_PlateCarrierGL_wdl { quality = 3; price = 150; };
class V_PlateCarrierH_CTRG { quality = 3; price = 150; };
class V_PlateCarrierIA1_dgtl { quality = 3; price = 150; };
class V_PlateCarrierIA2_dgtl { quality = 3; price = 150; };
class V_PlateCarrierIAGL_dgtl { quality = 3; price = 150; };
class V_PlateCarrierIAGL_oli { quality = 3; price = 150; };
class V_PlateCarrierL_CTRG { quality = 3; price = 150; };
class V_PlateCarrierSpec_blk { quality = 3; price = 150; };
class V_PlateCarrierSpec_mtp { quality = 3; price = 150; };
class V_PlateCarrierSpec_rgr { quality = 3; price = 150; };
class V_PlateCarrierSpec_tna_F { quality = 3; price = 150; };
class V_PlateCarrierSpec_wdl { quality = 3; price = 150; };
class V_Pocketed_black_F { quality = 3; price = 150; };
class V_Pocketed_coyote_F { quality = 3; price = 150; };
class V_Pocketed_olive_F { quality = 3; price = 150; };
class V_Police_heavy { quality = 3; price = 150; };
class V_Police_light { quality = 3; price = 150; };
class V_Police_medium { quality = 3; price = 150; };
class V_Pouch_light_A { quality = 3; price = 150; };
class V_Pouch_light_B { quality = 3; price = 150; };
class V_Pouch_light_C { quality = 3; price = 150; };
class V_Press_F { quality = 3; price = 150; };
class V_Rangemaster_belt { quality = 3; price = 150; };
class V_RebreatherB { quality = 3; price = 150; };
class V_RebreatherIA { quality = 3; price = 150; };
class V_RebreatherIR { quality = 3; price = 150; };
class V_Safety_blue_F { quality = 3; price = 150; };
class V_Safety_orange_F { quality = 3; price = 150; };
class V_Safety_yellow_F { quality = 3; price = 150; };
class V_SmershVest_01_F { quality = 3; price = 150; };
class V_SmershVest_01_radio_F { quality = 3; price = 150; };
class V_TacChestrig_cbr_F { quality = 3; price = 150; };
class V_TacChestrig_grn_F { quality = 3; price = 150; };
class V_TacChestrig_oli_F { quality = 3; price = 150; };
class V_TacVest_blk { quality = 3; price = 150; };
class V_TacVest_blk_POLICE { quality = 3; price = 150; };
class V_TacVest_brn { quality = 3; price = 150; };
class V_TacVest_camo { quality = 3; price = 150; };
class V_TacVest_gen_F { quality = 3; price = 150; };
class V_TacVest_khk { quality = 3; price = 150; };
class V_TacVest_oli { quality = 3; price = 150; };
class V_TacVest_TK { quality = 3; price = 150; };
class V_TacVestCamo_khk { quality = 3; price = 150; };
class V_TacVestEX_A { quality = 3; price = 150; };
class V_TacVestEX_B { quality = 3; price = 150; };
class V_TacVestEX_C { quality = 3; price = 150; };
class V_TacVestEX_D { quality = 3; price = 150; };
class V_TacVestEX_E { quality = 3; price = 150; };
class V_TacVestEX_F { quality = 3; price = 150; };
class V_TacVestEX_G { quality = 3; price = 150; };
class V_TacVestIR_blk { quality = 3; price = 150; };
class V_TacVestUP_A { quality = 3; price = 150; };
class V_TacVestUP_B { quality = 3; price = 150; };
class V_TacVestUP_C { quality = 3; price = 150; };
class V_TacVestUP_D { quality = 3; price = 150; };
class V_TacVestUP_E { quality = 3; price = 150; };
class V_TacVestUP_F { quality = 3; price = 150; };
class V_TacVestUP_G { quality = 3; price = 150; };
class V_Vest_AI_Invisible_Heavy { quality = 3; price = 150; };
class V_Vest_AI_Invisible_Light { quality = 3; price = 150; };
class V_Vest_AI_Invisible_Medium { quality = 3; price = 150; };
class V_Vest_light_Invisible { quality = 3; price = 150; };
class V_Vest_light_InvNoArmor { quality = 3; price = 150; };


// Backpacks 

class B_AA_01_weapon_F { quality = 3; price = 150; };
class B_AliceBag_A { quality = 3; price = 150; };
class B_Assault_Diver { quality = 3; price = 150; };
class B_AssaultPack_blk { quality = 3; price = 150; };
class B_AssaultPack_blk_DiverExp { quality = 3; price = 150; };
class B_AssaultPack_blk_Medic { quality = 3; price = 150; };
class B_AssaultPack_cbr { quality = 3; price = 150; };
class B_AssaultPack_dgtl { quality = 3; price = 150; };
class B_AssaultPack_eaf_F { quality = 3; price = 150; };
class B_AssaultPack_eaf_IELAT2_F { quality = 3; price = 150; };
class B_AssaultPack_eaf_IELAT_F { quality = 3; price = 150; };
class B_AssaultPack_eaf_IEPathfinder_F { quality = 3; price = 150; };
class B_AssaultPack_eaf_Repair_F { quality = 3; price = 150; };
class B_AssaultPack_Kerry { quality = 3; price = 150; };
class B_AssaultPack_khk { quality = 3; price = 150; };
class B_AssaultPack_mcamo { quality = 3; price = 150; };
class B_AssaultPack_mcamo_AA { quality = 3; price = 150; };
class B_AssaultPack_mcamo_AAR { quality = 3; price = 150; };
class B_AssaultPack_mcamo_Ammo { quality = 3; price = 150; };
class B_AssaultPack_mcamo_AT { quality = 3; price = 150; };
class B_AssaultPack_ocamo { quality = 3; price = 150; };
class B_AssaultPack_ocamo_Medic_F { quality = 3; price = 150; };
class B_AssaultPack_rgr { quality = 3; price = 150; };
class B_AssaultPack_rgr_BTLAT2_F { quality = 3; price = 150; };
class B_AssaultPack_rgr_BTLAT_F { quality = 3; price = 150; };
class B_AssaultPack_rgr_BTReconMedic { quality = 3; price = 150; };
class B_AssaultPack_rgr_CTRGLAT2_F { quality = 3; price = 150; };
class B_AssaultPack_rgr_CTRGLAT_F { quality = 3; price = 150; };
class B_AssaultPack_rgr_CTRGMedic_F { quality = 3; price = 150; };
class B_AssaultPack_rgr_LAT { quality = 3; price = 150; };
class B_AssaultPack_rgr_LAT2 { quality = 3; price = 150; };
class B_AssaultPack_rgr_Medic { quality = 3; price = 150; };
class B_AssaultPack_rgr_ReconExp { quality = 3; price = 150; };
class B_AssaultPack_rgr_ReconLAT { quality = 3; price = 150; };
class B_AssaultPack_rgr_ReconMedic { quality = 3; price = 150; };
class B_AssaultPack_rgr_Repair { quality = 3; price = 150; };
class B_AssaultPack_sgg { quality = 3; price = 150; };
class B_AssaultPack_tna_BTMedic_F { quality = 3; price = 150; };
class B_AssaultPack_tna_BTRepair_F { quality = 3; price = 150; };
class B_AssaultPack_tna_F { quality = 3; price = 150; };
class B_AssaultPack_wdl_BWLAT2_F { quality = 3; price = 150; };
class B_AssaultPack_wdl_BWLAT_F { quality = 3; price = 150; };
class B_AssaultPack_wdl_BWMedic_F { quality = 3; price = 150; };
class B_AssaultPack_wdl_BWReconMedic { quality = 3; price = 150; };
class B_AssaultPack_wdl_BWRepair_F { quality = 3; price = 150; };
class B_AssaultPack_wdl_F { quality = 3; price = 150; };
class B_AssaultPackG { quality = 3; price = 150; };
class B_AT_01_weapon_F { quality = 3; price = 150; };
class B_B_Parachute_02_F { quality = 3; price = 150; };
class B_Bag_TacticalCart { quality = 3; price = 150; };
class B_Bag_TacticalDeerStand { quality = 3; price = 150; };
class B_Bag_TacticalTent { quality = 3; price = 150; };
class B_Bag_weapon_CameraStatic_high { quality = 3; price = 150; };
class B_Bag_weapon_DShKM_high { quality = 3; price = 150; };
class B_Bag_weapon_DShKM_low { quality = 3; price = 150; };
class B_Bag_weapon_M2_high { quality = 3; price = 150; };
class B_Bag_weapon_M2_low { quality = 3; price = 150; };
class B_Bag_weapon_Mortar_Portable { quality = 3; price = 150; };
class B_Bag_weapon_SPG9 { quality = 3; price = 150; };
class B_Bergen_blk { quality = 3; price = 150; };
class B_Bergen_dgtl_F { quality = 3; price = 150; };
class B_Bergen_hex_F { quality = 3; price = 150; };
class B_Bergen_mcamo { quality = 3; price = 150; };
class B_Bergen_mcamo_F { quality = 3; price = 150; };
class B_Bergen_rgr { quality = 3; price = 150; };
class B_Bergen_sgg { quality = 3; price = 150; };
class B_Bergen_tna_F { quality = 3; price = 150; };
class B_BergenC_blu { quality = 3; price = 150; };
class B_BergenC_grn { quality = 3; price = 150; };
class B_BergenC_red { quality = 3; price = 150; };
class B_BergenG { quality = 3; price = 150; };
class B_BergenG_TEST_B_Soldier_overloaded { quality = 3; price = 150; };
class B_Carryall_A { quality = 3; price = 150; };
class B_Carryall_B { quality = 3; price = 150; };
class B_Carryall_C { quality = 3; price = 150; };
class B_Carryall_cbr { quality = 3; price = 150; };
class B_Carryall_cbr_AAT { quality = 3; price = 150; };
class B_Carryall_cbr_AHAT { quality = 3; price = 150; };
class B_Carryall_eaf_eng_F { quality = 3; price = 150; };
class B_Carryall_eaf_exp_F { quality = 3; price = 150; };
class B_Carryall_eaf_F { quality = 3; price = 150; };
class B_Carryall_eaf_IEAAA_F { quality = 3; price = 150; };
class B_Carryall_eaf_IEAAR_F { quality = 3; price = 150; };
class B_Carryall_eaf_IEAAT_F { quality = 3; price = 150; };
class B_Carryall_eaf_IEAmmo_F { quality = 3; price = 150; };
class B_Carryall_eaf_Mine_F { quality = 3; price = 150; };
class B_Carryall_ghex_F { quality = 3; price = 150; };
class B_Carryall_ghex_Mine { quality = 3; price = 150; };
class B_Carryall_ghex_OTAAA_F { quality = 3; price = 150; };
class B_Carryall_ghex_OTAAR_AAR_F { quality = 3; price = 150; };
class B_Carryall_ghex_OTAAT_F { quality = 3; price = 150; };
class B_Carryall_ghex_OTAHAT_F { quality = 3; price = 150; };
class B_Carryall_ghex_OTAmmo_F { quality = 3; price = 150; };
class B_Carryall_ghex_OTEng_F { quality = 3; price = 150; };
class B_Carryall_ghex_OTExp_F { quality = 3; price = 150; };
class B_Carryall_ghex_OTReconExp_F { quality = 3; price = 150; };
class B_Carryall_green_exp_F { quality = 3; price = 150; };
class B_Carryall_green_F { quality = 3; price = 150; };
class B_Carryall_khk { quality = 3; price = 150; };
class B_Carryall_khk_Mine { quality = 3; price = 150; };
class B_Carryall_mcamo { quality = 3; price = 150; };
class B_Carryall_mcamo_AAA { quality = 3; price = 150; };
class B_Carryall_mcamo_AAT { quality = 3; price = 150; };
class B_Carryall_ocamo { quality = 3; price = 150; };
class B_Carryall_ocamo_AAA { quality = 3; price = 150; };
class B_Carryall_ocamo_AAR { quality = 3; price = 150; };
class B_Carryall_ocamo_Eng { quality = 3; price = 150; };
class B_Carryall_ocamo_Exp { quality = 3; price = 150; };
class B_Carryall_ocamo_Mine { quality = 3; price = 150; };
class B_Carryall_oli { quality = 3; price = 150; };
class B_Carryall_oli_BTAAA_F { quality = 3; price = 150; };
class B_Carryall_oli_BTAAT_F { quality = 3; price = 150; };
class B_Carryall_oli_BTAmmo_F { quality = 3; price = 150; };
class B_Carryall_oli_IEAAR_F { quality = 3; price = 150; };
class B_Carryall_oli_IEAmmo_F { quality = 3; price = 150; };
class B_Carryall_oli_LAT { quality = 3; price = 150; };
class B_Carryall_oli_Mine { quality = 3; price = 150; };
class B_Carryall_oucamo { quality = 3; price = 150; };
class B_Carryall_oucamo_AAA { quality = 3; price = 150; };
class B_Carryall_oucamo_AAR { quality = 3; price = 150; };
class B_Carryall_oucamo_AAT { quality = 3; price = 150; };
class B_Carryall_oucamo_Eng { quality = 3; price = 150; };
class B_Carryall_oucamo_Exp { quality = 3; price = 150; };
class B_Carryall_oucamo_Repair { quality = 3; price = 150; };
class B_Carryall_taiga_Exp_F { quality = 3; price = 150; };
class B_Carryall_taiga_F { quality = 3; price = 150; };
class B_Carryall_wdl_BWAAA_F { quality = 3; price = 150; };
class B_Carryall_wdl_BWAAT_F { quality = 3; price = 150; };
class B_Carryall_wdl_BWAmmo_F { quality = 3; price = 150; };
class B_Carryall_wdl_F { quality = 3; price = 150; };
class B_Carryall_wdl_Mine { quality = 3; price = 150; };
class B_CombinationUnitRespirator_01_F { quality = 3; price = 150; };
class B_FieldPack_A { quality = 3; price = 150; };
class B_FieldPack_B { quality = 3; price = 150; };
class B_FieldPack_blk { quality = 3; price = 150; };
class B_FieldPack_blk_Bandit_8_F { quality = 3; price = 150; };
class B_FieldPack_blk_DiverExp { quality = 3; price = 150; };
class B_FieldPack_cb_Bandit_3_F { quality = 3; price = 150; };
class B_FieldPack_cbr { quality = 3; price = 150; };
class B_FieldPack_cbr_AA { quality = 3; price = 150; };
class B_FieldPack_cbr_AAA { quality = 3; price = 150; };
class B_FieldPack_cbr_AAT { quality = 3; price = 150; };
class B_FieldPack_cbr_Ammo { quality = 3; price = 150; };
class B_FieldPack_cbr_Ammo_F { quality = 3; price = 150; };
class B_FieldPack_cbr_AT { quality = 3; price = 150; };
class B_FieldPack_cbr_HAT { quality = 3; price = 150; };
class B_FieldPack_cbr_LAT { quality = 3; price = 150; };
class B_FieldPack_cbr_Medic { quality = 3; price = 150; };
class B_FieldPack_cbr_ReconExp { quality = 3; price = 150; };
class B_FieldPack_cbr_ReconLAT { quality = 3; price = 150; };
class B_FieldPack_cbr_Repair { quality = 3; price = 150; };
class B_FieldPack_cbr_RPG_AT { quality = 3; price = 150; };
class B_FieldPack_ghex_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTAA_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTAT_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTHAT_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTLAT_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTMedic_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTReconMedic_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTRepair_F { quality = 3; price = 150; };
class B_FieldPack_ghex_OTRPG_AT_F { quality = 3; price = 150; };
class B_FieldPack_green_Exp_F { quality = 3; price = 150; };
class B_FieldPack_green_F { quality = 3; price = 150; };
class B_Fieldpack_green_IEAA_F { quality = 3; price = 150; };
class B_Fieldpack_green_IEAT_F { quality = 3; price = 150; };
class B_Fieldpack_green_IELAT2_F { quality = 3; price = 150; };
class B_Fieldpack_green_IELAT_F { quality = 3; price = 150; };
class B_Fieldpack_green_IEMedic_F { quality = 3; price = 150; };
class B_FieldPack_green_Medic_F { quality = 3; price = 150; };
class B_FieldPack_green_RPG_AT_F { quality = 3; price = 150; };
class B_FieldPack_khk { quality = 3; price = 150; };
class B_FieldPack_khk_Bandit_1_F { quality = 3; price = 150; };
class B_FieldPack_ocamo { quality = 3; price = 150; };
class B_FieldPack_ocamo_AA { quality = 3; price = 150; };
class B_FieldPack_ocamo_AAR { quality = 3; price = 150; };
class B_FieldPack_ocamo_LAT_F { quality = 3; price = 150; };
class B_FieldPack_ocamo_Medic { quality = 3; price = 150; };
class B_FieldPack_ocamo_ReconExp { quality = 3; price = 150; };
class B_FieldPack_ocamo_ReconMedic { quality = 3; price = 150; };
class B_FieldPack_oli { quality = 3; price = 150; };
class B_Fieldpack_oli_IEAA_F { quality = 3; price = 150; };
class B_Fieldpack_oli_IEAT_F { quality = 3; price = 150; };
class B_Fieldpack_oli_IELAT2_F { quality = 3; price = 150; };
class B_Fieldpack_oli_IELAT_F { quality = 3; price = 150; };
class B_FieldPack_oucamo { quality = 3; price = 150; };
class B_FieldPack_oucamo_AA { quality = 3; price = 150; };
class B_FieldPack_oucamo_AAR { quality = 3; price = 150; };
class B_FieldPack_oucamo_Ammo { quality = 3; price = 150; };
class B_FieldPack_oucamo_AT { quality = 3; price = 150; };
class B_FieldPack_oucamo_LAT { quality = 3; price = 150; };
class B_FieldPack_oucamo_Medic { quality = 3; price = 150; };
class B_FieldPack_oucamo_Repair { quality = 3; price = 150; };
class B_FieldPack_taiga_F { quality = 3; price = 150; };
class B_FieldPack_taiga_Medic_F { quality = 3; price = 150; };
class B_FieldPack_taiga_RPG_AT_F { quality = 3; price = 150; };
class B_G_HMG_02_high_weapon_F { quality = 3; price = 150; };
class B_G_HMG_02_support_F { quality = 3; price = 150; };
class B_G_HMG_02_support_high_F { quality = 3; price = 150; };
class B_G_HMG_02_weapon_F { quality = 3; price = 150; };
class B_GiantBag_A { quality = 3; price = 150; };
class B_GiantBag_B { quality = 3; price = 150; };
class B_GiantBag_C { quality = 3; price = 150; };
class B_GiantBag_D { quality = 3; price = 150; };
class B_GiantBag_E { quality = 3; price = 150; };
class B_GiantBag_F { quality = 3; price = 150; };
class B_GMG_01_A_weapon_F { quality = 3; price = 150; };
class B_GMG_01_high_weapon_F { quality = 3; price = 150; };
class B_GMG_01_weapon_F { quality = 3; price = 150; };
class B_GMG_01_Weapon_grn_F { quality = 3; price = 150; };
class B_HikingBag_A { quality = 3; price = 150; };
class B_HikingBag_B { quality = 3; price = 150; };
class B_HikingBag_C { quality = 3; price = 150; };
class B_HikingBag_D { quality = 3; price = 150; };
class B_HikingBag_E { quality = 3; price = 150; };
class B_HikingBag_F { quality = 3; price = 150; };
class B_HMG_01_A_weapon_F { quality = 3; price = 150; };
class B_HMG_01_high_weapon_F { quality = 3; price = 150; };
class B_HMG_01_support_F { quality = 3; price = 150; };
class B_HMG_01_support_grn_F { quality = 3; price = 150; };
class B_HMG_01_support_high_F { quality = 3; price = 150; };
class B_HMG_01_weapon_F { quality = 3; price = 150; };
class B_HMG_01_Weapon_grn_F { quality = 3; price = 150; };
class B_HMG_02_high_weapon_F { quality = 3; price = 150; };
class B_HMG_02_support_F { quality = 3; price = 150; };
class B_HMG_02_support_high_F { quality = 3; price = 150; };
class B_HMG_02_weapon_F { quality = 3; price = 150; };
class B_HuntingBackpack { quality = 3; price = 150; };
class B_I_Parachute_02_F { quality = 3; price = 150; };
class B_Kitbag_A { quality = 3; price = 150; };
class B_Kitbag_A_Repair { quality = 3; price = 150; };
class B_Kitbag_B { quality = 3; price = 150; };
class B_Kitbag_C { quality = 3; price = 150; };
class B_Kitbag_cbr { quality = 3; price = 150; };
class B_Kitbag_cbr_Bandit_2_F { quality = 3; price = 150; };
class B_Kitbag_cbr_Para_5_F { quality = 3; price = 150; };
class B_Kitbag_D { quality = 3; price = 150; };
class B_Kitbag_E { quality = 3; price = 150; };
class B_Kitbag_mcamo { quality = 3; price = 150; };
class B_Kitbag_mcamo_Eng { quality = 3; price = 150; };
class B_Kitbag_rgr { quality = 3; price = 150; };
class B_Kitbag_rgr_AAR { quality = 3; price = 150; };
class B_Kitbag_rgr_BTAA_F { quality = 3; price = 150; };
class B_Kitbag_rgr_BTAT_F { quality = 3; price = 150; };
class B_Kitbag_rgr_BTEng_F { quality = 3; price = 150; };
class B_Kitbag_rgr_BTExp_F { quality = 3; price = 150; };
class B_Kitbag_rgr_BTReconExp_F { quality = 3; price = 150; };
class B_Kitbag_rgr_BWAAR { quality = 3; price = 150; };
class B_Kitbag_rgr_CTRGExp_F { quality = 3; price = 150; };
class B_Kitbag_rgr_Exp { quality = 3; price = 150; };
class B_Kitbag_rgr_Mine { quality = 3; price = 150; };
class B_Kitbag_rgr_Para_3_F { quality = 3; price = 150; };
class B_Kitbag_rgr_Para_8_F { quality = 3; price = 150; };
class B_Kitbag_sgg { quality = 3; price = 150; };
class B_Kitbag_tan { quality = 3; price = 150; };
class B_LegStrapBag_black_F { quality = 3; price = 150; };
class B_LegStrapBag_black_repair_F { quality = 3; price = 150; };
class B_LegStrapBag_coyote_F { quality = 3; price = 150; };
class B_LegStrapBag_coyote_repair_F { quality = 3; price = 150; };
class B_LegStrapBag_olive_F { quality = 3; price = 150; };
class B_LegStrapBag_olive_repair_F { quality = 3; price = 150; };
class B_Messenger_Black_F { quality = 3; price = 150; };
class B_Messenger_Coyote_F { quality = 3; price = 150; };
class B_Messenger_Gray_F { quality = 3; price = 150; };
class B_Messenger_Gray_Medical_F { quality = 3; price = 150; };
class B_Messenger_IDAP_F { quality = 3; price = 150; };
class B_Messenger_IDAP_Medical_F { quality = 3; price = 150; };
class B_Messenger_IDAP_TrainingMines_F { quality = 3; price = 150; };
class B_Messenger_Olive_F { quality = 3; price = 150; };
class B_Mortar_01_support_F { quality = 3; price = 150; };
class B_Mortar_01_support_grn_F { quality = 3; price = 150; };
class B_Mortar_01_weapon_F { quality = 3; price = 150; };
class B_Mortar_01_Weapon_grn_F { quality = 3; price = 150; };
class B_O_Parachute_02_F { quality = 3; price = 150; };
class B_OutdoorPack_blk { quality = 3; price = 150; };
class B_OutdoorPack_blu { quality = 3; price = 150; };
class B_OutdoorPack_tan { quality = 3; price = 150; };
class B_Parachute { quality = 3; price = 150; };
class B_Patrol_Carryall_green_Ammo_F { quality = 3; price = 150; };
class B_Patrol_Carryall_taiga_medic_F { quality = 3; price = 150; };
class B_Patrol_FieldPack_green_eng_F { quality = 3; price = 150; };
class B_Patrol_Launcher_bag_F { quality = 3; price = 150; };
class B_Patrol_Leader_bag_F { quality = 3; price = 150; };
class B_Patrol_Medic_bag_F { quality = 3; price = 150; };
class B_Patrol_Respawn_bag_F { quality = 3; price = 150; };
class B_Patrol_Supply_bag_F { quality = 3; price = 150; };
class B_RadioBag_01_black_F { quality = 3; price = 150; };
class B_RadioBag_01_digi_F { quality = 3; price = 150; };
class B_RadioBag_01_eaf_F { quality = 3; price = 150; };
class B_RadioBag_01_eaf_FAK_F { quality = 3; price = 150; };
class B_RadioBag_01_ghex_F { quality = 3; price = 150; };
class B_RadioBag_01_hex_F { quality = 3; price = 150; };
class B_RadioBag_01_mtp_F { quality = 3; price = 150; };
class B_RadioBag_01_oucamo_F { quality = 3; price = 150; };
class B_RadioBag_01_tropic_F { quality = 3; price = 150; };
class B_RadioBag_01_wdl_F { quality = 3; price = 150; };
class B_RadioBag_01_wdl_FAK_F { quality = 3; price = 150; };
class B_RadioBag_A { quality = 3; price = 150; };
class B_Respawn_Sleeping_bag_blue_F { quality = 3; price = 150; };
class B_Respawn_Sleeping_bag_brown_F { quality = 3; price = 150; };
class B_Respawn_Sleeping_bag_F { quality = 3; price = 150; };
class B_Respawn_TentA_F { quality = 3; price = 150; };
class B_Respawn_TentDome_F { quality = 3; price = 150; };
class B_RPGBag_A { quality = 3; price = 150; };
class B_RucksackBag_A { quality = 3; price = 150; };
class B_RucksackBag_A_Exp { quality = 3; price = 150; };
class B_RucksackBag_A_Medic { quality = 3; price = 150; };
class B_RucksackBag_A_Repair { quality = 3; price = 150; };
class B_RucksackBag_B { quality = 3; price = 150; };
class B_RucksackBag_C { quality = 3; price = 150; };
class B_RucksackBag_D { quality = 3; price = 150; };
class B_SCBA_01_F { quality = 3; price = 150; };
class B_Static_Designator_01_weapon_F { quality = 3; price = 150; };
class B_TacticalPack_A { quality = 3; price = 150; };
class B_TacticalPack_B { quality = 3; price = 150; };
class B_TacticalPack_blk { quality = 3; price = 150; };
class B_TacticalPack_C { quality = 3; price = 150; };
class B_TacticalPack_mcamo { quality = 3; price = 150; };
class B_TacticalPack_ocamo { quality = 3; price = 150; };
class B_TacticalPack_ocamo_AA_F { quality = 3; price = 150; };
class B_TacticalPack_ocamo_AT_F { quality = 3; price = 150; };
class B_TacticalPack_oli { quality = 3; price = 150; };
class B_TacticalPack_oli_AAR { quality = 3; price = 150; };
class B_TacticalPack_rgr { quality = 3; price = 150; };
class B_UAV_01_backpack_F { quality = 3; price = 150; };
class B_UAV_06_backpack_F { quality = 3; price = 150; };
class B_UAV_06_medical_backpack_F { quality = 3; price = 150; };
class B_UGV_02_Demining_backpack_F { quality = 3; price = 150; };
class B_UGV_02_Science_backpack_F { quality = 3; price = 150; };
class B_ViperHarness_blk_F { quality = 3; price = 150; };
class B_ViperHarness_ghex_Exp_F { quality = 3; price = 150; };
class B_ViperHarness_ghex_F { quality = 3; price = 150; };
class B_ViperHarness_ghex_JTAC_F { quality = 3; price = 150; };
class B_ViperHarness_ghex_LAT_F { quality = 3; price = 150; };
class B_ViperHarness_ghex_M_F { quality = 3; price = 150; };
class B_ViperHarness_ghex_Medic_F { quality = 3; price = 150; };
class B_ViperHarness_ghex_TL_F { quality = 3; price = 150; };
class B_ViperHarness_hex_Exp_F { quality = 3; price = 150; };
class B_ViperHarness_hex_F { quality = 3; price = 150; };
class B_ViperHarness_hex_JTAC_F { quality = 3; price = 150; };
class B_ViperHarness_hex_LAT_F { quality = 3; price = 150; };
class B_ViperHarness_hex_M_F { quality = 3; price = 150; };
class B_ViperHarness_hex_Medic_F { quality = 3; price = 150; };
class B_ViperHarness_hex_TL_F { quality = 3; price = 150; };
class B_ViperHarness_khk_F { quality = 3; price = 150; };
class B_ViperHarness_oli_F { quality = 3; price = 150; };
class B_ViperLightHarness_blk_F { quality = 3; price = 150; };
class B_ViperLightHarness_ghex_F { quality = 3; price = 150; };
class B_ViperLightHarness_hex_F { quality = 3; price = 150; };
class B_ViperLightHarness_khk_F { quality = 3; price = 150; };
class B_ViperLightHarness_oli_F { quality = 3; price = 150; };
class B_W_Static_Designator_01_weapon_F { quality = 3; price = 150; };
class C_Bergen_blu { quality = 3; price = 150; };
class C_Bergen_grn { quality = 3; price = 150; };
class C_Bergen_red { quality = 3; price = 150; };
class C_IDAP_UAV_01_backpack_F { quality = 3; price = 150; };
class C_IDAP_UAV_06_antimine_backpack_F { quality = 3; price = 150; };
class C_IDAP_UAV_06_backpack_F { quality = 3; price = 150; };
class C_IDAP_UAV_06_medical_backpack_F { quality = 3; price = 150; };
class C_IDAP_UGV_02_Demining_backpack_F { quality = 3; price = 150; };
class C_UAV_06_backpack_F { quality = 3; price = 150; };
class C_UAV_06_medical_backpack_F { quality = 3; price = 150; };
class G_AssaultPack { quality = 3; price = 150; };
class G_Bergen { quality = 3; price = 150; };
class G_Carryall_Ammo { quality = 3; price = 150; };
class G_Carryall_Exp { quality = 3; price = 150; };
class G_FieldPack_LAT { quality = 3; price = 150; };
class G_FieldPack_LAT2 { quality = 3; price = 150; };
class G_FieldPack_Medic { quality = 3; price = 150; };
class G_TacticalPack_Eng { quality = 3; price = 150; };
class I_AA_01_weapon_F { quality = 3; price = 150; };
class I_Assault_Diver { quality = 3; price = 150; };
class I_AT_01_weapon_F { quality = 3; price = 150; };
class I_C_HMG_02_high_weapon_F { quality = 3; price = 150; };
class I_C_HMG_02_support_F { quality = 3; price = 150; };
class I_C_HMG_02_support_high_F { quality = 3; price = 150; };
class I_C_HMG_02_weapon_F { quality = 3; price = 150; };
class I_Carryall_oli_AAA { quality = 3; price = 150; };
class I_Carryall_oli_AAT { quality = 3; price = 150; };
class I_Carryall_oli_Eng { quality = 3; price = 150; };
class I_Carryall_oli_Exp { quality = 3; price = 150; };
class I_E_AA_01_weapon_F { quality = 3; price = 150; };
class I_E_AT_01_weapon_F { quality = 3; price = 150; };
class I_E_GMG_01_A_Weapon_F { quality = 3; price = 150; };
class I_E_GMG_01_high_Weapon_F { quality = 3; price = 150; };
class I_E_GMG_01_Weapon_F { quality = 3; price = 150; };
class I_E_HMG_01_A_Weapon_F { quality = 3; price = 150; };
class I_E_HMG_01_high_Weapon_F { quality = 3; price = 150; };
class I_E_HMG_01_support_F { quality = 3; price = 150; };
class I_E_HMG_01_support_high_F { quality = 3; price = 150; };
class I_E_HMG_01_Weapon_F { quality = 3; price = 150; };
class I_E_HMG_02_high_weapon_F { quality = 3; price = 150; };
class I_E_HMG_02_support_F { quality = 3; price = 150; };
class I_E_HMG_02_support_high_F { quality = 3; price = 150; };
class I_E_HMG_02_weapon_F { quality = 3; price = 150; };
class I_E_Mortar_01_support_F { quality = 3; price = 150; };
class I_E_Mortar_01_Weapon_F { quality = 3; price = 150; };
class I_E_UAV_01_backpack_F { quality = 3; price = 150; };
class I_E_UAV_06_backpack_F { quality = 3; price = 150; };
class I_E_UAV_06_medical_backpack_F { quality = 3; price = 150; };
class I_E_UGV_02_Demining_backpack_F { quality = 3; price = 150; };
class I_E_UGV_02_Science_backpack_F { quality = 3; price = 150; };
class I_Fieldpack_oli_AA { quality = 3; price = 150; };
class I_Fieldpack_oli_AAR { quality = 3; price = 150; };
class I_Fieldpack_oli_Ammo { quality = 3; price = 150; };
class I_Fieldpack_oli_AT { quality = 3; price = 150; };
class I_Fieldpack_oli_LAT { quality = 3; price = 150; };
class I_Fieldpack_oli_LAT2 { quality = 3; price = 150; };
class I_Fieldpack_oli_Medic { quality = 3; price = 150; };
class I_Fieldpack_oli_Repair { quality = 3; price = 150; };
class I_G_HMG_02_high_weapon_F { quality = 3; price = 150; };
class I_G_HMG_02_support_F { quality = 3; price = 150; };
class I_G_HMG_02_support_high_F { quality = 3; price = 150; };
class I_G_HMG_02_weapon_F { quality = 3; price = 150; };
class I_GMG_01_A_weapon_F { quality = 3; price = 150; };
class I_GMG_01_high_weapon_F { quality = 3; price = 150; };
class I_GMG_01_weapon_F { quality = 3; price = 150; };
class I_HMG_01_A_weapon_F { quality = 3; price = 150; };
class I_HMG_01_high_weapon_F { quality = 3; price = 150; };
class I_HMG_01_support_F { quality = 3; price = 150; };
class I_HMG_01_support_high_F { quality = 3; price = 150; };
class I_HMG_01_weapon_F { quality = 3; price = 150; };
class I_HMG_02_high_weapon_F { quality = 3; price = 150; };
class I_HMG_02_support_F { quality = 3; price = 150; };
class I_HMG_02_support_high_F { quality = 3; price = 150; };
class I_HMG_02_weapon_F { quality = 3; price = 150; };
class I_Mortar_01_support_F { quality = 3; price = 150; };
class I_Mortar_01_weapon_F { quality = 3; price = 150; };
class I_UAV_01_backpack_F { quality = 3; price = 150; };
class I_UAV_06_backpack_F { quality = 3; price = 150; };
class I_UAV_06_medical_backpack_F { quality = 3; price = 150; };
class I_UGV_02_Demining_backpack_F { quality = 3; price = 150; };
class I_UGV_02_Science_backpack_F { quality = 3; price = 150; };
class O_AA_01_weapon_F { quality = 3; price = 150; };
class O_Assault_Diver { quality = 3; price = 150; };
class O_AT_01_weapon_F { quality = 3; price = 150; };
class O_G_HMG_02_high_weapon_F { quality = 3; price = 150; };
class O_G_HMG_02_support_F { quality = 3; price = 150; };
class O_G_HMG_02_support_high_F { quality = 3; price = 150; };
class O_G_HMG_02_weapon_F { quality = 3; price = 150; };
class O_GMG_01_A_weapon_F { quality = 3; price = 150; };
class O_GMG_01_high_weapon_F { quality = 3; price = 150; };
class O_GMG_01_weapon_F { quality = 3; price = 150; };
class O_HMG_01_A_weapon_F { quality = 3; price = 150; };
class O_HMG_01_high_weapon_F { quality = 3; price = 150; };
class O_HMG_01_support_F { quality = 3; price = 150; };
class O_HMG_01_support_high_F { quality = 3; price = 150; };
class O_HMG_01_weapon_F { quality = 3; price = 150; };
class O_HMG_02_high_weapon_F { quality = 3; price = 150; };
class O_HMG_02_support_F { quality = 3; price = 150; };
class O_HMG_02_support_high_F { quality = 3; price = 150; };
class O_HMG_02_weapon_F { quality = 3; price = 150; };
class O_Mortar_01_support_F { quality = 3; price = 150; };
class O_Mortar_01_weapon_F { quality = 3; price = 150; };
class O_Static_Designator_02_weapon_F { quality = 3; price = 150; };
class O_UAV_01_backpack_F { quality = 3; price = 150; };
class O_UAV_06_backpack_F { quality = 3; price = 150; };
class O_UAV_06_medical_backpack_F { quality = 3; price = 150; };
class O_UGV_02_Demining_backpack_F { quality = 3; price = 150; };
class O_UGV_02_Science_backpack_F { quality = 3; price = 150; };


// Glasses 

class COREV_G_Beard_A { quality = 3; price = 150; };
class COREV_G_Beard_Azz { quality = 3; price = 150; };
class COREV_G_Beard_B { quality = 3; price = 150; };
class COREV_G_Beard_Baddazz { quality = 3; price = 150; };
class COREV_G_Beard_C { quality = 3; price = 150; };
class COREV_G_Beard_D { quality = 3; price = 150; };
class COREV_G_Halo_Ring { quality = 3; price = 150; };
class COREV_G_Headphone { quality = 3; price = 150; };
class COREV_G_None { quality = 3; price = 150; };
class COREV_G_Reading_A { quality = 3; price = 150; };
class COREV_G_Wig_A { quality = 3; price = 150; };
class COREV_G_Wig_Az { quality = 3; price = 150; };
class COREV_G_Wig_Ba { quality = 3; price = 150; };
class COREV_G_Wig_Bb { quality = 3; price = 150; };
class COREV_G_Wig_Bc { quality = 3; price = 150; };
class G_AirPurifyingRespirator_01_F { quality = 3; price = 150; };
class G_AirPurifyingRespirator_01_nofilter_F { quality = 3; price = 150; };
class G_AirPurifyingRespirator_02_black_F { quality = 3; price = 150; };
class G_AirPurifyingRespirator_02_black_nofilter_F { quality = 3; price = 150; };
class G_AirPurifyingRespirator_02_olive_F { quality = 3; price = 150; };
class G_AirPurifyingRespirator_02_olive_nofilter_F { quality = 3; price = 150; };
class G_AirPurifyingRespirator_02_sand_F { quality = 3; price = 150; };
class G_AirPurifyingRespirator_02_sand_nofilter_F { quality = 3; price = 150; };
class G_Aviator { quality = 3; price = 150; };
class G_B_Diving { quality = 3; price = 150; };
class G_Balaclava_blk { quality = 3; price = 150; };
class G_Balaclava_combat { quality = 3; price = 150; };
class G_Balaclava_lowprofile { quality = 3; price = 150; };
class G_Balaclava_oli { quality = 3; price = 150; };
class G_Balaclava_TI_blk_F { quality = 3; price = 150; };
class G_Balaclava_TI_G_blk_F { quality = 3; price = 150; };
class G_Balaclava_TI_G_tna_F { quality = 3; price = 150; };
class G_Balaclava_TI_tna_F { quality = 3; price = 150; };
class G_Bandanna_aviator { quality = 3; price = 150; };
class G_Bandanna_beast { quality = 3; price = 150; };
class G_Bandanna_blk { quality = 3; price = 150; };
class G_Bandanna_khk { quality = 3; price = 150; };
class G_Bandanna_oli { quality = 3; price = 150; };
class G_Bandanna_shades { quality = 3; price = 150; };
class G_Bandanna_sport { quality = 3; price = 150; };
class G_Bandanna_tan { quality = 3; price = 150; };
class G_Blindfold_01_black_F { quality = 3; price = 150; };
class G_Blindfold_01_white_F { quality = 3; price = 150; };
class G_Combat { quality = 3; price = 150; };
class G_Combat_Goggles_tna_F { quality = 3; price = 150; };
class G_Diving { quality = 3; price = 150; };
class G_EyeProtectors_Earpiece_F { quality = 3; price = 150; };
class G_EyeProtectors_F { quality = 3; price = 150; };
class G_Goggles_VR { quality = 3; price = 150; };
class G_I_Diving { quality = 3; price = 150; };
class G_Lady_Blue { quality = 3; price = 150; };
class G_Lady_Dark { quality = 3; price = 150; };
class G_Lady_Mirror { quality = 3; price = 150; };
class G_Lady_Red { quality = 3; price = 150; };
class G_Lowprofile { quality = 3; price = 150; };
class G_O_Diving { quality = 3; price = 150; };
class G_RegulatorMask_F { quality = 3; price = 150; };
class G_Respirator_blue_F { quality = 3; price = 150; };
class G_Respirator_white_F { quality = 3; price = 150; };
class G_Respirator_yellow_F { quality = 3; price = 150; };
class G_Shades_Black { quality = 3; price = 150; };
class G_Shades_Blue { quality = 3; price = 150; };
class G_Shades_Green { quality = 3; price = 150; };
class G_Shades_Red { quality = 3; price = 150; };
class G_Spectacles { quality = 3; price = 150; };
class G_Spectacles_Tinted { quality = 3; price = 150; };
class G_Sport_Blackred { quality = 3; price = 150; };
class G_Sport_BlackWhite { quality = 3; price = 150; };
class G_Sport_Blackyellow { quality = 3; price = 150; };
class G_Sport_Checkered { quality = 3; price = 150; };
class G_Sport_Greenblack { quality = 3; price = 150; };
class G_Sport_Red { quality = 3; price = 150; };
class G_Squares { quality = 3; price = 150; };
class G_Squares_Tinted { quality = 3; price = 150; };
class G_Tactical_Black { quality = 3; price = 150; };
class G_Tactical_Clear { quality = 3; price = 150; };
class G_WirelessEarpiece_F { quality = 3; price = 150; };
class None { quality = 3; price = 150; };

// Uniforms 

5, U_AFAOfficerUni_A 
5, U_AFASoldierUni_A 
5, U_AFASpecialUni_A 
5, U_AntigonaBody 
5, U_AttisBody 
5, U_B_CBRN_Suit_01_MTP_F 
5, U_B_CBRN_Suit_01_Tropic_F 
5, U_B_CBRN_Suit_01_Wdl_F 
5, U_B_CombatUniform_mcam 
5, U_B_CombatUniform_mcam_tshirt 
5, U_B_CombatUniform_mcam_vest 
5, U_B_CombatUniform_mcam_wdl_f 
5, U_B_CombatUniform_mcam_worn 
5, U_B_CombatUniform_sgg 
5, U_B_CombatUniform_sgg_tshirt 
5, U_B_CombatUniform_sgg_vest 
5, U_B_CombatUniform_tshirt_mcam_wdL_f 
5, U_B_CombatUniform_vest_mcam_wdl_f 
5, U_B_CombatUniform_wdl 
5, U_B_CombatUniform_wdl_tshirt 
5, U_B_CombatUniform_wdl_vest 
5, U_B_CTRG_1 
5, U_B_CTRG_2 
5, U_B_CTRG_3 
5, U_B_CTRG_Soldier_2_F 
5, U_B_CTRG_Soldier_3_F 
5, U_B_CTRG_Soldier_F 
5, U_B_CTRG_Soldier_urb_1_F 
5, U_B_CTRG_Soldier_urb_2_F 
5, U_B_CTRG_Soldier_urb_3_F 
5, U_B_FullGhillie_ard 
5, U_B_FullGhillie_lsh 
5, U_B_FullGhillie_sard 
5, U_B_G_Captain_Ivan_F 
5, U_B_GEN_Commander_F 
5, U_B_GEN_Soldier_F 
5, U_B_GhillieSuit 
5, U_B_HeliPilotCoveralls 
5, U_B_PilotCoveralls 
5, U_B_Protagonist_VR 
5, U_B_Soldier_VR 
5, U_B_SpecopsUniform_sgg 
5, U_B_survival_uniform 
5, U_B_T_FullGhillie_tna_F 
5, U_B_T_Sniper_F 
5, U_B_T_Soldier_AR_F 
5, U_B_T_Soldier_F 
5, U_B_T_Soldier_SL_F 
5, U_B_Wetsuit 
5, U_BasicBody 
5, U_BG_Guerilla1_1 
5, U_BG_Guerilla1_2_F 
5, U_BG_Guerilla2_1 
5, U_BG_Guerilla2_2 
5, U_BG_Guerilla2_3 
5, U_BG_Guerilla3_1 
5, U_BG_Guerilla3_2 
5, U_BG_Guerrilla_6_1 
5, U_BG_leader 
5, U_C_CBRN_Suit_01_Blue_F 
5, U_C_CBRN_Suit_01_White_F 
5, U_C_Commoner1_1 
5, U_C_Commoner1_2 
5, U_C_Commoner1_3 
5, U_C_Commoner2_1 
5, U_C_Commoner2_2 
5, U_C_Commoner2_3 
5, U_C_Commoner_shorts 
5, U_C_ConstructionCoverall_Black_F 
5, U_C_ConstructionCoverall_Blue_F 
5, U_C_ConstructionCoverall_Red_F 
5, U_C_ConstructionCoverall_Vrana_F 
5, U_C_Driver_1 
5, U_C_Driver_1_black 
5, U_C_Driver_1_blue 
5, U_C_Driver_1_green 
5, U_C_Driver_1_orange 
5, U_C_Driver_1_red 
5, U_C_Driver_1_white 
5, U_C_Driver_1_yellow 
5, U_C_Driver_2 
5, U_C_Driver_3 
5, U_C_Driver_4 
5, U_C_E_LooterJacket_01_F 
5, U_C_Farmer 
5, U_C_Fisherman 
5, U_C_FishermanOveralls 
5, U_C_HunterBody_brn 
5, U_C_HunterBody_grn 
5, U_C_IDAP_Man_cargo_F 
5, U_C_IDAP_Man_casual_F 
5, U_C_IDAP_Man_Jeans_F 
5, U_C_IDAP_Man_shorts_F 
5, U_C_IDAP_Man_Tee_F 
5, U_C_IDAP_Man_TeeShorts_F 
5, U_C_Journalist 
5, U_C_Man_casual_1_F 
5, U_C_Man_casual_1_sick_F 
5, U_C_Man_casual_2_F 
5, U_C_Man_casual_2_sick_F 
5, U_C_Man_casual_3_F 
5, U_C_Man_casual_3_sick_F 
5, U_C_Man_casual_4_F 
5, U_C_Man_casual_4_sick_F 
5, U_C_Man_casual_5_F 
5, U_C_Man_casual_5_sick_F 
5, U_C_Man_casual_6_F 
5, U_C_Man_casual_6_sick_F 
5, U_C_man_sport_1_F 
5, U_C_man_sport_2_F 
5, U_C_man_sport_2_sick_F 
5, U_C_man_sport_3_F 
5, U_C_Mechanic_01_F 
5, U_C_Novak 
5, U_C_Paramedic_01_F 
5, U_C_Poloshirt_blue 
5, U_C_Poloshirt_blue_sick 
5, U_C_Poloshirt_burgundy 
5, U_C_Poloshirt_burgundy_sick 
5, U_C_Poloshirt_redwhite 
5, U_C_Poloshirt_redwhite_sick 
5, U_C_Poloshirt_salmon 
5, U_C_Poloshirt_stripped 
5, U_C_Poloshirt_stripped_sick 
5, U_C_Poloshirt_tricolour 
5, U_C_Poor_1 
5, U_C_Poor_2 
5, U_C_Poor_2_sick 
5, U_C_Poor_shorts_1 
5, U_C_Poor_shorts_2 
5, U_C_PriestBody 
5, U_C_Protagonist_VR 
5, U_C_Scavenger_1 
5, U_C_Scavenger_2 
5, U_C_Scientist 
5, U_C_ShirtSurfer_shorts 
5, U_C_Soldier_VR 
5, U_C_TeeSurfer_shorts_1 
5, U_C_TeeSurfer_shorts_2 
5, U_C_Uniform_Farmer_01_F 
5, U_C_Uniform_Scientist_01_F 
5, U_C_Uniform_Scientist_01_formal_F 
5, U_C_Uniform_Scientist_02_F 
5, U_C_Uniform_Scientist_02_formal_F 
5, U_C_WorkerCoveralls 
5, U_C_WorkerOveralls 
5, U_Captive_A 
5, U_CDFOfficerUni_A 
5, U_CDFSoldierUni_A 
5, U_CDGCombatUni_A 
5, U_CDGCombatUni_B 
5, U_CDGCombatUni_C 
5, U_CDGCombatUni_D 
5, U_CivilianCoat_A 
5, U_CivilianCoat_B 
5, U_CivilianCoat_C 
5, U_CivilianCoat_D 
5, U_CivilianCoat_E 
5, U_CivilianCoat_F 
5, U_CivilianCroppedPants_A 
5, U_CivilianCroppedPants_B 
5, U_CivilianCroppedPants_C 
5, U_CivilianCroppedPants_D 
5, U_CivilianCroppedPants_E 
5, U_CivilianHunter_A 
5, U_CivilianHunter_B 
5, U_CivilianHunter_C 
5, U_CivilianHunter_D 
5, U_CivilianJerseyCasual_A 
5, U_CivilianJerseyCasual_B 
5, U_CivilianJerseyCasual_C 
5, U_CivilianJerseyCasual_D 
5, U_CivilianJerseyCasual_E 
5, U_CivilianJerseyCasual_F 
5, U_CivilianJerseyCasual_G 
5, U_CivilianMetro_A 
5, U_CivilianMetro_B 
5, U_CivilianMetro_C 
5, U_CivilianMetro_D 
5, U_CivilianOutdoor_A 
5, U_CivilianOutdoor_B 
5, U_CivilianOutdoor_C 
5, U_CivilianOutdoor_D 
5, U_CivilianPilot_A 
5, U_CivilianPolo_A 
5, U_CivilianPolo_B 
5, U_CivilianPolo_C 
5, U_CivilianPolo_D 
5, U_CivilianPolo_E 
5, U_CivilianPolo_F 
5, U_CivilianSport_A 
5, U_CivilianSport_B 
5, U_CivilianSport_C 
5, U_CivilianSport_D 
5, U_CivilianSuit_A 
5, U_CivilianSuit_B 
5, U_CivilianSuit_C 
5, U_CivilianSuit_D 
5, U_CivilianTankTop_A 
5, U_CivilianTankTop_B 
5, U_CivilianTankTop_C 
5, U_CivilianTankTop_D 
5, U_CivilianTankTop_E 
5, U_CivilianTShirt_A 
5, U_CivilianTShirt_B 
5, U_CivilianTShirt_C 
5, U_CivilianTShirt_D 
5, U_CivilianTShirt_E 
5, U_CivilianTShirt_F 
5, U_CivilianTShirt_G 
5, U_CivilianTShirtCasual_A 
5, U_CivilianTShirtCasual_B 
5, U_CivilianTShirtCasual_C 
5, U_CivilianTShirtCasual_D 
5, U_CivilianTShirtCasual_E 
5, U_CivilianTShirtCasual_F 
5, U_CivilianTShirtCasual_G 
5, U_CivilianTShirtCasual_H 
5, U_CivilianTShirtCasual_I 
5, U_CombatOutdoor_A 
5, U_CombatOutdoor_B 
5, U_CombatOutdoor_C 
5, U_CombatOutdoor_D 
5, U_CombatUniFatigue_A 
5, U_CombatUniLeadMerc_A 
5, U_CombatUniLeadMerc_B 
5, U_CombatUniLeadMerc_C 
5, U_CombatUniLeadMerc_D 
5, U_CombatUniLeadMerc_E 
5, U_CombatUniLeadMerc_F 
5, U_CombatUniLong_A 
5, U_CombatUniLong_B 
5, U_CombatUniShirt_A 
5, U_CombatUniShirt_B 
5, U_CombatUniShirt_C 
5, U_CombatUniShirt_D 
5, U_CombatUniShirt_E 
5, U_CombatUniShirt_F 
5, U_CombatUniShirtAlt_A 
5, U_CombatUniShirtAlt_B 
5, U_CombatUniShirtAlt_C 
5, U_CombatUniShirtAlt_D 
5, U_CombatUniShirtAlt_E 
5, U_CombatUniShirtAlt_F 
5, U_CombatUniShirtMercA_A 
5, U_CombatUniShirtMercA_B 
5, U_CombatUniShirtMercA_C 
5, U_CombatUniShirtMercA_D 
5, U_CombatUniShirtMercA_E 
5, U_CombatUniShirtMercA_F 
5, U_CombatUniShirtMercA_G 
5, U_CombatUniShirtMercB_A 
5, U_CombatUniShirtMercB_B 
5, U_CombatUniShirtMercB_C 
5, U_CombatUniShirtMercB_D 
5, U_CombatUniShirtMercB_E 
5, U_CombatUniShirtMercB_F 
5, U_CombatUniShirtMercB_G 
5, U_CombatUniShirtMercB_H 
5, U_CombatUniShirtMercB_I 
5, U_CombatUniShirtMercB_J 
5, U_CombatUniShirtMercC_A 
5, U_CombatUniShirtMercC_B 
5, U_CombatUniShirtMercC_C 
5, U_CombatUniShirtMercC_D 
5, U_CombatUniShirtMercD_A 
5, U_CombatUniShirtMercD_B 
5, U_CombatUniShirtMercD_C 
5, U_CombatUniShirtMercD_D 
5, U_CombatUniShirtMercD_E 
5, U_CombatUniShirtMercD_F 
5, U_CombatUniShirtMercD_G 
5, U_CombatUniSleeves_A 
5, U_CombatUniSleeves_B 
5, U_CombatUniSleeves_C 
5, U_CombatUniSleeves_D 
5, U_CombatUniSleeves_E 
5, U_CombatUniSleeves_F 
5, U_CombatUniSleevesShort_A 
5, U_CombatUniSleevesShort_B 
5, U_CombatUniSleevesShort_C 
5, U_CombatUniSleevesShort_D 
5, U_CombatUniSleevesShort_E 
5, U_CombatUniSleevesShort_F 
5, U_CombatUniTShirt_A 
5, U_CombatUniTShirt_B 
5, U_CombatUniTShirt_C 
5, U_CombatUniTShirt_D 
5, U_CombatUniTShirt_E 
5, U_CombatUniTShirt_F 
5, U_CombatUniVest_A 
5, U_Competitor 
5, U_Coveralls_A 
5, U_Coveralls_B 
5, U_Coveralls_C 
5, U_Coveralls_D 
5, U_DressTKLocalUni_A_A 
5, U_DressTKLocalUni_A_B 
5, U_DressTKLocalUni_A_C 
5, U_DressTKLocalUni_A_D 
5, U_DressTKLocalUni_A_E 
5, U_DressTKLocalUni_B_A 
5, U_DressTKLocalUni_B_B 
5, U_DressTKLocalUni_B_C 
5, U_DressTKLocalUni_B_D 
5, U_DressTKLocalUni_B_E 
5, U_DressTKLocalUni_C_A 
5, U_DressTKLocalUni_C_B 
5, U_DressTKLocalUni_C_C 
5, U_DressTKLocalUni_C_D 
5, U_DressTKLocalUni_C_E 
5, U_DressTKLocalUni_D_A 
5, U_DressTKLocalUni_D_B 
5, U_DressTKLocalUni_D_C 
5, U_DressTKLocalUni_D_D 
5, U_DressTKLocalUni_D_E 
5, U_DressTKLocalUni_E_A 
5, U_DressTKLocalUni_E_B 
5, U_DressTKLocalUni_E_C 
5, U_DressTKLocalUni_E_D 
5, U_DressTKLocalUni_E_E 
5, U_Hipster_A 
5, U_Hipster_B 
5, U_I_C_Soldier_Bandit_1_F 
5, U_I_C_Soldier_Bandit_2_F 
5, U_I_C_Soldier_Bandit_3_F 
5, U_I_C_Soldier_Bandit_4_F 
5, U_I_C_Soldier_Bandit_5_F 
5, U_I_C_Soldier_Camo_F 
5, U_I_C_Soldier_Para_1_F 
5, U_I_C_Soldier_Para_2_F 
5, U_I_C_Soldier_Para_3_F 
5, U_I_C_Soldier_Para_4_F 
5, U_I_C_Soldier_Para_5_F 
5, U_I_CBRN_Suit_01_AAF_F 
5, U_I_CombatUniform 
5, U_I_CombatUniform_shortsleeve 
5, U_I_CombatUniform_tshirt 
5, U_I_E_CBRN_Suit_01_EAF_F 
5, U_I_E_Uniform_01_coveralls_F 
5, U_I_E_Uniform_01_F 
5, U_I_E_Uniform_01_officer_F 
5, U_I_E_Uniform_01_shortsleeve_F 
5, U_I_E_Uniform_01_sweater_F 
5, U_I_E_Uniform_01_tanktop_F 
5, U_I_FullGhillie_ard 
5, U_I_FullGhillie_lsh 
5, U_I_FullGhillie_sard 
5, U_I_G_resistanceLeader_F 
5, U_I_G_Story_Protagonist_F 
5, U_I_GhillieSuit 
5, U_I_HeliPilotCoveralls 
5, U_I_L_Uniform_01_camo_F 
5, U_I_L_Uniform_01_deserter_F 
5, U_I_L_Uniform_01_tshirt_black_F 
5, U_I_L_Uniform_01_tshirt_olive_F 
5, U_I_L_Uniform_01_tshirt_skull_F 
5, U_I_L_Uniform_01_tshirt_sport_F 
5, U_I_OfficerUniform 
5, U_I_pilotCoveralls 
5, U_I_Protagonist_VR 
5, U_I_Soldier_VR 
5, U_I_Wetsuit 
5, U_IG_Guerilla1_1 
5, U_IG_Guerilla2_1 
5, U_IG_Guerilla2_2 
5, U_IG_Guerilla2_3 
5, U_IG_Guerilla3_1 
5, U_IG_Guerilla3_2 
5, U_IG_Guerrilla_6_1 
5, U_IG_leader 
5, U_IG_Menelaos 
5, U_InsUniShirt_A 
5, U_InsUniShirt_B 
5, U_InsUniShirt_C 
5, U_InsUniShirt_Leader 
5, U_KerryBody 
5, U_LampreyBody 
5, U_Marshal 
5, U_MilitaryCoat_A 
5, U_MilitaryCoat_B 
5, U_MilitaryCoat_C 
5, U_MilitaryCoat_D 
5, U_MilitiaSport_A 
5, U_MilitiaSport_B 
5, U_MilitiaSport_C 
5, U_MilitiaUniShirt_A 
5, U_MilitiaUniShirt_B 
5, U_MilitiaUniShirt_C 
5, U_MilitiaUniShirt_D 
5, U_MilitiaUniShirt_E 
5, U_MilitiaUniShirt_F 
5, U_MilitiaUniShirt_G 
5, U_MilitiaUniTShirt_A 
5, U_MilitiaUniTShirt_B 
5, U_MilitiaUniTShirt_C 
5, U_MilitiaUniTShirt_D 
5, U_MilitiaUniTShirt_E 
5, U_MilitiaUniTShirt_F 
5, U_MilitiaUniTShirt_G 
5, U_MillerBody 
5, U_NikosAgedBody 
5, U_NikosBody 
5, U_O_CombatUniform_ocamo 
5, U_O_CombatUniform_oucamo 
5, U_O_FullGhillie_ard 
5, U_O_FullGhillie_lsh 
5, U_O_FullGhillie_sard 
5, U_O_GEN_Commander_F 
5, U_O_GEN_Soldier_F 
5, U_O_GhillieSuit 
5, U_O_officer_noInsignia_hex_F 
5, U_O_OfficerUniform_ocamo 
5, U_O_PilotCoveralls 
5, U_O_Protagonist_VR 
5, U_O_R_Gorka_01_black_F 
5, U_O_R_Gorka_01_brown_F 
5, U_O_R_Gorka_01_camo_F 
5, U_O_R_Gorka_01_F 
5, U_O_Soldier_VR 
5, U_O_SpecopsUniform_blk 
5, U_O_SpecopsUniform_ocamo 
5, U_O_T_FullGhillie_tna_F 
5, U_O_T_Officer_F 
5, U_O_T_Sniper_F 
5, U_O_T_Soldier_F 
5, U_O_V_Soldier_Viper_F 
5, U_O_V_Soldier_Viper_hex_F 
5, U_O_Wetsuit 
5, U_Office_A 
5, U_Office_B 
5, U_Office_C 
5, U_OG_Guerilla1_1 
5, U_OG_Guerilla2_1 
5, U_OG_Guerilla2_2 
5, U_OG_Guerilla2_3 
5, U_OG_Guerilla3_1 
5, U_OG_Guerilla3_2 
5, U_OG_Guerrilla_6_1 
5, U_OG_leader 
5, U_OI_Scientist 
5, U_OrestesBody 
5, U_Rangemaster 
5, U_Rangemaster_A 
5, U_Rangemaster_B 
5, U_Rangemaster_C 
5, U_Rangemaster_D 
5, U_Rangemaster_E 
5, U_Rangemaster_F 
5, U_Rangemaster_G 
5, U_Rangemaster_H 
5, U_Skater_A 
5, U_Skater_B 
5, U_Tank_green_F 
5, U_TerrorCombat_A 
5, U_TerrorCombat_B 
5, U_TerrorCombat_Black 
5, U_TKLocalCombat_A 
5, U_TKLocalCombat_B 
5, U_TKLocalCombat_C 
5, U_TKLocalCombat_D 
5, U_TKLocalCombat_E 
5, U_TKLocalTactic_A 
5, U_TKLocalTactic_B 
5, U_TKLocalTactic_C 
5, U_TKLocalTactic_D 
5, U_TKLocalTactic_E 
5, U_TKLocalUni_A 
5, U_TKLocalUni_B 
5, U_TKLocalUni_C 
5, U_TKLocalUni_D 
5, U_TKLocalUni_E 
5, U_TKLocalUni_F 
5, U_TKLocalUniLong_A 
5, U_TKLocalUniLong_B 
5, U_TKLocalUniLong_C 
5, U_TKLocalUniLong_D 
5, U_TKLocalUniLong_E 
5, U_TKOfficerUni_A 
5, U_TKOfficerUni_B 
5, U_TKSoldierUni_A 
5, U_TKSoldierUni_B 
5, U_TKSpecialUni_A 
5, U_TKSpecialUni_B 
5, U_VirtualMan_F 


// Headgear 

5, H_Bandanna_blu 
5, H_Bandanna_camo 
5, H_Bandanna_cbr 
5, H_Bandanna_gry 
5, H_Bandanna_khk 
5, H_Bandanna_khk_hs 
5, H_Bandanna_mcamo 
5, H_Bandanna_sand 
5, H_Bandanna_sgg 
5, H_Bandanna_surfer 
5, H_Bandanna_surfer_blk 
5, H_Bandanna_surfer_grn 
5, H_BandMask_blk 
5, H_BandMask_demon 
5, H_BandMask_khk 
5, H_BandMask_reaper 
5, H_Beret_02 
5, H_Beret_A 
5, H_Beret_B 
5, H_Beret_blk 
5, H_Beret_blk_POLICE 
5, H_Beret_brn_SF 
5, H_Beret_C 
5, H_Beret_Colonel 
5, H_Beret_CSAT_01_F 
5, H_Beret_EAF_01_F 
5, H_Beret_gen_F 
5, H_Beret_grn 
5, H_Beret_grn_SF 
5, H_Beret_ocamo 
5, H_Beret_red 
5, H_Booniehat_dgtl 
5, H_Booniehat_dirty 
5, H_Booniehat_eaf 
5, H_Booniehat_grn 
5, H_Booniehat_indp 
5, H_Booniehat_khk 
5, H_Booniehat_khk_hs 
5, H_Booniehat_mcamo 
5, H_Booniehat_mgrn 
5, H_Booniehat_oli 
5, H_Booniehat_taiga 
5, H_Booniehat_tan 
5, H_Booniehat_tna_F 
5, H_Booniehat_wdl 
5, H_Cap_Black_IDAP_F 
5, H_Cap_blk 
5, H_Cap_blk_CMMG 
5, H_Cap_blk_ION 
5, H_Cap_blk_Raven 
5, H_Cap_blk_Syndikat_F 
5, H_Cap_blu 
5, H_Cap_brn_SPECOPS 
5, H_Cap_grn 
5, H_Cap_grn_BI 
5, H_Cap_grn_Syndikat_F 
5, H_Cap_headphones 
5, H_Cap_khaki_specops_UK 
5, H_Cap_marshal 
5, H_Cap_oli 
5, H_Cap_oli_hs 
5, H_Cap_oli_Syndikat_F 
5, H_Cap_Orange_IDAP_F 
5, H_Cap_police 
5, H_Cap_press 
5, H_Cap_red 
5, H_Cap_surfer 
5, H_Cap_tan 
5, H_Cap_tan_specops_US 
5, H_Cap_tan_Syndikat_F 
5, H_Cap_usblack 
5, H_Cap_White_IDAP_F 
5, H_Construction_basic_black_F 
5, H_Construction_basic_orange_F 
5, H_Construction_basic_red_F 
5, H_Construction_basic_vrana_F 
5, H_Construction_basic_white_F 
5, H_Construction_basic_yellow_F 
5, H_Construction_earprot_black_F 
5, H_Construction_earprot_orange_F 
5, H_Construction_earprot_red_F 
5, H_Construction_earprot_vrana_F 
5, H_Construction_earprot_white_F 
5, H_Construction_earprot_yellow_F 
5, H_Construction_headset_black_F 
5, H_Construction_headset_orange_F 
5, H_Construction_headset_red_F 
5, H_Construction_headset_vrana_F 
5, H_Construction_headset_white_F 
5, H_Construction_headset_yellow_F 
5, H_CrewHelmetHeli_B 
5, H_CrewHelmetHeli_I 
5, H_CrewHelmetHeli_I_E 
5, H_CrewHelmetHeli_O 
5, H_EarProtectors_black_F 
5, H_EarProtectors_orange_F 
5, H_EarProtectors_red_F 
5, H_EarProtectors_white_F 
5, H_EarProtectors_yellow_F 
5, H_Hat_Beret_Basque_A 
5, H_Hat_Beret_Basque_B 
5, H_Hat_Beret_Basque_C 
5, H_Hat_Beret_Basque_D 
5, H_Hat_blue 
5, H_Hat_Boonie 
5, H_Hat_Boonie_Cowboy 
5, H_Hat_Boonie_Flecktarn 
5, H_Hat_Boonie_Green 
5, H_Hat_Boonie_Marpat 
5, H_Hat_Boonie_Tiger 
5, H_Hat_Boonie_Woodland 
5, H_Hat_brown 
5, H_Hat_camo 
5, H_Hat_Cap_RU 
5, H_Hat_Cap_Thai 
//5, H_Hat_CapCover_A 
5, H_Hat_CapCover_B 
5, H_Hat_CapSov_A 
5, H_Hat_CapSov_B 
5, H_Hat_CapSov_C 
5, H_Hat_checker 
5, H_Hat_Face_Balaclava_T 
5, H_Hat_Face_Cover 
5, H_Hat_Face_Cover_Black 
5, H_Hat_Face_Cover_Gold 
5, H_Hat_Face_Cover_Green 
5, H_Hat_Face_Wrap 
5, H_Hat_Face_Wrap_Black 
5, H_Hat_Face_Wrap_Dark 
5, H_Hat_Face_Wrap_Desert 
5, H_Hat_Face_Wrap_DPM 
5, H_Hat_Face_Wrap_Flecktarn 
5, H_Hat_Face_Wrap_Gold 
5, H_Hat_Face_Wrap_Olive 
5, H_Hat_Face_Wrap_Red 
5, H_Hat_Face_Wrap_Sand 
5, H_Hat_Face_Wrap_White 
5, H_Hat_Ghutra 
5, H_Hat_Ghutra_A 
5, H_Hat_Golf 
5, H_Hat_Golf_Black 
5, H_Hat_Golf_Blue 
5, H_Hat_grey 
5, H_Hat_Headbag 
5, H_Hat_Headband_A 
5, H_Hat_Headband_B 
5, H_Hat_Headband_C 
5, H_Hat_Headband_D 
5, H_Hat_Headband_E 
5, H_Hat_Headband_F 
5, H_Hat_Headband_G 
5, H_Hat_HeadbandL_A 
5, H_Hat_HeadbandL_B 
5, H_Hat_HeadbandL_C 
5, H_Hat_HeadbandL_D 
5, H_Hat_HeadbandL_E 
5, H_Hat_HeadbandL_F 
5, H_Hat_HeadbandL_G 
5, H_Hat_Headphones 
5, H_Hat_HeadTie_A 
5, H_Hat_HeadTie_B 
5, H_Hat_HeadTie_C 
5, H_Hat_HeadTie_D 
5, H_Hat_HeadTie_E 
5, H_Hat_HeadTie_F 
5, H_Hat_HeadTie_G 
5, H_Hat_HelmetA 
5, H_Hat_HelmetC 
5, H_Hat_HelmetConical 
5, H_Hat_HelmetCrewR 
5, H_Hat_HelmetD 
5, H_Hat_HelmetF 
5, H_Hat_HelmetJ 
5, H_Hat_HelmetK 
5, H_Hat_HelmetPilotR 
5, H_Hat_HelmetR 
5, H_Hat_HelmetS 
5, H_Hat_HelmetT 
5, H_Hat_HelmetU 
5, H_Hat_Kufiya 
5, H_Hat_Kufiya_B 
5, H_Hat_Kufiya_C 
5, H_Hat_Kufiya_D 
5, H_Hat_Kufiya_F 
5, H_Hat_Kufiya_G 
5, H_Hat_Kufiya_R 
5, H_Hat_Pagri 
5, H_Hat_Pagri_B 
5, H_Hat_Pagri_C 
5, H_Hat_Pakol 
5, H_Hat_Safari_olive_F 
5, H_Hat_Safari_sand_F 
5, H_Hat_tan 
5, H_Hat_Taqiyah_A 
5, H_Hat_Taqiyah_B 
5, H_Hat_Taqiyah_C 
5, H_Hat_Taqiyah_D 
5, H_Hat_Taqiyah_E 
5, H_Hat_Tinfoil_F 
5, H_Hat_Turban_A 
5, H_Hat_Turban_B 
5, H_Hat_Turban_C 
5, H_Hat_Turban_D 
5, H_Hat_Turban_E 
5, H_Hat_Ushanka 
5, H_Hat_Ushanka_Rnd_A 
5, H_Hat_Ushanka_Rnd_B 
5, H_Hat_Ushanka_Rnd_C 
5, H_Hat_Ushanka_Rnd_D 
5, H_Hat_Wig_A 
5, H_Hat_Wig_Az 
5, H_Hat_Wig_Ba 
5, H_Hat_Wig_Bb 
5, H_Hat_Wig_Bc 
5, H_HeadBandage_bloody_F 
5, H_HeadBandage_clean_F 
5, H_HeadBandage_stained_F 
5, H_HeadSet_black_F 
5, H_HeadSet_orange_F 
5, H_HeadSet_red_F 
5, H_HeadSet_white_F 
5, H_HeadSet_yellow_F 
5, H_Helmet_Kerry 
5, H_Helmet_Skate 
5, H_HelmetAggressor_cover_F 
5, H_HelmetAggressor_cover_taiga_F 
5, H_HelmetAggressor_F 
5, H_HelmetB 
5, H_HelmetB_black 
5, H_HelmetB_camo 
5, H_HelmetB_desert 
5, H_HelmetB_Enh_tna_F 
5, H_HelmetB_grass 
5, H_HelmetB_light 
5, H_HelmetB_light_black 
5, H_HelmetB_light_desert 
5, H_HelmetB_light_grass 
5, H_HelmetB_light_sand 
5, H_HelmetB_light_snakeskin 
5, H_HelmetB_Light_tna_F 
5, H_HelmetB_light_wdl 
5, H_HelmetB_paint 
5, H_HelmetB_plain_blk 
5, H_HelmetB_plain_mcamo 
5, H_HelmetB_plain_wdl 
5, H_HelmetB_sand 
5, H_HelmetB_snakeskin 
5, H_HelmetB_TI_tna_F 
5, H_HelmetB_tna_F 
5, H_HelmetCrew_B 
5, H_HelmetCrew_I 
5, H_HelmetCrew_I_E 
5, H_HelmetCrew_O 
5, H_HelmetCrew_O_ghex_F 
5, H_HelmetHBK_chops_F 
5, H_HelmetHBK_ear_F 
5, H_HelmetHBK_F 
5, H_HelmetHBK_headset_F 
5, H_HelmetIA 
5, H_HelmetIA_camo 
5, H_HelmetIA_net 
5, H_HelmetLeaderO_ghex_F 
5, H_HelmetLeaderO_ocamo 
5, H_HelmetLeaderO_oucamo 
5, H_HelmetO_ghex_F 
5, H_HelmetO_ocamo 
5, H_HelmetO_oucamo 
5, H_HelmetO_ViperSP_ghex_F 
5, H_HelmetO_ViperSP_hex_F 
5, H_HelmetSpecB 
5, H_HelmetSpecB_blk 
5, H_HelmetSpecB_paint1 
5, H_HelmetSpecB_paint2 
5, H_HelmetSpecB_sand 
5, H_HelmetSpecB_snakeskin 
5, H_HelmetSpecB_wdl 
5, H_HelmetSpecO_blk 
5, H_HelmetSpecO_ghex_F 
5, H_HelmetSpecO_ocamo 
5, H_MilCap_blue 
5, H_MilCap_dgtl 
5, H_MilCap_eaf 
5, H_MilCap_gen_F 
5, H_MilCap_ghex_F 
5, H_MilCap_grn 
5, H_MilCap_gry 
5, H_MilCap_mcamo 
5, H_MilCap_ocamo 
5, H_MilCap_oucamo 
5, H_MilCap_rucamo 
5, H_MilCap_taiga 
5, H_MilCap_tna_F 
5, H_MilCap_wdl 
5, H_PASGT_basic_black_F 
5, H_PASGT_basic_blue_F 
5, H_PASGT_basic_blue_press_F 
5, H_PASGT_basic_olive_F 
5, H_PASGT_basic_white_F 
5, H_PASGT_neckprot_blue_press_F 
5, H_PilotHelmetFighter_B 
5, H_PilotHelmetFighter_I 
5, H_PilotHelmetFighter_I_E 
5, H_PilotHelmetFighter_O 
5, H_PilotHelmetHeli_B 
5, H_PilotHelmetHeli_I 
5, H_PilotHelmetHeli_I_E 
5, H_PilotHelmetHeli_O 
5, H_RacingHelmet_1_black_F 
5, H_RacingHelmet_1_blue_F 
5, H_RacingHelmet_1_F 
5, H_RacingHelmet_1_green_F 
5, H_RacingHelmet_1_orange_F 
5, H_RacingHelmet_1_red_F 
5, H_RacingHelmet_1_white_F 
5, H_RacingHelmet_1_yellow_F 
5, H_RacingHelmet_2_F 
5, H_RacingHelmet_3_F 
5, H_RacingHelmet_4_F 
5, H_Shemag_khk 
5, H_Shemag_olive 
5, H_Shemag_olive_hs 
5, H_Shemag_tan 
5, H_ShemagOpen_khk 
5, H_ShemagOpen_tan 
5, H_StrawHat 
5, H_StrawHat_dark 
5, H_Tank_black_F 
5, H_Tank_eaf_F 
5, H_TurbanO_blk 
5, H_Watchcap_blk 
5, H_Watchcap_camo 
5, H_Watchcap_cbr 
5, H_Watchcap_khk 
5, H_Watchcap_sgg 
5, H_WirelessEarpiece_F 


// Vests 

5, V_Ballistic_A 
5, V_Ballistic_B 
5, V_Ballistic_C 
5, V_Ballistic_D 
5, V_Ballistic_E 
5, V_BandollierB_blk 
5, V_BandollierB_cbr 
5, V_BandollierB_ghex_F 
5, V_BandollierB_khk 
5, V_BandollierB_oli 
5, V_BandollierB_rgr 
5, V_BombJacket 
5, V_CarrierRigKBT_01_EAF_F 
5, V_CarrierRigKBT_01_heavy_EAF_F 
5, V_CarrierRigKBT_01_heavy_Olive_F 
5, V_CarrierRigKBT_01_light_EAF_F 
5, V_CarrierRigKBT_01_light_Olive_F 
5, V_CarrierRigKBT_01_Olive_F 
5, V_Chestrig_blk 
5, V_ChestRig_heavy_A 
5, V_ChestRig_heavy_B 
5, V_ChestRig_heavy_C 
5, V_ChestRig_heavy_D 
5, V_Chestrig_khk 
5, V_ChestRig_light_A 
5, V_ChestRig_light_B 
5, V_ChestRig_light_C 
5, V_ChestRig_light_D 
5, V_ChestRig_light_E 
5, V_Chestrig_oli 
5, V_Chestrig_rgr 
5, V_DeckCrew_blue_F 
5, V_DeckCrew_brown_F 
5, V_DeckCrew_green_F 
5, V_DeckCrew_red_F 
5, V_DeckCrew_violet_F 
5, V_DeckCrew_white_F 
5, V_DeckCrew_yellow_F 
5, V_EOD_blue_F 
5, V_EOD_coyote_F 
5, V_EOD_IDAP_blue_F 
5, V_EOD_olive_F 
5, V_FlakJacket_Black 
5, V_FlakJacket_Blue 
5, V_FlakJacket_digiCamo 
5, V_FlakJacket_Green 
5, V_FlakJacket_KP_Black 
5, V_FlakJacket_KP_Blue 
5, V_FlakJacket_KP_digiCamo 
5, V_FlakJacket_KP_Green 
5, V_FlakJacket_KP_Tan 
5, V_FlakJacket_KP_Woodland 
5, V_FlakJacket_Pliskin_Black 
5, V_FlakJacket_Pliskin_Blue 
5, V_FlakJacket_Pliskin_digiCamo 
5, V_FlakJacket_Pliskin_Green 
5, V_FlakJacket_Pliskin_HunterGreen 
5, V_FlakJacket_Pliskin_Tan 
5, V_FlakJacket_Pliskin_Woodland 
5, V_FlakJacket_SH_Black 
5, V_FlakJacket_SH_Blue 
5, V_FlakJacket_SH_digiCamo 
5, V_FlakJacket_SH_Green 
5, V_FlakJacket_SH_Tan 
5, V_FlakJacket_SH_Woodland 
5, V_FlakJacket_Tan 
5, V_FlakJacket_Woodland 
5, V_HarnessO_brn 
5, V_HarnessO_ghex_F 
5, V_HarnessO_gry 
5, V_HarnessOGL_brn 
5, V_HarnessOGL_ghex_F 
5, V_HarnessOGL_gry 
5, V_HarnessOSpec_brn 
5, V_HarnessOSpec_gry 
5, V_I_G_resistanceLeader_F 
5, V_LegStrapBag_black_F 
5, V_LegStrapBag_coyote_F 
5, V_LegStrapBag_olive_F 
5, V_Plain_crystal_F 
5, V_Plain_medical_F 
5, V_PlateCarrier1_blk 
5, V_PlateCarrier1_rgr 
5, V_PlateCarrier1_rgr_noflag_F 
5, V_PlateCarrier1_tna_F 
5, V_PlateCarrier1_wdl 
5, V_PlateCarrier2_blk 
5, V_PlateCarrier2_rgr 
5, V_PlateCarrier2_rgr_noflag_F 
5, V_PlateCarrier2_tna_F 
5, V_PlateCarrier2_wdl 
5, V_PlateCarrier3_rgr 
5, V_PlateCarrier_heavy_A 
5, V_PlateCarrier_heavy_B 
5, V_PlateCarrier_heavy_C 
5, V_PlateCarrier_heavy_D 
5, V_PlateCarrier_heavy_digiCamo 
5, V_PlateCarrier_heavy_E 
5, V_PlateCarrier_heavy_F 
5, V_PlateCarrier_heavy_G 
5, V_PlateCarrier_Kerry 
5, V_PlateCarrier_light_digiCamo 
5, V_PlateCarrier_medium_A 
5, V_PlateCarrier_medium_B 
5, V_PlateCarrier_medium_C 
5, V_PlateCarrier_medium_D 
5, V_PlateCarrier_medium_E 
5, V_PlateCarrierGL_blk 
5, V_PlateCarrierGL_mtp 
5, V_PlateCarrierGL_rgr 
5, V_PlateCarrierGL_tna_F 
5, V_PlateCarrierGL_wdl 
5, V_PlateCarrierH_CTRG 
5, V_PlateCarrierIA1_dgtl 
5, V_PlateCarrierIA2_dgtl 
5, V_PlateCarrierIAGL_dgtl 
5, V_PlateCarrierIAGL_oli 
5, V_PlateCarrierL_CTRG 
5, V_PlateCarrierSpec_blk 
5, V_PlateCarrierSpec_mtp 
5, V_PlateCarrierSpec_rgr 
5, V_PlateCarrierSpec_tna_F 
5, V_PlateCarrierSpec_wdl 
5, V_Pocketed_black_F 
5, V_Pocketed_coyote_F 
5, V_Pocketed_olive_F 
5, V_Police_heavy 
5, V_Police_light 
5, V_Police_medium 
5, V_Pouch_light_A 
5, V_Pouch_light_B 
5, V_Pouch_light_C 
5, V_Press_F 
5, V_Rangemaster_belt 
5, V_RebreatherB 
5, V_RebreatherIA 
5, V_RebreatherIR 
5, V_Safety_blue_F 
5, V_Safety_orange_F 
5, V_Safety_yellow_F 
5, V_SmershVest_01_F 
5, V_SmershVest_01_radio_F 
5, V_TacChestrig_cbr_F 
5, V_TacChestrig_grn_F 
5, V_TacChestrig_oli_F 
5, V_TacVest_blk 
5, V_TacVest_blk_POLICE 
5, V_TacVest_brn 
5, V_TacVest_camo 
5, V_TacVest_gen_F 
5, V_TacVest_khk 
5, V_TacVest_oli 
5, V_TacVest_TK 
5, V_TacVestCamo_khk 
5, V_TacVestEX_A 
5, V_TacVestEX_B 
5, V_TacVestEX_C 
5, V_TacVestEX_D 
5, V_TacVestEX_E 
5, V_TacVestEX_F 
5, V_TacVestEX_G 
5, V_TacVestIR_blk 
5, V_TacVestUP_A 
5, V_TacVestUP_B 
5, V_TacVestUP_C 
5, V_TacVestUP_D 
5, V_TacVestUP_E 
5, V_TacVestUP_F 
5, V_TacVestUP_G 
5, V_Vest_AI_Invisible_Heavy 
5, V_Vest_AI_Invisible_Light 
5, V_Vest_AI_Invisible_Medium 
5, V_Vest_light_Invisible 
5, V_Vest_light_InvNoArmor 


// Backpacks 

5, B_AA_01_weapon_F 
5, B_AliceBag_A 
5, B_Assault_Diver 
5, B_AssaultPack_blk 
5, B_AssaultPack_blk_DiverExp 
5, B_AssaultPack_blk_Medic 
5, B_AssaultPack_cbr 
5, B_AssaultPack_dgtl 
5, B_AssaultPack_eaf_F 
5, B_AssaultPack_eaf_IELAT2_F 
5, B_AssaultPack_eaf_IELAT_F 
5, B_AssaultPack_eaf_IEPathfinder_F 
5, B_AssaultPack_eaf_Repair_F 
5, B_AssaultPack_Kerry 
5, B_AssaultPack_khk 
5, B_AssaultPack_mcamo 
5, B_AssaultPack_mcamo_AA 
5, B_AssaultPack_mcamo_AAR 
5, B_AssaultPack_mcamo_Ammo 
5, B_AssaultPack_mcamo_AT 
5, B_AssaultPack_ocamo 
5, B_AssaultPack_ocamo_Medic_F 
5, B_AssaultPack_rgr 
5, B_AssaultPack_rgr_BTLAT2_F 
5, B_AssaultPack_rgr_BTLAT_F 
5, B_AssaultPack_rgr_BTReconMedic 
5, B_AssaultPack_rgr_CTRGLAT2_F 
5, B_AssaultPack_rgr_CTRGLAT_F 
5, B_AssaultPack_rgr_CTRGMedic_F 
5, B_AssaultPack_rgr_LAT 
5, B_AssaultPack_rgr_LAT2 
5, B_AssaultPack_rgr_Medic 
5, B_AssaultPack_rgr_ReconExp 
5, B_AssaultPack_rgr_ReconLAT 
5, B_AssaultPack_rgr_ReconMedic 
5, B_AssaultPack_rgr_Repair 
5, B_AssaultPack_sgg 
5, B_AssaultPack_tna_BTMedic_F 
5, B_AssaultPack_tna_BTRepair_F 
5, B_AssaultPack_tna_F 
5, B_AssaultPack_wdl_BWLAT2_F 
5, B_AssaultPack_wdl_BWLAT_F 
5, B_AssaultPack_wdl_BWMedic_F 
5, B_AssaultPack_wdl_BWReconMedic 
5, B_AssaultPack_wdl_BWRepair_F 
5, B_AssaultPack_wdl_F 
5, B_AssaultPackG 
5, B_AT_01_weapon_F 
5, B_B_Parachute_02_F 
5, B_Bag_TacticalCart 
5, B_Bag_TacticalDeerStand 
5, B_Bag_TacticalTent 
5, B_Bag_weapon_CameraStatic_high 
5, B_Bag_weapon_DShKM_high 
5, B_Bag_weapon_DShKM_low 
5, B_Bag_weapon_M2_high 
5, B_Bag_weapon_M2_low 
5, B_Bag_weapon_Mortar_Portable 
5, B_Bag_weapon_SPG9 
5, B_Bergen_blk 
5, B_Bergen_dgtl_F 
5, B_Bergen_hex_F 
5, B_Bergen_mcamo 
5, B_Bergen_mcamo_F 
5, B_Bergen_rgr 
5, B_Bergen_sgg 
5, B_Bergen_tna_F 
5, B_BergenC_blu 
5, B_BergenC_grn 
5, B_BergenC_red 
5, B_BergenG 
5, B_BergenG_TEST_B_Soldier_overloaded 
5, B_Carryall_A 
5, B_Carryall_B 
5, B_Carryall_C 
5, B_Carryall_cbr 
5, B_Carryall_cbr_AAT 
5, B_Carryall_cbr_AHAT 
5, B_Carryall_eaf_eng_F 
5, B_Carryall_eaf_exp_F 
5, B_Carryall_eaf_F 
5, B_Carryall_eaf_IEAAA_F 
5, B_Carryall_eaf_IEAAR_F 
5, B_Carryall_eaf_IEAAT_F 
5, B_Carryall_eaf_IEAmmo_F 
5, B_Carryall_eaf_Mine_F 
5, B_Carryall_ghex_F 
5, B_Carryall_ghex_Mine 
5, B_Carryall_ghex_OTAAA_F 
5, B_Carryall_ghex_OTAAR_AAR_F 
5, B_Carryall_ghex_OTAAT_F 
5, B_Carryall_ghex_OTAHAT_F 
5, B_Carryall_ghex_OTAmmo_F 
5, B_Carryall_ghex_OTEng_F 
5, B_Carryall_ghex_OTExp_F 
5, B_Carryall_ghex_OTReconExp_F 
5, B_Carryall_green_exp_F 
5, B_Carryall_green_F 
5, B_Carryall_khk 
5, B_Carryall_khk_Mine 
5, B_Carryall_mcamo 
5, B_Carryall_mcamo_AAA 
5, B_Carryall_mcamo_AAT 
5, B_Carryall_ocamo 
5, B_Carryall_ocamo_AAA 
5, B_Carryall_ocamo_AAR 
5, B_Carryall_ocamo_Eng 
5, B_Carryall_ocamo_Exp 
5, B_Carryall_ocamo_Mine 
5, B_Carryall_oli 
5, B_Carryall_oli_BTAAA_F 
5, B_Carryall_oli_BTAAT_F 
5, B_Carryall_oli_BTAmmo_F 
5, B_Carryall_oli_IEAAR_F 
5, B_Carryall_oli_IEAmmo_F 
5, B_Carryall_oli_LAT 
5, B_Carryall_oli_Mine 
5, B_Carryall_oucamo 
5, B_Carryall_oucamo_AAA 
5, B_Carryall_oucamo_AAR 
5, B_Carryall_oucamo_AAT 
5, B_Carryall_oucamo_Eng 
5, B_Carryall_oucamo_Exp 
5, B_Carryall_oucamo_Repair 
5, B_Carryall_taiga_Exp_F 
5, B_Carryall_taiga_F 
5, B_Carryall_wdl_BWAAA_F 
5, B_Carryall_wdl_BWAAT_F 
5, B_Carryall_wdl_BWAmmo_F 
5, B_Carryall_wdl_F 
5, B_Carryall_wdl_Mine 
5, B_CombinationUnitRespirator_01_F 
5, B_FieldPack_A 
5, B_FieldPack_B 
5, B_FieldPack_blk 
5, B_FieldPack_blk_Bandit_8_F 
5, B_FieldPack_blk_DiverExp 
5, B_FieldPack_cb_Bandit_3_F 
5, B_FieldPack_cbr 
5, B_FieldPack_cbr_AA 
5, B_FieldPack_cbr_AAA 
5, B_FieldPack_cbr_AAT 
5, B_FieldPack_cbr_Ammo 
5, B_FieldPack_cbr_Ammo_F 
5, B_FieldPack_cbr_AT 
5, B_FieldPack_cbr_HAT 
5, B_FieldPack_cbr_LAT 
5, B_FieldPack_cbr_Medic 
5, B_FieldPack_cbr_ReconExp 
5, B_FieldPack_cbr_ReconLAT 
5, B_FieldPack_cbr_Repair 
5, B_FieldPack_cbr_RPG_AT 
5, B_FieldPack_ghex_F 
5, B_FieldPack_ghex_OTAA_F 
5, B_FieldPack_ghex_OTAT_F 
5, B_FieldPack_ghex_OTHAT_F 
5, B_FieldPack_ghex_OTLAT_F 
5, B_FieldPack_ghex_OTMedic_F 
5, B_FieldPack_ghex_OTReconMedic_F 
5, B_FieldPack_ghex_OTRepair_F 
5, B_FieldPack_ghex_OTRPG_AT_F 
5, B_FieldPack_green_Exp_F 
5, B_FieldPack_green_F 
5, B_Fieldpack_green_IEAA_F 
5, B_Fieldpack_green_IEAT_F 
5, B_Fieldpack_green_IELAT2_F 
5, B_Fieldpack_green_IELAT_F 
5, B_Fieldpack_green_IEMedic_F 
5, B_FieldPack_green_Medic_F 
5, B_FieldPack_green_RPG_AT_F 
5, B_FieldPack_khk 
5, B_FieldPack_khk_Bandit_1_F 
5, B_FieldPack_ocamo 
5, B_FieldPack_ocamo_AA 
5, B_FieldPack_ocamo_AAR 
5, B_FieldPack_ocamo_LAT_F 
5, B_FieldPack_ocamo_Medic 
5, B_FieldPack_ocamo_ReconExp 
5, B_FieldPack_ocamo_ReconMedic 
5, B_FieldPack_oli 
5, B_Fieldpack_oli_IEAA_F 
5, B_Fieldpack_oli_IEAT_F 
5, B_Fieldpack_oli_IELAT2_F 
5, B_Fieldpack_oli_IELAT_F 
5, B_FieldPack_oucamo 
5, B_FieldPack_oucamo_AA 
5, B_FieldPack_oucamo_AAR 
5, B_FieldPack_oucamo_Ammo 
5, B_FieldPack_oucamo_AT 
5, B_FieldPack_oucamo_LAT 
5, B_FieldPack_oucamo_Medic 
5, B_FieldPack_oucamo_Repair 
5, B_FieldPack_taiga_F 
5, B_FieldPack_taiga_Medic_F 
5, B_FieldPack_taiga_RPG_AT_F 
5, B_G_HMG_02_high_weapon_F 
5, B_G_HMG_02_support_F 
5, B_G_HMG_02_support_high_F 
5, B_G_HMG_02_weapon_F 
5, B_GiantBag_A 
5, B_GiantBag_B 
5, B_GiantBag_C 
5, B_GiantBag_D 
5, B_GiantBag_E 
5, B_GiantBag_F 
5, B_GMG_01_A_weapon_F 
5, B_GMG_01_high_weapon_F 
5, B_GMG_01_weapon_F 
5, B_GMG_01_Weapon_grn_F 
5, B_HikingBag_A 
5, B_HikingBag_B 
5, B_HikingBag_C 
5, B_HikingBag_D 
5, B_HikingBag_E 
5, B_HikingBag_F 
5, B_HMG_01_A_weapon_F 
5, B_HMG_01_high_weapon_F 
5, B_HMG_01_support_F 
5, B_HMG_01_support_grn_F 
5, B_HMG_01_support_high_F 
5, B_HMG_01_weapon_F 
5, B_HMG_01_Weapon_grn_F 
5, B_HMG_02_high_weapon_F 
5, B_HMG_02_support_F 
5, B_HMG_02_support_high_F 
5, B_HMG_02_weapon_F 
5, B_HuntingBackpack 
5, B_I_Parachute_02_F 
5, B_Kitbag_A 
5, B_Kitbag_A_Repair 
5, B_Kitbag_B 
5, B_Kitbag_C 
5, B_Kitbag_cbr 
5, B_Kitbag_cbr_Bandit_2_F 
5, B_Kitbag_cbr_Para_5_F 
5, B_Kitbag_D 
5, B_Kitbag_E 
5, B_Kitbag_mcamo 
5, B_Kitbag_mcamo_Eng 
5, B_Kitbag_rgr 
5, B_Kitbag_rgr_AAR 
5, B_Kitbag_rgr_BTAA_F 
5, B_Kitbag_rgr_BTAT_F 
5, B_Kitbag_rgr_BTEng_F 
5, B_Kitbag_rgr_BTExp_F 
5, B_Kitbag_rgr_BTReconExp_F 
5, B_Kitbag_rgr_BWAAR 
5, B_Kitbag_rgr_CTRGExp_F 
5, B_Kitbag_rgr_Exp 
5, B_Kitbag_rgr_Mine 
5, B_Kitbag_rgr_Para_3_F 
5, B_Kitbag_rgr_Para_8_F 
5, B_Kitbag_sgg 
5, B_Kitbag_tan 
5, B_LegStrapBag_black_F 
5, B_LegStrapBag_black_repair_F 
5, B_LegStrapBag_coyote_F 
5, B_LegStrapBag_coyote_repair_F 
5, B_LegStrapBag_olive_F 
5, B_LegStrapBag_olive_repair_F 
5, B_Messenger_Black_F 
5, B_Messenger_Coyote_F 
5, B_Messenger_Gray_F 
5, B_Messenger_Gray_Medical_F 
5, B_Messenger_IDAP_F 
5, B_Messenger_IDAP_Medical_F 
5, B_Messenger_IDAP_TrainingMines_F 
5, B_Messenger_Olive_F 
5, B_Mortar_01_support_F 
5, B_Mortar_01_support_grn_F 
5, B_Mortar_01_weapon_F 
5, B_Mortar_01_Weapon_grn_F 
5, B_O_Parachute_02_F 
5, B_OutdoorPack_blk 
5, B_OutdoorPack_blu 
5, B_OutdoorPack_tan 
5, B_Parachute 
5, B_Patrol_Carryall_green_Ammo_F 
5, B_Patrol_Carryall_taiga_medic_F 
5, B_Patrol_FieldPack_green_eng_F 
5, B_Patrol_Launcher_bag_F 
5, B_Patrol_Leader_bag_F 
5, B_Patrol_Medic_bag_F 
5, B_Patrol_Respawn_bag_F 
5, B_Patrol_Supply_bag_F 
5, B_RadioBag_01_black_F 
5, B_RadioBag_01_digi_F 
5, B_RadioBag_01_eaf_F 
5, B_RadioBag_01_eaf_FAK_F 
5, B_RadioBag_01_ghex_F 
5, B_RadioBag_01_hex_F 
5, B_RadioBag_01_mtp_F 
5, B_RadioBag_01_oucamo_F 
5, B_RadioBag_01_tropic_F 
5, B_RadioBag_01_wdl_F 
5, B_RadioBag_01_wdl_FAK_F 
5, B_RadioBag_A 
5, B_Respawn_Sleeping_bag_blue_F 
5, B_Respawn_Sleeping_bag_brown_F 
5, B_Respawn_Sleeping_bag_F 
5, B_Respawn_TentA_F 
5, B_Respawn_TentDome_F 
5, B_RPGBag_A 
5, B_RucksackBag_A 
5, B_RucksackBag_A_Exp 
5, B_RucksackBag_A_Medic 
5, B_RucksackBag_A_Repair 
5, B_RucksackBag_B 
5, B_RucksackBag_C 
5, B_RucksackBag_D 
5, B_SCBA_01_F 
5, B_Static_Designator_01_weapon_F 
5, B_TacticalPack_A 
5, B_TacticalPack_B 
5, B_TacticalPack_blk 
5, B_TacticalPack_C 
5, B_TacticalPack_mcamo 
5, B_TacticalPack_ocamo 
5, B_TacticalPack_ocamo_AA_F 
5, B_TacticalPack_ocamo_AT_F 
5, B_TacticalPack_oli 
5, B_TacticalPack_oli_AAR 
5, B_TacticalPack_rgr 
5, B_UAV_01_backpack_F 
5, B_UAV_06_backpack_F 
5, B_UAV_06_medical_backpack_F 
5, B_UGV_02_Demining_backpack_F 
5, B_UGV_02_Science_backpack_F 
5, B_ViperHarness_blk_F 
5, B_ViperHarness_ghex_Exp_F 
5, B_ViperHarness_ghex_F 
5, B_ViperHarness_ghex_JTAC_F 
5, B_ViperHarness_ghex_LAT_F 
5, B_ViperHarness_ghex_M_F 
5, B_ViperHarness_ghex_Medic_F 
5, B_ViperHarness_ghex_TL_F 
5, B_ViperHarness_hex_Exp_F 
5, B_ViperHarness_hex_F 
5, B_ViperHarness_hex_JTAC_F 
5, B_ViperHarness_hex_LAT_F 
5, B_ViperHarness_hex_M_F 
5, B_ViperHarness_hex_Medic_F 
5, B_ViperHarness_hex_TL_F 
5, B_ViperHarness_khk_F 
5, B_ViperHarness_oli_F 
5, B_ViperLightHarness_blk_F 
5, B_ViperLightHarness_ghex_F 
5, B_ViperLightHarness_hex_F 
5, B_ViperLightHarness_khk_F 
5, B_ViperLightHarness_oli_F 
5, B_W_Static_Designator_01_weapon_F 
5, C_Bergen_blu 
5, C_Bergen_grn 
5, C_Bergen_red 
5, C_IDAP_UAV_01_backpack_F 
5, C_IDAP_UAV_06_antimine_backpack_F 
5, C_IDAP_UAV_06_backpack_F 
5, C_IDAP_UAV_06_medical_backpack_F 
5, C_IDAP_UGV_02_Demining_backpack_F 
5, C_UAV_06_backpack_F 
5, C_UAV_06_medical_backpack_F 
5, G_AssaultPack 
5, G_Bergen 
5, G_Carryall_Ammo 
5, G_Carryall_Exp 
5, G_FieldPack_LAT 
5, G_FieldPack_LAT2 
5, G_FieldPack_Medic 
5, G_TacticalPack_Eng 
5, I_AA_01_weapon_F 
5, I_Assault_Diver 
5, I_AT_01_weapon_F 
5, I_C_HMG_02_high_weapon_F 
5, I_C_HMG_02_support_F 
5, I_C_HMG_02_support_high_F 
5, I_C_HMG_02_weapon_F 
5, I_Carryall_oli_AAA 
5, I_Carryall_oli_AAT 
5, I_Carryall_oli_Eng 
5, I_Carryall_oli_Exp 
5, I_E_AA_01_weapon_F 
5, I_E_AT_01_weapon_F 
5, I_E_GMG_01_A_Weapon_F 
5, I_E_GMG_01_high_Weapon_F 
5, I_E_GMG_01_Weapon_F 
5, I_E_HMG_01_A_Weapon_F 
5, I_E_HMG_01_high_Weapon_F 
5, I_E_HMG_01_support_F 
5, I_E_HMG_01_support_high_F 
5, I_E_HMG_01_Weapon_F 
5, I_E_HMG_02_high_weapon_F 
5, I_E_HMG_02_support_F 
5, I_E_HMG_02_support_high_F 
5, I_E_HMG_02_weapon_F 
5, I_E_Mortar_01_support_F 
5, I_E_Mortar_01_Weapon_F 
5, I_E_UAV_01_backpack_F 
5, I_E_UAV_06_backpack_F 
5, I_E_UAV_06_medical_backpack_F 
5, I_E_UGV_02_Demining_backpack_F 
5, I_E_UGV_02_Science_backpack_F 
5, I_Fieldpack_oli_AA 
5, I_Fieldpack_oli_AAR 
5, I_Fieldpack_oli_Ammo 
5, I_Fieldpack_oli_AT 
5, I_Fieldpack_oli_LAT 
5, I_Fieldpack_oli_LAT2 
5, I_Fieldpack_oli_Medic 
5, I_Fieldpack_oli_Repair 
5, I_G_HMG_02_high_weapon_F 
5, I_G_HMG_02_support_F 
5, I_G_HMG_02_support_high_F 
5, I_G_HMG_02_weapon_F 
5, I_GMG_01_A_weapon_F 
5, I_GMG_01_high_weapon_F 
5, I_GMG_01_weapon_F 
5, I_HMG_01_A_weapon_F 
5, I_HMG_01_high_weapon_F 
5, I_HMG_01_support_F 
5, I_HMG_01_support_high_F 
5, I_HMG_01_weapon_F 
5, I_HMG_02_high_weapon_F 
5, I_HMG_02_support_F 
5, I_HMG_02_support_high_F 
5, I_HMG_02_weapon_F 
5, I_Mortar_01_support_F 
5, I_Mortar_01_weapon_F 
5, I_UAV_01_backpack_F 
5, I_UAV_06_backpack_F 
5, I_UAV_06_medical_backpack_F 
5, I_UGV_02_Demining_backpack_F 
5, I_UGV_02_Science_backpack_F 
5, O_AA_01_weapon_F 
5, O_Assault_Diver 
5, O_AT_01_weapon_F 
5, O_G_HMG_02_high_weapon_F 
5, O_G_HMG_02_support_F 
5, O_G_HMG_02_support_high_F 
5, O_G_HMG_02_weapon_F 
5, O_GMG_01_A_weapon_F 
5, O_GMG_01_high_weapon_F 
5, O_GMG_01_weapon_F 
5, O_HMG_01_A_weapon_F 
5, O_HMG_01_high_weapon_F 
5, O_HMG_01_support_F 
5, O_HMG_01_support_high_F 
5, O_HMG_01_weapon_F 
5, O_HMG_02_high_weapon_F 
5, O_HMG_02_support_F 
5, O_HMG_02_support_high_F 
5, O_HMG_02_weapon_F 
5, O_Mortar_01_support_F 
5, O_Mortar_01_weapon_F 
5, O_Static_Designator_02_weapon_F 
5, O_UAV_01_backpack_F 
5, O_UAV_06_backpack_F 
5, O_UAV_06_medical_backpack_F 
5, O_UGV_02_Demining_backpack_F 
5, O_UGV_02_Science_backpack_F 


// Glasses 

5, COREV_G_Beard_A 
5, COREV_G_Beard_Azz 
5, COREV_G_Beard_B 
5, COREV_G_Beard_Baddazz 
5, COREV_G_Beard_C 
5, COREV_G_Beard_D 
5, COREV_G_Halo_Ring 
5, COREV_G_Headphone 
5, COREV_G_None 
5, COREV_G_Reading_A 
5, COREV_G_Wig_A 
5, COREV_G_Wig_Az 
5, COREV_G_Wig_Ba 
5, COREV_G_Wig_Bb 
5, COREV_G_Wig_Bc 
5, G_AirPurifyingRespirator_01_F 
5, G_AirPurifyingRespirator_01_nofilter_F 
5, G_AirPurifyingRespirator_02_black_F 
5, G_AirPurifyingRespirator_02_black_nofilter_F 
5, G_AirPurifyingRespirator_02_olive_F 
5, G_AirPurifyingRespirator_02_olive_nofilter_F 
5, G_AirPurifyingRespirator_02_sand_F 
5, G_AirPurifyingRespirator_02_sand_nofilter_F 
5, G_Aviator 
5, G_B_Diving 
5, G_Balaclava_blk 
5, G_Balaclava_combat 
5, G_Balaclava_lowprofile 
5, G_Balaclava_oli 
5, G_Balaclava_TI_blk_F 
5, G_Balaclava_TI_G_blk_F 
5, G_Balaclava_TI_G_tna_F 
5, G_Balaclava_TI_tna_F 
5, G_Bandanna_aviator 
5, G_Bandanna_beast 
5, G_Bandanna_blk 
5, G_Bandanna_khk 
5, G_Bandanna_oli 
5, G_Bandanna_shades 
5, G_Bandanna_sport 
5, G_Bandanna_tan 
5, G_Blindfold_01_black_F 
5, G_Blindfold_01_white_F 
5, G_Combat 
5, G_Combat_Goggles_tna_F 
5, G_Diving 
5, G_EyeProtectors_Earpiece_F 
5, G_EyeProtectors_F 
5, G_Goggles_VR 
5, G_I_Diving 
5, G_Lady_Blue 
5, G_Lady_Dark 
5, G_Lady_Mirror 
5, G_Lady_Red 
5, G_Lowprofile 
5, G_O_Diving 
5, G_RegulatorMask_F 
5, G_Respirator_blue_F 
5, G_Respirator_white_F 
5, G_Respirator_yellow_F 
5, G_Shades_Black 
5, G_Shades_Blue 
5, G_Shades_Green 
5, G_Shades_Red 
5, G_Spectacles 
5, G_Spectacles_Tinted 
5, G_Sport_Blackred 
5, G_Sport_BlackWhite 
5, G_Sport_Blackyellow 
5, G_Sport_Checkered 
5, G_Sport_Greenblack 
5, G_Sport_Red 
5, G_Squares 
5, G_Squares_Tinted 
5, G_Tactical_Black 
5, G_Tactical_Clear 
5, G_WirelessEarpiece_F 
5, None 



*/
