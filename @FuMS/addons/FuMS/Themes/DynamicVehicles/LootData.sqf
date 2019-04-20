//LootData.sqf
// TheOneWhoKnocks
// 4/20/19
// Custom loot file for DynamicVehicle mission set
//INPUTS: lootConfig, mission center, mission status.
// Intended as a #include to the Fulcrum Mission System init file.
// This function pulls the applicable data from here, and call the function to create the loot box.
// Note: "RANDOM" in any field will select a random type (BoxType, weapon, magazine, item, backpack, etc)
// Note: Placing a 'variable name' from BaseLoot into an option will direct FillLoot.sqf to select a random item from
//    the list of obtions in the 'variable name'
// Example: [Backpacks_All, 4] will select a random backpack, and place 4 of them in the container
// Example: ["FAK",[1,0,5] ] will add '1' FAK, and an additional '0' to '5' First Aid Kits to the container.
//    see BaseLoot.sqf for more specific 'random' lists you can choose from.
//*********************************************************************************************************
// LOOTDATA is GLOBAL to all mission sets to permit easier management of quantity/richness/type of loot
//   accross all missions and mission themes on the server.
//**********************************************************************************************************
_lootData =
[
	// To add more loot options, copy and paste all lines (including comments) from the 'CloneHunter' code below.
    // Paste the code above the '**** CloneHunter Loot**** line.
	/*
	"Exile_Item_ConcreteWallKit","Exile_Item_ConcreteWallKit","Exile_Item_ConcreteWallKit","Exile_Item_ConcreteWallKit","Exile_Item_ConcreteFloorKit","Exile_Item_ConcreteFloorKit","Exile_Item_ConcreteFloorKit","Exile_Item_ConcreteDoorKit","Exile_Item_ConcreteFloorKit","Exile_Item_ConcreteGateKit","Exile_Item_RepairKitMetal","Exile_Item_DuctTape","Exile_Item_SafeKit","Exile_Item_CordlessScrewdriver","Exile_Item_WoodDoorwayKit","Exile_Item_WooDDoorKit","Exile_Item_WoodWallKit","Exile_Item_WoodFloorKit"
	*/
    
    
	//******** CloneHunter Loot****************************
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["LOOTBOX", "box_FIA_support_f"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[FuMS_SniperRifles, 			2],
			[FuMS_LightMGs, 				2],
			[FuMS_AssaultRifles, 			2]
		],
		[// All magazines and quantity
			[FuMS_Ammo_762, 				4],
			[FuMS_Ammo_127, 				4],
			[FuMS_Ammo_65, 					4],
			[FuMS_Ammo_556, 				4]
		],
		[// All items and quantity
			["Exile_Item_InstaDoc", 		3],
			["optic_Arco", 					2],
			["Exile_Item_Heatpack", 		3],
			[FuMS_Food_ALL, 				2],
			[FuMS_Crafting_Wood, 			5],
			[FuMS_Crafting_Metal, 			5],
			[FuMS_Crafting_Tools, 			5],
			[FuMS_E_All, 					2]
		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				2]
		]
	],
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["SmallLoot", "IG_supplyCrate_F"],  //
		[// All weapons and quantity 
			[FuMS_AssaultRifles, 			[1,0,1]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			2]
		],
		[// All items and quantity
			["Exile_Item_InstaDoc", 		2],
			["optic_Arco", 					1],
			[FuMS_Food_ALL, 				2]

		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				2]
		]
	],
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["SniperLoot", "box_exile_weapons_1v"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[FuMS_SniperRifles,				[0,0,10]]	
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			[2,1,4]]
		],
		[// All items and quantity
			["Exile_Item_InstaDoc", 		[2,0,2]],
			["optic_Arco", 					[1,0,1]],
			[FuMS_Food_ALL, 				[2,2,4]]

		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				4]
		]
	],	
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["ResearchLoot", "box_east_wps_f"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[
				[
					"arifle_SDAR_F","arifle_MX_GL_Black_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F","MMG_02_sand_F",
					"hgun_PDW2000_F","SMG_01_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F"
				],							[2,0,6]
			]
			
			
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			[2,0,4]]
		],
		[// All items and quantity
			[
				[
					"H_HelmetLeaderO_ocamo","H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo","H_HelmetLeaderO_oucamo","U_B_survival_uniform",
					"U_B_Wetsuit","U_O_Wetsuit","U_I_Wetsuit","H_HelmetB_camo","H_HelmetSpecB","H_HelmetSpecO_blk","Exile_Item_EMRE",
					"Exile_Item_InstantCoffee","Exile_Item_PowerDrink","Exile_Item_InstaDoc"
				],							[9,0,3]
			]	
		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				[3,0,1]]
		]
	],	

	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["MedicalLoot", "box_nato_support_f"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[FuMS_Guns_ALL,					[2,0,4]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			[2,0,2]]
		],
		[// All items and quantity
			[FuMS_Medical_Supplies, 		[9,0,3]],
			[FuMS_Food_ALL, 				[2,2,4]]
		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				[2,0,1]]
		]
	],

	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["GunsLoot", "box_east_wpsSpecial_f"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[FuMS_Guns_ALL,					[6,0,7]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			[2,0,2]]
		],
		[// All items and quantity
			[FuMS_Drink, 					[3,0,3]],
			[FuMS_Flares_ALL, 				[3,0,3]],			
			[FuMS_Food_ALL, 				[2,2,4]]
		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				[3,0,1]]
		]
	],		


	
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["AntiAirLoot", "box_nato_ammoveh_f"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[FuMS_SniperRifles, 			2],
			[FuMS_LightMGs, 				2],
			[FuMS_AssaultRifles, 			2]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			[2,0,2]]
		],
		[// All items and quantity
			["Exile_Item_InstaDoc", 		3],
			["optic_Arco", 					2],
			["Exile_Item_Heatpack", 		3],
			[FuMS_Food_ALL, 				2],
			[FuMS_Crafting_Wood, 			5],
			[FuMS_Crafting_Metal, 			5],
			[FuMS_Crafting_Tools, 			5],
			[FuMS_E_All, 					2]
		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				2]
		]
	],

		[		// Loot Option title, and box to be used.  Use of array names is permitted. 

			["BaseBuildingLoot", "Land_Pod_Heli_Transport_04_ammo_f"],  //Exile_Container_SupplyBox
			[// All weapons and quantity 
				[FuMS_AssaultRifles, 			[3,0,1]]
			],
			[// All magazines and quantity
				["FuMS_AmmoForEach",			2]
			],
			[// All items and quantity
				[FuMS_BaseBuilding_ALL ,		[9,1,4]]
			],
			[// All backpacks and quantity			
				[FuMS_Packs_ALL, 				3]
			]
		],
	
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["IKEALoot", "Land_Pod_Heli_Transport_04_ammo_f"],  //Exile_Container_SupplyBox
		[// All weapons and quantity 
			[FuMS_AssaultRifles, 			2]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			2]
		],
		[// All items and quantity
			[FuMS_Building_Supplies ,		[20,1,4]]
		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, 				2]
		]
	],
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["BeerLoot", "Exile_Container_OldChest"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[FuMS_AssaultRifles, 			[2,0,2]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			2]
		],
		[// All items and quantity
			["Exile_Item_Beer" ,			[15,0,3]]
		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				[2,0,1]]
		]
	],

	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["DrinkLoot", "Exile_Container_OldChest"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
		],
		[// All magazines and quantity
		],
		[// All items and quantity
			[FuMS_Drink ,					[15,0,3]]
		],
		[// All backpacks and quantity			
		]
	],
	
		[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["EmptyLoot", "Exile_Container_Storagecrate"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
		],
		[// All magazines and quantity
		],
		[// All items and quantity
		],
		[// All backpacks and quantity			
		]
	],
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["BambiLoot", "Exile_Container_Storagecrate"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
		
			[FuMS_Pistols, 					[1,1,2]],
			[FuMS_AssaultRifles, 			[1,0,1]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			1]
		],
		[// All items and quantity
			["Exile_Item_BushKit_Green",	[0,0,3]],
			["Exile_Item_Bandage",			[1,0,4]],
			["Exile_Item_Beer",				[1,0,4]],
			["Exile_Item_JunkMetal",		[0,0,4]],
			["Exile_Item_Foolbox",			[0,0,1]],
			["Exile_Item_CatFood",			[0,0,3]],
			["Exile_Item_CockONut",			[1,0,3]],
			["Exile_Item_DuctTape",			[1,0,3]],
			["Exile_Item_Handsaw",			[0,0,1]]

		],
		[
			// All backpacks and quantity
			[FuMS_Packs_ALL, 				[1,0,1]]
		]
	],

	//********** Loot**********************
	//**********************************************************************************************************
	
	
	
	[
		// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
		["BanditTruck","box_nato_ammo_f"],
		[// All weapons and quantity  
			["hgun_Rook40_F",					[1,0,3]], 
			["hgun_ACPC2_F",					[1,0,2]] 
		],
		[// All magazines and quantity
			["9Rnd_45ACP_Mag",					[3,0,3]], 
			["16Rnd_9x21_Mag",					[3,0,3]]
		],
		[// All items and quantity
			["U_NikosAgedBody",					[1,0,2]], 
			["U_NikosBody",						[1,0,3]], 
			["H_Cap_press",						[1,0,2]],
			["H_StrawHat_dark",					[1,0,2]], 
			["Exile_Item_EMRE",					[1,0,3]], 
			["Exile_Item_PlasticBottleCoffee",	[1,0,3]], 
			["ItemGPS",							[1,0,2]]
		],// All backpacks and quantity
		[
    
		]
	],  //*********** Loot************************ 
	
	
	//************ Generic Truck Loot
	
	
	[
		// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
		["Truck01","box_nato_ammo_f"],
		[// All weapons and quantity  
   
		],
		[// All magazines and quantity
   
		],
		[// All items and quantity
			[FuMS_Food_Cooked, 				3],
			["Exile_Item_MountainDupe", 	[1,2,4]],  // 1 plus a random amount between 2-4 : 3-5 items!
			["Exile_Item_EnergyDrink",		3],
			["Exile_Item_Bandage",			1]
		],// All backpacks and quantity
		[
    
		]
	]  //*********** Loot************************ 
		//**********************************************************************************************************
];

FuMS_LOOTDATA set [_this select 0, _lootData];

