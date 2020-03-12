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
_cartName = "exile";
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
		true,				// TRUE - Replaces vanilla class      FALSE - Appends to vanilla class
					
		[
			"U_C_Journalist","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1",
			"U_C_Scientist","U_OrestesBody","U_Rangemaster","U_NikosAgedBody","U_NikosBody","U_Competitor",
			"Exile_Uniform_BambiOverall"
		]
	],

	//////////////////////////////////////////// Uniforms - Independant
	
	[
		"CAMS_U_Soldier_I",1,false,
		[
			"Exile_Uniform_Woodland"
		]	
	],
	[
		"CAMS_U_Wetsuit_I",1,false,
		[
			"Exile_Uniform_Wetsuit_AAF","Exile_Uniform_Wetsuit_CSAT","Exile_Uniform_Wetsuit_NATO"
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
		"CAMS_V_Vests",1,false,
		[
			"Exile_Vest_Snow"
		]
	],
	[
		"CAMS_V_Rebreather",1,false,
		[
			"Exile_Vest_Rebreather_AAF","Exile_Vest_Rebreather_CSAT","Exile_Vest_Rebreather_NATO"
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
		"CAMS_H_Caps",1,false,
		[	
			"Exile_Cap_Exile"
		]
	],
	[
		"CAMS_H_Hats",1,false,
		[
			"Exile_Headgear_SantaHat"
		]
	],
	[
		"CAMS_H_Shemags",1,false,
		[
			"Exile_Headgear_GasMask"
		]
	],
	[
		"CAMS_H_LightHelmet",1,false,
		[
			"Exile_Headgear_SafetyHelmet"
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
	
	/////////////////////////////////////////////////////
	///////////// CAMS AI Models ////////////////////////
	/////////////////////////////////////////////////////
	// This whole section should be rebuilt to your content but keep the global groupings at the end
	// Just swap out your own global names
	
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
			"Exile_Item_XM8","Exile_Item_MobilePhone"
		]
	],
	
	// Meds - Has all vanilla stuff since its more for loot and random AI loot, but break up if you want or if your content has a lot of custom stuff here
	[
		"CAMS_I_Meds",1,false,
		[
			"Exile_Item_Bandage","Exile_Item_Heatpack","Exile_Item_InstaDoc","Exile_Item_Vishpirin"
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

	///////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////// Explosives ///////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
	

	// Explosive Shells
	[
		"CAMS_E_IED",1,false,
		[
			"Exile_Ammo_BreachingCharge_BigMomma_Veh","Exile_Ammo_BreachingCharge_Metal_Veh","Exile_Ammo_BreachingCharge_Wood_Veh"
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
	
	// ******* WEAPONS - IND ********************	
	[
		"CAMS_Pistols_I",1,false,
		[
			"Exile_Weapon_Colt1911","Exile_Weapon_Taurus","Exile_Weapon_TaurusGold","Exile_Weapon_Makarov"		
		]
	],
	[
		"CAMS_SMG_I",1,false,
		[
			"Exile_Weapon_SA61",
			"Exile_Weapon_M1014"		// Shotgun - Just put it here for now 			
		]
	],
	[
		"CAMS_LMG_I",1,false,
		[
			"Exile_Weapon_PK","Exile_Weapon_PKP","Exile_Weapon_RPK"		
		]
	],
	[
		"CAMS_AssaultRifles_I",1,false,
		[
			"Exile_Weapon_AK107","Exile_Weapon_AK107_GL","Exile_Weapon_AK47","Exile_Weapon_AK74","Exile_Weapon_AK74_GL","Exile_Weapon_AKM",
			"Exile_Weapon_AKS","Exile_Weapon_AKS_Gold","Exile_Weapon_M16A2","Exile_Weapon_M16A4","Exile_Weapon_M4"		
		]
	],
	[
		"CAMS_SniperRifles_I",1,false,
		[
			"Exile_Weapon_CZ550","Exile_Weapon_SVD","Exile_Weapon_SVDCamo","Exile_Weapon_VSSVintorez","Exile_Weapon_DMR",
			"Exile_Weapon_LeeEnfield","Exile_Weapon_m107","Exile_Weapon_ksvk"		
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
		"CAMS_H20_Jetski_C",1,false,
		[
			"Exile_Boat_WaterScooter"
		]
	],
	[
		"CAMS_H20_All_C",0,true,
		[
			"CAMS_H20_Boats_C", "CAMS_H20_RubberDucks_C", "CAMS_H20_Jetski_C"
		]
	],
	
	//////////////////////////// Water Vehicles - Ind
	[
		"CAMS_H20_Boats_I",1,false,
		[
			"Exile_Boat_MotorBoat_Orange","Exile_Boat_MotorBoat_White","Exile_Boat_MotorBoat_Police"		
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,false,
		[
			"Exile_Boat_RubberDuck_CSAT","Exile_Boat_RubberDuck_Digital","Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue","Exile_Boat_RubberDuck_Black", "Exile_Boat_RHIB"		
		]
	],
	[
		"CAMS_H20_SDV_I",1,false,
		[
			"Exile_Boat_SDV_Grey","Exile_Boat_SDV_Digital","Exile_Boat_SDV_CSAT"
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
	
	/////////////////////////////////// Helicopters - Independant 
	[
		"CAMS_Heli_Unarmed_I",1,false,
		[
			"Exile_Chopper_Hummingbird_Green","Exile_Chopper_Hummingbird_Civillian_Blue",
			"Exile_Chopper_Hummingbird_Civillian_Red","Exile_Chopper_Hummingbird_Civillian_ION",
			"Exile_Chopper_Hummingbird_Civillian_BlueLine", "Exile_Chopper_Hummingbird_Civillian_Digital",
			"Exile_Chopper_Hummingbird_Civillian_Elliptical","Exile_Chopper_Hummingbird_Civillian_Furious",
			"Exile_Chopper_Hummingbird_Civillian_GrayWatcher","Exile_Chopper_Hummingbird_Civillian_Jeans",
			"Exile_Chopper_Hummingbird_Civillian_Light","Exile_Chopper_Hummingbird_Civillian_Shadow",
			"Exile_Chopper_Hummingbird_Civillian_Sheriff","Exile_Chopper_Hummingbird_Civillian_Speedy",
			"Exile_Chopper_Hummingbird_Civillian_Sunset","Exile_Chopper_Hummingbird_Civillian_Vrana",
			"Exile_Chopper_Hummingbird_Civillian_Wasp","Exile_Chopper_Hummingbird_Civillian_Wave"
		]
	],
	[
		"CAMS_Heli_Armed_I",1,false,
		[
			"Exile_Chopper_Huey_Armed_Desert","Exile_Chopper_Huey_Armed_Green"
		]
	],	
	[
		"CAMS_Heli_Transport_I",1,false,
		[
			"Exile_Chopper_Huey_Green","Exile_Chopper_Huey_Desert",
			
			"Exile_Chopper_Hellcat_Green","Exile_Chopper_Hellcat_FIA",

			"Exile_Chopper_Huron_Black","Exile_Chopper_Huron_Green",

			"Exile_Chopper_Mohawk_FIA",

			"Exile_Chopper_Taru_Transport_CSAT","Exile_Chopper_Taru_Transport_Black","Exile_Chopper_Taru_CSAT",
			"Exile_Chopper_Taru_Black","Exile_Chopper_Taru_Covered_CSAT","Exile_Chopper_Taru_Covered_Black",

			"Exile_Chopper_Orca_CSAT","Exile_Chopper_Orca_Black","Exile_Chopper_Orca_BlackCustom"	

		]
	],

	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,false,
		[
			"Exile_Plane_Ceasar","Exile_Plane_Cessna",

			"Exile_Plane_BlackfishInfantry","Exile_Plane_BlackfishVehicle",

			"Exile_Plane_AN2_Green","Exile_Plane_AN2_Stripe","Exile_Plane_AN2_White"
			
		]
	],
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,false,
		[
			"Exile_Bike_OldBike","Exile_Bike_MountainBike",

			"Exile_Car_Ikarus_Blue","Exile_Car_Ikarus_Red","Exile_Car_Ikarus_Party",

			"Exile_Car_Golf_Black","Exile_Car_Golf_Red",

			"Exile_Car_Octavius_White","Exile_Car_Octavius_Black",

			"Exile_Car_UAZ_Green","Exile_Car_UAZ_Open_Green",

			"Exile_Car_Lada_Green","Exile_Car_Lada_Taxi","Exile_Car_Lada_Red","Exile_Car_Lada_Hipster",
			"Exile_Car_Lada_White",

			"Exile_Car_Volha_White","Exile_Car_Volha_Blue","Exile_Car_Volha_Black",

			"Exile_Car_Hatchback_Beige","Exile_Car_Hatchback_Green","Exile_Car_Hatchback_Blue",
			"Exile_Car_Hatchback_BlueCustom","Exile_Car_Hatchback_BeigeCustom","Exile_Car_Hatchback_Yellow",
			"Exile_Car_Hatchback_Grey","Exile_Car_Hatchback_Black","Exile_Car_Hatchback_Dark",
			"Exile_Car_Hatchback_Rusty1","Exile_Car_Hatchback_Rusty2","Exile_Car_Hatchback_Rusty3",

			"Exile_Car_Hatchback_Sport_Red","Exile_Car_Hatchback_Sport_Blue","Exile_Car_Hatchback_Sport_Orange",
			"Exile_Car_Hatchback_Sport_White","Exile_Car_Hatchback_Sport_Beige","Exile_Car_Hatchback_Sport_Green"
			,"Exile_Car_Hatchback_Sport_Admin"
			
		]
	],
	[
		"CAMS_Land_Offroad_C",1,false,
		[
			"Exile_Car_Offroad_Red","Exile_Car_Offroad_Beige","Exile_Car_Offroad_White","Exile_Car_Offroad_Blue",
			"Exile_Car_Offroad_DarkRed","Exile_Car_Offroad_BlueCustom","Exile_Car_Offroad_Guerilla01",
			"Exile_Car_Offroad_Guerilla02","Exile_Car_Offroad_Guerilla03","Exile_Car_Offroad_Guerilla04",
			"Exile_Car_Offroad_Guerilla05","Exile_Car_Offroad_Guerilla06","Exile_Car_Offroad_Guerilla07",
			"Exile_Car_Offroad_Guerilla08","Exile_Car_Offroad_Guerilla09","Exile_Car_Offroad_Guerilla10",
			"Exile_Car_Offroad_Guerilla11","Exile_Car_Offroad_Guerilla12","Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2","Exile_Car_Offroad_Rusty3",		

			"Exile_Car_MB4WD","Exile_Car_MB4WDOpen",

			"Exile_Car_QilinUnarmed"

		]
	],
	[
		"CAMS_Land_Transport_C",1,false,
		[
			"Exile_Car_V3S_Covered","Exile_Car_V3S_Open"		
		]
	],
	[
		"CAMS_Land_SUV_C",1,false,
		[
			"Exile_Car_SUV_Red","Exile_Car_SUV_Black","Exile_Car_SUV_Grey","Exile_Car_SUV_Orange",
			"Exile_Car_SUVXL_Black","Exile_Car_SUV_Rusty1","Exile_Car_SUV_Rusty2","Exile_Car_SUV_Rusty3",
	

			"Exile_Car_LandRover_Red","Exile_Car_LandRover_Urban","Exile_Car_LandRover_Green",
			"Exile_Car_LandRover_Sand","Exile_Car_LandRover_Desert"
			
		]
	],
	[
		"CAMS_Land_Van_C",1,false,
		[
			"Exile_Car_Van_Red", "Exile_Car_Van_Guerilla01", "Exile_Car_Van_Guerilla02", "Exile_Car_Van_Guerilla03",
			"Exile_Car_Van_Guerilla04",	"Exile_Car_Van_Guerilla05","Exile_Car_Van_Guerilla06",
			"Exile_Car_Van_Guerilla07",	"Exile_Car_Van_Guerilla08","Exile_Car_Van_Black","Exile_Car_Van_White",		

			"Exile_Car_LandRover_Ambulance_Green","Exile_Car_LandRover_Ambulance_Desert", 
			"Exile_Car_LandRover_Red","Exile_Car_LandRover_Sand","Exile_Car_LandRover_Urban"
		]
	],
	[
		"CAMS_Land_Utility_C",1,false,
		[
			"Exile_Car_Tractor_Red","Exile_Car_OldTractor_Red","Exile_Car_TowTractor_White",		

			"Exile_Car_LandRover_Ambulance_Green","Exile_Car_LandRover_Ambulance_Desert", 
			"Exile_Car_LandRover_Ambulance_Sand"
		]
	],
	[
		"CAMS_Land_Quad_C",1,false,
		[
			"Exile_Bike_OldBike","Exile_Bike_MountainBike"		
		]
	],
	[
		"CAMS_Land_Kart_C",1,false,
		[
			"Exile_Car_Kart_BluKing","Exile_Car_Kart_RedStone","Exile_Car_Kart_Vrana","Exile_Car_Kart_Green","Exile_Car_Kart_Blue",
			"Exile_Car_Kart_Orange","Exile_Car_Kart_White","Exile_Car_Kart_Yellow","Exile_Car_Kart_Black"		
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



	/////////////////////////////////////////////////////// Guerilla Vehicles
	[
		"CAMS_Land_ArmedOffroad_I",1,false,
		[
			"Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_Offroad_Armed_Guerilla02","Exile_Car_Offroad_Armed_Guerilla03",
			"Exile_Car_Offroad_Armed_Guerilla04","Exile_Car_Offroad_Armed_Guerilla05","Exile_Car_Offroad_Armed_Guerilla06",
			"Exile_Car_Offroad_Armed_Guerilla07","Exile_Car_Offroad_Armed_Guerilla08","Exile_Car_Offroad_Armed_Guerilla09",
			"Exile_Car_Offroad_Armed_Guerilla10","Exile_Car_Offroad_Armed_Guerilla11","Exile_Car_Offroad_Armed_Guerilla12",

			"Exile_Car_HMMWV_M134_Desert","Exile_Car_HMMWV_M134_Green","Exile_Car_HMMWV_M2_Desert",
			"Exile_Car_HMMWV_M2_Green",

			"Exile_Car_SUV_Armed_Black",

			"Exile_Car_ProwlerLight"
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,false,
		[
			"Exile_Car_Offroad_Guerilla01",	"Exile_Car_Offroad_Guerilla02",	"Exile_Car_Offroad_Guerilla03",	
			"Exile_Car_Offroad_Guerilla04",	"Exile_Car_Offroad_Guerilla05",	"Exile_Car_Offroad_Guerilla06",	
			"Exile_Car_Offroad_Guerilla07",	"Exile_Car_Offroad_Guerilla08",	"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",	"Exile_Car_Offroad_Guerilla11",	"Exile_Car_Offroad_Guerilla12",

			"Exile_Car_HMMWV_MEV_Desert","Exile_Car_HMMWV_MEV_Green","Exile_Car_HMMWV_UNA_Desert",
			"Exile_Car_HMMWV_UNA_Green",

			"Exile_Car_ProwlerUnarmed"

		]
	],
	[
		"CAMS_Land_Quad_I",1,false,
		[
			"Exile_Bike_QuadBike_Black","Exile_Bike_QuadBike_Blue","Exile_Bike_QuadBike_Red","Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato","Exile_Bike_QuadBike_Csat","Exile_Bike_QuadBike_Fia","Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02"
		]
	],
	[
		"CAMS_Land_Transport_I",1,false,
		[
			"Exile_Car_Ural_Open_Worker","Exile_Car_Ural_Open_Yellow","Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Open_Military",
			
			"Exile_Car_Ural_Covered_Worker","Exile_Car_Ural_Covered_Blue","Exile_Car_Ural_Covered_Yellow",
			"Exile_Car_Ural_Covered_Military",

			"Exile_Car_Hunter",

			"Exile_Car_Ifrit",

			"Exile_Car_Strider",

			"Exile_Car_Tempest",

			"Exile_Car_Zamak"

		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,false,
		[
			"Exile_Car_Van_Fuel_Black", "Exile_Car_Van_Fuel_White", "Exile_Car_Van_Fuel_Red",
			"Exile_Car_Van_Fuel_Guerilla01", "Exile_Car_Van_Fuel_Guerilla02", "Exile_Car_Van_Fuel_Guerilla03",		

			"Exile_Car_Offroad_Repair_Guerilla01", "Exile_Car_Offroad_Repair_Guerilla02", "Exile_Car_Offroad_Repair_Guerilla03",
			"Exile_Car_Offroad_Repair_Guerilla04", "Exile_Car_Offroad_Repair_Guerilla05", "Exile_Car_Offroad_Repair_Guerilla06",
			"Exile_Car_Offroad_Repair_Guerilla07", "Exile_Car_Offroad_Repair_Guerilla08", "Exile_Car_Offroad_Repair_Guerilla09",
			"Exile_Car_Offroad_Repair_Guerilla10", "Exile_Car_Offroad_Repair_Guerilla11", "Exile_Car_Offroad_Repair_Guerilla12",
			"Exile_Car_Offroad_Repair_Civillian", "Exile_Car_Offroad_Repair_Red", "Exile_Car_Offroad_Repair_Beige",
			"Exile_Car_Offroad_Repair_White", "Exile_Car_Offroad_Repair_Blue", "Exile_Car_Offroad_Repair_DarkRed",
			"Exile_Car_Offroad_Repair_BlueCustom", 

			"Exile_Car_Van_Box_Guerilla01", "Exile_Car_Van_Box_Guerilla02", "Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04", "Exile_Car_Van_Box_Guerilla05", "Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07", "Exile_Car_Van_Box_Guerilla08", "Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White","Exile_Car_Van_Box_Red",

			"Exile_Car_BTR40_Camo","Exile_Car_BTR40_Green",

			"Exile_Car_HEMMT"
		]
	],
	[
		"CAMS_Land_ArmedTransport_I",1,false,
		[
			"Exile_Car_BTR40_MG_Camo","Exile_Car_BTR40_MG_Green",

			"Exile_Car_BRDM2_HQ"// Confirm 
		
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