// 	Destroyer.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 15612.1,15862.4 as this map is specific to Altis
// 	This mission was ported from =CF=Dragunov's set of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
    "Destroyer" static mission for Altis. Needs the Destroyer spawned thru init.sqf
    Based on an Defent/eraser1 mission
    Created by =CF=Dragunov
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Destroyer", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Destroyer Assault","hd_objective","ELLIPSE","ColorRed","SolidBorder",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[				// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 			// Notify players via global toast message
		true,			// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[		
			"Destroyer Assault",	// The first line is the title of the pop-up box
			"A Group of Terrorists invaded the beach near the docks! Please help us get rid of them!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Destroyer Assault cleared!",
			"Convicts have successfully liberated the Destroyer and got the impressive cache"
		],
	  
		// Mission Failure Message
		[
			"Destroyer looted!",
			"Seems like the terrorists got bored and left taking the huge cache with them..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["LOOTBOX" , 	[0,0] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		//["Land_Destroyer_01_base_F",		[15479.9,15369.7,55.8943]],   	89.80515, 		[0,   0,     .5,         .5,         .5], "FIRE_SMALL"],
		//["Land_Destroyer_01_base_F",        [15479.9,15369.7,55.8943],		289.80515,		0,  "SMOKE_BIG"]		
		
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Destroyer_01_base_F",[15479.9,15369.7,55.89439],89.80515,[[0.997835,0.0657662,0],[0,0,1]],false]
			]
		]
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		//[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   					["TowerGuard",	[21957.828125,21010.695313,4.545008],[21957.828125,21010.695313,4.545008],[150, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   					["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   					["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   					["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   					["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   					["SENTRY",		[0,0],[0,0],[200] ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   					["SENTRY",		[0,0],[0,0],[300]   ]],
		//[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[21868.0292969,20942.171875,1.374988],[21868.0292969,20942.171875,1.374988],[50]   ]],		//  Fountain
		//[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[21858.667969,21025.705078,0.0014286],[21858.667969,21025.705078,0.0014286],[50]   ]],		//  back road clear area
		//[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[22049.220703,21100.746094,0.00123978],[22049.220703,21100.746094,0.00123978],[50]   ]],	//  Clear area behind the hotel 1
		//[["EAST","COMBAT","RED","COLUMN"],  		[  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","VEE"],   			[  [4,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  		[  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  		[  [1,"Sniper_E"],[3,"Rifleman_E"]  ],   	["Explore",		[0,0],[0,0],[300]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[3,0],							[0],     	"None" ],	// 3 meter North of center pos
				[  "O_HMG_01_high_F"        ,[15566,15386.1,55.7196],		[0],        "None" ], 	
				[  "O_HMG_01_high_F"        ,[15550.6,15385.3,57.0363],		[0],        "None" ], 	
				[  "O_HMG_01_high_F"   		,[15492.7,15383.6,60.2766],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"        ,[15626.8,15861.3,0.00181484],	[0],        "None" ], 	// at shore for missions without the ship as base 

				[  "O_HMG_01_high_F"       	,[15494.1,15356.8,63.584],		[0],     	"None" ],	// 3 meter North of center pos
				[  "O_HMG_01_high_F"        ,[15432.9,15366.7,73.1163],		[0],        "None" ], 	
				[  "O_HMG_01_high_F"        ,[15570,15366.2,57.3065],		[0],        "None" ], 	
				[  "O_HMG_01_high_F"   		,[15433.1,15357.1,68.9394],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"        ,[15432,15376.2,67.5402],		[0],        "None" ], 	// at shore for missions without the ship as base 


				[  "O_HMG_01_high_F"   		,[15390.8,15363.7,68.8991],		[0],     	"None" ]		
				
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// 	Drivers                          		# and type  |        Patrol AI    |  spawn   | 	dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [11, "Rifleman_E"]  ],   ["Gunner",		[0,0],		[0,0],			[0]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
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
			["LUCNT",		["LowUnitCount","EAST",1,0,[0,0]]  ]			
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["LUCNT"     ]],
			[["LOSE"],["TIMER"     ]],

			[["END"],["LUCNT","OR","TIMER"    ]]  
		]
  
	]


];
