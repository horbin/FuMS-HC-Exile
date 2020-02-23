// RaidTown-S-Start_E.sqf
// TheOneWhoKnocks
// 2/13/2020
//
// Spawns the local uprising in an urban area
// 

[
	["RaidTown-S-Start_E", 200], // Mission Title NOSPACES!, and encounter radius
	["RaidTown-S-Start_E","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		false,				// Show encounter area on the map
		600,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		300       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
		[
			"TownRaid S_E Starting",
			"Spawning local rebellion"
		],
			
			// Mission Success Message
		[
			"Town Raid repelled",
			"The town raid was broken up with both sides sustaining heavy losses"
		],
		  
			// Mission Failure Message
		[   
			"Town Raid Complete - Resistance is Futile",
			"All resistance fighters have been put down and the gang has left the area."
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
		[["EAST","COMBAT","RED","WEDGE"],   [  [1,"SMG_E"],	[2,"Rifleman_E"]  ],   	["Buildings",	[10,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [1,"LMG_E"],	[2,"Rifleman_E"]  ],   	["Buildings",	[0,0],[10,0],[100]   ]],
		[["EAST","COMBAT","RED","WEDGE"],   [  [3,"Rifleman_E"]  ],   				["Buildings",	[0,10],[0,0],[75]   ]]

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
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 \
			["LowCount",["LowUnitCount","EAST",5,0,[0,0]]  ],
			["AllDead",["LowUnitCount","EAST",0,0,[0,0]]  ]


			//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			//	  ["LUCNT",["LowUnitCount","GUER",1,0,[0,0]]  ]
			//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
			//	  ["Detect",["Detected","ALL","ALL"] ],
			//["BodyCount",	["BodyCount",15] ],
		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			[["CHILD",["HelpHelo_E",[0,0],1,2000]],["LowCount"     ]],  // 

			[["END"],["AllDead"     ]]  
		]      
	]
];
