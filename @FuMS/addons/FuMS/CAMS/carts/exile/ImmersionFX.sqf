// ImmersionFX.sqf
// TheOneWhoKnocks
// Overwrites the global variables used by FrSB to integrate custom content into system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_immersionData","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "exile";
_debugCart = false;

_immersionData = 
[

	[
		"ImFX_Exile_Pistols",1,true,
		[
			"Exile_Weapon_Colt1911","Exile_Weapon_Taurus","Exile_Weapon_TaurusGold","Exile_Weapon_Makarov"
		]
	],
	[
		"ImFX_Exile_Shotguns",1,true,
		[
			"Exile_Weapon_M1014"
		]
	],
	[
		"ImFX_Exile_SMG",1,true,
		[
			"Exile_Weapon_SA61"
		]
	],
	[
		"ImFX_Exile_LMG",1,true,
		[
			"Exile_Weapon_PK","Exile_Weapon_PKP","Exile_Weapon_RPK"
		]
	],	
	[
		"ImFX_Exile_AssaultRifles",1,true,
		[
			"Exile_Weapon_AK107","Exile_Weapon_AK107_GL","Exile_Weapon_AK47","Exile_Weapon_AK74","Exile_Weapon_AK74_GL","Exile_Weapon_AKM",
			"Exile_Weapon_AKS","Exile_Weapon_AKS_Gold","Exile_Weapon_M16A2","Exile_Weapon_M16A4","Exile_Weapon_M4"
		]
	],	
	[
		"ImFX_Exile_SniperRifles",1,true,
		[
			"Exile_Weapon_CZ550","Exile_Weapon_SVD","Exile_Weapon_SVDCamo","Exile_Weapon_VSSVintorez","Exile_Weapon_DMR",
			"Exile_Weapon_LeeEnfield","Exile_Weapon_m107","Exile_Weapon_ksvk"
		]
	],	
	
	[
		"ImFX_H_Exile_Hats",1,true,
		[
			"Exile_Headgear_SafetyHelmet","Exile_Headgear_SantaHat"
		]
	],
	
	///////////////////////// Vehicles
	//  Toy / small / man powered type vehicles
	[
		"ImFX_Exile_Land_Bikes",1,true,
		[
			"Exile_Bike_OldBike","Exile_Bike_MountainBike"
		]
	],
	[
		"ImFX_Exile_Land_Quads",1,true,
		[
			"Exile_Bike_QuadBike_Black","Exile_Bike_QuadBike_Blue","Exile_Bike_QuadBike_Red","Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato","Exile_Bike_QuadBike_Csat","Exile_Bike_QuadBike_Fia","Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02"
		]
	],
	[
		"ImFX_Exile_Land_Karts",1,true,
		[
			"Exile_Car_Kart_BluKing","Exile_Car_Kart_RedStone","Exile_Car_Kart_Vrana","Exile_Car_Kart_Green","Exile_Car_Kart_Blue",
			"Exile_Car_Kart_Orange","Exile_Car_Kart_White","Exile_Car_Kart_Yellow","Exile_Car_Kart_Black"
		]
	],
	// BOATS
	[
		"ImFX_Exile_H20_Boats",1,true,
		[
			"Exile_Boat_MotorBoat_Orange","Exile_Boat_MotorBoat_White""Exile_Boat_MotorBoat_Police"
		]
	],
	[
		"ImFX_Exile_H20_RubberDucks",1,true,
		[
			"Exile_Boat_RubberDuck_CSAT","Exile_Boat_RubberDuck_Digital","Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue","Exile_Boat_RubberDuck_Black"
		]
	],
	[
		"ImFX_Exile_H20_RHIB",1,true,
		[
			"Exile_Boat_RHIB"
		]
	],
	[
		"ImFX_Exile_H20_SDV",1,true,
		[
			"Exile_Boat_SDV_CSAT","Exile_Boat_SDV_Digital","Exile_Boat_SDV_Grey"
		]
	],
	[
		"ImFX_Exile_H20_Jetski",1,true,
		[
			"Exile_Boat_WaterScooter"
		]
	],
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	// Helicopters
	[
		"ImFX_Exile_Heli_Hellcats",1,true,
		[
			"Exile_Chopper_Hellcat_Green","Exile_Chopper_Hellcat_FIA"
		]
	],
	[
		"ImFX_Exile_Heli_UnarmedHueys",1,true,
		[
			"Exile_Chopper_Huey_Green","Exile_Chopper_Huey_Desert"
		]
	],
	[
		"ImFX_Exile_Heli_ArmedHueys",1,true,
		[
			"Exile_Chopper_Huey_Armed_Desert","Exile_Chopper_Huey_Armed_Green"
		]
	],
	[
		"ImFX_Heli_Hueys_ALL",0,false,
		[
			"ImFX_Exile_Heli_ArmedHueys", "ImFX_Exile_Heli_UnarmedHueys"
		]
	],
	[
		"ImFX_Exile_Heli_Hummingbirds",1,true,
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
		"ImFX_Exile_Heli_Hurons",1,true,
		[
			"Exile_Chopper_Huron_Black","Exile_Chopper_Huron_Green"
		]
	],
	[
		"ImFX_Exile_Heli_Mohawks",1,true,
		[
			"Exile_Chopper_Mohawk_FIA"
		]
	],
	[
		"ImFX_Exile_Heli_Orcas",1,true,
		[
			"Exile_Chopper_Orca_CSAT","Exile_Chopper_Orca_Black","Exile_Chopper_Orca_BlackCustom"
		]
	],
	[
		"ImFX_Exile_Heli_Tarus",1,true,
		[
			"Exile_Chopper_Taru_Transport_CSAT","Exile_Chopper_Taru_Transport_Black","Exile_Chopper_Taru_CSAT",
			"Exile_Chopper_Taru_Black","Exile_Chopper_Taru_Covered_CSAT","Exile_Chopper_Taru_Covered_Black"
		]
	],
	[
		"ImFX_Heli_Airdrop",0,false,
		[
			"ImFX_Exile_Heli_Hellcats", "ImFX_Exile_Heli_UnarmedHueys"
		]
	],
	[
		"ImFX_Heli_Troops",0,false,
		[
			"ImFX_Exile_Heli_UnarmedHueys", "ImFX_Exile_Heli_Hummingbirds", "ImFX_Exile_Heli_Hurons", "ImFX_Exile_Heli_Mohawks", 
			"ImFX_Exile_Heli_Orcas"
		]
	],
	[
		"ImFX_Heli_ALL",0,false,
		[
			"ImFX_Exile_Heli_Hellcats", "ImFX_Exile_Heli_Hueys_All", "ImFX_Exile_Heli_Hummingbirds", "ImFX_Heli_Hurons",
			"ImFX_Exile_Heli_Mohawks", "ImFX_Exile_Heli_Orcas", "ImFX_Exile_Heli_Tarus"
		]
	],

	// Aircraft
	[
		"ImFX_Exile_Plane_AN2",1,true,
		[
			"Exile_Plane_AN2_Green","Exile_Plane_AN2_Stripe","Exile_Plane_AN2_White"
		]
	],
	[
		"ImFX_Exile_Plane_VTOL",1,true,
		[
			"Exile_Plane_BlackfishInfantry","Exile_Plane_BlackfishVehicle"
		]
	],
	[
		"ImFX_Exile_Plane_Ceaser",1,true,
		[
			"Exile_Plane_Ceasar"
		]
	],
	[
		"ImFX_Exile_Plane_Cessnas",1,true,
		[
			"Exile_Plane_Cessna"
		]
	],
	[
		"ImFX_Plane_All",0,false,
		[
			"ImFX_Exile_Plane_Cessnas", "ImFX_Exile_Plane_VTOL", "ImFX_Exile_Plane_Ceaser", "ImFX_Exile_Plane_AN2"
		]
	],
	
	// Civilian Vehicles

	[
		"ImFX_Exile_Land_Hatchbacks",1,true,
		[
			"Exile_Car_Hatchback_Beige","Exile_Car_Hatchback_Green","Exile_Car_Hatchback_Blue",
			"Exile_Car_Hatchback_BlueCustom","Exile_Car_Hatchback_BeigeCustom","Exile_Car_Hatchback_Yellow",
			"Exile_Car_Hatchback_Grey","Exile_Car_Hatchback_Black","Exile_Car_Hatchback_Dark",
			"Exile_Car_Hatchback_Rusty1","Exile_Car_Hatchback_Rusty2","Exile_Car_Hatchback_Rusty3"
		]
	],
	[
		"ImFX_Exile_Land_SportHatchbacks",1,true,
		[
			"Exile_Car_Hatchback_Sport_Red","Exile_Car_Hatchback_Sport_Blue","Exile_Car_Hatchback_Sport_Orange",
			"Exile_Car_Hatchback_Sport_White","Exile_Car_Hatchback_Sport_Beige","Exile_Car_Hatchback_Sport_Green"
		]
	],
	[
		"ImFX_Exile_Land_Hatchbacks_ALL",0,true,
		[
			"ImFX_Exile_Land_Hatchbacks", "ImFX_Exile_Land_SportHatchbacks"
		]
	],
	[
		"ImFX_Exile_Land_Offroads",1,true,
		[
			"Exile_Car_Offroad_Red","Exile_Car_Offroad_Beige","Exile_Car_Offroad_White","Exile_Car_Offroad_Blue",
			"Exile_Car_Offroad_DarkRed","Exile_Car_Offroad_BlueCustom","Exile_Car_Offroad_Guerilla01",
			"Exile_Car_Offroad_Guerilla02","Exile_Car_Offroad_Guerilla03","Exile_Car_Offroad_Guerilla04",
			"Exile_Car_Offroad_Guerilla05","Exile_Car_Offroad_Guerilla06","Exile_Car_Offroad_Guerilla07",
			"Exile_Car_Offroad_Guerilla08","Exile_Car_Offroad_Guerilla09","Exile_Car_Offroad_Guerilla10",
			"Exile_Car_Offroad_Guerilla11","Exile_Car_Offroad_Guerilla12","Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2","Exile_Car_Offroad_Rusty3"
		]
	],
	[
		"ImFX_Exile_Land_MB4WD",1,true,
		[
			"Exile_Car_MB4WD","Exile_Car_MB4WDOpen"
		]
	],
	[
		"ImFX_Exile_Land_Quilin",1,true,
		[
			"Exile_Car_QilinUnarmed"
		]
	],
	[
		"ImFX_Exile_Land_SUV",1,true,
		[
			"Exile_Car_SUV_Red","Exile_Car_SUV_Black","Exile_Car_SUV_Grey","Exile_Car_SUV_Orange",
			"Exile_Car_SUVXL_Black"
		]
	],
	[

		"ImFX_Exile_Land_Vans",1,true,
		[
			"Exile_Car_Van_Red", "Exile_Car_Van_Guerilla01", "Exile_Car_Van_Guerilla02", "Exile_Car_Van_Guerilla03",
			"Exile_Car_Van_Guerilla04",	"Exile_Car_Van_Guerilla05","Exile_Car_Van_Guerilla06",
			"Exile_Car_Van_Guerilla07",	"Exile_Car_Van_Guerilla08","Exile_Car_Van_Black","Exile_Car_Van_White"
		]
	],
	[
		"ImFX_Exile_Land_Ikarus",1,true,
		[
			"Exile_Car_Ikarus_Blue","Exile_Car_Ikarus_Red","Exile_Car_Ikarus_Party"
		]
	],
	[
		"ImFX_Exile_Land_Tractors",1,true,
		[
			"Exile_Car_Tractor_Red","Exile_Car_OldTractor_Red","Exile_Car_TowTractor_White"
		]
	],
	[
		"ImFX_Exile_Land_Golf",1,true,
		[
			"Exile_Car_Golf_Black","Exile_Car_Golf_Red"
		]
	],
	[
		"ImFX_Exile_Land_Octavius",1,true,
		[
			"Exile_Car_Octavius_White","Exile_Car_Octavius_Black"
		]
	],
	[
		"ImFX_Exile_Land_UAZs",1,true,
		[
			"Exile_Car_UAZ_Green","Exile_Car_UAZ_Open_Green"
		]
	],
	[
		"ImFX_Exile_Land_V3S",1,true,
		[
			"Exile_Car_V3S_Covered","Exile_Car_V3S_Open"
		]
	],
	[

		"ImFX_Exile_Land_LandRover",1,true,
		[
			"Exile_Car_LandRover_Red","Exile_Car_LandRover_Urban","Exile_Car_LandRover_Green",
			"Exile_Car_LandRover_Sand","Exile_Car_LandRover_Desert"
		]
	],
	[
		"ImFX_Exile_Land_Ambulance",1,true,
		[
			"Exile_Car_LandRover_Ambulance_Green","Exile_Car_LandRover_Ambulance_Desert", 
			"Exile_Car_LandRover_Ambulance_Sand"
		]
	],
	[
		"ImFX_Exile_Land_Ladas",1,true,
		[
			"Exile_Car_Lada_Green","Exile_Car_Lada_Taxi","Exile_Car_Lada_Red","Exile_Car_Lada_Hipster",
			"Exile_Car_Lada_White"
		]
	],
	[
		"ImFX_Exile_Land_Volhas",1,true,
		[
			"Exile_Car_Volha_White","Exile_Car_Volha_Blue","Exile_Car_Volha_Black"
		]
	],
	[
		"ImFX_Land_Work",0,false,
		[
			"ImFX_Exile_Land_Tractors", "ImFX_Exile_Land_Ikarus", "ImFX_Exile_Land_Ambulance"
		]
	],
	[
		"ImFX_Land_Cars",0,false,
		[
			"ImFX_Exile_Land_Hatchbacks_ALL", "ImFX_Exile_Land_SUV", "ImFX_Exile_Land_Vans", "ImFX_Exile_Land_Octavius", 
			"ImFX_Exile_Land_Ladas", "ImFX_Exile_Land_Volhas"
		]
	],
	[
		"ImFX_Land_Trucks",0,false,
		[
			"ImFX_Exile_Land_Offroads", "ImFX_Exile_Land_MB4WD", "ImFX_Exile_Land_Quilin", "ImFX_Exile_Land_UAZs", "ImFX_Exile_Land_V3S", 
			"ImFX_Exile_Land_LandRover"
		]
	],
	[
		"ImFX_Land_All",0,false,
		[
			"ImFX_Land_Work", "ImFX_Land_Cars", "ImFX_Land_Trucks"
		]
	],
	// Civilian Work Vehicles
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////
	[	
		"ImFX_Work_RepairOffroads",1,true,
		[
			"Exile_Car_Offroad_Repair_Guerilla01", "Exile_Car_Offroad_Repair_Guerilla02", "Exile_Car_Offroad_Repair_Guerilla03",
			"Exile_Car_Offroad_Repair_Guerilla04", "Exile_Car_Offroad_Repair_Guerilla05", "Exile_Car_Offroad_Repair_Guerilla06",
			"Exile_Car_Offroad_Repair_Guerilla07", "Exile_Car_Offroad_Repair_Guerilla08", "Exile_Car_Offroad_Repair_Guerilla09",
			"Exile_Car_Offroad_Repair_Guerilla10", "Exile_Car_Offroad_Repair_Guerilla11", "Exile_Car_Offroad_Repair_Guerilla12",
			"Exile_Car_Offroad_Repair_Civillian", "Exile_Car_Offroad_Repair_Red", "Exile_Car_Offroad_Repair_Beige",
			"Exile_Car_Offroad_Repair_White", "Exile_Car_Offroad_Repair_Blue", "Exile_Car_Offroad_Repair_DarkRed",
			"Exile_Car_Offroad_Repair_BlueCustom" 
		]
	],
	[
		"ImFX_Work_BoxVans",1,true,
		[
			"Exile_Car_Van_Box_Guerilla01", "Exile_Car_Van_Box_Guerilla02", "Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04", "Exile_Car_Van_Box_Guerilla05", "Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07", "Exile_Car_Van_Box_Guerilla08", "Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White","Exile_Car_Van_Box_Red"
		]
	],
	[
		"ImFX_Work_FuelVans",1,true,
		[
			"Exile_Car_Van_Fuel_Black", "Exile_Car_Van_Fuel_White", "Exile_Car_Van_Fuel_Red",
			"Exile_Car_Van_Fuel_Guerilla01", "Exile_Car_Van_Fuel_Guerilla02", "Exile_Car_Van_Fuel_Guerilla03"
		]
	],
	[
		"ImFX_Work_All",0,true,
		[
			"ImFX_Work_RepairOffroads", "ImFX_Work_BoxVans", "ImFX_Work_FuelVans"
		]
	],

	// Military Vehicles
	[
		"ImFX_Mil_ArmedOffroads",1,true,
		[
			"Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_Offroad_Armed_Guerilla02","Exile_Car_Offroad_Armed_Guerilla03",
			"Exile_Car_Offroad_Armed_Guerilla04","Exile_Car_Offroad_Armed_Guerilla05","Exile_Car_Offroad_Armed_Guerilla06",
			"Exile_Car_Offroad_Armed_Guerilla07","Exile_Car_Offroad_Armed_Guerilla08","Exile_Car_Offroad_Armed_Guerilla09",
			"Exile_Car_Offroad_Armed_Guerilla10","Exile_Car_Offroad_Armed_Guerilla11","Exile_Car_Offroad_Armed_Guerilla12"
		]
	],
	[
		"ImFX_Mil_UnarmedOffroads",1,true,
		[
			"Exile_Car_Offroad_Guerilla01",	"Exile_Car_Offroad_Guerilla02",	"Exile_Car_Offroad_Guerilla03",	
			"Exile_Car_Offroad_Guerilla04",	"Exile_Car_Offroad_Guerilla05",	"Exile_Car_Offroad_Guerilla06",	
			"Exile_Car_Offroad_Guerilla07",	"Exile_Car_Offroad_Guerilla08",	"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",	"Exile_Car_Offroad_Guerilla11",	"Exile_Car_Offroad_Guerilla12"
		]
	],
	[
		"ImFX_Mil_HMMWV_Armed",1,true,
		[
			"Exile_Car_HMMWV_M134_Desert","Exile_Car_HMMWV_M134_Green","Exile_Car_HMMWV_M2_Desert",
			"Exile_Car_HMMWV_M2_Green"
		]
	],
	[
		"ImFX_Mil_HMMWV_Unarmed",1,true,
		[
			"Exile_Car_HMMWV_MEV_Desert","Exile_Car_HMMWV_MEV_Green","Exile_Car_HMMWV_UNA_Desert",
			"Exile_Car_HMMWV_UNA_Green"
		]
	],
	[
		"ImFX_Mil_HMMWV_ALL",0,true,
		[
			"ImFX_Mil_HMMWV_Armed", "ImFX_Mil_HMMWV_Unarmed"
		]
	],
	[
		"ImFX_Mil_SUV_Armed",1,true,
		[
			"Exile_Car_SUV_Armed_Black"
		]
	],
	[

		"ImFX_Mil_BTR_Armed",1,true,
		[
			"Exile_Car_BTR40_MG_Camo","Exile_Car_BTR40_MG_Green"
		]
	],
	[
		"ImFX_Mil_BTR_Unarmed",1,true,
		[
			"Exile_Car_BTR40_Camo","Exile_Car_BTR40_Green"
		]
	],
	[
		"ImFX_Mil_BTR_ALL",0,true,
		[
			"ImFX_Mil_BTR_Armed", "ImFX_Mil_BTR_Unarmed"
		]
	],
	[
		"ImFX_Mil_OpenUral",1,true,
		[
			"Exile_Car_Ural_Open_Worker","Exile_Car_Ural_Open_Yellow","Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Open_Military"
		]
	],
	[
		"ImFX_Land_CoveredUral",1,true,
		[
			"Exile_Car_Ural_Covered_Worker","Exile_Car_Ural_Covered_Blue","Exile_Car_Ural_Covered_Yellow",
			"Exile_Car_Ural_Covered_Military"
		]
	],
	[
		"ImFX_Mil_Ural_ALL",0,true,
		[
			"ImFX_Mil_OpenUral", "ImFX_Mil_CoveredUral"
		]
	],
	[
		"ImFX_Mil_Hemmts",1,true,
		[
			"Exile_Car_HEMMT"
		]
	],
	[
		"ImFX_Mil_Hunters",1,true,
		[
			"Exile_Car_Hunter"
		]
	],
	[
		"ImFX_Mil_Ifrits",1,true,
		[
			"Exile_Car_Ifrit"
		]
	],
	[
		"ImFX_Mil_Striders",1,true,
		[
			"Exile_Car_Strider"
		]
	],
	[
		"ImFX_Mil_Tempests",1,true,
		[
			"Exile_Car_Tempest"
		]
	],
	[
		"ImFX_Mil_Zamaks",1,true,
		[
			"Exile_Car_Zamak"
		]
	],
	[
		"ImFX_Mil_Prowler",1,true,
		[
			"Exile_Car_ProwlerLight","Exile_Car_ProwlerUnarmed"
		]
	],
	[
		"ImFX_Mil_BRDM",1,true,
		[
			"Exile_Car_BRDM2_HQ"
		]
	],
	[

		// CONFIRM UNARMED!
		"ImFX_Mil_Unarmed",0,true,
		[
			"ImFX_Mil_BTR_Unarmed", "ImFX_Mil_HMMWV_Unarmed", "ImFX_Mil_Hemmts", "ImFX_Mil_Hunters", 
			"ImFX_Mil_Ifrits", "ImFX_Mil_Striders", "ImFX_Mil_Tempests", "ImFX_Mil_Zamaks", "ImFX_Mil_Prowler"
		]
	],
	[
		"ImFX_Mil_Armed",0,true,
		[
			"ImFX_Mil_ArmedOffroads", "ImFX_Mil_HMMWV_Armed", "ImFX_Mil_BTR_Armed",	"ImFX_Mil_BRDM", 
			"ImFX_Mil_SUV_Armed"
		]
	],
	[
		"ImFX_Mil_All",0,true,
		[
			"ImFX_Mil_Unarmed", "ImFX_Mil_Armed"
		]
	],







////////////////////////////////////////////////////////////






	[
		"ImFX_Air_Patrol",1,false,
		[
			// AN-2
			"Exile_Plane_AN2_Green",
			"Exile_Plane_AN2_White",
			"Exile_Plane_AN2_Stripe",
			"An2_tk",
			"An2_af",
			"An2_a2",	
			// Cessna 185 Skymaster (armed)
			"GNT_C185T"
		]
	],
	[	
		"ImFX_Air_Interceptor",1,false,
		[
		]
	],
	[	
		"ImFX_Air_Rescue_Heli",1,false,
		[
		]
	],
	/////////////////////////// DAPE Loot Table
	[	
		"ImFX_DAPE_lootItems",1,false,
		[
			"Exile_Item_InstaDoc","Exile_Item_Vishpirin","Exile_Item_Bandage"
		]
	],
	[	// Uniforms that "Bambi" class can wear 
		"ImFX_Uniform_Bambi",1,false,
		[
			"Exile_Uniform_BambiOverall"
		]
	]

];

/*
Exile_Melee_Abstract
Exile_Melee_Axe
Exile_Melee_Shovel
Exile_Melee_SledgeHammer
Exile_Uniform_ExileCustoms
Exile_Casino_TwinkleTwister
Exile_ConcreteMixer
Exile_Construction_Abstract_Physics
Exile_Construction_Abstract_Static
Exile_Construction_BaseCamera_Preview
Exile_Construction_BaseCamera_Static
Exile_Construction_CamoTent_Preview
Exile_Construction_CampFire_Preview
Exile_Construction_CampFire_Static
Exile_Construction_ConcreteDoor_Preview
Exile_Construction_ConcreteDoor_Static
Exile_Construction_ConcreteDoorway_Preview
Exile_Construction_ConcreteDoorway_Static
Exile_Construction_ConcreteFloor_Preview
Exile_Construction_ConcreteFloor_Static
Exile_Construction_ConcreteFloorHatch_Preview
Exile_Construction_ConcreteFloorHatch_Static
Exile_Construction_ConcreteFloorPort_Preview
Exile_Construction_ConcreteFloorPort_Static
Exile_Construction_ConcreteGate_Preview
Exile_Construction_ConcreteGate_Static
Exile_Construction_ConcreteStairs_Preview
Exile_Construction_ConcreteStairs_Static
Exile_Construction_ConcreteSupport_Preview
Exile_Construction_ConcreteSupport_Static
Exile_Construction_ConcreteWall_Preview
Exile_Construction_ConcreteWall_Static
Exile_Construction_ConcreteWindow_Preview
Exile_Construction_ConcreteWindow_Static
Exile_Construction_ConcreteWindowHatch_Preview
Exile_Construction_ConcreteWindowHatch_Static
Exile_Construction_Flag_Preview
Exile_Construction_Flag_Static
Exile_Construction_FloodLight_Preview
Exile_Construction_FloodLight_Static
Exile_Construction_HBarrier5_Preview
Exile_Construction_HBarrier5_Static
Exile_Construction_Laptop_Preview
Exile_Construction_Laptop_Static
Exile_Construction_MetalHedgehog_Preview
Exile_Construction_MetalHedgehog_Static
Exile_Construction_PortableGenerator_Preview
Exile_Construction_PortableGenerator_Static
Exile_Construction_RazorWire_Preview
Exile_Construction_Safe_Preview
Exile_Construction_SandBags_Corner_Preview
Exile_Construction_SandBags_Corner_Static
Exile_Construction_SandBags_Long_Preview
Exile_Construction_SandBags_Long_Static
Exile_Construction_StorageCrate_Preview
Exile_Construction_SupplyBox_Preview
Exile_Construction_WaterBarrel_Preview
Exile_Construction_WaterBarrel_Static
Exile_Construction_WiredFence_Preview
Exile_Construction_WiredFence_Static
Exile_Construction_WoodDoor_Preview
Exile_Construction_WoodDoor_Reinforced_Preview
Exile_Construction_WoodDoor_Reinforced_Static
Exile_Construction_WoodDoor_Static
Exile_Construction_WoodDoorway_Preview
Exile_Construction_WoodDoorway_Reinforced_Preview
Exile_Construction_WoodDoorway_Reinforced_Static
Exile_Construction_WoodDoorway_Static
Exile_Construction_WoodFloor_Preview
Exile_Construction_WoodFloor_Reinforced_Preview
Exile_Construction_WoodFloor_Reinforced_Static
Exile_Construction_WoodFloor_Static
Exile_Construction_WoodFloorPort_Preview
Exile_Construction_WoodFloorPort_Static
Exile_Construction_WoodGate_Preview
Exile_Construction_WoodGate_Reinforced_Preview
Exile_Construction_WoodGate_Reinforced_Static
Exile_Construction_WoodGate_Static
Exile_Construction_WoodStairs_Preview
Exile_Construction_WoodStairs_Static
Exile_Construction_WoodSupport_Preview
Exile_Construction_WoodSupport_Static
Exile_Construction_WoodWall_Preview
Exile_Construction_WoodWall_Reinforced_Preview
Exile_Construction_WoodWall_Reinforced_Static
Exile_Construction_WoodWall_Static
Exile_Construction_WoodWallHalf_Preview
Exile_Construction_WoodWallHalf_Reinforced_Preview
Exile_Construction_WoodWallHalf_Reinforced_Static
Exile_Construction_WoodWallHalf_Static
Exile_Construction_WoodWindow_Preview
Exile_Construction_WoodWindow_Reinforced_Preview
Exile_Construction_WoodWindow_Reinforced_Static
Exile_Construction_WoodWindow_Static
Exile_Construction_WorkBench_Preview
Exile_Construction_WorkBench_Static
Exile_Container_Abstract
Exile_Container_CamoTent
Exile_Container_Safe
Exile_Container_Storagecrate
Exile_Container_SupplyBox
Exile_Cosmetic_Axe
Exile_Cosmetic_BBQSandwich
Exile_Cosmetic_BeefParts
Exile_Cosmetic_Beer
Exile_Cosmetic_CatFood
Exile_Cosmetic_Cheathas
Exile_Cosmetic_CockONut
Exile_Cosmetic_DogFood
Exile_Cosmetic_EMRE
Exile_Cosmetic_EnergyDrink
Exile_Cosmetic_Foolbox
Exile_Cosmetic_GasMask
Exile_Cosmetic_InstantCoffee
Exile_Cosmetic_Knife
Exile_Cosmetic_MacasCheese
Exile_Cosmetic_Magazine01
Exile_Cosmetic_Magazine02
Exile_Cosmetic_Magazine03
Exile_Cosmetic_Magazine04
Exile_Cosmetic_MG
Exile_Cosmetic_Moobar
Exile_Cosmetic_PopTabs
Exile_Cosmetic_PowerDrink
Exile_Cosmetic_Raisins
Exile_Cosmetic_Shovel
Exile_Cosmetic_SledgeHammer
Exile_Cosmetic_Surstromming
Exile_Cosmetic_UAV
Exile_Guard_01
Exile_Guard_02
Exile_Guard_03
Exile_Guard_Abstract
Exile_Helper_175mSafeZone
Exile_Helper_50mBox
Exile_Locker
Exile_Loot_XmasPresent_Abstract
Exile_Loot_XmasPresent_Blue
Exile_Loot_XmasPresent_Gold
Exile_Loot_XmasPresent_Green
Exile_Loot_XmasPresent_Magenta
Exile_Loot_XmasPresent_Mint
Exile_Loot_XmasPresent_Pink
Exile_Loot_XmasPresent_Purple
Exile_Loot_XmasPresent_Red
Exile_Unit_Abstract
Exile_Unit_ExileCustoms
Exile_Unit_GhostPlayer
Exile_Unit_Player
Exile_Unit_Wetsuit_AAF
Exile_Unit_Wetsuit_CSAT
Exile_Unit_Wetsuit_NATO
Exile_Unit_Woodland

	///////////////////////////////////////////////////////////////////////////////
	// Hardware
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_CamoTentKit					{ quality = 1; price = 250; };
	class Exile_Item_CodeLock						{ quality = 1; price = 5000; };
	class Exile_Item_DuctTape						{ quality = 1; price = 300; };
	class Exile_Item_ExtensionCord					{ quality = 1; price = 40; };
	class Exile_Item_FuelCanisterEmpty				{ quality = 1; price = 40; };
	class Exile_Item_JunkMetal						{ quality = 1; price = 400; };
	class Exile_Item_LightBulb						{ quality = 1; price = 20; };
	class Exile_Item_MetalBoard						{ quality = 1; price = 600; };
	class Exile_Item_MetalPole						{ quality = 1; price = 800; };
	class Exile_Item_MetalScrews					{ quality = 1; price = 100; };
	class Exile_Item_Rope							{ quality = 1; price = 20; };
	class Exile_Item_SafeKit						{ quality = 4; price = 25000; };
	//class Exile_Item_BaseCameraKit				{ quality = 2; price = 5000; };
	//class Exile_Item_CarWheel						{ quality = 1; price = 1000; };
	//class Exile_Item_Cement						{ quality = 1; price = 20; };
	//class Exile_Item_Laptop						{ quality = 2; price = 9000; };
	//class Exile_Item_MetalHedgehogKit				{ quality = 1; price = 1200; };
	//class Exile_Item_MetalWire					{ quality = 1; price = 100; };
	//class Exile_Item_Sand							{ quality = 1; price = 20; };

	// Added in 1.0.3, but not used
	//class Exile_Item_Bullets_556					{ quality = 2; price = 5; };
	//class Exile_Item_Bullets_762					{ quality = 2; price = 5; };
	//class Exile_Item_BurlapSack					{ quality = 2; price = 5; };
	//class Exile_Item_SprayCan_Black				{ quality = 2; price = 20; };
	//class Exile_Item_SprayCan_Blue				{ quality = 2; price = 20; };
	//class Exile_Item_SprayCan_Green				{ quality = 2; price = 20; };
	//class Exile_Item_SprayCan_Red					{ quality = 2; price = 20; };
	//class Exile_Item_SprayCan_White				{ quality = 2; price = 20; };
	//class Exile_Item_WeaponParts					{ quality = 2; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Food
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_AlsatianSteak_Cooked			{ quality = 4; price = 230; }; //100, 30
	class Exile_Item_AlsatianSteak_Raw				{ quality = 2; price = 115; };	//15, 30
	class Exile_Item_BBQSandwich					{ quality = 3; price = 20; }; //40, 60
	class Exile_Item_BeefParts						{ quality = 2; price = 18; }; //30, 30
	class Exile_Item_Can_Empty						{ quality = 1; price = 1; sellPrice = 1; };
	class Exile_Item_CatSharkFilet_Cooked			{ quality = 4; price = 230; }; //100, 30
	class Exile_Item_CatSharkFilet_Raw				{ quality = 2; price = 125; }; //25, 30
	class Exile_Item_Catfood						{ quality = 2; price = 24; }; //40, 40
	class Exile_Item_Cheathas						{ quality = 2; price = 18; }; //30, 30
	class Exile_Item_ChickenFilet_Cooked			{ quality = 3; price = 205; }; //70, 30
	class Exile_Item_ChickenFilet_Raw				{ quality = 2; price = 110; }; //10, 30
	class Exile_Item_ChristmasTinner				{ quality = 3; price = 20; }; //40, 60
	class Exile_Item_Dogfood						{ quality = 2; price = 18; }; //30, 30
	class Exile_Item_EMRE							{ quality = 3; price = 54; }; //75, 60
	class Exile_Item_FinSteak_Cooked				{ quality = 4; price = 230; }; //100, 30
	class Exile_Item_FinSteak_Raw					{ quality = 2; price = 115; }; //15, 30
	class Exile_Item_GloriousKnakworst				{ quality = 3; price = 40; }; //60, 30
	class Exile_Item_GoatSteak_Cooked				{ quality = 4; price = 230; }; //100, 30
	class Exile_Item_GoatSteak_Raw					{ quality = 2; price = 115; }; //15, 30
	class Exile_Item_InstantCoffee					{ quality = 1; price = 20; }; //5, 10
	class Exile_Item_MacasCheese					{ quality = 3; price = 20; }; //40, 60
	class Exile_Item_MackerelFilet_Cooked			{ quality = 3; price = 190; }; //55, 30
	class Exile_Item_MackerelFilet_Raw				{ quality = 2; price = 108; }; //5, 30
	class Exile_Item_Moobar							{ quality = 1; price = 8; }; //10, 30
	class Exile_Item_MulletFilet_Cooked				{ quality = 3; price = 200; }; //65, 30
	class Exile_Item_MulletFilet_Raw				{ quality = 2; price = 108; }; //5, 30
	class Exile_Item_Noodles						{ quality = 1; price = 14; }; //25, 50
	class Exile_Item_OrnateFilet_Cooked				{ quality = 3; price = 180; }; //40, 30
	class Exile_Item_OrnateFilet_Raw				{ quality = 2; price = 108; }; //5, 30
	class Exile_Item_RabbitSteak_Cooked				{ quality = 3; price = 215; }; //80, 30
	class Exile_Item_RabbitSteak_Raw				{ quality = 2; price = 108; }; //5, 30
	class Exile_Item_Raisins						{ quality = 1; price = 10; }; //15, 30
	class Exile_Item_RoosterFilet_Cooked			{ quality = 3; price = 205; }; //70, 30
	class Exile_Item_RoosterFilet_Raw				{ quality = 2; price = 110; }; //10, 30
	class Exile_Item_SalemaFilet_Cooked				{ quality = 3; price = 200; }; //65, 30
	class Exile_Item_SalemaFilet_Raw				{ quality = 2; price = 108; }; //5, 30
	class Exile_Item_SausageGravy					{ quality = 3; price = 30; }; //50, 25
	class Exile_Item_SeedAstics						{ quality = 1; price = 12; }; //20, 40
	class Exile_Item_SheepSteak_Cooked				{ quality = 4; price = 230; }; //100, 30
	class Exile_Item_SheepSteak_Raw					{ quality = 2; price = 115; }; //15, 30
	class Exile_Item_SnakeFilet_Cooked				{ quality = 3; price = 180; }; //40, 30
	class Exile_Item_SnakeFilet_Raw					{ quality = 2; price = 108; }; //5, 30
	class Exile_Item_Surstromming					{ quality = 3; price = 34; }; //55, 25
	class Exile_Item_TunaFilet_Cooked				{ quality = 3; price = 220; }; //90, 30
	class Exile_Item_TunaFilet_Raw					{ quality = 2; price = 120; }; //20, 30
	class Exile_Item_TurtleFilet_Cooked				{ quality = 4; price = 230; }; //100, 30
	class Exile_Item_TurtleFilet_Raw				{ quality = 2; price = 115; }; //15, 30

	///////////////////////////////////////////////////////////////////////////////
	// Drinks
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Beer 							{ quality = 1; price = 50; }; //75, 30
	class Exile_Item_ChocolateMilk					{ quality = 1; price = 25; }; //75, 20
	class Exile_Item_EnergyDrink					{ quality = 1; price = 40; }; //75, 20
	class Exile_Item_MountainDupe					{ quality = 1; price = 30; }; //50, 20
	class Exile_Item_PlasticBottleCoffee	 		{ quality = 3; price = 70; sellPrice = 10; };//100, 60
	class Exile_Item_PlasticBottleEmpty				{ quality = 1; price = 4; };
	class Exile_Item_PlasticBottleFreshWater 		{ quality = 2; price = 50; sellPrice = 4; }; //80, 15
	class Exile_Item_PowerDrink						{ quality = 3; price = 60; }; //95, 10

	///////////////////////////////////////////////////////////////////////////////
	// First Aid
	///////////////////////////////////////////////////////////////////////////////
						{ quality = 3; price = 300; };

	//class Exile_Item_Defibrillator				{ quality = 1; price = 7500; };

	///////////////////////////////////////////////////////////////////////////////
	// Tools
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_CanOpener						{ quality = 1; price = 80; };
	class Exile_Item_CookingPot						{ quality = 2; price = 80; };
	class Exile_Item_Foolbox						{ quality = 2; price = 4000; };
	class Exile_Item_Grinder						{ quality = 2; price = 1250; };
	class Exile_Item_Handsaw						{ quality = 2; price = 500; };
	class Exile_Item_Matches 						{ quality = 1; price = 60; };
	class Exile_Item_Pliers							{ quality = 2; price = 350; };
	class Exile_Melee_Axe							{ quality = 2; price = 100; };
	class Exile_Melee_SledgeHammmer					{ quality = 3; price = 500; };
	//class Exile_Item_CordlessScrewdriver			{ quality = 1; price = 750; };
	//class Exile_Item_FireExtinguisher				{ quality = 1; price = 650; };
	//class Exile_Item_Hammer						{ quality = 1; price = 600; };
	//class Exile_Item_OilCanister					{ quality = 1; price = 1750; };
	//class Exile_Item_Screwdriver					{ quality = 1; price = 250; };
	//class Exile_Item_Shovel						{ quality = 1; price = 700; };
	//class Exile_Item_SleepingMat					{ quality = 1; price = 1250; };
	//class Exile_Item_ToiletPaper					{ quality = 1; price = 5; };
	//class Exile_Item_Wrench						{ quality = 1; price = 250; };
	//class Exile_Item_ZipTie						{ quality = 1; price = 250; };





*/

/////////////////////////////
// Cart processing //////////
/////////////////////////////
_hold = [_cartName,_immersionData,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): ImmersionFX.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};