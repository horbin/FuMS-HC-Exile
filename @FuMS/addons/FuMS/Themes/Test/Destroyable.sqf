//Destroyable.sqf
// Horbin
// 6/13/2015

[
 [
     "Destroyable", 200,"NONE", // Mission Title NOSPACES!, and encounter radius
     [100,125,0], // min, max, direction: offset values from the mission center for ALL other offsets to be defined.
     // placing values here will result in objects created by the mission being placed away from the actual encounter center
     // values here can be used to produce missions that are NOT actually located at the encounter center, as may be depicted by
     // a map indicator!!!!
     "StartExample", // Custom Start script.
     "EndExample"  // Custom End script.
 ],
["Destroyable Test","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
   // type is "mil_objective"
[  
    [// NOTIFICATION Messages and Map display Control.
	false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
    false, // Notify players via global message
    true,// Show encounter area on the map
    0,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
    0       // Lose delay: Time in seconds after a lose before mission cleanup is performed
          //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
    ],
    // Spawn Mission Message
["Destroyables",
    "Destroyable objects",
    "Destroy the objects to win the mission!"
],
    
    // Mission Success Message
["Destroyed",
    "",
    "The disabled UGV was destroyed"
],
  
    // Mission Failure Message
["Failure",
    "Buildings Destroyed",
    "The generator and support buildings have been destroyed."
]

],
[  //  Loot Config:  Refer to LootData.sqf for specifcs
["CloneHunter" , [0,2] ], //[static loot, offset location] - spawns with the mission
["Random" , [5,5] ], // Win loot, offset location - spawns after mission success
["None" , [0,0] ]  // Failure loot, offset location - spawns on mission failure
],
[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
// ["Land_Device_disassembled_F",[-2,0],0,0],
// ["I_UGV_01_rcws_F",[0,5],0, [.5, 1, .5, .5,.5], "SMOKE_BIG"],

 ["M3Editor", [0,0], 777, 0,

   // paste your array of building objects here
 [
	["Land_Cargo_Tower_V1_No1_F",[7364,7098.37,4.57764e-005],120,[[0.866025,-0.5,0],[0,-0,1]],false],
	["Land_Cargo_Tower_V1_No2_F",[7365.19,7097.3,17.6671],300.366,[[-0.862814,0.505522,0],[0,0,1]],false],
	["Campfire_burning_F",[7323.76,7126.59,0],0,[[0,1,0],[0,0,1]],false],
	["Campfire_burning_F",[7321.68,7123.28,0],0,[[0,1,0],[0,0,1]],false],
	["Land_CampingChair_V2_F",[7323.48,7128.39,0],0,[[0,1,0],[0,0,1]],false],
	["Land_CampingChair_V2_F",[7320.47,7121.95,0],222.549,[[-0.676221,-0.736699,0],[-0,0,1]],false],
	["Land_CampingTable_F",[7327.75,7127.86,0],24.7277,[[0.418306,0.908306,0],[0,0,1]],false],
	["Land_DieselGroundPowerUnit_01_F",[7380.95,7040.27,4.57764e-005],33.4551,[[0.551283,0.834318,0],[0,0,1]],false],
	["Land_Wreck_Heli_Attack_01_F",[7437.54,6985.9,0],0,[[0,1,0],[0,0,1]],false],
	["Land_Wreck_Heli_Attack_01_F",[7276.35,6983.57,0],0,[[0,1,0],[0,0,1]],false],
	["Land_Wreck_HMMWV_F",[7407.42,7240.23,0],0,[[0,1,0],[0,0,1]],false]
  ]





   ],

	// Vehicle Name  | offset | rotation | Fuel, Ammo, DmgEngine, Dmg FuelTank, DmgHull
	["I_UGV_01_rcws_F",[0,5],   0,       [.5,   1,     0,         0,         0],"SMOKE_BIG"],
   ["I_UGV_01_rcws_F",[0,15],   0,       [.5,   1,     .5,         .5,         .5]],
   ["I_UGV_01_rcws_F",[5,5],   0,       [.5,   1,     .5,         .5,         .5]]

],
[ // AI GROUPS. Only options marked 'Def:' implemented.
   [["EAST","COMBAT","RED","COLUMN"],   [  [6,"Sniper"]  ],   ["TowerGuard",[0,0],[0,0],[100,"Land_Cargo_Tower_V1_No2_F"]   ]],
   // [["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Diver"]                                         ],   ["BoxPatrol",[0,0],[0,0],[70] ]]
//[["ZOMBIE","CARELESS","RED","LINE"],   [  [10,"Zombie"]           ],     ["Zombie",[0,0],[0,0],[]     ]],
//[["RESISTANCE","COMBAT","RED","LINE"],[[3,"RaptorM"]],["Buildings",[0,0],[0,0],[70] ]], // 3 rifleman that will patrol all buildings within 70m for unlimited duration
// **End 'copy'******(see Patrol Options below for other AI behaviour)
// Example of a 3D map location. This loc is specific to ALTIS
//[["RESISTANCE","COMBAT","RED","LINE"],[[5,"RaptorF"]],["BoxPatrol",[0,0],[0,0],[70] ]]
//[["RESISTANCE","COMBAT","RED","LINE"],   [  [3,"Rifleman"],[1,"LMG"] ],   ["Explore",[6,6],[0,0],[150]     ]],
  [["EAST","COMBAT","RED","LINE"],   [  [3,"Rifleman"]           ],   ["Buildings",[0,0],[0,0],[150]     ]]
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
                 
],
   [
	[
      //Define all the triggers this mission will be using
	  // Trigger names must be unique within each mission.
	  // NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
	  // NOTE: "OK" is a reserved trigger. Do not define it here.
	  //  "OK" can be used in the actions section to force an action to occur at mission start!	 
        ["DmgBuildingWin",  ["DmgBuildings","0",0.5]],
        ["DmgVehWin", 	["DMGVehicles","0",1.0]],
	  ["PROX",["ProxPlayer",[0,0],100,1]  ],
        ["DmgBuildingLose",  	["DmgBuildings","1,3-8",.5]], // damage building #8 to 50%
	  ["LUCNT",["LowUnitCount","RESISTANCE",3,100,[0,0]]  ]
//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
//	  ["Detect",["Detected","ALL","ALL"] ],
//	  ["BodyCount",["BodyCount",9] ]
//	  ["Timer",["TIMER", 3000] ]
	  
	],
	[
	  // Define what actions should occur when above trigger logics evaluate to true
	   // Note: a comma between two logics is interpreted as "AND"
	  [["WIN"],["DmgBuildingWin","DmgVehWin"   ]],  // 
	//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
	// [["Reinforce","Help_Vehicle","Trig4"]], 
	  [["LOSE"],["DmgBuildingLose","LUCNT"]   ],
      [["END"],["DmgBuildingWin","DmgVehWin","OR","DmgBuildingLose","LUCNT"     ]]  
	]      
] 

];
