// Help_VehicleS.sqf
// TheOneWhoKnocks
// 5/18/19
// Mission designed to be launched in response to a call for reinforcements.
// No triggers and no loot for this mission, just Troops!
// Units will spawn 250m to the south and proceed to within 75mn of the encounter and patrol!
// Be cautious when editing data.
[
	["veSReinforcments", 200,"LAND"], // Mission Title NOSPACES!, and encounter radius
	["Vic Reinforce","mil_dot","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[   // NOTIFICATION Messages and Map display Control.
			true, "ALL", 0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, // Notify players via global message
			false,// Show encounter area on the map
			10,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
				  //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
		[
			"REINFORCEMENTS!", 					// title line, do not remove these!
			"Incoming assault troops!" 		//description/radio message.
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
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], //[static loot, offset location] - spawns with the mission
		["None" , [-5,0] ], // Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
	  
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
	],
	// Vehicles
	[
		[  // Convoy #1    
			// Spawns 3 vehicles 600m south of encounter center. These 3 will move as a convoy and contain 3 groups of mixed troops.
			// These troops will be dropped off just south of encounter center, then the convoy will return to their spawn location and despawn.
			[         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				["O_LSV_02_unarmed_F"           ,[0,-250],[ 1, "Rifleman"          ],       "None"]   
				 // If driver-less vehicles are desired, place them at the bottom of the list. 
				 // Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[0,-250],[0,0],["Full",true,false,true   ]]]
			],
			[   
				// Troops : These are distributed across all vehicles in this convoy. These lines are identical to the lines in the group section.
				//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],[[1,"Sniper"],[2,"Rifleman"]],["BoxPatrol",[0,0],[0,0],[50]]]
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		]
	],
	[
		[
		],
		[
		  //Define all the triggers this mission will be using
		  // Trigger names must be unique within each mission.
		  // NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
		  // NOTE: "OK" is a reserved trigger. Do not define it here.
		  //  "OK" can be used in the actions section to force an action to occur at mission start!	 
		  [["END"],["OK"     ]]  
		]      
	]

];
