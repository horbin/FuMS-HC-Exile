//LandPatrol.sqf
// Horbin
// 1/20/15
// Updated by TheOneWhoKnocks
// 3/15/19
// Be cautious when editing data.

[
	["LandPatrol", 300, "LAND"], 										// Mission Title NOSPACES!, and encounter radius
	["Land Patrol","mil_dot","ELLIPSE","ColorYellow","FDiagonal",200],  // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[																// NOTIFICATION Messages and Map display Control.
			true, 0, 0, 												// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 														// Notify players via global message
			false,														// Show encounter area on the map
			30,    														// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       													// Lose delay: Time in seconds after a lose before mission cleanup is performed
																		//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
																		// Spawn Mission Message 
		[
			"",															// title line, do not remove these!
			"A convoy of human hunters is patrolling the roads in the area." 	//description/radio message.
		],  
																		// Mission Success Message
		[
			"Convoy destroyed",
			"The convoy is destroyed!"
		], 
																		// Mission Failure Message
		[
			"Convoy escaped!",
			"The convoy has reached its destination and escaped!"
		] 
	],
	[  																	//  Loot Config:  Refer to LootData.sqf for specifics
																		// Loot for this mission is contained in the Vehicles!
		["None" , [0,0] ], 												//[static loot, offset location] - spawns with the mission
																		// static loot will also spawn if 'NO TRIGGERS' is enabled.
		["None" , [0,0] ], 												// Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  												// Failure loot, offset location - spawns on mission failure
	],
	[																	//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
	  
	],
	[ 																	// AI GROUPS. Only options marked 'Def:' implemented.
	],
				// Example: PatrolBehavior: ["BoxPatrol", [100,0], [0,0],0 ]  
				// AI will spawn 100m east of encounter center, a 4 point patrol will be set up at 80% encounter radius. AI will move to this and start patrolling.
				// spawnoffsetloc: [x,y] where x and y are offsets in meters from the encounter center.Sets the spawn location for the group.
				// patroloffsetloc:[x,y] where x and y are offsets in meters from encounter center. Sets the center of the group's patrol zone,
				// or where it should travel too before starting its patrol pattern.
				// radius: in meters - used in establishing patrol geometry. If zero, then 80% of encounter radius will be used.
				// ###Patrol Options### 
				// Def:   "Perimeter", spawnloc, patrolloc, radius: - 12 waypoints set at radius from loc, group goes from point to point
				// Def:   "BoxPatrol", spawnloc, patrolloc, radius: - 4 waypoints set at radius from loc, group goes from point to point
				// Def:  "Explore", spawnloc, patrolloc, radius: - 12 waypoints set up at radius from loc, group moves randomly from point to point
				// Def:  "Guard", spawnloc, patrolloc, radius: - group patrols inside of buildings found within radius of loc.
				// Def:  "Sentry", spawnloc, patrolloc radius: - group moves to nearest building and takes up station in highest points within the building
				//     NOTE: if no buildings are located within 'radius' both Guard and Sentry will locate nearest buildings to the encounter and move there!
				//  "Loiter", loc, radius: - group just hangs out, in an unaware mode in vicinity of loc-radius.
				//  "Convoy", loc, data: group follows roads from startloc to stoploc, then loops back.
				//  "XCountry", loc, data: group goes from startloc to stoploc, then loops back.
	[			// Vehicles
		[  		// Convoy #1                     
			[   // Vehicle                     Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_Hemmts          ,[0,0],		[1 ,"Rifleman"],        "Random" ], 
				[  FuMS_Mil_ArmedOffroads   ,[0,50],	[1 ,"Rifleman"],     	"Random" ], 
				[  FuMS_Mil_Hunters       	,[0,75],	[1 ,"Rifleman"],     	"Random" ]
				// If driver-less vehicles are desired, place them at the bottom of the list ND Hv less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [3, "Driver"]  ],   ["TrackRoute",[0,0],[0,0],["SAFE","LIMITED",["Cities","Cities"],true,true,false,0]   ]]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [3,"Sniper"],[2,"Rifleman"]  ],   ["BoxPatrol",[0,0],[0,0],[100]   ]]
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
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
			["BodyCount",["BodyCount",9] ]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["BodyCount"     ]],
			[["END"],["BodyCount"     ]]  
		]

  
	]


];
