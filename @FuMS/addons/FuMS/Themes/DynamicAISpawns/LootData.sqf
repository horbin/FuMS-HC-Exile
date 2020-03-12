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
    
    
	//******** CloneHunter Loot****************************
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["Template", "box_nato_ammoveh_f","RANDOM"],
		[// All weapons and quantity 
			[CAMS_LMG_E, [2,0,1]],
			[CAMS_AssaultRifles_E, [2,0,1]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, [4,0,2]]    // 4 clips for each weapon Line defined above.
			// This will provide 4 - 6 for each spawned weapon
		],
		[	// All items and quantity
			[CAMS_I_Meds, [2,0,1]],
			[CAMS_I_Navigation, [2,0,1]],
			[CAMS_W_Opticslv1, [2,0,1]],
			["G_Diving",[2,0,1]]
		],
		[	// All backpacks and quantity
			[CAMS_Packs_ALL, [1,0,1]]
		],
		10000	//Maximum number of poptabs to be included in poptab bag

	],
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["SmallLoot", "Box_NATO_Wps_F"],  //
		[// All weapons and quantity 
			[CAMS_AssaultRifles_E, [2,0,1]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, [2,0,2]]    // 4 clips for each weapon Line defined above.
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
	
	[///////////////////////////////////////////////////////////
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["SniperLoot", "box_exile_weapons_1v"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[CAMS_SniperRifles_E,		[0,0,10]]	
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach,			[2,1,4]]
		],
		[// All items and quantity
			["Exile_Item_InstaDoc", 	[2,0,2]],
			["optic_Arco", 				[1,0,1]],
			[CAMS_W_Optics_ALL, 		[2,2,4]]

		],
		[
			// All backpacks and quantity
			[CAMS_Packs_ALL, 			[2,0,2]]
		]
	],	
	
	[////////////////////////////////////////////////////////////////////////////
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["ResearchLoot", "box_nato_ammoveh_f"],  //Box_NATO_Wps_F
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
			[CAMS_Packs_ALL, 				[3,0,1]]
		]
	],	

	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["MedicalLoot", "box_nato_ammoveh_f"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[CAMS_Guns_ALL_I,				[2,0,4]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			[2,0,2]]
		],
		[// All items and quantity
			[CAMS_I_Meds, 					[9,0,3]]
			//[FuMS_Food_ALL, 				[2,2,4]]
		],
		[
			// All backpacks and quantity
			[CAMS_Packs_ALL, 				[2,0,1]]
		]
	],

	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["GunsLoot", "box_exile_weapons_1v"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[CAMS_Guns_ALL_I,					[6,0,7]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			[2,0,2]]
		],
		[// All items and quantity
			//[FuMS_Drink, 					[3,0,3]],
			[CAMS_Flares_ALL, 				[3,0,3]]			
			//[FuMS_Food_ALL, 				[2,2,4]]
		],
		[
			// All backpacks and quantity
			[CAMS_Packs_ALL, 				[3,0,1]]
		]
	],		
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["BeerLoot", "Exile_Container_OldChest"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
			[CAMS_AssaultRifles_I, 			[2,0,2]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			2]
		],
		[// All items and quantity
			["Exile_Item_Beer" ,			[15,0,3]]
		],
		[
			// All backpacks and quantity
			[CAMS_Packs_ALL, 				[2,0,1]]
		]
	],
/*
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
*/	
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
	
	[///////////////////////////////////////////////////////////////////////////////////////////////////////
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["BambiLoot", "Exile_Container_Storagecrate"],  //Box_NATO_Wps_F
		[// All weapons and quantity 
		
			[CAMS_Pistols_I, 				[1,1,2]],
			[CAMS_AssaultRifles_I, 			[1,0,1]]
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
			[CAMS_Packs_ALL, 				[1,0,1]]
		]
	],

	//********** Loot**********************
	//**********************************************************************************************************
	
	
	
	[//////////////////////////////////////////////////////////////////////////
		// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
		["BanditTruck","box_nato_ammo_f"],
		[// All weapons and quantity  
			[CAMS_Pistols_I,					[1,0,3]], 
			[CAMS_AssaultRifles_I,				[1,0,2]] 
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",			1]
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
		["TruckJunk","Vehicle","RANDOM"],
		[// All weapons and quantity  
			["hgun_Pistol_Signal_F",[0,0,1]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, [0,1,1]]   
		],
		[// All items and quantity    
			[CAMS_I_Meds,[0,0,3]],
			[CAMS_Flares_Chemical,[0,0,2]],
			[CAMS_G_ALL,[0,0,2]]
		],// All backpacks and quantity
		[
			[CAMS_Packs_ALL, [1,0,2]]
		]
	]
		//**********************************************************************************************************
];

FuMS_LOOTDATA set [_this select 0, _lootData];

