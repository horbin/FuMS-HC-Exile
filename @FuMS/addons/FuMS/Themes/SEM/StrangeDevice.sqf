// StrangeDevice.sqf
// TheOneWhoKnocks
// 1/15/2020
// Added support for CAMS system
// Based upon Horbin Mission Scripts

[
	["StrangeDevice", 100,"LAND"], // Mission Title NOSPACES!, and encounter radius
	["Strange Device","hd_objective","ELLIPSE","ColorGreen","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		true, "ALL",700, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		90      			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],	
	[// Spawn Mission Message
		"A Strange Device",
		"A strange device has been discovered and some psychos are playing around near it with a batch of explosives they brought.  There is a slight chance it's nuclear....  You MUST destroy that device!"
		
	],
	[// Mission Success Message
		"Device disabled",
		"The Device has been disabled.  Whatever it was, it's uselss now."
	],
	[// Mission Failure Message
		"They lost the detonators!",
		"These morons lost the detonators, so they just went home"
	] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["Explosives" , [18,-9] ], //[static loot, offset location] - spawns with the mission
		["RANDOM" , 	[-5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["Land_Device_disassembled_F",[6,6],(round random 360),1]   //type, offset, rotation, presist flag
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
	],

	// Vehicles
	[
					 
	],
	// Triggers and Event control.
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			//["LUCNT",["LowUnitCount","EAST",1,0,[0,0]]  ],
			["LaunchGuards",	["ProxPlayer",[0,0], 700, 1]],				// Player must be near event center to count as win
			["DeviceDestroyed",["DmgBuildings","0",1.0] ],
			["Timer",["TIMER", 1900] ]
		],
		[
		  // Define what actions should occur when above trigger logics evaluate to true
		   // Note: a comma between two logics is interpreted as "AND"
			[["CHILD",	["SpawnGuards",[0,0],1,120]],["LaunchGuards"     ]],  
			[["WIN"],	["DeviceDestroyed"     ]],  // 
			[["LOSE"],	["TIMER"]   ],
			[["END"],	["DeviceDestroyed","OR","TIMER"    ]]  
		]      
	]

];
