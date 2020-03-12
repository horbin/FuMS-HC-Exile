// 	Radioactive.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 21866.859375,20978.0917969 as this map is specific to Altis
// 	This mission was ported from =CF=Dragunov's set of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
    "Radioactive" static mission for Altis.
    Based on an Defent/eraser1 mission
    Created by =CF=Dragunov
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Radioactive", 400], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Radioactive Area Invasion","ExileContaminatedZone","ELLIPSE","ColorRed","SolidBorder",500],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Radiation Invasion",	// The first line is the title of the pop-up box
			"A Group of Terrorists took anti-radiation injections and invaded the radioactive area. Get your gas mask and kill them."		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Radiation Invasion cleared!",
			"Convicts have successfully liberated the Radioactive area and have taken the impressive cache"
		],
	  
		// Mission Failure Message
		[
			"Radiation Invasion looted!",
			"Seems like the terrorists got bored and left taking the huge cache with them..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		
		["None" , 			[5,5] ], //[static loot, offset location] - spawns with the mission
		["RadiationLoot" , 	[0,0] ], // Win loot, offset location - spawns after mission success
		["None" , 			[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_CampingTable_F",[22030.220703,21105.746094,0.00123978],24.5454,[[0.415415,0.909632,0],[0,0,1]],false],
				["Land_Wreck_UAZ_F",[22031.220703,21110.746094,0.00123978],41.3637,[[0.660836,0.75053,0],[0,0,1]],false],
				["Land_Device_disassembled_F",[21869.2,20971.5,0.00155616],296.5454,[[0.415415,0.909632,0],[0,0,1]],true]				
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   				["TowerGuard",	[21957.828125,21010.695313,4.545008],[21957.828125,21010.695313,4.545008],[150, "ANY"]   ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   				["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   				["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   				["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   				["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   				["SENTRY",		[0,0],[0,0],[200] ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   				["SENTRY",		[0,0],[0,0],[300]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [1,"Rifleman_E"],[2,"SMG_E"]  ],  	["BoxPatrol",	[21868.0292969,20942.171875,1.374988],[21868.0292969,20942.171875,1.374988],[50]   ]],		//  Fountain
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [1,"Rifleman_E"],[2,"LMG_E"]  ],   	["BoxPatrol",	[21858.667969,21025.705078,0.0014286],[21858.667969,21025.705078,0.0014286],[50]   ]],		//  back road clear area
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[22049.220703,21100.746094,0.00123978],[22049.220703,21100.746094,0.00123978],[50]   ]],	//  Clear area behind the hotel 1
		[["EAST","COMBAT","RED","COLUMN"],  		[  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","VEE"],   			[  [4,"Hunter_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  		[  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  		[  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["Explore",		[0,0],[0,0],[300]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[-13,0],									[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[0,13],										[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[23,0],										[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[21868.0292969,20944.171875,1.374988],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[21978.435547,21002.785156,9.867336],		[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [5, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
		
			[   // Vehicle                     	Offset     				Direction   CargoLoot (see Loot section below for more detail!)  
				[  CAMS_Land_ArmedOffroad_E,		[0,0],	[1,"Rifleman_E"],        "TruckJunk",[0]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [ [ 1, "Rifleman_E"]  ],   ["BoxPatrol",[0,0],[0,0],[100]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],    [[ 1, "Rifleman_E"]]  ,   ["BoxPatrol",[0,0],[0,0],[100]   ]   
				]
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
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],				// Player must be near event center to count as win
			["LUCNT2",		["LowUnitCount","EAST",4,250,[0,0]]  ],		// Triggers call for reinforcements
			["AllDead",		["LowUnitCount","EAST",1,0,[0,0]]  ]			
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead","PLAYERNEAR"     ]],
			[["LOSE"],["TIMER"     ]],
			[["CHILD",	["Help_VehicleE",[0,0],5,120]],["LUCNT2"     ]],  
			[["END"],["TIMER","OR","AllDead","PLAYERNEAR"    ]]  
		]
  
	]


];
