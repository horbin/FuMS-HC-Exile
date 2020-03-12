//HeloCrash.sqf
// TheOneWhoKnocks
// 02/02/2020
// Added support for CAMS system
// Based upon drsubo Mission Scripts

[
	["HeloCrash", 100,"LAND"], // Mission Title NOSPACES!, and encounter radius
	["Helicopter Crash","hd_objective","ELLIPSE","ColorGreen","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		true, "ALL",700, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		30       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
	[
		"Helo Crash!",
		"A Heli with Supplies and Bandit Troops has Crash Landed.  The Soldiers are Waiting for their Ride Out, Get to them First..."
	],
		
		// Mission Success Message
	[
		"Helo bandits annihilated!",
		"The bandits have been destroyed and the loot is being sorted out now."
	],
	  
		// Mission Failure Message
	[
		"Helo bandits have escaped!",
		"The bandits have loaded up and escaped."
	] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], //[static loot, offset location] - spawns with the mission
		["WreckageLoot" , [-5,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		[CAMS_Wreck_Heli,[6,6],(round random 360),0,"FIRE_BIG"]   //type, offset, rotation, presist flag
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","STEALTH","RED","LINE"],   [  [1,"Sniper_I"]           	],   ["LOITER",[((round random 50)-100),((round random 50)-100)],[0,0],[10]     ]],
		[["EAST","STEALTH","RED","LINE"],   [  [1,"Sniper_I"]           	],   ["TowerGuard",	[((round random 50)-100),((round random 50)-100)],	[0,0],[150,"ANY"]	]]
	
	],

	// Vehicles
	[
					 
	],
	// Triggers and Event control.
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			["Timer",		["TimerNoPlayers", 2000] ],   				// Trigger true if the mission timer reaches 1800 seconds and no players are withen 300 m
			["TimerEvac", 	["Timer", 1400] ], // 1400		  
			["PLAYERNEAR",	["ProxPlayer",[0,0], 200, 1]],// Player must be near event center to count as win
			["LaunchGuards",["ProxPlayer",[0,0], 700, 1]],				// Player must be near event center to count as win	
			["LUCNT",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Triggers call for reinforcements
			["AllDead",		["LowUnitCount","EAST",0,250,[0,0]]  ]		// Always leaves one behind as a special surprise for players.
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			//[["WIN"],["BodyCount"     ]],  // 
			[["WIN"],	["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],	["Timer"     ]],
			[["CHILD",	["EvacTownVeh",[0,0],2,30]],["TimerEvac","PLAYERNEAR" ]],  // 
			[["CHILD",	["Help_Helo",[0,0],2,300]],["LUCNT"     ]],  
			[["CHILD",	["SpawnScavengers",[0,0],1,120]],["LaunchGuards"     ]],  
			[["END"],	["AllDead","OR","TIMER"    ]]  
		]   
	]
];
