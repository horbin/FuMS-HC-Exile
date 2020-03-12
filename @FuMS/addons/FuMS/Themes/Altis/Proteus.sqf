// 	Proteus.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 11764.7,13329.6 as this map is specific to Altis
// 	This mission was ported from =CF=Dragunov collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
    "Nuclear Submarine Proteus" static mission for Altis.
    Based on a mission by eraser1
    Created by =CF=Dragunov
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Proteus", 400], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Proteus Shipwrecked","ExileContaminatedZone","ELLIPSE","ColorRed","SolidBorder",400],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Proteus Shipwrecked",	// The first line is the title of the pop-up box
			"A Nuclear submarine just ran aground near Poliakko Bay, it is heavely protected! Do something!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Proteus has been secured!",
			"Convicts have successfully controlled the Nuclear Submarine and have taken the cache"
		],
	  
		// Mission Failure Message
		[
			"Proteus repaired!",
			"Seems like the Nuclear Submarine crew fixed the sub and left. Your fault, you just build, build!"
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[0,0] ], 		//[static loot, offset location] - spawns with the mission
		["ProteusLoot" ,[30,150] ], 	// Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  		// Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		["Submarine_01_F",				[11815.1,13395.3,4.05626],				296.5454,			[0,   0,     .5,         .5,         .5],"SMOKE_MEDIUM"],
		["Land_Device_disassembled_F",	[11769.8,13339.1,0.00155616],			296.5454,			0]	
	
/*	
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Device_disassembled_F",[11769.8,13339.1,0.00155616],296.5454,[[0.415415,0.909632,0],[0,0,1]],true]	
			]
		]
*/	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["Loiter",		[11836,13272,-0.0415688],[11836,13272,-0.0415688],[50]   ]],
		//[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   			["Loiter",		[22648.419922,7833.15625,0.00106049],[22648.419922,7833.15625,0.00106049],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["BoxPatrol",	[11682.9,13574.2,0.00332069],[11682.9,13574.2,0.00332069],[75]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [2,"Sniper_E"]  ],   				["TowerGuard",	[22793.271484,7689.626465,17.810936],[22793.271484,7689.626465,17.810936],[150, "ANY"]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22849.380859,7697.429688,18.547241],[22849.380859,7697.429688,18.547241],[150, "ANY"]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22818.0625,7785.050293,18.912285],[22818.0625,7785.050293,18.912285],[150, "ANY"]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22740.378906,7873.231934,18.979851],[22740.378906,7873.231934,18.979851],[100, "ANY"]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22679.738281,7940.896484,17.935356],[22679.738281,7940.896484,17.935356],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["Buildings",	[11849.4,13147.2,0.677441],[11849.4,13147.2,0.677441],[75]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["Buildings",	[11821,13625.5,0.00130081],[11821,13625.5,0.00130081],[75]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[0],     	"None" ],		// 3 meters West of center pos (table)
				[  "O_HMG_01_high_F"       	,[11887.6,13546.7,8.25699],		[0],     	"None" ],		// up in the pier
				[  "O_HMG_01_high_F"       	,[11753,13593.4,-0.0059948],	[0],     	"None" ],		// slums
				[  "O_HMG_01_high_F"   		,[11781,13211,-0.0144739],		[0],     	"None" ]		// Up in the big tower W
				// If driver-less vehicles are desired, place them at the bottom of the list ND Hv less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [4, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
				[  CAMS_Land_ArmedOffroad_E,		[-40,-40],	[1,"Rifleman_E"],        "TruckJunk",[0]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   	[ [ 1, "Rifleman_E"]  ],   ["BoxPatrol",[-40,-40],[-40,-40],[50]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],    [[ 1, "Rifleman_E"]]  ,   ["BoxPatrol",[-40,-40],[-40,-40],[50]   ]   
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
			["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds and no players are withen 300 m
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],				// Player must be near event center to count as win
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Always leaves one behind as a special surprise for players.
			["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ]		// Triggers call for reinforcements
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],	["TIMER"     ]],
			[["CHILD",	["Help_Helo",[0,0],5,120]],["LUCNT"     ]],  
			[["END"],	["AllDead","OR","TIMER"    ]]  
		]
	]
];
