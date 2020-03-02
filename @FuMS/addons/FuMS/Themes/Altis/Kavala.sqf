// 	Kavala.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 3747.34,12990.4 as this map is specific to Altis
// 	This mission was ported from =CF=Dragunov's set of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
    "Kavala Hospital" static mission for Altis.
    Based on an Defent/eraser1 mission
    Created by =CF=Dragunov
*/
//
// This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Kavala", 500], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Kavala Hospital","hd_objective","ELLIPSE","ColorRed","SolidBorder",500],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Kavala Hospital",	// The first line is the title of the pop-up box
			"A Group of Terrorists invaded the Kavala Hospital. Intel reports they have loot boxes there.."		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Kavala Hospital cleared!",
			"Convicts have successfully liberated the Kavala Hospital and now are dividing the loot"
		],
	  
		// Mission Failure Message
		[
			"Kavala Hospital looted!",
			"Seems like the terrorists got bored and left taking the huge cache and money with them..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics	
	
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["KavalaLoot" , 	[[3049.73,13202.9,18.3091],[2995.75,13238.9,-0.0138435],[2992.14,13289.1,7.87374],[3053.48,13255.4,-0.0370255]]],
			["KavalaLoot" , 	[[3151.6,13084.6,8.69122],[3177.64,13150.8,3.96083],[3118.58,13210.5,0] ]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_UWreck_MV22_F",	[3731.72,12976.2,19.4927],	24.5454,[[0.415415,0.909632,0],[0,0,1]],false],
				["Land_Wreck_HMMWV_F",	[3748.81,13036,0.00164413],	24.5454,[[0.415415,0.909632,0],[0,0,1]],false],
				["Land_Wreck_UAZ_F",	[3734.42,12993.6,0.0014801],41.3637,[[0.660836,0.75053,0],[0,0,1]],false]
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   		["Loiter",		[3746.06,12970,18.8735],[3746.06,12970,18.8735],[10]]],
		[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   		["Loiter",		[3726.84,12976.6,19.4938],[0,0],[10]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   		["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  		[  [1,"Sniper_E"]  ],   		["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [3,"Rifleman_E"]  ], 		["BoxPatrol",	[3762.42,13015.7,0.157682],[3762.42,13015.7,0.157682],	[25]   ]],		//  ground level room
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [3,"Hunter_E"]  ],   		["Buildings",	[3751.32,12977,15.5085],[3751.32,12977,15.5085],		[25]   ]],		//  below helipad ramp
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [3,"Rifleman_E"]  ], 		["BoxPatrol",	[3683.76,12977.3,0.001194],[3683.76,12977.3,0.001194],	[25]   ]],		//  behind the houses in front
		[["EAST","COMBAT","RED","COLUMN"],  		[  [2,"SMG_E"]  ],   			["Explore",		[0,0],[0,0],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   			[  [2,"Rifleman_E"]  ], 		["BoxPatrol",	[0,0],[0,0],[75]   ]],
		[["EAST","COMBAT","YELLOW","COLUMN"],  		[  [2,"Hunter_E"]  ],   		["Explore",		[0,0],[0,0],[100]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[310],  "None" ],	// 3 meters West of center pos
				[  "O_HMG_01_high_F"        ,[3723.3,12977.2,15.5121],		[270],  "None" ], 	// projected front
				[  "O_HMG_01_high_F"        ,[3763.25,13032.1,18.9741],		[0],	"None" ], 	// projected back
				[  "O_HMG_01_high_F"   		,[3773.12,12986.1,0.142307],	[90],   "None" ]	// reception desk - indoor
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [4, "Rifleman_E"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
			["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds and no players are withen 300 m
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],				// Player must be near event center to count as win
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Always leaves one behind as a special surprise for players.
			["LUCNT",		["LowUnitCount","EAST",15,250,[0,0]]  ],	// Triggers call for reinforcements
			["LUCNT2",		["LowUnitCount","EAST",10,250,[0,0]]  ]		// Triggers call for reinforcements

		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],	["TIMER"     ]],
			[["CHILD",	["Help_GroundE",[0,0],3,120]],["LUCNT"     ]],  
			[["CHILD",	["Help_Helo",[0,0],5,120]],["LUCNT2"     ]],  
			[["END"],	["AllDead","OR","TIMER"    ]]  
		]

  
	]


];
