// 	SpawnGuards.sqf
// 	TheOneWhoKnocks
// 	02/02/2020
// 	Dynamic mission to spawn guards around basic missions
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//  
//  Be cautious when editing data.

[
	["SpawnGuards", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["SpawnGuards","hd_objective","ELLIPSE","ColorKhaki","DiagGrid",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[					// NOTIFICATION Messages and Map display Control.
			true, "ALL", 700, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			false, 			// Notify players via global toast message
			false,			// Show encounter area on the map
			30,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message 
		[
			"SpawnGuards Launching",	// The first line is the title of the pop-up box
			"Launching SpawnGuards mission"		// The second line is the actual text in the box
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
	[  	//  Loot Config:  Refer to LootData.sqf for specifics
		// Loot for this mission is contained in the Vehicles!
		["None" , [0,0] ], //[static loot, offset location] - spawns with the mission
		// static loot will also spawn if 'NO TRIGGERS' is enabled.
		["None" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		//[["EAST","AWARE","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   			["Loiter",		[-13,-13],	[-13,-13],	[10] ]],
		[["EAST","AWARE","RED","LINE"],   	[  [3,"Rifleman_E"],[1,"LMG_E"]	],	["Explore",		[((round random 50)-100),((round random 50)-100)],		[0,0],		[50] ]],
		[["EAST","CARELESS","RED","VEE"],  	[  [4,"Rifleman_E"]  ],   			["BoxPatrol",	[((round random 50)-100),((round random 50)-100)],	[0,0],		[75] ]]

	],

	// Vehicles
	[
		[  // Convoy #1                     
			[   // Vehicle                     Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
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
			//["AllDead",		["LowUnitCount","EAST",0,250,[0,0]]  ],		// All dead, cleanup
			//["Timer",		["TIMER", 30000] ]
		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			//[["WIN"],["AllDead"    ]],  // 
			//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			//	  [["LOSE"],["TIMER"]   ],
			[["END"],["OK"      ]]  
		]      
	]
];
