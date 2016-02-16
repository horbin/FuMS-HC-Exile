//TestFunction.sqf
// Horbin
// 1/21/15
// 

[
["RaidTown", 200], // Mission Title NOSPACES!, and encounter radius
["Town","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
   // type is "mil_objective"
[  
    [// NOTIFICATION Messages and Map display Control.
	false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
    true, // Notify players via global message
    true,// Show encounter area on the map
    120,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
    30       // Lose delay: Time in seconds after a lose before mission cleanup is performed
          //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
    ],
    // Spawn Mission Message
["Town Raid",
    "A city is being looted by humans",
    "A city is being invaded by humans!"
],
    
    // Mission Success Message
["Mission Success",
    "Look for their loot in the center of town!",
    "The loot collected has been captured by clones!"
],
  
    // Mission Failure Message
["Mission Failure!",
    "",
    "We have escaped with the resources."
] 
],
[  //  Loot Config:  Refer to LootData.sqf for specifcs
["None" , [0,0] ], //[static loot, offset location] - spawns with the mission
["TownLoot" , [0,0] ], // Win loot, offset location - spawns after mission success
["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
],
[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.

],
[ // AI GROUPS. Only options marked 'Def:' implemented.

],

// Vehicles
[
    [  // Convoy #1    South
 [         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
   [  FuMS_Mil_Hemmts,[0,-600],[2,"Rifleman"],        "Truck01"      ] 
    ],[  
    // Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
   [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[0,-600],[0,-100],["NORMAL",true,true, true]   ]]
  ],[   
     // Troops : These are distributed across all vehicles in this convoy.                                                         
     //  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
      [["EAST","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Buildings",[0,-600],[0,-50],[100]]] // [timer, radius]
  //    [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Explore",[0,-600],[0,-50],[2400,100]]] // [timer, radius]
     ]
   ],
     [  // Convoy #2    North
 [         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
   [  FuMS_Mil_Hemmts,[0,600],[2,"Rifleman"],        "Truck01"      ] 
    ],[  
    // Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
   [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[0,600],[0,100],["NORMAL",true,true, true]   ]]
  ],[   
     // Troops : These are distributed across all vehicles in this convoy.                                                         
     //  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
      [["EAST","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Buildings",[0,600],[0,50],[100]]] // [timer, radius]
//      [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Explore",[0,-600],[0,-50],[2400,100]]] // [timer, radius]
     ]
   ],
     [  // Convoy #3  East
 [         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
   [  FuMS_Mil_Hemmts,[600,0],[2,"Rifleman"],        "Truck01"      ] 
    ],[  
    // Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
   [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[600,0],[100,0],["NORMAL",true,true, true]   ]]
  ],[   
     // Troops : These are distributed across all vehicles in this convoy.                                                         
     //  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
      [["EAST","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Buildings",[600,0],[50,0],[100]]] // [timer, radius]
//      [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Explore",[0,-600],[0,-50],[2400,100]]] // [timer, radius]
     ]
   ],
     [  // Convoy #4    West
 [         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
   [  FuMS_Mil_Hemmts,[-600,0],[2,"Rifleman"],        "Truck01"      ] 
    ],[  
    // Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
   [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[-600,0],[-100,0],["NORMAL",true,true, true]   ]]
  ],[   
     // Troops : These are distributed across all vehicles in this convoy.                                                         
     //  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
      [["EAST","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Buildings",[-600,0],[-50,0],[100]]] // [timer, radius]
//      [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"] ,[5, "Rifleman"]],["Explore",[0,-600],[0,-50],[2400,100]]] // [timer, radius]
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
//	  ["LUCNT",["LowUnitCount","GUER",1,0,[0,0]]  ]
//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
//	  ["Detect",["Detected","ALL","ALL"] ],
	  ["BodyCount",["BodyCount",20] ],
	  ["Timer",["TIMER", 1800] ], // 1800  
        ["TimerEvac", ["TIMER", 1400] ] // 1400
	  //                            offset      radius    time(s)  Name
//	  ["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
 //                               [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
//       ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
//       ["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ]
	  
	],
	[
	  // Define what actions should occur when above trigger logics evaluate to true
	   // Note: a comma between two logics is interpreted as "AND"
	  [["WIN"],["BodyCount"     ]],  // 
        [["CHILD",["EvacTown",[0,0],3,10]],["TimerEvac"      ]],  // 
	// [["Reinforce","Help_Vehicle","Trig4"]], 
	  [["LOSE"],["TIMER"]   ],
      [["END"],["BodyCount","OR","TIMER"     ]]  
	]      
]

];
