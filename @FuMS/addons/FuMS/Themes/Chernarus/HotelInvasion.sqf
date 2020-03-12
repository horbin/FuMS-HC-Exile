// 	HotelInvasion.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 5765.37,10368.9 as this map is specific to Tanoa
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Hotel Invasion" v2.1 static mission for Tanoa.
	Created by [CiC]red_ned using templates by eraser1
	19 years of CiC
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["HotelInvasion", 250], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Hotel Invasion","hd_objective","ELLIPSE","ColorRed","SolidBorder",250],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Hotel Invasion",	// The first line is the title of the pop-up box
			"The Lei-Low Hotel is being invaded by terrorists"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Hotel cleared!",
			"Convicts have successfully cleared the Hotel and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Hotel looted!",
			"Invaders have stripped the Hotel guests of their loot and left."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics					
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["HotelLoot" , 	[[12497.5,14210.5,0.139198],[12523.2,14228.5,0.16119],[12436.9,14216.2,0.228447],[12404.2,14196,0.325665]]],
			["HotelLoot" , 	[[12499.8,14191.3,0.167206],[12453.8,14173.9,0.317108],[12415.8,14173.4,0.32922],[12428.7,14172.9,0.289165],[12471.7,14195.7,0.413441]]]

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
		["Sign_Arrow_Blue_F", [12284.2,14233.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [12285.6,14239.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [12345.2,14207.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [12373.2,14197.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [12395.4,14184.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [12410.2,14184.1,0], 0, 0],
		["Sign_Arrow_Blue_F", [12425.2,14183.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [12447.8,14184.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [12467.2,14188.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [12489.2,14189.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [12482.3,14205.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [12488.5,14213.7,0], 0, 0],
		["Sign_Arrow_Blue_F", [12472.1,14232,0], 0, 0],
		["Sign_Arrow_Blue_F", [12496.1,14236.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [12517.4,14223.1,0], 0, 0],
		["Sign_Arrow_Blue_F", [12531.7,14265.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [12585,14266.2,0], 0, 0],
		["Sign_Arrow_Blue_F", [12617.2,14166.9,0], 0, 0],
		["Sign_Arrow_Blue_F", [12516.1,14193.7,0], 0, 0],
		["Sign_Arrow_Blue_F", [12455.1,14228.5,0], 0, 0],
		["Sign_Arrow_Blue_F", [12436.7,14237.7,0], 0, 0],
		["Sign_Arrow_Blue_F", [12385.2,14225.1,0], 0, 0],
		["Sign_Arrow_Blue_F", [12444.7,14208.9,0], 0, 0],
		["Sign_Arrow_Blue_F", [12430.7,14206.2,0], 0, 0],
		["Sign_Arrow_Blue_F", [12417.6,14223.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [12434.5,14223.8,0.232742], 0, 0],
		["Sign_Arrow_Blue_F", [12434.8,14213.3,0.250225], 0, 0],
		["Sign_Arrow_Blue_F", [12465.3,14149.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [12459.4,14120.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [12407.9,14265.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [12452,14275.9,0], 0, 0],
		["Sign_Arrow_Blue_F", [12440.4,14228.9,0.0927734], 0, 0],
		["Sign_Arrow_Blue_F", [12514.8,14229.8,0.211414], 0, 0],
		["Sign_Arrow_Blue_F", [12422.1,14174.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [12439,14172.9,0], 0, 0],
		["Sign_Arrow_Blue_F", [12464.6,14176.4,0], 0, 0]

		
		
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_HBarrier_01_line_5_green_F",[12282.9,14240.1,0.000717163],103.645,[[0.971776,-0.235905,0],[-0.0236053,-0.0972385,0.994981]],false],
				["Land_HBarrier_01_line_5_green_F",[12281.5,14234.5,0.00630951],103.645,[[0.971776,-0.235905,0],[0,-0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12216.1,14194.8,0.00366592],70.9177,[[0.94505,0.326926,0],[0.0163779,-0.0473439,0.998744]],false],
				["Land_HBarrier_01_line_5_green_F",[12217.3,14152.5,0.00553513],135.463,[[0.701368,-0.712799,0],[0,-0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12261.7,14103,0.00553513],174.554,[[0.0949074,-0.995486,0],[0,-0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12253.7,14274.5,0.00630951],196.372,[[-0.281878,-0.95945,0],[-0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12301.2,14310.2,0.00630951],244.1,[[-0.899555,-0.436808,0],[-0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12355.3,14339,0.00630951],244.1,[[-0.899555,-0.436808,0],[-0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12399.6,14352.4,0.00630951],259.554,[[-0.983427,-0.181305,0],[-0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12468.7,14357.8,0.00630951],264.554,[[-0.995487,-0.0949025,0],[-0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12539.1,14362.2,0.00630951],273.191,[[-0.99845,0.0556587,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12624.8,14347.7,0.00630951],282.736,[[-0.975396,0.220461,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12688.7,14300.4,0.00630951],329.554,[[-0.506721,0.86211,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12735.3,14222.9,0.00630951],341.373,[[-0.319413,0.947616,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12746.8,14166,0.00630951],357.736,[[-0.0395003,0.99922,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12750.3,14082,0.00630951],351.373,[[-0.150009,0.988685,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[12822.9,13951,0.00630951],351.373,[[-0.150008,0.988685,0],[0,0,1]],false]
			]
		]
	  
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
			[   // Vehicle                     Offset     					Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[0,0],							[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[12343.4,14212.7,0.0848351],	[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[12279.9,14227,0],				[0],        "None" ],
				[  "O_HMG_01_high_F"        ,[12448.1,14229.6,0.129326],	[0],        "None" ],
				[  "O_HMG_01_high_F"   		,[12438.8,14224.2,0.232151],	[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[12518,14229.3,0.13847],		[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[12496,14241.8,0],				[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[12491.6,14214.1,0],			[0],        "None" ],
				[  "O_HMG_01_high_F"        ,[12526.2,14191.5,0],			[0],        "None" ],
				[  "O_HMG_01_high_F"   		,[12436.1,14174.8,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[12410.8,14192.6,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[12364.5,14207.5,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[12465.6,14191.5,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[12395.5,14194.5,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[12415.3,14243,0],				[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [15, "Rifleman"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
				//[  FuMS_Mil_ArmedOffroads,	[5503.89,10042.7,0],	[1,"Rifleman"],      "TruckJunk",		[0.25]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				//[[["EAST","COMBAT","RED","COLUMN"],	[  [1, "Driver"]  ],["PATROLROUTE", [5503.89,10042.7,0], [5503.89,10042.7,0], ["AWARE", "NORMAL", true, false, false]]]]
			],	// Troops : These are distributed across all vehicles in this convoy. 
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				//[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"]],["BoxPatrol",[0,0],[0,0],[75]]]

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
			["PLAYERNEAR",	["ProxPlayer",[5765.37,10368.9,0], 100, 1]]
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
