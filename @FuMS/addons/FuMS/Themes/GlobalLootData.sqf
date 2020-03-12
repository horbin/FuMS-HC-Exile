//LootData.sqf
// TheOneWhoKnocks
// Updated 9/30/18 to reformat file and remove specific loot.  All loot will be set to FuMS Global Variables
// Updated 9/1/19 to factor in new development 
// TheOneWhoKnocks
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
	
	
	
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["SmokeBomb", "GroundWeaponHolder_Scripted","RANDOM"],
		[// All weapons and quantity 
		],
		[// All magazines and quantity
			// This will provide 4 - 6 for each spawned weapon
		],
		[// All items and quantity
		],
		[// All backpacks and quantity
		],
		0
	],
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["Explosives", "Box_NATO_WpsSpecial_F","Special"],
			[// All weapons and quantity 

			],
			[// All magazines and quantity
				// This will provide 4 clips for the LightMG's and 4 for the rifles for a total of 8 clips (not 16 clips)
			],
			[// All items and quantity
				[CAMS_E_IED, 2]
			],
			[// All backpacks and quantity
				[CAMS_Packs_ALL, 1]
			],
			0
	],

	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["BasicLoot", "box_nato_ammoveh_f","RANDOM"],
		[// All weapons and quantity 
			[CAMS_LMG_E, [2,0,2]],
			[CAMS_AssaultRifles_E, [2,0,1]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, [4,2,2]]    // 4 clips for each weapon Line defined above.
			// This will provide 4 clips for the LightMG's and 4 for the rifles for a total of 8 clips (not 16 clips)
		],
		[// All items and quantity
			[CAMS_I_Meds, [2,1,2]],
			[CAMS_I_Navigation, [1,0,1]],
			[CAMS_W_Opticslv1, [2,0,0]],
			["G_Diving",[0,0,2]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, [1,0,1]]
		],
		5000
	],
	
	//******** Poptab Loot****************************
	/*
	[
		// Loot Option title, and box to be used.  Use of array names is permitted. 
		["PoptabLoot", "Exile_PopTabs"],  // Should only be used with Exile servers
		[// All weapons and quantity 
			
		],
		[// All magazines and quantity
			
			// This will provide 4 clips for the LightMG's and 4 for the rifles for a total of 8 clips (not 16 clips)
		],
		[// All items and quantity
			
		],
		[// All backpacks and quantity
			
		],
		10000 //Maximum number of poptabs to be included in poptab bag
	],
	*/
	
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
	],

	//************ Generic Neli Loot
	[
		// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
		["HeliJunk","VEHICLE","special"],
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
	],

	//*********** Zombie Loot************************ 
	[ 
		// Zombie Bomb loot - specific to zombie encounters to provide a source for players to finish the objective!
		["ZombieBomb","Scatter","Special"],
		[
			//weapons
		],
		[
			//magazines
		],
		[
			//items   
			["SatchelCharge_Remote_Mag", 3]
		],
		[
			// backpacks   
		]          
	],
	
	//**SCATTER loot example.  Loot in this option will be distributed on the ground around the loot location center.
	[
		["Scatter", "none","Special"],
		[	// All weapons and quantity 
			[CAMS_AssaultRifles_E, [2,0,2]],
			[CAMS_AssaultRifles_E, [2,0,2]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, [4,0,1]]
		],
		[// All items and quantity
			[CAMS_I_Navigation, [2,0,1]],
			[CAMS_W_OpticsLv1, [2,1,1]],
			["G_Diving",[2,0,1]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, [2,0,1]]
		]
	],
	[
		["WreckageLoot", "Scatter","Special"],
		[	// All weapons and quantity 
			[CAMS_AssaultRifles_E, [2,0,2]],
			[CAMS_AssaultRifles_E, [2,0,2]],
			[CAMS_AssaultRifles_E, [2,0,2]],
			[CAMS_AssaultRifles_E, [2,0,2]]

		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, [4,0,1]]
		],
		[// All items and quantity
			[CAMS_I_Navigation, [2,0,1]],
			[CAMS_I_Meds, [4,0,4]],
			[CAMS_W_OpticsLv1, [2,1,1]],
			[CAMS_W_OpticsLv2, [2,1,1]],
			["G_Diving",[2,0,1]]
		],
		[// All backpacks and quantity
			[CAMS_Packs_ALL, [4,0,1]]
		]
	],
	
	// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
	[
		["RoadBlock","box_nato_ammoveh_f","special"],
		[// All weapons and quantity  
			[CAMS_Rifles_ALL_E, [8,4,2]]
		],
		[// All magazines and quantity
			[FuMS_AmmoForEach, [4,1,2]]   
		],
		[// All items and quantity  
			["G_Diving",[0,0,1]]
		],// All backpacks and quantity
		[
			//[FuMS_Packs_ALL, 2]
		]
	]
 
	//**********************************************************************************************************
];

FuMS_LOOTDATA set [_this select 0, _lootData];

