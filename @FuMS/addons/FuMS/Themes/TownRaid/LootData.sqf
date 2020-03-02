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

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["TownLoot", "box_FIA_support_f"],
		[// All weapons and quantity 
			[FuMS_Guns_ALL, 		[20,0,10]]
		],
		[// All magazines and quantity
			["FuMS_AmmoForEach",	[1,0,2]]
		],
		[// All items and quantity
			[FuMS_E_All, 			[10,0,10]]
		],
		[// All backpacks and quantity
			[FuMS_Packs_ALL, 		[4,0,3]]
		],
		20000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
	// Loot used for Abandonded Village mission
		["TownLootLoss", "box_FIA_support_f"],
		[// All weapons and quantity 
		],
		[// All magazines and quantity
		],
		[// All items and quantity
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, [1,0,2]]
		],
		420  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 
	//**********************************************************************************************************
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

