// Help_GroundE.sqf
// TheOneWhoKnocks
// 12/27/19
// Mission designed to be launched in response to a call for reinforcements. (EAST)
// Sends in 1 sniper, 2 riflemen, and 2 hunters
// These troops are ground based and spawn 200 meters to the North west, with a final destination of 0,0
// No triggers and no loot for this mission, just Troops!
// Be cautious when editing data.

[
	["Help_Ground_E", 200,"LAND"], // Mission Title NOSPACES!, and encounter radius
	["Help Ground E","mil_dot","ELLIPSE","ColorGreen","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[   			// NOTIFICATION Messages and Map display Control.
		true, "ALL", 500, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		false, 			// Notify players via global message
		false,			// Show encounter area on the map
		30,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
		[
			"REINFORCEMENTS!", 							// title line, do not remove these!
			"OPFOR has alled in ground reinforcements!" //description/radio message.
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
		["None" , [-5,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","COLUMN"],   [  [1,"Sniper_E"],[2,"Rifleman_E"],[2,"Hunter_E"]  ],   ["BoxPatrol",[200,200],[0,0],[75]   ]]
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
			[["END"],["OK"     ]]  
		]      
	]
];
