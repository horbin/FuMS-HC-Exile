// WaterMission.sqf
// Horbin
// 2/26/15
// Updated by TheOneWhoKnocks
// 3/15/19
// Based upon drsubo Mission Scripts

[
	[
		"WaterMission", 100,"WATER"], // Mission Title NOSPACES!, and encounter radius
		[
			// Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
			"Ship Wreck","c_ship","ELLIPSE","ColorBlue","FDiagonal",200		
		],    
																			// type is "mil_objective"
	[  
		[																	// NOTIFICATION Messages and Map display Control.
			true, "ALL",1000, 													// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 															// Notify players via global message
			true,															// Show encounter area on the map
			0,    															// Win delay: Time in seconds after a WIN before mission cleanup is performed
			0       														// Lose delay: Time in seconds after a lose before mission cleanup is performed
																			//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
																			// Spawn Mission Message
		[
			"Ship Wreck",
			"Soldiers are salvaging a crashed boat near the shore!"
		],
    
																			// Mission Success Message
		[
			"Ship Wreck salvaged!",
			"The wreck has been salvaged."
		],
  
																			// Mission Failure Message
		[
			"Ship Wreck lost!",
			"The wreck has vanished into the depths."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , [18,-9] ], 												//[static loot, offset location] - spawns with the mission
		["RANDOM" , [5,5] ], 												// Win loot, offset location - spawns after mission success
		["None" , [0,0] ]  													// Failure loot, offset location - spawns on mission failure
	],
	[																		//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		[CAMS_Wreck_Boat,			[0,0],0,0]   							//type, offset, rotation, presist flag
	],
	[ 																		// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","LINE"],   [  [3,"Diver_E"]           ],     ["BoxPatrol",[0,0],[0,0],[25]     ]],
		[["EAST","COMBAT","RED","LINE"],   [  [3,"Diver_E"]           ],     ["BoxPatrol",[0,0],[0,0],[15]     ]],
		[["EAST","COMBAT","RED","LINE"],   [  [3,"Diver_E"]           ],     ["BoxPatrol",[0,0],[0,0],[5]     ]]
	],
																			//Example: PatrolBehavior: ["BoxPatrol", [100,0], [0,0],0 ]  
																			// AI will spawn 100m east of encounter center, a 4 point patrol will be set up at 80% encounter radius. AI will move to this and start patrolling.
																			// spawnoffsetloc: [x,y] where x and y are offsets in meters from the encounter center.Sets the spawn location for the group.
																			// patroloffsetloc:[x,y] where x and y are offsets in meters from encounter center. Sets the center of the group's patrol zone,
																			//                     or where it should travel too before starting its patrol pattern.
																			// radius: in meters - used in establishing patrol geometry. If zero, then 80% of encounter radius will be used.
																			//###Patrol Options### 
																			//Def:   "Perimeter", spawnloc, patrolloc, radius: - 12 waypoints set at radius from loc, group goes from point to point
																			//Def:   "BoxPatrol", spawnloc, patrolloc, radius: - 4 waypoints set at radius from loc, group goes from point to point
																			//Def:  "Explore", spawnloc, patrolloc, radius: - 12 waypoints set up at radius from loc, group moves randomly from point to point
																			//Def:  "Guard", spawnloc, patrolloc, radius: - group patrols inside of buildings found within radius of loc.
																			//Def:  "Sentry", spawnloc, patrolloc radius: - group moves to nearest building and takes up station in highest points within the building
																			//     NOTE: if no buildings are located within 'radius' both Guard and Sentry will locate nearest buildings to the encounter and move there!
																			//  "Loiter", loc, radius: - group just hangs out, in an unaware mode in vicinity of loc-radius.
																			//  "Convoy", loc, data: group follows roads from startloc to stoploc, then loops back.
																			//  "XCountry", loc, data: group goes from startloc to stoploc, then loops back.

																			// Vehicles
	[      
		[  																	// Convoy #1    
																			// Spawns 3 vehicles 600m south of encounter center. These 3 will move as a convoy and contain 3 groups of mixed troops.
																			// These troops will be dropped off just south of encounter center, then the convoy will return to their spawn location and despawn.
			[         														// Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
																			//  [  "B_SDV_01_F",                    [0,10],[1,"Diver"],        "TruckJunk"      ], 
																			//   [  "B_Boat_Armed_01_minigun_F"           ,[10,0],[1,"Rifleman"],     "TruckJunk"      ], 
																			//  [  "B_Boat_Transport_01_F"           ,[0,0], [1,"Rifleman"],     "TruckJunk"      ]
																			//[  "C_Offroad_01_EPOCH"           ,[13300,14600,0],[ 0, ""          ],       "TruckJunk"]   
																			// If driver-less vehicles are desired, place them at the bottom of the list. 
																			// Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
																			// Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
																			//  [["RESISTANCE","COMBAT","RED","COLUMN"],   [  [3, "Driver"]  ],   ["BoxPatrol",[0,0],[0,0],[50]   ]]
			],
			[   
																			// Troops : These are distributed across all vehicles in this convoy. These lines are identical to the lines in the group section.
																			//  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
																			//  [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[1,"Rifleman"]],["BoxPatrol",[-70,-600],[0,0],[0]]],
																			//  [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[2,"Rifleman"]],["BoxPatrol",[-70,-600],[50,0],[50]]],
																			//  [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[1,"Rifleman"]],["BoxPatrol",[-70,-600],[-50,0],[50]]]
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
			["PROX",["ProxPlayer",[0,0],80,1]  ],
																			//	  ["LUCNT",["LowUnitCount","GUER",3,0,[0,0]]  ],
																			//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
																			//	  ["Detect",["Detected","ALL","ALL"] ],
			["BodyCount",["BodyCount",8] ]
																			//	  ["Timer",["TIMER", 1800] ],
																			//                            offset      radius    time(s)  Name
																			//	  ["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
																			//                               [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
																			//       ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
																			//       ["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ]
	  
		],
		[
																			// Define what actions should occur when above trigger logics evaluate to true
																			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["PROX","BodyCount"     ]],  // 
																			//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
																			// [["Reinforce","Help_Vehicle","Trig4"]], 
																			//	  [["LOSE"],["TIMER", "OR", "VehDmg1", "BldgDmg1"]   ],
			[["END"],["PROX","BodyCount"     ]]  
		] 
	]
];
