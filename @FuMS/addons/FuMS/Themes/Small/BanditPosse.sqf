// BanditPosse.sqf
// TheOneWhoKnocks
// 02/02/2020
// Based upon drsubo Mission Scripts

[
	["BanditPosse", 200], // Mission Title NOSPACES!, and encounter radius
	["Bandit Posse","hd_objective","ELLIPSE","ColorOrange","FDiagonal",200],    
	   
	[  
		[// NOTIFICATION Messages and Map display Control.
			true, "ALL", 700,	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 		// Notify players via global message
			true,		// Show encounter area on the map
			600,    	// Win delay: Time in seconds after a WIN before mission cleanup is performed
			30       	// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],	
		[// Spawn Mission Message
			"A Bandit Posse is terrorizing a small village!",
			"Confiscate any of their property you find as payment for eliminating the threat!."
		],	
		[// Mission Success Message
			"Mission Success",
			"The Bandit Posse has been destroyed."
		],	
		[// Mission Failure Message
			"Mission Failure!",
			"The Bandit Posse has escaped."
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], //[static loot, offset location] - spawns with the mission
		["RANDOM" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [-7,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 1: building deleted at event completion, 1= building remains until server reset.
	 // ["CamoNet_INDP_open_F",[0,0],0,0]  //type, offset, rotation, presist flag
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","LINE"],   [  [2,"Sniper_E"]           ],     ["SENTRY",   [((round random 50)-100),((round random 50)-100)],[1,0], [100]      ]]
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
			["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds and no players are withen 300 m
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],// Player must be near event center to count as win
			["LaunchAI",	["ProxPlayer",[0,0], 700, 1]],// Player must be near event center to count as win
			//["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ],		// Triggers call for reinforcements
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ]		// Always leaves one behind as a special surprise for players.
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],["TIMER"     ]],
			[["CHILD",	["SpawnPosse",[0,0],1,10000]],["LaunchAI"     ]],  
			[["END"],["AllDead","OR","TIMER"    ]]  
		]
	]
];
