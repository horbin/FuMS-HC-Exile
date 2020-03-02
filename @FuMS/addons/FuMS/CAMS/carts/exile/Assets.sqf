// Assets.sqf
// TheOneWhoKnocks
// Overwrites or appends the global variables used by FrSB to generate various elements of the system

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



_cartContents = 
[	
	[
		"CAMS_Exile_Pistols",5,true,
		[
			"Exile_Weapon_Colt1911","Exile_Weapon_Taurus","Exile_Weapon_TaurusGold","Exile_Weapon_Makarov"
		]
	],
	[
		"CAMS_Pistols",0,false,
		[
			"CAMS_Exile_Pistols"
		]
	],	
	/*
	This could have been done directly if you don't need to create the cart specific group.  This will save a step and some memory
	[
		"CAMS_Pistols",5,false,
		[
			"Exile_Weapon_Colt1911","Exile_Weapon_Taurus","Exile_Weapon_TaurusGold","Exile_Weapon_Makarov"
		]
	],	
	*/
	[
		"CAMS_Exile_Shotguns",3,true,
		[
			"Exile_Weapon_M1014"
		]
	],
	[
		"CAMS_Shotguns",0,false,
		[
			"CAMS_Exile_Shotguns"
		]
	],	
	[
		"CAMS_Exile_SubMGs",3,true,
		[
			"Exile_Weapon_SA61"
		]
	],
	[
		"CAMS_SubMGs",0,false,
		[
			"CAMS_Exile_SubMGs"
		]
	],	
	[
		"CAMS_Exile_LightMGs",3,true,
		[
			"Exile_Weapon_PK","Exile_Weapon_PKP","Exile_Weapon_RPK"
		]
	],	
	[
		"CAMS_LightMGs",0,false,
		[
			"CAMS_Exile_LightMGs"
		]
	],	
	[
		"CAMS_Exile_AssaultRifles",3,true,
		[
			"Exile_Weapon_AK107","Exile_Weapon_AK107_GL","Exile_Weapon_AK47","Exile_Weapon_AK74","Exile_Weapon_AK74_GL","Exile_Weapon_AKM",
			"Exile_Weapon_AKS","Exile_Weapon_AKS_Gold","Exile_Weapon_M16A2","Exile_Weapon_M16A4","Exile_Weapon_M4"
		]
	],	
	[
		"CAMS_AssaultRifles",0,false,
		[
			"CAMS_Exile_AssaultRifles"
		]
	],	
	[
		"CAMS_Exile_SniperRifles",3,true,
		[
			"Exile_Weapon_CZ550","Exile_Weapon_SVD","Exile_Weapon_SVDCamo","Exile_Weapon_VSSVintorez","Exile_Weapon_DMR",
			"Exile_Weapon_LeeEnfield","Exile_Weapon_m107","Exile_Weapon_ksvk"
		]
	],	
	[
		"CAMS_SniperRifles",0,true,
		[
			"CAMS_Exile_SniperRifles"
		]
	],	
	
	// Don't forget to add to _ALL groups as needed
	[
		"CAMS_Rifles_ALL",0,false,
		[
			"CAMS_Exile_LightMGs", "CAMS_Exile_AssaultRifles", "CAMS_Exile_SniperRifles"
		]
	],	
	[
		"CAMS_Guns_ALL",0,false,
		[
			"CAMS_Exile_SubMGs","CAMS_Exile_Pistols","CAMS_Exile_Shotguns","CAMS_Exile_LightMGs","CAMS_Exile_AssaultRifles","CAMS_Exile_SniperRifles"
		]
	],	
	
	
	
	
	
	[
		"CAMS_H_Exile_Hats",4,true,
		[
			"Exile_Headgear_SafetyHelmet","Exile_Headgear_SantaHat"
		]
	],
	[
		"CAMS_H_Hats",0,false,
		[
			"CAMS_H_Exile_Hats"
		]
	],	
	
	///////////////////////// Vehicles
	//  Toy / small / man powered type vehicles
	[
		"CAMS_Toy_Bikes",1,false,
		[
			"Exile_Bike_OldBike","Exile_Bike_MountainBike"
		]
	],
	[
		"CAMS_Toy_Quads",1,true,
		[
			"Exile_Bike_QuadBike_Black","Exile_Bike_QuadBike_Blue","Exile_Bike_QuadBike_Red","Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato","Exile_Bike_QuadBike_Csat","Exile_Bike_QuadBike_Fia","Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02"
		]
	],
	[
		"CAMS_Toy_Karts",1,true,
		[
			"Exile_Car_Kart_BluKing","Exile_Car_Kart_RedStone","Exile_Car_Kart_Vrana","Exile_Car_Kart_Green","Exile_Car_Kart_Blue",
			"Exile_Car_Kart_Orange","Exile_Car_Kart_White","Exile_Car_Kart_Yellow","Exile_Car_Kart_Black"
		]
	],
	[
		"CAMS_Toy_All",0,false,
		[
			"CAMS_Toy_Bikes", "CAMS_Toy_Quads", "CAMS_Toy_Karts"
		]
	],
	// BOATS
	[
		"CAMS_Exile_H20_Boats",1,true,
		[
			"Exile_Boat_MotorBoat_Orange","Exile_Boat_MotorBoat_White""Exile_Boat_MotorBoat_Police"
		]
	],
	[
		"CAMS_H20_RubberDucks",1,true,
		[
			"Exile_Boat_RubberDuck_CSAT","Exile_Boat_RubberDuck_Digital","Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue","Exile_Boat_RubberDuck_Black"
		]
	],
	[
		"CAMS_H20_RHIB",1,true,
		[
			"Exile_Boat_RHIB"
		]
	],
	[
		"CAMS_H20_SDV_I",1,true,
		[
			"Exile_Boat_SDV_CSAT","Exile_Boat_SDV_Digital","Exile_Boat_SDV_Grey"
		]
	],
	[
		"CAMS_H20_Jetski",1,true,
		[
			"Exile_Boat_WaterScooter"
		]
	],
	[
		"CAMS_H20_All",0,false,
		[
			"CAMS_Exile_H20_Boats", "CAMS_Exile_H20_RubberDucks", "CAMS_Exile_H20_SDVs", "CAMS_Exile_H20_RHIB" , "CAMS_Exile_H20_Jetski"
		]
	],
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	// Helicopters
	[
		"CAMS_Exile_Heli_Hellcats",1,true,
		[
			"Exile_Chopper_Hellcat_Green","Exile_Chopper_Hellcat_FIA"
		]
	],
	[
		"CAMS_Exile_Heli_UnarmedHueys",1,true,
		[
		"Exile_Chopper_Huey_Green","Exile_Chopper_Huey_Desert"
		]
	],
	[
		"CAMS_Exile_Heli_ArmedHueys",1,true,
		[
			"Exile_Chopper_Huey_Armed_Desert","Exile_Chopper_Huey_Armed_Green"
		]
	],
	[
		"CAMS_Exile_ Heli_Hueys_ALL",0,true,
		[
			"CAMS_Heli_ArmedHueys", "CAMS_Heli_UnarmedHueys"
		]
	],
	[
		"CAMS_Heli_Hummingbirds",1,true,
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
		"CAMS_Heli_Hurons",1,true,
		[
			"Exile_Chopper_Huron_Black","Exile_Chopper_Huron_Green"
		]
	],
	[
		"CAMS_Heli_Mohawks",1,true,
		[
			"Exile_Chopper_Mohawk_FIA"
		]
	],
	[
		"CAMS_Heli_Orcas",1,true,
		[
			"Exile_Chopper_Orca_CSAT","Exile_Chopper_Orca_Black","Exile_Chopper_Orca_BlackCustom"
		]
	],
	[
		"CAMS_Heli_Tarus",1,true,
		[
			"Exile_Chopper_Taru_Transport_CSAT","Exile_Chopper_Taru_Transport_Black","Exile_Chopper_Taru_CSAT",
			"Exile_Chopper_Taru_Black","Exile_Chopper_Taru_Covered_CSAT","Exile_Chopper_Taru_Covered_Black"
		]
	],
	[
		"CAMS_Heli_Airdrop",0,true,
		[
			"CAMS_Heli_Hellcats", "CAMS_Heli_UnarmedHueys"
		]
	],
	[
		"CAMS_Heli_Troops",0,true,
		[
			"CAMS_Heli_UnarmedHueys", "CAMS_Heli_Hummingbirds", "CAMS_Heli_Hurons", "CAMS_Heli_Mohawks", 
			"CAMS_Heli_Orcas"
		]
	],
	[
		"CAMS_Heli_ALL",0,true,
		[
			"CAMS_Heli_Hellcats", "CAMS_Heli_Hueys_All", "CAMS_Heli_Hummingbirds", "CAMS_Heli_Hurons",
			"CAMS_Heli_Mohawks", "CAMS_Heli_Orcas", "CAMS_Heli_Tarus"
		]
	],

	// Aircraft
	[
		"CAMS_Plane_AN2",1,true,
		[
			"Exile_Plane_AN2_Green","Exile_Plane_AN2_Stripe","Exile_Plane_AN2_White"
		]
	],
	[
		"CAMS_Plane_VTOL",1,true,
		[
			"Exile_Plane_BlackfishInfantry","Exile_Plane_BlackfishVehicle"
		]
	],
	[
		"CAMS_Plane_Ceaser",1,true,
		[
			"Exile_Plane_Ceasar"
		]
	],
	[
		"CAMS_Plane_Cessnas",1,true,
		[
			"Exile_Plane_Cessna"
		]
	],
	[
		"CAMS_Plane_All",0,true,
		[
			"CAMS_Plane_Cessnas", "CAMS_Plane_VTOL", "CAMS_Plane_Ceaser", "CAMS_Plane_AN2"
		]
	],
	
	// Civilian Vehicles

	[
		"CAMS_Civ_Hatchbacks",1,true,
		[
			"Exile_Car_Hatchback_Beige","Exile_Car_Hatchback_Green","Exile_Car_Hatchback_Blue",
			"Exile_Car_Hatchback_BlueCustom","Exile_Car_Hatchback_BeigeCustom","Exile_Car_Hatchback_Yellow",
			"Exile_Car_Hatchback_Grey","Exile_Car_Hatchback_Black","Exile_Car_Hatchback_Dark",
			"Exile_Car_Hatchback_Rusty1","Exile_Car_Hatchback_Rusty2","Exile_Car_Hatchback_Rusty3"
		]
	],
	[
		"CAMS_Civ_SportHatchbacks",1,true,
		[
			"Exile_Car_Hatchback_Sport_Red","Exile_Car_Hatchback_Sport_Blue","Exile_Car_Hatchback_Sport_Orange",
			"Exile_Car_Hatchback_Sport_White","Exile_Car_Hatchback_Sport_Beige","Exile_Car_Hatchback_Sport_Green"
		]
	],
	[
		"CAMS_Civ_Hatchbacks_ALL",0,true,
		[
			"CAMS_Civ_Hatchbacks", "CAMS_Civ_SportHatchbacks"
		]
	],
	[
		"CAMS_Civ_Offroads",1,true,
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
		"CAMS_Civ_MB4WD",1,true,
		[
			"Exile_Car_MB4WD","Exile_Car_MB4WDOpen"
		]
	],
	[
		"CAMS_Civ_Quilin",1,true,
		[
			"Exile_Car_QilinUnarmed"
		]
	],
	[
		"CAMS_Civ_SUV",1,true,
		[
			"Exile_Car_SUV_Red","Exile_Car_SUV_Black","Exile_Car_SUV_Grey","Exile_Car_SUV_Orange",
			"Exile_Car_SUVXL_Black"
		]
	],
	[

		"CAMS_Civ_Vans",1,true,
		[
			"Exile_Car_Van_Red", "Exile_Car_Van_Guerilla01", "Exile_Car_Van_Guerilla02", "Exile_Car_Van_Guerilla03",
			"Exile_Car_Van_Guerilla04",	"Exile_Car_Van_Guerilla05","Exile_Car_Van_Guerilla06",
			"Exile_Car_Van_Guerilla07",	"Exile_Car_Van_Guerilla08","Exile_Car_Van_Black","Exile_Car_Van_White"
		]
	],
	[
		"CAMS_Civ_Ikarus",1,true,
		[
			"Exile_Car_Ikarus_Blue","Exile_Car_Ikarus_Red","Exile_Car_Ikarus_Party"
		]
	],
	[
		"CAMS_Civ_Tractors",1,true,
		[
			"Exile_Car_Tractor_Red","Exile_Car_OldTractor_Red","Exile_Car_TowTractor_White"
		]
	],
	[
		"CAMS_Civ_Golf",1,true,
		[
			"Exile_Car_Golf_Black","Exile_Car_Golf_Red"
		]
	],
	[
		"CAMS_Civ_Octavius",1,true,
		[
			"Exile_Car_Octavius_White","Exile_Car_Octavius_Black"
		]
	],
	[
		"CAMS_Civ_UAZs",1,true,
		[
			"Exile_Car_UAZ_Green","Exile_Car_UAZ_Open_Green"
		]
	],
	[
		"CAMS_Civ_V3S",1,true,
		[
			"Exile_Car_V3S_Covered","Exile_Car_V3S_Open"
		]
	],
	[

		"CAMS_Civ_LandRover",1,true,
		[
			"Exile_Car_LandRover_Red","Exile_Car_LandRover_Urban","Exile_Car_LandRover_Green",
			"Exile_Car_LandRover_Sand","Exile_Car_LandRover_Desert"
		]
	],
	[
		"CAMS_Civ_Ambulance",1,true,
		[
			"Exile_Car_LandRover_Ambulance_Green","Exile_Car_LandRover_Ambulance_Desert", 
			"Exile_Car_LandRover_Ambulance_Sand"
		]
	],
	[
		"CAMS_Civ_Ladas",1,true,
		[
			"Exile_Car_Lada_Green","Exile_Car_Lada_Taxi","Exile_Car_Lada_Red","Exile_Car_Lada_Hipster",
			"Exile_Car_Lada_White"
		]
	],
	[
		"CAMS_Civ_Volhas",1,true,
		[
			"Exile_Car_Volha_White","Exile_Car_Volha_Blue","Exile_Car_Volha_Black"
		]
	],
	[
		"CAMS_Civ_Work",0,true,
		[
			"CAMS_Civ_Tractors", "CAMS_Civ_Ikarus", "CAMS_Civ_Ambulance"
		]
	],
	[
		"CAMS_Civ_Cars",0,true,
		[
			"CAMS_Civ_Hatchbacks_ALL", "CAMS_Civ_SUV", "CAMS_Civ_Vans", "CAMS_Civ_Octavius", 
			"CAMS_Civ_Ladas", "CAMS_Civ_Volhas"
		]
	],
	[
		"CAMS_Civ_Trucks",0,true,
		[
			"CAMS_Civ_Offroads", "CAMS_Civ_MB4WD", "CAMS_Civ_Quilin", "CAMS_Civ_UAZs", "CAMS_Civ_V3S", 
			"CAMS_Civ_LandRover"
		]
	],
	[
		"CAMS_Civ_All",0,true,
		[
			"CAMS_Civ_Work", "CAMS_Civ_Cars", "CAMS_Civ_Trucks"
		]
	],
	// Civilian Work Vehicles
	[	
		"CAMS_Work_RepairOffroads",1,true,
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
		"CAMS_Work_BoxVans",1,true,
		[
			"Exile_Car_Van_Box_Guerilla01", "Exile_Car_Van_Box_Guerilla02", "Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04", "Exile_Car_Van_Box_Guerilla05", "Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07", "Exile_Car_Van_Box_Guerilla08", "Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White","Exile_Car_Van_Box_Red"
		]
	],
	[
		"CAMS_Work_FuelVans",1,true,
		[
			"Exile_Car_Van_Fuel_Black", "Exile_Car_Van_Fuel_White", "Exile_Car_Van_Fuel_Red",
			"Exile_Car_Van_Fuel_Guerilla01", "Exile_Car_Van_Fuel_Guerilla02", "Exile_Car_Van_Fuel_Guerilla03"
		]
	],
	[
		"CAMS_Work_All",0,true,
		[
			"CAMS_Work_RepairOffroads", "CAMS_Work_BoxVans", "CAMS_Work_FuelVans"
		]
	],

	// Military Vehicles
	[
		"CAMS_Mil_ArmedOffroads",1,true,
		[
			"Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_Offroad_Armed_Guerilla02","Exile_Car_Offroad_Armed_Guerilla03",
			"Exile_Car_Offroad_Armed_Guerilla04","Exile_Car_Offroad_Armed_Guerilla05","Exile_Car_Offroad_Armed_Guerilla06",
			"Exile_Car_Offroad_Armed_Guerilla07","Exile_Car_Offroad_Armed_Guerilla08","Exile_Car_Offroad_Armed_Guerilla09",
			"Exile_Car_Offroad_Armed_Guerilla10","Exile_Car_Offroad_Armed_Guerilla11","Exile_Car_Offroad_Armed_Guerilla12"
		]
	],
	[
		"CAMS_Mil_UnarmedOffroads",1,true,
		[
			"Exile_Car_Offroad_Guerilla01",	"Exile_Car_Offroad_Guerilla02",	"Exile_Car_Offroad_Guerilla03",	
			"Exile_Car_Offroad_Guerilla04",	"Exile_Car_Offroad_Guerilla05",	"Exile_Car_Offroad_Guerilla06",	
			"Exile_Car_Offroad_Guerilla07",	"Exile_Car_Offroad_Guerilla08",	"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",	"Exile_Car_Offroad_Guerilla11",	"Exile_Car_Offroad_Guerilla12"
		]
	],
	[
		"CAMS_Mil_HMMWV_Armed",1,true,
		[
			"Exile_Car_HMMWV_M134_Desert","Exile_Car_HMMWV_M134_Green","Exile_Car_HMMWV_M2_Desert",
			"Exile_Car_HMMWV_M2_Green"
		]
	],
	[
		"CAMS_Mil_HMMWV_Unarmed",1,true,
		[
			"Exile_Car_HMMWV_MEV_Desert","Exile_Car_HMMWV_MEV_Green","Exile_Car_HMMWV_UNA_Desert",
			"Exile_Car_HMMWV_UNA_Green"
		]
	],
	[
		"CAMS_Mil_HMMWV_ALL",0,true,
		[
			"CAMS_Mil_HMMWV_Armed", "CAMS_Mil_HMMWV_Unarmed"
		]
	],
	[
		"CAMS_Mil_SUV_Armed",1,true,
		[
			"Exile_Car_SUV_Armed_Black"
		]
	],
	[

		"CAMS_Mil_BTR_Armed",1,true,
		[
			"Exile_Car_BTR40_MG_Camo","Exile_Car_BTR40_MG_Green"
		]
	],
	[
		"CAMS_Mil_BTR_Unarmed",1,true,
		[
			"Exile_Car_BTR40_Camo","Exile_Car_BTR40_Green"
		]
	],
	[
		"CAMS_Mil_BTR_ALL",0,true,
		[
			"CAMS_Mil_BTR_Armed", "CAMS_Mil_BTR_Unarmed"
		]
	],
	[
		"CAMS_Mil_OpenUral",1,true,
		[
			"Exile_Car_Ural_Open_Worker","Exile_Car_Ural_Open_Yellow","Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Open_Military"
		]
	],
	[
		"CAMS_Mil_CoveredUral",1,true,
		[
			"Exile_Car_Ural_Covered_Worker","Exile_Car_Ural_Covered_Blue","Exile_Car_Ural_Covered_Yellow",
			"Exile_Car_Ural_Covered_Military"
		]
	],
	[
		"CAMS_Mil_Ural_ALL",0,true,
		[
			"CAMS_Mil_OpenUral", "CAMS_Mil_CoveredUral"
		]
	],
	[
		"CAMS_Mil_Hemmts",1,true,
		[
			"Exile_Car_HEMMT"
		]
	],
	[
		"CAMS_Mil_Hunters",1,true,
		[
			"Exile_Car_Hunter"
		]
	],
	[
		"CAMS_Mil_Ifrits",1,true,
		[
			"Exile_Car_Ifrit"
		]
	],
	[
		"CAMS_Mil_Striders",1,true,
		[
			"Exile_Car_Strider"
		]
	],
	[
		"CAMS_Mil_Tempests",1,true,
		[
			"Exile_Car_Tempest"
		]
	],
	[
		"CAMS_Mil_Zamaks",1,true,
		[
			"Exile_Car_Zamak"
		]
	],
	[
		"CAMS_Mil_Prowler",1,true,
		[
			"Exile_Car_ProwlerLight","Exile_Car_ProwlerUnarmed"
		]
	],
	[
		"CAMS_Mil_BRDM",1,true,
		[
			"Exile_Car_BRDM2_HQ"
		]
	],
	[

		// CONFIRM UNARMED!
		"CAMS_Mil_Unarmed",0,true,
		[
			"CAMS_Mil_BTR_Unarmed", "CAMS_Mil_HMMWV_Unarmed", "CAMS_Mil_Hemmts", "CAMS_Mil_Hunters", 
			"CAMS_Mil_Ifrits", "CAMS_Mil_Striders", "CAMS_Mil_Tempests", "CAMS_Mil_Zamaks", "CAMS_Mil_Prowler"
		]
	],
	[
		"CAMS_Mil_Armed",0,true,
		[
			"CAMS_Mil_ArmedOffroads", "CAMS_Mil_HMMWV_Armed", "CAMS_Mil_BTR_Armed",	"CAMS_Mil_BRDM", 
			"CAMS_Mil_SUV_Armed"
		]
	],
	[
		"CAMS_Mil_All",0,true,
		[
			"CAMS_Mil_Unarmed", "CAMS_Mil_Armed"
		]
	]
	
];




/////////////////////////////
// Cart processing //////////
/////////////////////////////


_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};
