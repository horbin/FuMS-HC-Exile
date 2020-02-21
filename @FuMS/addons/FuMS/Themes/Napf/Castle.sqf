// 	Castle.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 11077.8,11801.7 as this map is specific to NAPF
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Napf Castle" v2.1 static mission for Napf.
	Created by [CiC]red_ned using templates by eraser1 
	Credits to Pradatoru for mapping
	19 years of CiC http://cic-gaming.co.uk
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Castle", 200], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Napf Castle Invasion","hd_objective","ELLIPSE","ColorRed","SolidBorder",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Napf Castle Invasion",	// The first line is the title of the pop-up box
			"Terrorists are using the castle to repair their equipment"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Napf Castle cleared!",
			"Convicts have successfully killed the Terrorists and stolen all the loot"
		],
	  
		// Mission Failure Message
		[
			"Napf Castle looted!",
			"Terrorists got bored and buggered off taking all the goodies..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics	


									,


	
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["CastleLoot" , 	[[11050.3,11793.3,0.557617],[11057.3,11787.8,0.910721],[11063.9,11783.8,4.2645],[11065.1,11790.2,0.257599]]],
			["CastleLoot" , 	[[11082.7,11814.9,0.553116],[11083.4,11792.8,0.398758],[11083.9,11811.6,6.86894],[11098,11824.6,3.14572]]]

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
		["Sign_Arrow_Blue_F", [11004.7,11790.3,0.0507965], 0, 0],
		["Sign_Arrow_Blue_F", [11004.8,11801.7,0.0518341], 0, 0],
		["Sign_Arrow_Blue_F", [11030.3,11809,0.00924683], 0, 0],
		["Sign_Arrow_Blue_F", [11034.4,11799.6,0.0085144], 0, 0],
		["Sign_Arrow_Blue_F", [11036.9,11783,0.0135651], 0, 0],
		["Sign_Arrow_Blue_F", [11042.2,11776.6,0.00935364], 0, 0],
		["Sign_Arrow_Blue_F", [11046.2,11797.3,0.866241], 0, 0],
		["Sign_Arrow_Blue_F", [11058.9,11784.2,4.38593], 0, 0],
		["Sign_Arrow_Blue_F", [11063.1,11826,0.00410461], 0, 0],
		["Sign_Arrow_Blue_F", [11065.2,11769.3,0.00350952], 0, 0],
		["Sign_Arrow_Blue_F", [11068.7,11792,0.000991821], 0, 0],
		["Sign_Arrow_Blue_F", [11071.4,11829.6,30.2139], 0, 0],
		["Sign_Arrow_Blue_F", [11074.3,11806.1,0.000457764], 0, 0],
		["Sign_Arrow_Blue_F", [11076.1,11766.2,0.0083313], 0, 0],
		["Sign_Arrow_Blue_F", [11079.2,11822.1,0.000244141], 0, 0],
		["Sign_Arrow_Blue_F", [11081.4,11786.9,0.407394], 0, 0],
		["Sign_Arrow_Blue_F", [11084.3,11815.8,6.86604], 0, 0],
		["Sign_Arrow_Blue_F", [11089.1,11822.8,2.94565], 0, 0],
		["Sign_Arrow_Blue_F", [11089.8,11777.1,0.00218201], 0, 0],
		["Sign_Arrow_Blue_F", [11096.8,11832.3,0.0243988], 0, 0],
		["Sign_Arrow_Blue_F", [11100.4,11843.2,0.0456543], 0, 0],
		["Sign_Arrow_Blue_F", [11106.6,11827,0.014801], 0, 0],
		["Sign_Arrow_Blue_F", [11108.6,11798.6,0.00392151], 0, 0],
		["Sign_Arrow_Blue_F", [11127.9,11831.9,0.0297546], 0, 0],
		["Sign_Arrow_Blue_F", [11131.4,11818.9,0.0249176], 0, 0],
		
		
		
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["CUP_A2_concpipeline_ep1",[11095.5,11803.6,230.182],[[-0.677953,0.72331,0.13116],[0.0489378,-0.133619,0.989824]],[true,false]],
				["CUP_A2_concpipeline_ep1",[11097.4,11801.4,229.775],[[-0.677953,0.72331,0.13116],[0.0489378,-0.133619,0.989824]],[true,false]],
				["CUP_A2_dirtmount",[10996.8,11805,218.661],[[-8.20177e-008,-0.998436,0.0559086],[-0.346166,0.052452,0.936706]],[false,false]],
				["CUP_A2_dirtmount",[10996.9,11788.6,218.753],[[0,0.96806,0.250718],[-0.274966,-0.241054,0.930745]],[false,false]],
				["Land_HBarrierTower_F",[11000.2,11789.9,219.894],[[0.991193,-0.112574,0.0697458],[-0.0707467,-0.00491557,0.997482]],[false,true]],
				["Land_HBarrierTower_F",[11001,11804.7,220.352],[[0.997121,-0.0701683,0.0287348],[-0.0308232,-0.0288636,0.999108]],[false,true]],
				["Land_HBarrierTower_F",[11132.3,11834.4,222.266],[[-0.901086,-0.421546,0.101703],[0.0739517,0.0817141,0.993908]],[false,true]],
				["Land_HBarrierTower_F",[11138,11821.8,222.258],[[-0.901846,-0.416398,0.11527],[0.0975479,0.0636698,0.993192]],[false,true]],
				["Land_Trench_01_grass_F",[10997.5,11788.9,219.774],[[-0.996528,0.0832604,0],[0,0,1]],[false,false]],
				["Land_Trench_01_grass_F",[10997.8,11791.4,220.027],[[-0.996528,0.0832604,0],[0,0,1]],[false,false]],
				["Land_Trench_01_grass_F",[10998.2,11803.8,220.66],[[-0.996528,0.0832604,0],[0,0,1]],[false,false]],
				["Land_Trench_01_grass_F",[10998.5,11806.3,220.408],[[-0.996528,0.0832604,0],[0,0,1]],[false,false]]
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
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[11014.4,11801.8,-1.52588e-005],[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[11026.7,11784,0.000396729],	[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[11055,11785.9,4.82426],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[11082.6,11768.8,-0.000274658],[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[11084.4,11806.5,7.53537],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"       	,[11090.2,11811.8,7.01128],		[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [6, "Rifleman"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
			["PLAYERNEAR",	["ProxPlayer",[11077.8,11801.7,0], 100, 1]]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],		["AllDead","PLAYERNEAR"    ]],
			[["LOSE"],		["TIMER"     ]],
			[["CHILD",		["Help_Helo",[0,0],6,300]],["LUCNT"     ]],  
			[["END"],		["TIMER","OR","PLAYERNEAR", "AllDead"   ]]  
		]
	]
];
