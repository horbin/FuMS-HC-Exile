// RaidTown-M.sqf
// TheOneWhoKnocks
// 12/28/19
//
// Kicks off a City raid in which a civilian uprising (RESISTANCE) is being put down by the OPFOR
// Includes larger fighting force than -S version and includes special forces paradrop for resistance,
// and ground bases re-enforcements for OPFOR
// 

[
	["RaidTownM", 200], // Mission Title NOSPACES!, and encounter radius
	["Town Raid - M","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		300       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
	[
		"Town Raid",
		"A large guerilla group of militias has been pinned down and is locked in a battle with local gang."
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
		[
			["TownLoot" , [0,10] ], // Win loot, offset location - spawns after mission success
			["TownLoot" , [5,0] ]
		],
		["TownLootLoss" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.

	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["RESISTANCE","COMBAT","RED","WEDGE"],   	[  [2,"Rifleman"]  ],   	["Buildings",	[0,0],[0,0],[75]   ]],
		[["RESISTANCE","COMBAT","RED","VEE"],   	[  [4,"Hunter"]  ],   		["Buildings",	[0,0],[0,0],[75]   ]],
		[["RESISTANCE","COMBAT","RED","WEDGE"],   	[  [6,"Pistolman"]  ],   	["Buildings",	[0,0],[0,0],[50]   ]],
		[["RESISTANCE","COMBAT","RED","VEE"],   	[  [5,"CivCombat"]  ],   	["Buildings",	[0,0],[0,0],[100]  ]],
		[["RESISTANCE","COMBAT","RED","COLUMN"],  	[  [5,"CivCombat"]  ],   	["Explore",		[0,0],[0,0],[75]   ]]

	],

	// Vehicles
	[
		[  // Convoy #1    South
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_UnarmedOffroads,[0,-1000],[1,"Rifleman"],        "Truck01"      ],
				[  FuMS_Mil_UnarmedOffroads,[0,-1050],[1,"Rifleman"],        "Truck01"      ] 				
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","BLUE","COLUMN"],   [  [2, "Driver"]  ],   ["Convoy",[0,-1000],[0,-50],["NORMAL",true,true, true]   ]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy.                                                         
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","VEE"],[[1,"SMG"] ,[3, "Rifleman"]],["Buildings",[0,-1000],[0,-25],[100]]], // [timer, radius]
				[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"] ,[3, "Rifleman"]],["Explore",[0,-1050],[25,0],[100]]] // [timer, radius]
			]
		],
		[  // Convoy #2    South
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_UnarmedOffroads,[-1000,0],[1,"Rifleman"],        "Truck01"      ],
				[  FuMS_Mil_UnarmedOffroads,[-1050,0],[1,"Rifleman"],        "Truck01"      ] 				
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","BLUE","COLUMN"],   [  [2, "Driver"]  ],   ["Convoy",[0,-600],[0,-50],["NORMAL",true,true, true]   ]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy.                                                         
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","LINE"],[[1,"SMG"] ,[3, "Rifleman"]],["Buildings",[0,-1000],[0,-25],[100]]], // [timer, radius]
				[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"] ,[3, "Rifleman"]],["Explore",[0,-1050],[25,0],[100]]] // [timer, radius]
			]
		],

		[  // Convoy #3    West
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_UnarmedOffroads,[-1000,0],[1,"Rifleman"],        "Truck01"      ],
				[  FuMS_Mil_UnarmedOffroads,[-1050,0],[1,"Rifleman"],        "Truck01"      ] 
				
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","BLUE","COLUMN"],   [  [2, "Driver"]  ],   ["Convoy",[-1000,0],[-10,0],["NORMAL",true,true, true]   ]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy.                                                         
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"] ,[3, "Rifleman"]],["Buildings",[-1000,0],[0,0],[100]]], // [timer, radius]
				[["EAST","COMBAT","RED","DIAMOND"],[[1,"SMG"] ,[3, "Rifleman"]],["Buildings",[-1050,0],[-10,0],[100]]] // [timer, radius]
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
			["PROX",["ProxPlayer",[0,0],80,1]  ],
			["LUCNTRESIST",["LowUnitCount","GUER",10,0,[0,0]]  ],
			["LUCNTALLRESIST",["LowUnitCount","GUER",0,0,[0,0]]  ],
			["LUCNTEAST",["LowUnitCount","EAST",15,0,[0,0]]  ],
			//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
			//	  ["Detect",["Detected","ALL","ALL"] ],
			["BodyCount",	["BodyCount",40] ],
			["Timer",		["TIMER", 1800] ], // 1800  
			["TimerEvac", 	["TIMER", 1400] ] // 1400
		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			//[["WIN"],	["BodyCount","PROX"   ]],  // 
			[["WIN"],	["BodyCount"   ]],  // 
			[["CHILD",	["EvacTown-S",[0,0],3,60]],["TimerEvac"      ]],  // 
			[["CHILD",	["Help_Ground",[0,0],2,60]],["LUCNTEAST"      ]],  // 
			[["CHILD",	["Help_Helo",[0,0],1,60]],["LUCNTRESIST"      ]],  // 
			[["LOSE"],	["TIMER","OR","LUCNTALLRESIST"]   ],
			[["END"],	["BodyCount","OR","TIMER"     ]]  
		]      
	]
];
