// ArmedEvacuation.sqf
// TheOneWhoKnocks
// 7/21/19
// Based upon drsubo and Horbin mission scripts

[
	["EvacTownVeh", 200], // Mission Title NOSPACES!, and encounter radius
	["EvacVeh","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		true, "ALL",500,	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		false, 				// Notify players via global message
		false,				// Show encounter area on the map
		0,    				// Win delay: Time in seconds after a WIN before mission cleanup is performed
		0       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		
		// Spawn Mission Message
		[
			"Distress Call detected!",
			"The enemy has radioed for help and an extraction team is on the way.  Get ready for heavy contact!"
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
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [0,0] ], //[static loot, offset location] - spawns with the mission
		["None" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		//   ["Land_Device_disassembled_F",[0,0],0,0]   //type, offset, rotation, presist flag
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
	],
	// Vehicles
	[
		[  // Convoy #1    South
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  ImFX_Land_Armed_Guard,[0,600],[1,"Rifleman_E"],        "TruckJunk"      ] 
			],
			[	// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver_E"]  ],   ["Convoy",[0,600],[0,0],["FULL",true,false, true, "XFILL"]   ]]
			],
			[   

			]
		],
		[	// Convoy #2    North
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  ImFX_Land_Unarmed_Transport,[0,600],[1,"Rifleman_E"],        "TruckJunk"      ] 
			],
			[	// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver_E"]  ],   ["Convoy",[0,600],[0,0],["FULL",true,false, true,"XFILL"]   ]]
			],
			[   

			]
		]/*,
		[  // Convoy #3  East
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  ImFX_Land_Armed_Transport,[600,0],[1,"Rifleman"],        "TruckJunk"      ] 
			],
			[	// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[600,0],[0,0],["NORMAL",true,true, true,"XFILL"]   ]]
			],
			[   

			]
		],
		[  // Convoy #4    West
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  ImFX_Land_Armed_Guard,[600,0],[1,"Rifleman"],        "TruckJunk"      ] 
			],
			[	// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[-600,0],[0,0],["NORMAL",true,true, true,"XFILL"]   ]]
			],
			[   
			]
	   ]*/
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
		  [["END"],["OK"]]  
		]      
	]
];
