// 	CommsAlpha.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 10033.3,11792.4 as this map is specific to Tanoa
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Comms Alpha" v2.1 static mission for Tanoa.
	Created by [CiC]red_ned using templates by eraser1
	Exile_Car_BTR40_Camo increases persistent chance with difficulty
	19 years of CiC
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["CommsAlpha", 150], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Comms Alpha","hd_objective","ELLIPSE","ColorRed","SolidBorder",150],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Comms Alpha Invasion",	// The first line is the title of the pop-up box
			"Comms Alpha Station is being invaded by terrorists"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Comms Alpha cleared!",
			"Convicts have successfully cleared Comms Alpha Station and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Comms Alpha looted!",
			"Invaders have stripped Comms Alpha Station of loot and left."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics					
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["CommsAlphaLoot" , 	[	[9947.22,11791,0.0769348],	[10056,11761.6,0],	[10088.9,11747,0.119232]	]	],
			["CommsAlphaLoot" , 	[	[10067.4,11760,0.085144],	[9998.37,11783.5,0]								]	]

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

		["Exile_Car_BTR40_Camo",				[9947,11799.4,0],				0,			[.5,   1,     .5,         .5,         .5]],
		
		// SUGGESTED SPAWN POINTS FROM ORIGINAL MAP 
		// USED TO FIND GOOD LOCATIONS FOR SPAWN
		["Sign_Arrow_Blue_F",[10023.8,11830.5,0],0,0],
		["Sign_Arrow_Blue_F",[10022.5,11806.9,0],0,0],
		["Sign_Arrow_Blue_F",[10043.2,11809.6,0],0,0],
		["Sign_Arrow_Blue_F",[9947.78,11805.3,0],0,0],
		["Sign_Arrow_Blue_F",[9949.77,11790.5,0.0664],0,0],
		["Sign_Arrow_Blue_F",[9943.55,11776.7,0],0,0],
		["Sign_Arrow_Blue_F",[9976.6,11779.4,0],0,0],
		["Sign_Arrow_Blue_F",[9993.78,11779.1,0],0,0],
		["Sign_Arrow_Blue_F",[10009.2,11781.3,0],0,0],
		["Sign_Arrow_Blue_F",[10057.1,11759.3,0.0236],0,0],
		["Sign_Arrow_Blue_F",[10062.2,11767.4,0],0,0],
		["Sign_Arrow_Blue_F",[10064.7,11796.8,0],0,0],
		["Sign_Arrow_Blue_F",[10063.5,11784,0],0,0],
		["Sign_Arrow_Blue_F",[10070.1,11756.7,0],0,0],
		["Sign_Arrow_Blue_F",[10064.9,11756,0],0,0],
		["Sign_Arrow_Blue_F",[10070.8,11768.8,0],0,0],
		["Sign_Arrow_Blue_F",[10094.3,11744.7,0],0,0],
		["Sign_Arrow_Blue_F",[10083.8,11749.5,0],0,0],
		["Sign_Arrow_Blue_F",[10098.8,11755.1,0],0,0],
		["Sign_Arrow_Blue_F",[10101.7,11787.7,0],0,0],
		["Sign_Arrow_Blue_F",[10096.2,11795.7,0.1512],0,0],
		["Sign_Arrow_Blue_F",[10035.4,11760.8,0],0,0],
		["Sign_Arrow_Blue_F",[10018.3,11759.8,0],0,0],
		["Sign_Arrow_Blue_F",[10024.2,11783.8,0],0,0],
		["Sign_Arrow_Blue_F",[10040.8,11791.7,0],0,0],
		["Sign_Arrow_Blue_F",[9978.8,11817,0],0,0],
		["Sign_Arrow_Blue_F",[10013.9,11827.5,0],0,0],
		["Sign_Arrow_Blue_F",[10053.3,11828.3,0],0,0],
		["Sign_Arrow_Blue_F",[10075,11809.2,0],0,0],
		["Sign_Arrow_Blue_F",[10104.3,11745.3,0],0,0],
		["Sign_Arrow_Blue_F",[10000.7,11802.7,0],0,0],
		["Sign_Arrow_Blue_F",[10044.1,11795.7,0.5526],0,0],
		["Sign_Arrow_Blue_F",[10017.9,11802.8,0.6483],0,0],

		
		
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_EmplacementGun_01_rusty_F",[10112.3,11774.4,0.219055],184.545,[[-0.0792504,-0.996855,0],[-0,0,1]],false],
				["Land_EmplacementGun_01_rusty_F",[10109.7,11755.3,0.243958],184.546,[[-0.0792509,-0.996855,0],[-0,0,1]],false],
				["Land_PillboxBunker_01_hex_F",[10103.9,11784.5,0.234711],188.636,[[-0.150163,-0.988661,0],[-0,0,1]],false],
				["Land_PillboxWall_01_6m_round_F",[10107.2,11778.3,0],188.636,[[-0.150163,-0.988661,0],[-0,0,1]],false],
				["Land_PillboxWall_01_6m_round_F",[10101.6,11781.9,0],230.455,[[-0.771121,-0.636688,0],[-0,0,1]],false],
				["Land_PillboxWall_01_6m_round_F",[10097,11787.5,0],230,[[-0.766046,-0.642785,0],[-0,0,1]],false],
				["Land_Bulldozer_01_wreck_F",[9950.55,11809.2,-0.0907593],323.636,[[-0.592908,0.80527,0],[0,0,1]],false],
				["Land_Bulldozer_01_wreck_F",[9955.01,11812.4,-0.0907593],323.636,[[-0.592907,0.805271,0],[0,0,1]],false],
				["Land_Wreck_Ural_F",[9980.25,11823.9,0],82.2726,[[0.990919,0.134459,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V4_F",[10035.6,11831.7,-0.063385],183.636,[[-0.0634243,-0.997987,0],[-0,0,1]],false],
				["Land_Cargo_Patrol_V4_F",[10025.6,11758.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_red_F",[9991.8,11776.1,-0.0301514],1.36364,[[0.0237979,0.999717,0],[0,0,1]],false],
				["Land_Cargo40_red_F",[9974.61,11776.4,0],1.36365,[[0.0237979,0.999717,0],[0,0,1]],false],
				["Exile_Plant_GreenBush3",[10101.7,11735.4,0],292.273,[[-0.92539,0.379016,0],[0,0,1]],false],
				["Exile_Plant_GreenBush3",[10081.8,11820.9,0],278.182,[[-0.989821,0.142316,0],[0,0,1]],false],
				["Land_Cargo40_sand_F",[10084.2,11812.3,-0.158051],50.4545,[[0.77112,0.63669,0],[0,0,1]],false]
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
				[  "O_HMG_01_high_F"       	,[-5,0],					[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[0,-5],					[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[10045.3,11760.9,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[10101.7,11736.9,0],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[10119.5,11744.2,0],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"       	,[10083.8,11745,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[10072.2,11749.3,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[10041.5,11781.4,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[10009.8,11811.1,0],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[9972.2,11806,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[9970.87,11781,0],			[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[9941.86,11782.5,0],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[10062.5,11824.7,0],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[10075.7,11772.3,0],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[10064,11791.8,0],			[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[10064.3,11801.7,0],		[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [16, "Rifleman"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
