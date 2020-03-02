// 	Georgetown.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 5765.37,10368.9 as this map is specific to Tanoa
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Georgetown Invasion" v2.1 static mission for Tanoa.
	Created by [CiC]red_ned using templates by eraser1
	Exile_Chopper_Huey_Desert increases persistent chance with difficulty
	Reinforcements of AI vehicle patrols, 2 different groups of AI so one is dedicated sniper
	This version includes AI heli - thanks to aussie battler for help with this
	Diffficulty of mission not linked to difficulty of AI if you want.
	17 years of CiC
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Georgetown", 250], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Georgetown Invasion","hd_objective","ELLIPSE","ColorRed","SolidBorder",250],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Georgetown Invasion",	// The first line is the title of the pop-up box
			"Georgetown is being invaded by terrorists"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Georgetown cleared!",
			"Convicts have successfully cleared Georgetown and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Georgetown looted!",
			"Invaders have stripped Georgetown of loot and left."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics					
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["GeorgetownLoot" , 	[	[5777.83,10349.7,0],		[5754.64,10393.5,0.0875998],	[5727.57,10366,0.258264]	]	],
			["GeorgetownLoot" , 	[	[5767.56,10384,0.821316],	[5751.11,10363.5,0.0801148]									]	]

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

		["Exile_Chopper_Huey_Desert",				[5818.5,10357.4,0],				0,			[.5,   1,     .5,         .5,         .5]],
		
		// SUGGESTED SPAWN POINTS FROM ORIGINAL MAP 
		// USED TO FIND GOOD LOCATIONS FOR SPAWN
		["Sign_Arrow_Blue_F",[5739.91,10301.2,0],0,0],
		["Sign_Arrow_Blue_F",[5720.12,10242.9,0],0,0],
		["Sign_Arrow_Blue_F",[5693.45,10177.8,0],0,0],
		["Sign_Arrow_Blue_F",[5731.93,10162.6,0],0,0],
		["Sign_Arrow_Blue_F",[5705.9,10118.9,0],0,0],
		["Sign_Arrow_Blue_F",[5717.31,10077.4,0],0,0],
		["Sign_Arrow_Blue_F",[5565.75,9897.22,0],0,0],
		["Sign_Arrow_Blue_F",[5556.96,9911.44,0],0,0],
		["Sign_Arrow_Blue_F",[5529.53,9922.53,0],0,0],
		["Sign_Arrow_Blue_F",[5503.74,10030.3,0],0,0],
		["Sign_Arrow_Blue_F",[5578.77,10048.2,0],0,0],
		["Sign_Arrow_Blue_F",[5625.2,10063.9,0],0,0],
		["Sign_Arrow_Blue_F",[5651.92,10109.3,0],0,0],
		["Sign_Arrow_Blue_F",[5666.7,10171.2,0],0,0],
		["Sign_Arrow_Blue_F",[5664.16,10258.3,0],0,0],
		["Sign_Arrow_Blue_F",[5713.34,10401.4,0],0,0],
		["Sign_Arrow_Blue_F",[5818.65,10373.4,0],0,0],
		["Sign_Arrow_Blue_F",[5818.57,10445.9,0],0,0],
		["Sign_Arrow_Blue_F",[5791.23,10569.9,0],0,0],
		["Sign_Arrow_Blue_F",[5796.77,10614.2,0],0,0],
		["Sign_Arrow_Blue_F",[5782.76,10700.8,0],0,0],
		["Sign_Arrow_Blue_F",[5800.82,10796.3,0],0,0],
		["Sign_Arrow_Blue_F",[5859.48,10827,0],0,0],
		["Sign_Arrow_Blue_F",[5870.57,11007.3,0],0,0],
		["Sign_Arrow_Blue_F",[5867.14,11010.9,0],0,0],
		["Sign_Arrow_Blue_F",[5852.48,10750.7,0],0,0],
		["Sign_Arrow_Blue_F",[5920.26,10600.3,0],0,0],
		["Sign_Arrow_Blue_F",[5980.07,10574.8,0],0,0],
		["Sign_Arrow_Blue_F",[5984.41,10583.4,0],0,0],
		["Sign_Arrow_Blue_F",[5765.45,10480.6,0],0,0],
		["Sign_Arrow_Blue_F",[5774.28,10351.5,0],0,0],
		["Sign_Arrow_Blue_F",[5766.5,10380.1,0],0,0],
		["Sign_Arrow_Blue_F",[5730.95,9991.98,0],0,0],
		
		// SUGGESTED SNIPER SPOTS
		["Sign_Arrow_F",[5741.25,10396.4,8.33376],0,0],
		["Sign_Arrow_F",[5701.03,10423.4,6.84472],0,0],
		["Sign_Arrow_F",[5790.64,10473,11.6051],0,0],
		["Sign_Arrow_F",[5824.09,10515.8,10.7217],0,0],
		["Sign_Arrow_F",[5775.01,10552.9,10.7422],0,0],
		["Sign_Arrow_F",[5762.65,10668.1,9.01839],0,0],
		["Sign_Arrow_F",[5837.25,10835.2,7.21549],0,0],
		["Sign_Arrow_F",[5764.46,10227.4,10.9102],0,0],
		["Sign_Arrow_F",[5532.89,10011.9,11.0499],0,0],
		["Sign_Arrow_F",[5734.16,10144.5,8.6512],0,0],
		["Sign_Arrow_F",[5737.27,10332.6,6.52303],0,0],
		["Sign_Arrow_F",[5744.84,10238.2,12.026],0,0],
		["Sign_Arrow_F",[5724.98,10212.2,8.45481],0,0],
		["Sign_Arrow_F",[5788.08,10274.6,8.08307],0,0],
		["Sign_Arrow_F",[5832.26,10327.4,11.1234],0,0],
		["Sign_Arrow_F",[5763.99,10637.7,11.5969],0,0],
		["Sign_Arrow_F",[5707.85,10506.4,6.96054],0,0],
		["Sign_Arrow_F",[5760.84,10489.4,11.0633],0,0],
		["Sign_Arrow_F",[5830.4,10476.5,10.7212],0,0],
		["Sign_Arrow_F",[5759.04,10320.2,7.95645]0,0],
		
		//VEHICLE SPAWN LOCATIONS
		["Sign_Arrow_Pink_F",[5503.89,10042.7,0],0,0],
		["Sign_Arrow_Pink_F",[5811.15,10488.8,0],0,0],
		["Sign_Arrow_Pink_F",[5785.14,10610.8,0],0,0],
		["Sign_Arrow_Pink_F",[5778.55,10756.6,0],0,0],
		["Sign_Arrow_Pink_F",[5892.39,10749.2,0],0,0],
		["Sign_Arrow_Pink_F",[5911.17,10622.2,0],0,0],
		["Sign_Arrow_Pink_F",[5769.6,10602.6,0],0,0],
		["Sign_Arrow_Pink_F",[5698.83,10372.1,0],0,0],
		["Sign_Arrow_Pink_F",[5648.25,10179.4,0],0,0],
		["Sign_Arrow_Pink_F",[5715.98,10107,0],0,0],
		["Sign_Arrow_Pink_F",[5621.89,10082.9,0]0,0],

		
		
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_HBarrier_01_line_5_green_F",[5534.24,9917.15,0],346.364,[[-0.235752,0.971813,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5527.07,9915.4,0],346.364,[[-0.235752,0.971813,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5519.7,9913.69,0],346.364,[[-0.235752,0.971813,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5554.61,9906.41,0],68.6364,[[0.931288,0.364285,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5557.05,9900,0],68.6364,[[0.931288,0.364285,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5559.55,9893.38,0],68.6364,[[0.931288,0.364285,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5855.99,10834,0],349.091,[[-0.189249,0.981929,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5848.85,10832.8,0],349.091,[[-0.189249,0.981929,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5871.29,11018.3,0],5.90911,[[0.102951,0.994686,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5856.92,11043.9,0],292.727,[[-0.922356,0.386341,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5992.38,10565.1,0],305,[[-0.819152,0.573577,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5996.99,10571.6,0],305,[[-0.819152,0.573577,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5738.94,9993.64,0],108.182,[[0.95007,-0.312037,0],[0,-0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5736.82,9986.05,0],108.182,[[0.95007,-0.312037,0],[0,-0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5773.12,10185.9,0],8.18182,[[0.142315,0.989821,0],[0,0,1]],false],
				["Land_HBarrier_01_line_5_green_F",[5764.78,10187.1,0],8.18182,[[0.142315,0.989821,0],[0,0,1]],false]
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
				[  "O_HMG_01_high_F"       	,[0,0],							[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[0,-2],						[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[5841.33,10837.6,7.02381],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[5852.05,10834.8,0],			[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[5996.15,10567.3,0],			[0],     	"None" ],   
				[  "O_HMG_01_high_F"       	,[5976.56,10596.7,3.05931],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[5987.16,10588.6,0.25619],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[5513.95,9915.8,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[5539.56,9919.56,0.0459909],	[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[5564.54,9903.37,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[5730.09,10002.3,3.52505],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[5715.29,10032,3.29457],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[5751.59,10385.6,0],			[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[5748.03,10360.1,3.34197],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[5488.29,10046.1,0],			[0],     	"None" ], 
				[  "O_HMG_01_high_F"   		,[5799.66,10560.4,3.19466],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[5702.8,10400.8,0,]			[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[5768.91,10186.1,0],			[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [18, "Rifleman"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
				[  FuMS_Mil_ArmedOffroads,	[5503.89,10042.7,0],	[1,"Rifleman"],      "TruckJunk",		[0.25]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					[
						["EAST","COMBAT","RED","COLUMN"],   
						[  [1, "Driver"]  ],   
						["PATROLROUTE", [5503.89,10042.7,0], [5503.89,10042.7,0], ["AWARE", "NORMAL", 
							[
								[5503.89,10042.7,0],[5811.15,10488.8,0],[5785.14,10610.8,0],[5778.55,10756.6,0],[5892.39,10749.2,0],[5911.17,10622.2,0],
								[5769.6,10602.6,0],[5698.83,10372.1,0],[5648.25,10179.4,0],[5715.98,10107,0],[5621.89,10082.9,0]
							], true, false, false]
						]
					]
				]
			],	// Troops : These are distributed across all vehicles in this convoy. 
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"]],["BoxPatrol",[0,0],[0,0],[75]]
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
