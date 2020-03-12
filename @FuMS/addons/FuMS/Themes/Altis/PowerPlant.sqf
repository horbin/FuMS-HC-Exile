// 	PowerPlant.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 15401.227539,15972.847656 as this map is specific to Altis
// 	This mission was ported from =CF=Dragunov collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
    "Solar Power Plant" static mission for Altis.
    Based on a mission by eraser1
    Adapted for Altis Solar Power Plant by =CF=Dragunov
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["PowerPlant", 500], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Power Plant","hd_objective","ELLIPSE","ColorRed","SolidBorder",500],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[				// NOTIFICATION Messages and Map display Control.
		true, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 			// Notify players via global toast message
		true,			// Show encounter area on the map
		600,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Solar Power Plant",	// The first line is the title of the pop-up box
			"A Group of Terrorists have Assaulted the Solar Power Plant. There are reports they are Heavily Armed and have a stockpile of Weapons."		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Power Plant cleared",
			"Convicts have successfully liberated the Solar Power plant and have taken the cache"
		],
	  
		// Mission Failure Message
		[
			"Power Plant looted",
			"Seems like the terrorists got bored and left taking the huge cache and fabulous vehicles with them..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["LOOTBOX" , 	[0,0] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,												
			[	// paste your array of building objects here
				["Land_CampingTable_F",	[15369.920898,15981.40332,0.001441],24.5454,[[0.415415,0.909632,0],[0,0,1]],false],
				["Land_Wreck_UAZ_F",	[15365.920898,15989.40332,0.001441],41.3637,[[0.660836,0.75053,0],[0,0,1]],false]
			]
 		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","VEE"],   		[  [2,"Rifleman_E"]  ],   				["Loiter",		[15368.97168,15976.119141,0.0014534],[15368.97168,15976.119141,0.0014534],[50]   ]],			//  Near the desk (W)
		[["EAST","COMBAT","RED","VEE"],   		[  [2,"Rifleman_E"]  ],   				["Loiter",		[15351.546875,16216.283203,0.00143528],[15351.546875,16216.283203,0.00143528],[50]   ]],		//  By the small military cargo tower near the road (N)
		[["EAST","COMBAT","RED","VEE"],   		[  [2,"Rifleman_E"]  ],   				["Loiter",		[15480.575195,15901.859375,0.00140667],[15480.575195,15901.859375,0.00140667],[50]   ]],		//  Clear space by the small cargo tower (W)
		[["EAST","AWARE","YELLOW","COLUMN"],  	[  [1,"Sniper_E"]  ],   				["TowerGuard",	[15480.4,15912.2,4.32122],[15480.4,15912.2,4.32122],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  	[  [1,"Sniper_E"]  ],   				["TowerGuard",	[15371.9,15852.3,4.34659],[15371.9,15852.3,4.34659],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  	[  [1,"Sniper_E"]  ],   				["TowerGuard",	[15363,15892,3.1363],[15363,15892,3.1363],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  	[  [1,"Sniper_E"]  ],   				["TowerGuard",	[15280.9,15895.2,4.27559],[15280.9,15895.2,4.27559],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  	[  [1,"Sniper_E"]  ],   				["Loiter",		[15268.7,16238.1,48.2208],[15280.9,15895.2,4.27559],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   		[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[15429.394531,15990.97168,0.00141668],[15429.394531,15990.97168,0.00141668],[75]   ]],			//  Opposite side, clear space (E)
		[["EAST","COMBAT","RED","LINE"],   		[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[15381.762695,15911.453125,0.00144291],[15381.762695,15911.453125,0.00144291],[75]   ]],		//  Clear space near water (E)
		[["EAST","COMBAT","RED","VEE"],   		[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[15412.185547,16042.538086,0.00141907],[15412.185547,16042.538086,0.00141907],[75]   ]],		//  Clear space East side aligned with hill (E)
		[["EAST","COMBAT","RED","VEE"],   		[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[15385.728516,16253.981445,0.00142002],[15385.728516,16253.981445,0.00142002],[75]   ]],		//  Clear area by the agora solar huge towers
		[["EAST","COMBAT","YELLOW","COLUMN"],  	[  [1,"Sniper_E"],[3,"Rifleman_E"]  ],	["Buildings",	[15214.838867,16230.0810547,0.00147247],[15214.838867,16230.0810547,0.00147247],[150]   ]],		//  Clear area by the fuel tanks (NW)

		
		[["EAST","AWARE","YELLOW","COLUMN"],	[  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],	[  [1,"Sniper_E"],[2,"Rifleman_E"]  ],  ["Buildings",	[0,0],[0,0],[125]   ]],
		[["EAST","AWARE","YELLOW","LINE"],  	[  [1,"Sniper_E"],[2,"Rifleman_E"]  ],  ["Explore",		[0,0],[0,0],[150]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],									[0],     	"None" ],		// 5 meters West of center pos (table)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],									[0],     	"None" ],		// 5 meters East of center pos (table)
				[  "O_HMG_01_high_F"        ,[((round random 100)-50),((round random 100)-50)],									[0],        "None" ], 		// 5 meters North of center pos
				[  "O_HMG_01_high_F"        ,[((round random 100)-50),((round random 100)-50)],									[0],        "None" ], 		// 5 meters South of center pos		
				[  "O_HMG_01_high_F"   		,[15252.710938,16250.327148,10.100967],		[0],     	"None" ],		// Top of NorthWest Fuel Tank (NW)			
				[  "O_HMG_01_high_F"   		,[15359.521484,16216.516602,4.342695],		[0],     	"None" ]		// Top of the military cargo tower by the road (N)
				// If driver-less vehicles are desired, place them at the bottom of the list ND Hv less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [6, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
			["LUCNT",		["LowUnitCount","EAST",15,500,[0,0]]  ],		// Triggers call for reinforcements
			["LUCNT3",		["LowUnitCount","EAST",10,500,[0,0]]  ],		// Triggers call for reinforcements
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],				// Player must be near event center to count as win
			["AllDead",		["LowUnitCount","EAST",0,250,[0,0]]  ]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["CHILD",	["Help_Ground",[0,0],2,120]],["LUCNT"     ]],  
			[["CHILD",	["Help_Helo",[0,0],2,180]],["LUCNT3"     ]],  
			[["LOSE"],	["TIMER"     ]],
			[["WIN"],	["AllDead","PLAYERNEAR"     ]],  // 
			[["END"],	["TIMER","OR","AllDead","PLAYERNEAR"     ]]  
		]      
	]
];
