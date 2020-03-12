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
		["LootcrateE", "box_nato_ammoveh_f"],
		[// All weapons and quantity 
			[CAMS_SniperRifles_E, 	[1,0,2]],
			[CAMS_LMG_E, 		[0,0,1]],
			[CAMS_AssaultRifles_E, 	[2,0,2]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, 		[3,0,2]]
		],
		[// All items and quantity
			[CAMS_W_OpticsLv1, 		[2,0,1]],
			[CAMS_I_Meds, 			[2,0,4]],
			[CAMS_I_Navigation, 	[2,1,3]],
			[CAMS_W_Pointer, 		[0,0,1]],
			[CAMS_Flares_Normal, 	[2,0,2]],
			[CAMS_E_ALL, 			[0,0,2]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[0,0,1]]
		]
	],//********** Loot**********************
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
		["LootcrateW", "box_nato_ammoveh_f"],
		[// All weapons and quantity 
			[CAMS_SniperRifles_W, 	[1,0,2]],
			[CAMS_LMG_W, 		[0,0,1]],
			[CAMS_AssaultRifles_W, 	[2,0,2]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, 		[3,0,2]]
		],
		[// All items and quantity
			[CAMS_W_OpticsLv1, 		[2,0,1]],
			[CAMS_I_Meds, 			[2,0,4]],
			[CAMS_I_Navigation,		[2,1,3]],
			[CAMS_W_Pointer, 		[0,0,1]],
			[CAMS_Flares_Normal, 	[2,0,2]],
			[CAMS_E_ALL, 			[0,0,2]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[0,0,1]]
		]
	],//********** Loot**********************

	// Copy from here to next comment to make new loot box
	[
	// Loot Option title, and box to be used.  Use of array names is permitted. 
		["LootTemplate", "box_FIA_support_f"],
		[// All weapons and quantity 
			[CAMS_AssaultRifles_E, 	[2,0,2]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, 		[2,0,2]]
		],
		[// All items and quantity
			[CAMS_E_ALL, 			[0,0,2]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 2]
		],
		10000  //optional, number of random poptabs to add to loot
	],//********** Loot**********************
// Copy from first comment to here to make custom loot box 	

//**SCATTER loot example.  Loot in this option will be distributed on the ground around the loot location center.
	[
		["ScatterE", "SCATTER","Special"],
		[	// All weapons and quantity 
			[CAMS_AssaultRifles_E, 	[1,0,1]],
			[CAMS_AssaultRifles_E, 	[1,0,1]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, 4]
		],
		[// All items and quantity CAMS_I_Junk
			[CAMS_I_Meds, 			[2,0,4]],
			[CAMS_I_Navigation,		[3,0,2]],
//			[CAMS_I_Junk, 			[5,0,3]],
//			[CAMS_I_Tools, 			[1,0,1]],
			[CAMS_G_Tactical, 		[1,0,1]],
			[CAMS_I_Navigation, 	[2,0,2]],
			[CAMS_W_Attachments_ALL,[2,0,2]]
//			[CAMS_I_Drink, 			[2,0,2]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, 		[1,0,1]]
		]
	],
	[
		["ScatterW", "SCATTER","Special"],
		[	// All weapons and quantity 
			[CAMS_AssaultRifles_W, 	[1,0,1]],
			[CAMS_AssaultRifles_W, 	[1,0,1]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, 4]
		],
		[// All items and quantity CAMS_I_Junk
			[CAMS_I_Meds, 			[2,0,4]],
			[CAMS_I_Navigation,		[3,0,2]],
//			[CAMS_I_Junk, 			[5,0,3]],
//			[CAMS_I_Tools, 			[1,0,1]],
			[CAMS_G_Tactical, 		[1,0,1]],
			[CAMS_I_Navigation, 	[2,0,2]],
			[CAMS_W_Attachments_ALL,[2,0,2]]
//			[CAMS_I_Drink, 			[2,0,2]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, [1,0,1]]
		]
	],
	
	
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
			[CAMS_Packs_ALL, 1]
		],// All backpacks and quantity
		[
    
		]
	]  //*********** Loot************************ 
	//**********************************************************************************************************
];

FuMS_LOOTDATA set [_this select 0, _lootData];

