// LootCrate.sqf
// TheOneWhoKnocks
// 5/1/19
// Inspired by loot drops from Kuplion's Occupation system
// Drops loot crates around the map
// Be cautious when editing data.

[
	["LootCrateE", 50, "LAND"], // Mission Title NOSPACES!, and encounter radius
	["Loot Crate - E","hd_start","ELLIPSE","ColorWhite","FDiagonal",25],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[ // NOTIFICATION Messages and Map display Control.
		false, 0, 0, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		false, 			// Notify players via global message
		false,			// Show encounter area on the map
		30,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message 
		[
			"", // title line, do not remove these!
			"" //description/radio message.
		],  
		// Mission Success Message
		[
			"Mission Success",
			""
		], 
		
		// Mission Failure Message
		[
			"Mission Failure!",
			""
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifics
	// Loot for this mission is contained in the Vehicles!
		["LootcrateE" , [10,-10] ], //[static loot, offset location] - spawns with the mission
		   // static loot will also spawn if 'NO TRIGGERS' is enabled.
		["None" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		[CAMS_Wreck_Land,	[2,3], (round random 360), 0, "Fire_Big" ]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
	],

	// Vehicles
	[
		[  // Convoy #1                     
			[         // Vehicle                     Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
			],
			[  
				// Drivers                                                          # and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options                        # and type of Troops                               Patrol logic |  spawn     |dest |'Patrol' options
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
            ["StartGuard",	["ProxPlayer",	[0,0], 500, 1	]	],			
            ["StartCamper",	["ProxPlayer",	[0,0], 50, 1	]	],			
			["LongTime",	["TIMER", 		30000			]	]
		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			//	  [["WIN"],["LUCNT","PROX"    ]],  // 
			[["CHILD",	["SpawnGuard",	[0,0],10,1800]],	["StartGuard"	]],  // 
			[["CHILD",	["SpawnCamper",	[0,0],10,1800]],	["StartCamper"	]],  // 
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			//	  [["LOSE"],["TIMER"]   ],
			[["END"],["LongTime"     ]]  
		]      
	]
];
