//Gunfight.sqf
// Horbin
// 10/27/2015
// Based upon drsubo Mission Scripts
// Updated 9/29/18 by TheOneWhoKnocks to add mission annoucements and clean up layout

[
	["gunfight", 100, "LAND"], // Mission Title NOSPACES!, and encounter radius
	["gunfight","mil_objective", "ELLIPSE","ColorGreen","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	   // type is "mil_objective"
	[  
		[// NOTIFICATION Messages and Map display Control.
		false, 1,0,
		true, // Notify players via global message
		false,// Show encounter area on the map
		300,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
		300       // Lose delay: Time in seconds after a lose before mission cleanup is performed
			  //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
		[   
			"Gunfight!",
			"There's a fight brewing, maybe some good loot to be had..."
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
		  //  ["Land_BagBunker_Tower_F",[6,6],0,0]   //type, offset, rotation, presist flag
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.

		//[["EAST","COMBAT","RED","LINE"],   [  [3,"Sniper"]           ],     ["Explore",[6,-6],[0,0],[0]     ]],
		//[["EAST","COMBAT","RED","LINE"],   [  [3,"Rifleman"],[1,"LMG"] ],   ["Explore",[6,6],[0,0],[0]     ]],
		[["EAST","COMBAT","RED","LINE"],   [  [3,"Pistolman_E"]           ],   ["Explore",[75,75],[0,0],[0]     ]],
		[["WEST","COMBAT","RED","LINE"],   [  [3,"Pistolman_W"]           ],   ["Explore",[-75,-75],[0,0],[0]     ]]
	],

	// Vehicles
	[
					 
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			//  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			["LUCNT",["LowUnitCount","EAST",0,0,[0,0]]  ],
			["LUCNT2",["LowUnitCount","WEST",0,0,[0,0]] ],
			//["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
			//["Detect",["Detected","ALL","ALL"] ],
			//["BodyCount",["BodyCount",9] ]
			["Timer",["TIMER", 900] ]
			//                                 offset   radius    time(s)  Name
			//["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
			//                            [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
			//["VehDmg1", ["DmgVehicles", "1",0.8]  ],
			//["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ]
		  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["LUCNT","LUCNT2"     ]],  // 
			//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			[["LOSE"],["TIMER"]],
			[["END"],["LUCNT","LUCNT2","OR","TIMER"    ]]  
		]      
	]

];
