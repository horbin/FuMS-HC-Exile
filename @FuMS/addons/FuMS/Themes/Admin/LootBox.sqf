//LootBox.sqf
// Horbin
// 1/11/15
// Based upon drsubo Mission Scripts

[
["LootBox", 200], // Mission Title NOSPACES!, and encounter radius
["LootBox","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
   // type is "mil_objective"
[  
    [// NOTIFICATION Messages and Map display Control.
	false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
    false, // Notify players via global message
    false,// Show encounter area on the map
    0,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
    0       // Lose delay: Time in seconds after a lose before mission cleanup is performed
          //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
    ],
    // Spawn Mission Message
["Mission",
    "",
    ""
],
    
    // Mission Success Message
["Mission Success",
    "",
    ""
],
  
    // Mission Failure Message
["Mission Failure!",
    "",
    ""
] 
],
[  //  Loot Config:  Refer to LootData.sqf for specifcs
["LOOTBOX" , [0,0] ], //[static loot, offset location] - spawns with the mission
["None" , [5,5] ], // Win loot, offset location - spawns after mission success
["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
],
[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
   
],
[ // AI GROUPS. Only options marked 'Def:' implemented.
//   [["RESISTANCE","COMBAT","RED","COLUMN"],   [  [1,"Sniper"],[2,"Rifleman"],[2,"Hunter"]  ],   ["BoxPatrol",[0,75],[0,0],[0]   ]],
//    [["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Rifleman"]                                         ],   ["Guard",[-20,10],[0,0],[70] ]],
//[["EAST","COMBAT","RED","LINE"],   [  [3,"Sniper"]           ],     ["BoxPatrol",[50,250],[0,0],[150]     ]]
//[["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Rifleman"],[1,"LMG"] ],   ["Explore",[6,6],[0,0],[150]     ]],
//[["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Rifleman"]           ],   ["BoxPatrol",[-6,-6],[0,0],[0]     ]]
],
// Vehicles
[
                 
],
[
	[

	],
	[
      [["END"],["OK"      ]]  
	]    
]

];
