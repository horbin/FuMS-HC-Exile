// SniperRaid.sqf
// TheOneWhoKnocks
// 1/12/2020
// Based upon drsubo Mission Scripts

[
	["SniperRaid", 75], // Mission Title NOSPACES!, and encounter radius
	["Sniper Raid","plp_mark_as_infantry","ELLIPSE","ColorOrange","FDiagonal",75],    
	[  
		[// NOTIFICATION Messages and Map display Control.
			true, "ALL", 0,	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global message
			true,			// Show encounter area on the map
			600,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			30       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[// Spawn Mission Message
			"Snipers have been spotted setting up in a small village!",
			"Confiscate any of their property you find as payment for eliminating the threat!."
		],
		[// Mission Success Message
			"Sniper nest destroyed",
			"The Snipers have been destroyed."
		],
		[// Mission Failure Message
			"Snipers escaped!",
			"The Snipers have left the village."
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], //[static loot, offset location] - spawns with the mission
		["RANDOM" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [-7,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 1: building deleted at event completion, 1= building remains until server reset.
	  //["Land_BagBunker_Tower_F",[0,0],0,0]  //type, offset, rotation, presist flag
		
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","STEALTH","RED","LINE"],  [  [2,"SNIPER"]           ],     ["TowerGuard",[6,-6],[0,0],[100,"ANY"]     ]],
		[["EAST","COMBAT","RED","LINE"],   [  [2,"SNIPER"]           ],     ["BUILDINGS",[-6,6],[0,0],[50]     ]],
		[["EAST","COMBAT","RED","LINE"],   [  [2,"SNIPER"]           ],     ["EXPLORE",   [10,10],[0,1], [50]      ]],
		[["EAST","STEALTH","RED","LINE"],  [  [2,"SNIPER"]           ],     ["SENTRY",   [0,-10],[1,0], [50]      ]]
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
			//["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ],		// Triggers call for reinforcements
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ]		// Always leaves one behind as a special surprise for players.
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],["TIMER"     ]],
			//[["CHILD",	["Help_Helo",[0,0],5,120]],["LUCNT"     ]],  
			[["END"],["AllDead","OR","TIMER"    ]]  
		]
	]
];