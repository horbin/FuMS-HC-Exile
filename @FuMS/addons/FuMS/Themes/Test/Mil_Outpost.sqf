//TestMission01.sqf
// Horbin
// 12/31/14
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!
[[
//------------------------------------------------------------------------------------
//-----Mission Area Setup-----
    "Mil_Outpost",  // Mission Title NOSPACES!
    200 ,               // encounter radius
    "LAND"// Options "LAND","WATER","NONE". Setting this will force a scan of 'encounter Radius' meters around the center of the mission to ensure the same type of water/land is present.
               // This setting should hopefully reduce the chance of the mission being randomly placed too near water for example.
              // this paramater is optional, but if a value is present it MUST be one of the three above values.
              // This option is only used if a mission location is not set via the Theme's 'Locations' section, or the mission loc is not specified elsewhere in the ThemeData.sqf.
],[ 
//------------------------------------------------------------------------------------
//-----Notification Configuration-----
//--Map Marker Config.
    "Static Placement",  // Name, set to "" for nothing
     "mil_dot", // icon type:                                     https://community.bistudio.com/wiki/cfgMarkers for other options.
                     // mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
     "ELLIPSE", // "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
     "ColorYellow",//                                                  https://community.bistudio.com/wiki/setMarkerColor
     "FDiagonal",// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
       200           // size of the marker.    
],[[
    // NOTIFICATION Messages and Map display Control.
	true,    // Notify players via Radio Message
    "ALL",   // radio channel. "ALL" = no radio required.
    0,         //range from encounter center AI radio's can be heard (0=unlimited.)
    false,  // Notify players via global message - hint screen on right of game display -
    true,   // Show encounter area on the map
    30,      // Win delay: Time in seconds after a WIN before mission cleanup is performed
    10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
],[
   // Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
     "CORE Directive",  // title line
     "Defense Alert!", 
     "High Command has directed us to establish a Forward Operating Base!" //description/radio message.
],[  
    // Mission Success Message
    "Mission Success",  // title line
     "",
     "Notifying High Command that the FOB has been destroyed!"
],[
   // Mission Failure Message
    "Mission Failure!",
    "",
    "Reconnaissance complete. All forces are to RTB."
]],[
//---------------------------------------------------------------------------------
//-----Loot Configuration-----    
// Refer to LootData.sqf for available loot types and contents.
// "Random" will select a random configuration, ignoring all 'ScatterXX' options.
// "ScatterXX" this loot will not appear in a box, but will be scattered about on the ground around the location/offset
    // Ex: ["Scatter01",[0,0]]  will take the loot contained in the "Scatter01" option and spread it around at offset [0,0] to the mission center.
[
   ["Random",[0,0]],["Random",[5,5]],["Random",[-5,5]]
   //Array of loot now supported using above syntax.
   // replace "Random" with your desired loot option from LootData.sqf, or leave random for random results!
   // AND don't forget you can use these loot options to fill vehicles with loot too!(see vehicle section below)
],[
    "Random" ,        // WIN Loot
    [0,0]                // Offset from mission center x,y, 3 coords [x,y,z] places loot at a specific map location!  
],[
    "None" ,            // Lose Loot.
     [0,0]                // Offset from mission center.
]],[
//---------------------------------------------------------------------------------
//-----Building  and stand alone vehicle Configuration-----       
//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
// NOTE: if using 3D coordinates for buildings, if the 1st building uses a location of [0,0] 

    
    
// These vehicles are static and remain until server reset.
["M3Editor", [0,0], 777, 1, // 1 = vehicle will persist until server restart.
   // paste your array of buildings/vehicles what should stay until serverrestart
 [
	[FuMS_Work_ALL,[14697.4,16707.8,0],133.183,[0,0,1],true]
 ]
]
	
],[
//---------------------------------------------------------------------------------
//-----Group Configuration-----  see Convoy section for AI in vehicles! 
//--- See SoldierData.sqf for AI type options.
[[
    "RESISTANCE", // side: RESISTANCE, WEST, EAST, CIV
    "COMBAT",      // behaviour: SAFE, AWARE, COMBAT, STEALTH
    "RED",          //combatmode: BLUE, WHITE, GREEN, YELLOW, RED
    "COLUMN"    //formation: STAG COLUMN, WEDGE, ECH LEFT, ECH RIGHT, VEE, LINE, COLUMN
],[[1,"Sniper"],[1,"Rifleman"]],[  "TowerGuard",[0,0], [0,0],[100,"Land_TentHangar_V1_F"] ]],
// 4 AI will spawn into the specified building.

 [["EAST","COMBAT","RED","LINE"],[[3,"Sniper"],[3,"Rifleman"]],[  "TowerGuard",[0,0], [0,0],[150,"ANY"] ]],
// if "ANY" is changed to a specific building type, ex: "Land_Cargo_Tower_V3_F", they will all spawn into this building type.

[["EAST","COMBAT","RED","LINE"],[[5,"Hunter"]],["Buildings",[6,6],[0,0],[100]]]
// these 5 will patrol in and out of the buildings withn 100m of encounter center.
],
// NOTE: if no buildings are located within 'radius' both 'Buildings'  will locate nearest buildings to the encounter and move there!
// NOTE: See AI_LOGIC.txt for detailed and most current descriptions of AI logic.

//---------------------------------------------------------------------------------
//-----LAND Vehicle Configuration----- 
[
    [  // Emplacement #1 (North)   
   [         // 3rd paramater sets the 'facing' of the static weapon.
        ["O_Mortar_01_F",[5,55],[15],"None"],
        ["B_HMG_01_high_F",[2,55],[330],"None"],
        ["B_static_AT_F",[5,58],[45],"None"]
              
    ],[  // Drivers                                                         # and type  |         Patrol     |    spawn   | dest  |facing
         [["EAST","COMBAT","RED","COLUMN"],   [  [3, "Driver"]  ],   ["Gunner",[-25,0],[0,0],[0]   ]]
    ],
    [  
     ]
   ],
   
   [  // Emplacement #2  (South)                   
       [         // Vehicle                     Offset         Crew (only 1 type!)   Cargo
          ["B_HMG_01_high_F",[-20,-25],[180],"None"]
      ],
      [                 
          [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Gunner",[-25,0],[0,0],[0]   ]]       
      ],      
     [      //  Troop behaviour and side options                        # and type of Troops                               Patrol logic |  spawn     |dest |'Patrol' options
     ]
   ] ,
   
   
   [  // Emplacement #3  (East)                  
       [         // Vehicle                     Offset         Crew (only 1 type!)   Cargo
          ["B_HMG_01_high_F",[70,25],[90],"None"]
       ],
       [                 
          [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["Gunner",[-25,0],[0,0],[0]   ]]       
       ],                                                    
      [      //  Troop behaviour and side options                        # and type of Troops                               Patrol logic |  spawn     |dest |'Patrol' options
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
	  ["LUCNT",["LowUnitCount","EAST",1,0,[0,0]]  ]
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
	  [["WIN"],["LUCNT"     ]],  // 
	//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
	// [["Reinforce","Help_Vehicle","Trig4"]], 
//	  [["LOSE"],["TIMER", "OR", "VehDmg1", "BldgDmg1"]   ],
      [["END"],["LUCNT"     ]]  
	]      
]

];
//*******************************************************************************
//******* Do not change this!                                       **********************************
//*******************************************************************************
