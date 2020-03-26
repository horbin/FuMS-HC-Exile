// LootData.sqf
// TheOneWhKnocks
// 5/21/19
//	INPUTS: lootConfig, mission center, mission status.
// Intended as a #include to the Fulcrum Mission System init file.
// This function pulls the applicable data from here, and call the function to create the loot box.
// Note: "RANDOM" in any field will select a random type (BoxType, weapon, magazine, item, backpack, etc)
// Note: Placing a 'variable name' from BaseLoot into an option will direct FillLoot.sqf to select a random item from
//    the list of obtions in the 'variable name'
// Example: [Backpacks_All, 4] will select a random backpack, and place 4 of them in the container
// Example: ["FAK",[1,0,5] ] will add '1' FAK, and an additional '0' to '5' First Aid Kits to the container.
//    see BaseLoot.sqf for more specific 'random' lists you can choose from.
//*********************************************************************************************************
// LOOTDATA is LOCAL to Chernarus mission sets to permit easier management of quantity/richness/type of loot
//   accross themed missions.
//**********************************************************************************************************
_lootData =
[
    // To add more loot options, copy and paste all lines (including comments) from the 'CloneHunter' code below.
    // Paste the code above the '**** CloneHunter Loot**** line.
    
    
	//******** CloneHunter Loot****************************
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
		["LOOTBOX", "box_nato_ammoveh_f"],
		[// All weapons and quantity 
			[FuMS_SniperRifles, 2],
			[FuMS_LightMGs, 2],
			[FuMS_AssaultRifles, 2]
		],
		[// All magazines and quantity
			[FuMS_Ammo_762, 4],

			[FuMS_Ammo_127, 4],
			[FuMS_Ammo_65, 4],
			[FuMS_Ammo_556, 4]
		],
		[// All items and quantity
			["Exile_Item_InstaDoc", 3],
			["optic_Arco", 2],
			["Exile_Item_Heatpack", 3],
			[FuMS_Food_ALL, 2] ,
			[FuMS_Crafting_Wood, 5],
			[FuMS_Crafting_Metal, 5],
			[FuMS_Crafting_Tools, 5],
			[FuMS_E_All, 2]
		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, 2]
		]
	],//********** Loot**********************

// Copy from here to next comment to make new loot box
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["AIBase1Loot", "I_CargoNet_01_ammo_F"],
		[// All weapons and quantity 
			[
				[
					/*
					#ifdef USE_CUP_WEAPONS 
					"CUP_srifle_M110",
					"CUP_srifle_AWM_wdl",
					"CUP_srifle_M107_Base",
					#endif
					*/
					"srifle_DMR_02_camo_F",
					"srifle_DMR_02_sniper_F",
					"srifle_DMR_03_khaki_F",
					"srifle_DMR_03_multicam_F",
					"srifle_DMR_03_woodland_F",
					"srifle_DMR_04_F",
					"srifle_DMR_04_Tan_F",
					"srifle_DMR_05_blk_F",
					"srifle_DMR_05_hex_F",
					"srifle_DMR_05_tan_f",
					"srifle_DMR_06_camo_F",
					"srifle_DMR_06_olive_F",
					"srifle_EBR_F",
					"srifle_GM6_camo_F",
					"srifle_LRR_camo_F"
				], [20,0,15]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach", 4]
		],
		[// All items and quantity
			

		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, [10,0,2]]
		],
		5000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

// Copy from here to next comment to make new loot box
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["AIBase1HELoot", "I_CargoNet_01_ammo_F"],
		[// All weapons and quantity 
			[
				[
					/*
					#ifdef USE_CUP_WEAPONS 
					"CUP_hgun_MicroUzi",
					"CUP_hgun_MicroUzi",
					"CUP_muzzle_snds_MicroUzi"
					#endif
					*/
					//"launch_B_Titan_short_F",
					"launch_Titan_F",
					//"launch_RPG32_F",
					"launch_NLAW_F"
				], [5,0,5]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach", 4]
		],
		[// All items and quantity
			[
				[	
					#ifdef USE_CUP_WEAPONS
					"CUP_30Rnd_9x19_UZI",
					"CUP_30Rnd_9x19_UZI",
					"CUP_30Rnd_9x19_UZI",
					"CUP_30Rnd_9x19_UZI",
					#endif
					"Laserdesignator",
					//"H_HelmetO_ViperSP_hex_F",
					//"H_HelmetO_ViperSP_ghex_F",
				//	"I_UAV_01_backpack_F",
					//"RPG32_HE_F",
				//	"NLAW_F",
					//"Titan_AT",
					//"Titan_AP",
					//"Titan_AA",
					//"RPG32_F",
					//"RPG32_HE_F",
					"Exile_SafeKit",
					"Exile_CodeLock"
					//"optic_Nightstalker",
					//"optic_TWS"
				], [5,0,2]]
		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, [5,0,1]]
		],
		5000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

// Copy from here to next comment to make new loot box
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["AIBase1MedLoot", "I_CargoNet_01_ammo_F"],
		[// All weapons and quantity 

		],
		[// All magazines and quantity

		],
		[// All items and quantity
			[
				[
					"Exile_Item_InstaDoc",
					"Exile_Item_Vishpirin",
					"Exile_Item_Vishpirin",
					"Exile_Item_Vishpirin",
					"Exile_Item_Bandage",
					"Exile_Item_Bandage",
					"Exile_Item_Bandage",
					"Exile_Item_Bandage",
					"Exile_Item_Bandage"
				], [20,0,25]]
		],
		[// All backpacks and quantity

		],
		5000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 		

// Copy from here to next comment to make new loot box
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["AIBase1BuildLoot", "I_CargoNet_01_ammo_F"],
		[// All weapons and quantity 

		],
		[// All magazines and quantity

		],
		[// All items and quantity
			[FuMS_BaseBuilding_ALL, [20,0,25]]
		],
		[// All backpacks and quantity

		],
		5000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 		



// Copy from here to next comment to make new loot box
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["HotelLoot", "I_CargoNet_01_ammo_F"],
		[// All weapons and quantity 
			[FuMS_Guns_ALL, [20,0,30]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach", 4]
		],
		[// All items and quantity
			[FuMS_Loot_Items, [20,0,25]]
		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, [3,0,2]]
		],
		5000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	


	
// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
		["TestLoot", "box_FIA_support_f"],
		[// All weapons and quantity 
			[FuMS_AssaultRifles, 2]
		],
		[// All magazines and quantity
			[FuMS_Ammo_556, 4]
		],
		[// All items and quantity
			[FuMS_E_All, 2]
		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, 2]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

	
	
	//**********************************************************************************************************
	//************ Generic Truck Loot
	[
		// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
		["TruckJunk","box_nato_ammo_f"],
		[// All weapons and quantity  
   
		],
		[// All magazines and quantity
   
		],
		[// All items and quantity
			[FuMS_Food_Cooked, 3],
			["Exile_Item_MountainDupe", [1,2,4]],  // 1 plus a random amount between 2-4 : 3-5 items!
			["Exile_Item_EnergyDrink",3],
			["Exile_Item_Bandage",1]
		],// All backpacks and quantity
		[
    
		]
	]  //*********** Loot************************ 
	//**********************************************************************************************************
];

FuMS_LOOTDATA set [_this select 0, _lootData];

