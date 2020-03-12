// Help_Helo_I.sqf
// TheOneWhoKnocks
// 3/15/19
// Mission designed to be launched in response to a call for reinforcements.
// No triggers and no loot for this mission, just Troops!
// Spawns in 1 sniper and 4 riflemen
// Units will spawn 2000m to the east and proceed to within 75m of the encounter and patrol!
// Pulls from the Global Variables (CAMS) for helicopter types
// Be cautious when editing data.

[
	["HelpHelo_I", 200], 				// Mission Title NOSPACES!, and encounter radius
											// Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	["ParaDrop Troops E","mil_dot","ELLIPSE","ColorGreen","FDiagonal",200],    
	[  
		[   								// NOTIFICATION Messages and Map display Control.
			true, "ALL", 0, 				// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 							// Notify players via global message
			false,							// Show encounter area on the map
			10,    							// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       						// Lose delay: Time in seconds after a lose before mission cleanup is performed
											// NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
											// Spawn Mission Message
		[
			"REINFORCEMENTS!", 							// title line, do not remove these!
			"You hear over the radio that the resistance has called in paratroopers!" //description/radio message.
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
	[  										// Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], 				// [static loot, offset location] - spawns with the mission
		["None" , [-5,0] ], 				// Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  					// Failure loot, offset location - spawns on mission failure
	],
	[										//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
  
	],
	[ 										// AI GROUPS. Only options marked 'Def:' implemented.
											//  	[["RESISTANCE","COMBAT","RED","COLUMN"],   [  [1,"Sniper"],[2,"Rifleman"],[2,"Hunter"]  ],   ["BoxPatrol",[250,0],[0,0],[75]   ]]
											//   	[["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Rifleman"]                                         ],   ["Sentry",[-20,10],[0,0],[70] ]],
											//		[["RESISTANCE","COMBAT","RED","LINE"],   [  [2,"Hunter"]                                              ],   ["Guard",[6,6],[0,0],[30]     ]]
	],
											// Vehicles
	[
		[  									// Division #1
			[         						// Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
											//     ex. [  "O_Heli_Light_02_unarmed_EPOCH",[0,-1900],[1,"Rifleman"],        "TruckJunk"      ], 
											//     ex. [  "O_Heli_Light_02_unarmed_EPOCH"           ,[0,-1800],[1,"Rifleman"],     "None"      ], 
				[  ImFX_Heli_Troops, [0,2000], [1,"Pilot_I"],     "None"      ]
			],
			[  
											// PILOTS: # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["GUER","COMBAT","RED","COLUMN"],   [  [1, "Pilot_I"]  ],   ["ParaDrop",[1800,0],[0,0],["Full", 100, true,true  ]   ]]
			],
			[   
											// TROOPS : These are distributed across all aircraft in the division. These lines are identical to the lines in the group section.
											//  Troop behaviour and side options                    # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["GUER","COMBAT","RED","COLUMN"],[[4,"Paratrooper_I"]],["BoxPatrol",[0,2000],[0,0],[100]]]
											// 'dest' for troops is where they will go to perform their 'Patrol Logic' once they get on deck
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
		],
		[
											// Define what actions should occur when above trigger logics evaluate to true
											// Note: a comma between two logics is interpreted as "AND"
			[["END"],["OK"     ]]  
		]      
	]
];
