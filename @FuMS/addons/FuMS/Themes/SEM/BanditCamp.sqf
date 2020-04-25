// BanditCamp.sqf
// TheOneWhoKnocks
// 02/02/2020
// Added support for CAMS system
// Based upon drsubo Mission Scripts

[
	["BanditCamp", 200, "LAND"], // Mission Title NOSPACES!, and encounter radius
	["Bandit Camp","hd_objective", "ELLIPSE","ColorGreen","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		true, "ALL", 700, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		900,   				// Win delay: Time in seconds after a WIN before mission cleanup is performed
		30      			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
		[   
			"Bandit Base Camp reported in the area",
			"A Bandit Camp has been Located and is Marked on Your Map.  They Probably Have some Nice Toys..."
		],
		
		// Mission Success Message
		[
			"Bandit Base Camp Destroyed",
			"The Bandits have been Terminated and Players are Sorting Through the Loot."
		],
	  
		// Mission Failure Message
		[  
			"Bandit Base Camp disbanded",
			"Bandits have broken camp and moved on."
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , 	[18,-9] ], //[static loot, offset location] - spawns with the mission
		["RANDOM" , [-5,0] 	], // Win loot, offset location - spawns after mission success
		["None" , 	[0,0] 	]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		[ImFX_Build_Mil_Tower,[((round random 10)-20),((round random 10)-20)],0,0]   //type, offset, rotation, presist flag
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","STEALTH","RED","LINE"],	[  [1,"Sniper_E"]	],   ["LOITER",	[((round random 50)-100),((round random 50)-100)],	[6,6],[5,"ANY"]	]],
		[["EAST","STEALTH","RED","LINE"],	[  [1,"Sniper_E"]	],   ["TowerGuard",	[((round random 50)-100),((round random 50)-100)],	[0,0],[150,"ANY"]	]]
	],

	// Vehicles
	[
					 
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			["Timer",			["TimerNoPlayers", 2000] ],   				// Trigger true if the mission timer reaches 1800 seconds and no players are withen 300 m
			["PLAYERNEAR",		["ProxPlayer",[0,0], 100, 1]],				// Player must be near event center to count as win
			["LaunchGuards",	["ProxPlayer",[0,0], 700, 1]],				// Player must be near event center to count as win
			
			["AllDead",			["LowUnitCount","EAST",0,500,[0,0]]  ],		// 
			["LUCNT",			["LowUnitCount","EAST",1,500,[0,0]]  ]		// Triggers call for reinforcements

		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],			["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],			["TIMER"     ]],
			[["CHILD",			["Help_Helo",[0,0],1,120]],["LUCNT"     ]],  
			[["CHILD",			["SpawnGuards",[0,0],1,120]],["LaunchGuards"     ]],  

			[["END"],			["TIMER","OR", "AllDead"   ]]  
		]      
	]
];
