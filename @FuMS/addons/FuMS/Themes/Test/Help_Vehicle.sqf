//Reinforcements.sqf
// Horbin
// 1/18/15
// Mission designed to be launched in response to a call for reinforcements.
// No triggers and no loot for this mission, just Troops!
// Units will spawn 250m to the east and proceed to within 75mn of the encounter and patrol!
// Be cautious when editing data.
[
["Reinforcments", 200], // Mission Title NOSPACES!, and encounter radius
["Test Mission","mil_dot","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
[  
    [   // NOTIFICATION Messages and Map display Control.
	true, "ALL", 0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
    false, // Notify players via global message
    false,// Show encounter area on the map
    10,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
    10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
          //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
    ],
    // Spawn Mission Message
    ["",  // title line
     "", // title line, do not remove these!
     "High Command is sending help!" //description/radio message.
	],  
    // Mission Success Message
    ["",
     "",
     ""
	], 
    // Mission Failure Message
    ["",
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
 //  [["RESISTANCE","COMBAT","RED","COLUMN"],   [  [1,"Sniper"],[2,"Rifleman"],[2,"Hunter"]  ],   ["BoxPatrol",[250,0],[0,0],[75]   ]]
 //   [["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Rifleman"]                                         ],   ["Sentry",[-20,10],[0,0],[70] ]],
   //[["RESISTANCE","COMBAT","RED","LINE"],   [  [2,"Hunter"]                                              ],   ["Guard",[6,6],[0,0],[30]     ]]
],
// Vehicles
[
 [  // Convoy #1    
    // Spawns 3 vehicles 600m south of encounter center. These 3 will move as a convoy and contain 3 groups of mixed troops.
    // These troops will be dropped off just south of encounter center, then the convoy will return to their spawn location and despawn.
 [         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
  // [  "B_Truck_01_transport_EPOCH",[-50,-610],[1,"Rifleman"],        "Truck01"      ], 
 //  [  "C_Offroad_01_EPOCH"           ,[-50,-615],[1,"Rifleman"],     "None"      ], 
 //  [  "C_Offroad_01_EPOCH"           ,[-50,-618],[1,"Rifleman"],     "None"      ], 
   [  "C_Offroad_01_EPOCH"           ,[-700,0],[ 1, "Rifleman"          ],       "None"]   
                 // If driver-less vehicles are desired, place them at the bottom of the list. 
				 // Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
    ],[  
    // Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
   [["RESISTANCE","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Convoy",[-700,0],[0,-50],["Full",true,true,true   ]]]
  ],[   
     // Troops : These are distributed across all vehicles in this convoy. These lines are identical to the lines in the group section.
     //  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
 //   [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[1,"Rifleman"]],["BoxPatrol",[-70,-600],[0,0],[0]]],
  //  [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[2,"Rifleman"]],["BoxPatrol",[-70,-600],[50,0],[50]]],
    [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[3,"Rifleman"]],["BoxPatrol",[-700,0],[0,0],[50]]]
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
//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
//	  ["LUCNT",["LowUnitCount","GUER",1,0,[0,0]]  ],
//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
//	  ["Detect",["Detected","ALL","ALL"] ],
//	  ["BodyCount",["BodyCount",9] ]
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
//	  [["WIN"],["LUCNT"     ]],  // 
	//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
	// [["Reinforce","Help_Vehicle","Trig4"]], 
//	  [["LOSE"],["TIMER", "OR", "VehDmg1", "BldgDmg1"]   ],
      [["END"],["OK"     ]]  
	]      
]

];
