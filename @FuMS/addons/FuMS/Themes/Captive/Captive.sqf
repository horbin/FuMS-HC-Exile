// Captive.sqf
// Horbin
// 12/31/14
// Reworked 5/19/2019 by TheOneWhoKnocks
// Rebuilt with new AI, rewards, etc.
// Based upon drsubo Mission Scripts

[
	["Captive", 200, "LAND"], // Mission Title NOSPACES!, and encounter radius
	["Captives","mil_dot", "ELLIPSE","ColorYellow","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[// NOTIFICATION Messages and Map display Control.
		true, "ALL" ,1000,
		true, 			// Notify players via global message
		true,			// Show encounter area on the map
		300,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
		30       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
			  //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
		[   "Captive camp",
			 "Inmates have been captured for scientific testing. Go free them!"
		],
		
		// Mission Success Message
		[   "Captives rescued",
			 "Captives have been rescued."
		],
	  
		// Mission Failure Message
		[  "Captives taken!",
			"The Authority has escaped with the inmates."
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["Random",	[5,5] ], //[static loot, offset location] - spawns with the mission
		["Random",	[15,15] ], // Win loot, offset location - spawns after mission success
		["None" , 	[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["Land_BarrelWater_F",      [-7,-7], 	(round random 360),  0],
		["Land_Wreck_Car2_F",       [12,12],  	(round random 360),  0],
		["Land_Wreck_Offroad2_F",   [-10,-10],	(round random 360),  0],
		["Land_HighVoltageTower_F", [20,-10],	(round random 360),  0],
		["CamoNet_INDP_big_F",      [-20, 10],	(round random 360),  0],
		["Land_Wreck_Car2_F",		[0,50],		(round random 360), 	0, "Fire"],

		["B_G_Van_02_vehicle_F",	[0,100],   	(round random 360),       [.5,   1,     .5,         .5,         .5]],

		
		["M3Editor", [0,0], "NONE", 0,
							// paste your array of building objects here
			[
				["Land_TentHangar_V1_F",[14692.4,16710.5,0],(round random 360),[0,0,1],true]
			]
 		]
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST", "AWARE", "RED", "COLUMN"],[[1,"Sniper_E"],[3,"Rifleman_E"]],[  "BoxPatrol",[0,0], [0,0],[25] ]],
							// GROUP 0 - Spawns 4 AI into a 25m box patrol around the building
		[["EAST","COMBAT","RED","LINE"],[[1,"Sniper_E"],[3,"Rifleman_E"]],[  "TowerGuard",[0,0], [0,0],[150,"ANY"] ]],
							// GROUP 1 - Spawns 4 AI will spawn into the specified building using TOWERGUARD logic.
							// if "ANY" is changed to a specific building type, ex: "Land_Cargo_Tower_V3_F", they will all spawn into this building type.
		[["EAST","COMBAT","RED","LINE"],[[2,"Hunter_E"]],["Buildings",[6,6],[0,0],[100]]],
							// GROUP 2 - These 2 will patrol in and out of the buildings withn 100m of encounter center.
		[["RESISTANCE","SAFE","BLUE","WEDGE"],[[10,"Captive"]],["Captured",[0,0],[0,0],[-1,[[300,300],[-300,-300],[300,-300],[-300,300]]  ]] ],
							// This grp of 10 prisoners should stand around
		[["RESISTANCE","SAFE","BLUE","WEDGE"],[[3,"Captive"]],["Captured",[25,0],[25,0],[0,[[300,300],[-300,-300],[300,-300],[-300,300]]  ]] ]
							// This grp of 3 prisoners should follow the group leader of grp '0' (BoxPatrol group above)!
	],

	// Vehicles
	[
		[ // Convoy #1
			[        
				[ImFX_Land_All,[20,0],[0,"Driver_E"],"None",[["engine",.5],["fueltank",.3],["hull",.7],["wheel_1_1",.5]]],
				[ImFX_Land_All,[30,0],[0,"Driver_E"],"None",[["engine",.5],["hull",.5]]     ]
			],
			[    
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver_E"]  ],   ["BoxPatrol",[100,100],[0,0],[200]   ]]          
			],
			[
			]
		],
		[  // Convoy #2                     
			[   // Vehicle                     Offset         Crew (only 1 type!)   Cargo
				//   ["I_UGV_01_rcws_F",[100,100],[0,""],"none"],           
				//  ["I_UAV_02_F",[125,100],[0,""],"none"],
				//      ["I_UGV_01_F",[175,100],[0,""],"none"]
			],
			[                 
				// Drivers                                                          # and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				//    [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["BoxPatrol",[100,100],[0,0],[100]   ]]          
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[    
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
			["Timer",		["TIMER", 1800] ],
			["LUCNT",		["LowUnitCount","EAST",5,250,[0,0]]  ],		// Triggers call for reinforcements
			//["LowCivs",		["LowUnitCount","RESISTANCE",6,250,[0,0]]  ],		// Triggers call for reinforcements
			["Captive1", 	["Captive", 7]  ]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["Captive1"     ]],  
			[["CHILD",	["Help_Helo",[0,0],2,300]],["LUCNT"     ]],  // when half of ai dead, call for help, max 2 times, min interval 300 secs between calls for help.     
			//[["LOSE"],	["LowCivs"]   ],
			[["END"],	["TIMER","OR","Captive1"     ]]  
		]      
	]
];
