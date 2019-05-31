//LootData.sqf
// Horbin
// 1/8/15
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
		["Lootcrate", "Exile_Container_SupplyBox"],
		[// All weapons and quantity 
		],
		[// All magazines and quantity
		],
		[// All items and quantity
			[FuMS_BaseBuilding_ALL, [2,0,4]],
			[FuMS_Medical_Supplies, [1,0,4]],
			[FuMS_Drink, [2,1,3]],
			[FuMS_FOOD_R2E, [2,1,2]]
		],
		[// All backpacks and quantity
		],
		2000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
		["LootTemplate", "box_FIA_support_f"],
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

//**SCATTER loot example.  Loot in this option will be distributed on the ground around the loot location center.
	[
		["Scatter", "none","Special"],
		[	// All weapons and quantity 
			[FuMS_AssaultRifles, [1,0,1]],
			[FuMS_AssaultRifles, [1,0,1]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, 4]
		],
		[// All items and quantity
			[FuMS_B_Navigation, 2],
			[FuMS_Crafting_Tools, 3],
			[FuMS_W_OpticsLv1, 2],
			[FuMS_Food_Raw, 2],
			[FuMS_Drink, 2] ,
			["G_Diving",2]
		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, 1]
		]
	],
	
	
	//**********************************************************************************************************
	//************ Generic Truck Loot
	[
		// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
		["Truck01","box_nato_ammo_f"],
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

