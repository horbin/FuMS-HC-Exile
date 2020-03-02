// LootData.sqf
// TheOneWhoKnocks
// 5/13/19
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
// LOOTDATA is LOCAL to all missions in this particular theme, so once you use this file, you must ensure all 
// loot options that you want avaialable in these missions is included here.
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
			[CAMS_Rifles_ALL_I, 2]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			["Exile_Item_InstaDoc", 3],
			["optic_Arco", 2],
			["Exile_Item_Heatpack", 3],
			[FuMS_Food_ALL, 2] ,// Add to Exile Immersion File
			[FuMS_Crafting_Wood, 5],
			[FuMS_Crafting_Metal, 5],
			[FuMS_Crafting_Tools, 5],
			[CAMS_E_All, 2]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 2]
		]
	],//********** Loot**********************

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
		["TestLoot", "box_FIA_support_f"],
		[// All weapons and quantity 
			[CAMS_Rifles_ALL_I, 2]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 2]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 2]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["AltisStaticLoot", "box_FIA_support_f"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[20,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[20,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[4,0,3]]
		],
		2000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["GraveRobberLoot", "box_FIA_support_f"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[5,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[40,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[2,0,1]]
		],
		25000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["KavalaLoot", "box_FIA_support_f"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[5,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[40,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[2,0,1]]
		],
		25000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["LabyrintheLoot", "box_FIA_support_f"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[5,0,5]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[30,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[2,0,1]]
		],
		2000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["RadiationLoot", "Exile_Container_SupplyBox"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[10,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[30,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[3,0,2]]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["MilitaryBaseLoot", "I_CargoNet_01_ammo_F"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[10,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[30,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[3,0,2]]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["PowerPlantLoot", "Exile_Container_SupplyBox"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[10,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[30,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[3,0,2]]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["ProteusLoot", "Exile_Container_SupplyBox"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[10,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[30,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[3,0,2]]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["MarshLoot", "Exile_Container_SupplyBox"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[10,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[30,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[3,0,2]]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["HarborLoot", "Exile_Container_SupplyBox"],
		[// All weapons and quantity 
			[CAMS_Guns_ALL_E, 		[10,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[CAMS_E_All, 			[30,0,10]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[3,0,2]]
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

