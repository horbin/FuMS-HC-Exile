//CityZombies.sqf
// Horbin
// 1/20/15
// Be cautious when editing data.

[
[
	"UrbanZombies", // Mission Title NOSPACES!
	250, // encounter radius
	"LAND" // location requirement: LAND, WATER, NONE
    // this paramater is optional, but if a value is present it MUST be one of the three above values.
], 
["Infection","mil_dot","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
[  
    [// NOTIFICATION Messages and Map display Control.
	false, "ALL", 0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
    false, // Notify players via global message
    false,// Show encounter area on the map
    30,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
    10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
          //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
    ],
    // Spawn Mission Message 
    [
     	"A town has become infected!", // title line, do not remove these!
     	"The source of the infection must be destroyed." //description/radio message.
    ],  
    // Mission Success Message
    [
    	"Mission Success",
     	"The source of the horde has been destroyed."
	], 
    // Mission Failure Message
    [
    	"Mission Failure!",
    	""
	] 
],
[  //  Loot Config:  Refer to LootData.sqf for specifics
["NONE" , [0,0] ], //[static loot, offset location] - spawns with the mission
   // static loot will also spawn if 'NO TRIGGERS' is enabled.
["none" , [0,0]], // Win loot, offset location - spawns after mission success
["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
],
[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
  //Land_Grave_obelisk_F
  //["Land_Grave_obelisk_F",[0,0],0,0,"SMOKE_BIG"]
 //   ["Land_BellTower_02_V2_F",[0,0],0,0,"SMOKE_BIG"]
],
[ // AI GROUPS. Only options marked 'Def:' implemented.
   [["WEST","COMBAT","RED","COLUMN"],   [  [2,"Zombie"] ],   ["Zombie",[0,0],[0,0], [100,true,300]    ]],
   [["WEST","COMBAT","RED","COLUMN"],   [  [2,"Zombie"] ],   ["Zombie",[50,0],[0,0], [100,true,300]    ]],
  [["WEST","COMBAT","RED","COLUMN"],   [  [2,"Zombie"] ],   ["Zombie",[0,50],[0,0], [100,true,300]    ]],
  [["WEST","COMBAT","RED","COLUMN"],   [  [2,"Zombie"] ],   ["Zombie",[-50,0],[0,0], [100,true,300]    ]],
  [["WEST","COMBAT","RED","COLUMN"],   [  [2,"Zombie"] ],   ["Zombie",[0,-50],[0,0], [100,true,300]    ]]
 //   [["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Rifleman"]                                         ],   ["Sentry",[-20,10],[0,0],[70] ]],
 //  [["RESISTANCE","COMBAT","RED","LINE"],   [  [2,"Hunter"]                                              ],   ["Guard",[6,6],[0,0],[30]     ]]
],


// Vehicles
[
     [  // Convoy #1                     
    [         // Vehicle                     Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
   
      ],
      [  
    
      ],
      // Troops : These are distributed across all vehicles in this convoy.                                                         
     [      //  Troop behaviour and side options                        # and type of Troops                               Patrol logic |  spawn     |dest |'Patrol' options
      
     ]
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
	  ["PROX",["ProxPlayer",[0,0],250,1]  ],
	  ["LUCNT",["LowUnitCount","WEST",0,0,[0,0]]  ],
	  ["PLRGONE",["LowUnitCount","GUER",0,0,[,0,0]] ],
//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
//	  ["Detect",["Detected","ALL","ALL"] ],
//	  ["BodyCount",["BodyCount",9] ]
//	  ["Timer",["TIMER", 3000] ],
	  //                            offset      radius    time(s)  Name
//	  ["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
 //                               [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
//       ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
     // ["BldgDmg1",["DmgBuildings","0",1.0]  ]
	  
	],
	[
	  // Define what actions should occur when above trigger logics evaluate to true
	   // Note: a comma between two logics is interpreted as "AND"
	 // [["WIN"],["LUCNT"    ]],  // 
       // [["CHILD",["MoreZombies",[0,0],10,60]],["LUCNT"]],
       
        // set up MoreZombies to be like a reinforcement mission.
        
	 // [["LOSE"],["TIMER"]   ],
      [["END"],["LUCNT","OR","PLRGONE"     ]]  
	]      
]
];

