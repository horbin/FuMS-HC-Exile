// RaidTown-S-Seed_W.sqf
// TheOneWhoKnocks
// 12/28/19
//
// Kicks off a City raid in which a civilian uprising (RESISTANCE) is being put down by the OPFOR
// 

[
	["RaidTown-S-Seed_W", 300], // Mission Title NOSPACES!, and encounter radius
	["RaidTown-S-Seed_W","mil_objective","ELLIPSE","ColorBlue","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		600       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
	[
		"BLUEFOR prepares to defend village",
		"BLUEFOR has received intel about an impending attack and is setting up to defend the village"
	],
		
		// Mission Success Message
	[
		"BLUEFOR force repel attack",
		"The BLUEFOR forces repelled the attack from OPFOR and are gethering enemy weapons"
	],
	  
		// Mission Failure Message
	[   
		"Vilage attack over",
		"Both sides suffered heavy losses and the conflict is petering out"
	] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [0,0] ], //[static loot, offset location] - spawns with the mission
		["None" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.

	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
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
			["LaunchStart",["ProxPlayer",[0,0],500,1]  ],
			["LaunchAttack",["ProxPlayer",[0,0],300,1]  ],

			//["LUCNT",["LowUnitCount","GUER",1,0,[0,0]]  ],
			//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
			//	  ["Detect",["Detected","ALL","ALL"] ],
			["Contact",		["BodyCount",5] ],
			["BodyCount",	["BodyCount",15] ],
			["EndMission",	["TIMER", 1400] ] // 1800  
		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["EndMission"]],  // 
			[["CHILD",["HelpHelo_W",[(floor random 50),(floor random 50)],1,2000]],["Contact"      ]],  // 
			[["CHILD",["RaidTown-S-Start_W",[0,0],1,2000]],["LaunchStart"      ]],  // 
			[["CHILD",["RaidTown-S-Attack_E",[0,0],1,2000]],["LaunchAttack"      ]],  // 
			//[["CHILD",["HelpHelo_I",[0,0],1,2000]],["LUCNT", "LaunchAttack"      ]],  // 
			[["LOSE"], ["BodyCount"     ]  ],
			[["END"],["BodyCount","OR","EndMission"     ]]  
		]      
	]
];
