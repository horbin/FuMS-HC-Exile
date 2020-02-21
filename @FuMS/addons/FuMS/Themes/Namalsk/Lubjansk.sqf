// 	Lubjansk.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 4456.71,11232.6 as this map is specific to Tanoa
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Lubjansk" v2.1 static mission for Namalsk.
	Created by [CiC]red_ned using templates by eraser1 
	19 years of CiC http://cic-gaming.co.uk
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Lubjansk", 200], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Lubjansk Harbour","hd_objective","ELLIPSE","ColorRed","SolidBorder",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[				// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 			// Notify players via global toast message
		true,			// Show encounter area on the map
		900,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[		
			"Lubjansk Harbour",	// The first line is the title of the pop-up box
			"Lubjansk Harbour is being invaded by terrorists"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Lubjansk Harbour cleared!",
			"Convicts have successfully cleared Lubjansk Harbour and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Lubjansk Harbour looted!",
			"Invaders have stripped Lubjansk Harbour of loot and left."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics	
	
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["LubjanskLoot" , 	[[4489.99,11285.5,0.0304077],[4486.13,11255.7,0.692561],[4483.57,11211.8,0.962618],	[4416.89,11292.2,0.426895]]],
			["LubjanskLoot" , 	[[4425.23,11281.3,0.415057],[4424.27,11290.3,3.72787],[4424.27,11290.3,7.61803]]]
		], // Win loot, offset location - spawns after mission success
		//["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   		
		
		// SUGGESTED SPAWN POINTS FROM ORIGINAL MAP 
		// USED TO FIND GOOD LOCATIONS FOR SPAWN
		["Sign_Arrow_Blue_F", [4410.3,11292,0.398696], 0, 0],
		["Sign_Arrow_Blue_F", [4428.31,11232.2,0], 0, 0],
		["Sign_Arrow_Blue_F", [4407.66,11240.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [4444.49,11273.9,0], 0, 0],
		["Sign_Arrow_Blue_F", [4486.99,11288.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [4491.61,11239.5,0], 0, 0],
		["Sign_Arrow_Blue_F", [4474.58,11220.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [4465.58,11213.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [4473.11,11146,0.103943], 0, 0],
		["Sign_Arrow_Blue_F", [4457.3,11152,0], 0, 0],
		["Sign_Arrow_Blue_F", [4455.41,11130.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [4469.99,11191.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [4490.31,11264.8,0.702977], 0, 0],
		["Sign_Arrow_Blue_F", [4490.8,11256.6,0.699592], 0, 0],
		["Sign_Arrow_Blue_F", [4487.6,11222.1,0.669372], 0, 0],
		["Sign_Arrow_Blue_F", [4430.79,11214.6,0.329555], 0, 0],
		["Sign_Arrow_Blue_F", [4426.03,11205.1,0.299984], 0, 0],
		["Sign_Arrow_Blue_F", [4471.93,11203,0.367413], 0, 0]
		  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		//[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman"]  ],   				["Loiter",		[18297.931641,15587.395508,0.00136185],[18297.931641,15587.395508,0.00136185],[50]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18440.494141,15581.865234,17.889561],[18440.494141,15581.865234,17.889561],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18271.00390625,15474.366211,18.0308838],[18271.00390625,15474.366211,18.0308838],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18180.560547,15560.74707,17.798668],[18180.560547,15560.74707,17.798668],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18164.910156,15541.244141,4.348576],[18164.910156,15541.244141,4.348576],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18291.595703,15584.178711,4.353832],[18291.595703,15584.178711,4.353832],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18307.537109,15588.579102,4.360596],[18307.537109,15588.579102,4.360596],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18426.212891,15537.683594,4.300941],[18426.212891,15537.683594,4.300941],[10, "ANY"]   ]],
		//[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman"]  ],   				["BoxPatrol",	[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman"]  ],   				["Explore",		[0,0],[0,0],[200]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper"],[3,"Rifleman"]  ],   	["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[0,-5],						[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[4423.37,11279.7,0.403339],	[0],        "None" ],
				[  "O_HMG_01_high_F"        ,[4430.6,11228.4,0],			[0],        "None" ],
				[  "O_HMG_01_high_F"   		,[4465.26,11133.4,-0.0176592],	[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[4483.47,11285.9,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[4485.37,11263.8,0.693156],	[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[4484.22,11221.1,0.697772],	[0],        "None" ],
				[  "O_HMG_01_high_F"        ,[4434.34,11208.1,-0.0666306],	[0],        "None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [8, "Rifleman"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		],
		[
			[   // Vehicle                     Offset     			Crew and number   	CargoLoot 		Damage
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
			],	// Troops : These are distributed across all vehicles in this convoy. 
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		]	
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Always leaves one behind as a special surprise for players.
			["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ],		// Triggers call for reinforcements
			["PLAYERNEAR",	["ProxPlayer",[4456.71,11232.6,0], 100, 1]]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead","PLAYERNEAR"    ]],
			[["LOSE"],["TIMER"     ]],
			[["CHILD",	["Help_Helo",[0,0],5,300]],["LUCNT"     ]],  
			[["END"],["TIMER","OR","PLAYERNEAR", "AllDead"   ]]  
		]
	]


];
