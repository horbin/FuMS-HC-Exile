// SpawnPatrol.sqf
// TheOneWhoKnocks
// 1/15/2020
// Based upon drsubo Mission Scripts

[
	["SpawnPatrol", 75], // Mission Title NOSPACES!, and encounter radius
	["SpawnPatrol","hd_objective","ELLIPSE","ColorOrange","FDiagonal",75],    
	   
	[  
		[// NOTIFICATION Messages and Map display Control.
			true, "ALL", 700,	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			false, 				// Notify players via global message
			false,				// Show encounter area on the map
			600,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
			30       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
								//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
			// Spawn Mission Message
		[
			"Spawn Hostile Patrol!",
			"Placing AI"
		],
			
			// Mission Success Message
		[
			"",
			""
		],
		  
			// Mission Failure Message
		[
			"",
			""
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], //[static loot, offset location] - spawns with the mission
		["None" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [-7,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 1: building deleted at event completion, 1= building remains until server reset.
	  //["CamoNet_INDP_open_F",[0,0],0,0]  //type, offset, rotation, presist flag
		 
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","LINE"],   [  [2,"Hunter_E"]           ],     ["BUILDINGS",[((round random 50)-100),((round random 50)-100)],[0,0],[50]     ]],
		[["EAST","COMBAT","RED","LINE"],   [  [2,"LMG_E"]              ],     ["EXPLORE",   [((round random 50)-100),((round random 50)-100)],[0,1], [50]      ]],
		[["EAST","COMBAT","RED","LINE"],   [  [2,"Sniper_E"]           ],     ["SENTRY",   [((round random 50)-100),((round random 50)-100)],[1,0], [50]      ]]

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
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["END"],["OK"    ]]  
		]
	]
];
