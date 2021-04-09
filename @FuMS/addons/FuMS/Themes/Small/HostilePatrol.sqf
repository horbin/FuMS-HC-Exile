// HostilePatrol.sqf
// TheOneWhoKnocks
// 1/15/2020
// Based upon drsubo Mission Scripts

[
	["HostilePatrol", 200], // Mission Title NOSPACES!, and encounter radius
	["Hostile Patrol","plp_mark_as_specialforces","ELLIPSE","ColorOrange","FDiagonal",200],    
	   
	[  
		[// NOTIFICATION Messages and Map display Control.
			true, "ALL", 1000,	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global message
			true,			// Show encounter area on the map
			1800,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			30       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
			// Spawn Mission Message
		[
			"A Hostile Patrol Has Been Spotted searching a village!",
			"Confiscate any of their property you find as payment for eliminating the threat!"
		],
			
			// Mission Success Message
		[
			"Hostile Patrol destroyed",
			"The Hostile Patrol has been destroyed."
		],
		  
			// Mission Failure Message
		[
			"Hostile Patrol escaped",
			"The Hostile Patrol has looted the village and evacuated the area."
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], //[static loot, offset location] - spawns with the mission
		["RANDOM" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [-7,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 1: building deleted at event completion, 1= building remains until server reset.
	  //["CamoNet_INDP_open_F",[0,0],0,0]  //type, offset, rotation, presist flag
		 
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","LINE"],   [  [3,"Hunter_E"]           ],     ["BUILDINGS",[((round random 50)-100),((round random 50)-100)],[0,0],[150]     ]]

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
			["Timer",		["TimerNoPlayers", random [1000,1200,1400]] ],   // Trigger true if the mission timer reaches 1000 - 1400 seconds and no players are withen 300 m
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],					// Player must be near event center to count as win
			["LaunchAI",	["ProxPlayer",[0,0], 700, 1]],					// Player must be near event center to count as win
			//["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ],		// Triggers call for reinforcements
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ]			// Always leaves one behind as a special surprise for players.
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],["TIMER"     ]],
			[["CHILD",	["SpawnPatrol",[0,0],1,10000]],["LaunchAI"     ]],  
			[["END"],["AllDead","OR","TIMER"    ]]  
		]
	]
];
