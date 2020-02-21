// RaidTown.sqf
// TheOneWhoKnocks
// 12/28/19
//
// Kicks off a City raid in which a civilian uprising (RESISTANCE) is being put down by the OPFOR
// 

[
	["RaidTown", 200], // Mission Title NOSPACES!, and encounter radius
	["Town Raid","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		30       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
	[
		"Town Raid",
		"The local rebellion has been pinned down and is locked in a battle with local gang."
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
		["TownLoot" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.

	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["RESISTANCE","COMBAT","RED","WEDGE"],   	[  [3,"Rifleman"]  ],   	["Buildings",		[0,0],[0,0],[75]   ]],
		[["RESISTANCE","COMBAT","RED","VEE"],   	[  [3,"Hunter"]  ],   		["Buildings",		[0,0],[0,0],[75]   ]],
		[["RESISTANCE","COMBAT","RED","WEDGE"],   	[  [6,"Pistolman"]  ],   	["Buildings",		[0,0],[0,0],[50]   ]],
		[["RESISTANCE","COMBAT","RED","VEE"],   	[  [20,"CivCombat"]  ],   	["Buildings",		[0,0],[0,0],[100]   ]]
//		[["RESISTANCE","COMBAT","RED","COLUMN"],  	[  [20,"CivCombat"]  ],   	["Explore",		[0,0],[0,0],[75]   ]]

	],

	// Vehicles
	[
		[  // Convoy #1    South
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_UnarmedOffroads,[0,-1000],[2,"Rifleman"],        "Truck01"      ] 
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","BLUE","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[0,-600],[0,-100],["NORMAL",true,true, true]   ]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy.                                                         
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"] ,[5, "Rifleman"]],["Buildings",[0,-600],[0,-50],[100]]] // [timer, radius]
			]
		],
		[  // Convoy #2    North
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_UnarmedOffroads,[0,1000],[2,"Rifleman"],        "Truck01"      ] 
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","BLUE","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[0,600],[0,100],["NORMAL",true,true, true]   ]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy.                                                         
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"] ,[5, "Rifleman"]],["Buildings",[0,600],[0,50],[100]]] // [timer, radius]
			]
		],
		[  // Convoy #3  East
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_UnarmedOffroads,[1000,0],[2,"Rifleman"],        "Truck01"      ] 
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","BLUE","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[600,0],[100,0],["NORMAL",true,true, true]   ]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy.                                                         
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"] ,[5, "Rifleman"]],["Buildings",[600,0],[50,0],[100]]] // [timer, radius]
			]
		],
		[  // Convoy #4    West
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_UnarmedOffroads,[-1000,0],[2,"Rifleman"],        "Truck01"      ] 
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","BLUE","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[-600,0],[-100,0],["NORMAL",true,true, true]   ]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy.                                                         
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"] ,[5, "Rifleman"]],["Buildings",[-600,0],[-50,0],[100]]] // [timer, radius]
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
			//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			//	  ["LUCNT",["LowUnitCount","GUER",1,0,[0,0]]  ]
			//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
			//	  ["Detect",["Detected","ALL","ALL"] ],
			["BodyCount",	["BodyCount",70] ],
			["Timer",		["TIMER", 500] ], // 1800  
			["TimerEvac", 	["TIMER", 300] ] // 1400
		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["BodyCount"     ]],  // 
			[["CHILD",["EvacTown",[0,0],1,600]],["TimerEvac"      ]],  // 
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			[["LOSE"],["TIMER"]   ],
			[["END"],["BodyCount","OR","TIMER"     ]]  
		]      
	]
];
