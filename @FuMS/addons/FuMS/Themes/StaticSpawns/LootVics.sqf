// LootVic.sqf
// TheOneWhoKnocks
// 3/24/2020 - The Great Slowdown
// Drops random vehicles
// BETA
// Be cautious when editing data.

[
	["LootVic", 300, "LAND"], // Mission Title NOSPACES!, and encounter radius
	["Loot Vic","ExileMissionStrongholdIcon","ELLIPSE","ColorWhite","FDiagonal",25],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[// NOTIFICATION Messages and Map display Control.
		false, 0, 0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		false, // Notify players via global message
		false,// Show encounter area on the map
		30,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
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
		["None" , [0,0] ], //[static loot, offset location] - spawns with the mission
		["None" , [0,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.

	],
	[			// Vehicles	
		[
		
			[   // Vehicle                     	Offset     				Direction   CargoLoot (see Loot section below for more detail!)  
				[  CAMS_Land_ALL_C,		[((random 300)-150),((random 300)-150)],	[1,"Rifleman_E"],        "TruckJunk",[0]      ],
				[  CAMS_Land_ALL_C,		[((random 300)-150),((random 300)-150)],	[1,"Rifleman_E"],        "TruckJunk",[0]      ],
				[  CAMS_Land_ALL_C,		[((random 300)-150),((random 300)-150)],	[1,"Rifleman_E"],        "TruckJunk",[0]      ],
				[  CAMS_Land_ALL_C,		[((random 300)-150),((random 300)-150)],	[1,"Rifleman_E"],        "TruckJunk",[0]      ]
				
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
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
			["Timer",["TIMER", 30000] ]
		  		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			//	  [["WIN"],["LUCNT","PROX"    ]],  // 
			//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			//	  [["LOSE"],["TIMER"]   ],
			[["END"],["TIMER"     ]]  
		]      
	]
];
