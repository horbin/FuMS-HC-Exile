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
    "TestMission",  // Mission Title NOSPACES!
    200 ,               // encounter radius
    "LAND",// Options "LAND","WATER","NONE". Setting this will force a scan of 'encounter Radius' meters around the center of the mission to ensure the same type of water/land is present.
               // This setting should hopefully reduce the chance of the mission being randomly placed too near water for example.
              // this paramater is optional, but if a value is present it MUST be one of the three above values.
              // This option is only used if a mission location is not set via the Theme's 'Locations' section, or the mission loc is not specified elsewhere in the ThemeData.sqf.
    [0,0,0],
    "NONE",
    "NONE"	
],[ 
//------------------------------------------------------------------------------------
//-----Notification Configuration-----
//--Map Marker Config.
    "Test Mission",  // Name, set to "" for nothing
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
    true,  // Notify players via global message - hint screen on right of game display -
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
// ALL other buildings will assume their locations are offsets!
    // building name                 | offset   |rotation|persist flag
  //  ["Land_BagBunker_Tower_F",  [0,0],     0,         0],  
  //  ["Land_BarrelWater_F",          [-7,-7], 0,         0],
  //  ["Land_Wreck_Car2_F",          [12,12],  0,         0],
  //  ["Land_Wreck_Offroad2_F",   [-10,-10],0,        0],
 //   ["Land_HighVoltageTower_F",    [20,-10],0,       0],
  //  ["CamoNet_INDP_big_F",        [-20, 10],0,        0],
	// Vehicle Name  | offset | rotation | Fuel, Ammo, DmgEngine, Dmg FuelTank, DmgHull
//	["I_UGV_01_rcws_F",[0,100],   0,       [.5,   1,     .5,         .5,         .5]],
   // ["Land_Wreck_Car2_F",[0,50],0, [.5, 1, .5, .5,.5], "Fire"]
	// vehicles: 1 for fuel and ammo is full 100%, DmgEngine=1 is 100% damaged
    // test_EmptyObjectForFireBig = "Fire"
    // test_EmptyObjectForSmoke = "Smoke"
      
    
// These vehicles are static and remain until server reset.
["M3Editor", [0,0], 777, 1, // 1 = vehicle will persist until server restart.
   // paste your array of buildings/vehicles what should stay until serverrestart
 [
	[FuMS_Civ_All,[14697.4,16707.8,0],133.183,[0,0,1],true]
]
 
],
 
// M3Editor buildings all with 'big_smoke'
["M3Editor", [0,0], "SMOKE_BIG", 0,
 
   // paste your array of building objects here
 [
	["Land_TentHangar_V1_F",[14692.4,16710.5,0],312.727,[0,0,1],true],
	["Land_LampShabby_F",[14694.2,16695.4,0],84.0909,[0,0,1],true],
	["Land_LampShabby_F",[14707.4,16710.3,0],179.091,[0,0,1],true],
	["Land_LampShabby_F",[14677.4,16711.2,0],349.091,[0,0,1],true],
	["Land_LampShabby_F",[14690.6,16726.1,0],267.727,[0,0,1],true],
	["Land_Cargo20_military_green_F",[14686.4,16707.5,0],196.364,[0,0,1],true],
	["Land_Cargo20_military_green_F",[14692.2,16702.4,0],196.364,[0,0,1],true],
	["CargoNet_01_barrels_F",[14692.6,16721.2,0],311.818,[0,0,1],true],
	["CargoNet_01_barrels_F",[14691.6,16720.1,0],311.818,[0,0,1],true],
	["CargoNet_01_barrels_F",[14690.6,16719,0],311.818,[0,0,1],true],
	["CargoNet_01_barrels_F",[14691.7,16718,0],311.818,[0,0,1],true],
	["CargoNet_01_barrels_F",[14692.7,16719.1,0],311.818,[0,0,1],true],
	["CargoNet_01_barrels_F",[14693.7,16720.3,0],311.818,[0,0,1],true],
	["Land_PalletTrolley_01_khaki_F",[14693.6,16716.8,0],279.091,[0,0,1],true],
	["Land_CratesWooden_F",[14698,16716.3,0],44.5454,[0,0,1],true],
	["Land_CratesWooden_F",[14699,16713.2,0],350,[0,0,1],true],
	["Land_CratesWooden_F",[14700.6,16714.9,0],225,[0,0,1],true],
	["Flag_Altis_F",[14686.3,16700.5,0],0,[0,0,1],true],
	["MetalBarrel_burning_F",[14695.6,16714.1,0],0,[0,0,1],true],
	["MetalBarrel_burning_F",[14693,16704.3,0],0,[0,0,1],true],
	["Land_WaterTank_F",[14681.3,16709.2,0],220.455,[0,0,1],true],
	["Land_Cargo10_military_green_F",[14689.2,16722.3,0],319.091,[0,0,1],true],
	["Land_FieldToilet_F",[14687.3,16725,0],76.8182,[0,0,1],true],
	["Land_FieldToilet_F",[14687,16726.3,0],76.8182,[0,0,1],true],
	["Land_Pallets_stack_F",[14695.5,16718.4,0],40.4546,[0,0,1],true],
	["Land_WaterCooler_01_new_F",[14683.1,16709.4,0],193.636,[0,0,1],true],
	["Box_Wps_F",[14689.5,16710.4,0],106.818,[0,0,1],true],
	["Box_Wps_F",[14688.5,16710.8,0],122.727,[0,0,1],true],
	["CargoNet_01_box_F",[14685.4,16710.3,0],15.9091,[0,0,1],true],
	["CargoNet_01_box_F",[14687.2,16709.9,0],30.4546,[0,0,1],true],
	["CargoNet_01_box_F",[14689,16709.1,0],15.9091,[0,0,1],true],
	["Box_Wps_F",[14690.5,16708.3,0],106.818,[0,0,1],true],
	["Box_Wps_F",[14690.7,16708.8,0],106.818,[0,0,1],true],
	["Box_Wps_F",[14691.6,16708.5,0],126.818,[0,0,1],true],
	["Box_Wps_F",[14690.9,16709.5,0],108.182,[0,0,1],true]
]
 
]

    
	
],[
//---------------------------------------------------------------------------------
//-----Group Configuration-----  see Convoy section for AI in vehicles! 
//--- See SoldierData.sqf for AI type options.
/*
    Defined AI logic options: See 'Documenation' for details'
["BUILDINGS", [spawnloc], [actionloc], [duration, range]]  
["EXPLORE   ",[spawnloc], [actionloc], [radius]]
["BOXPATROL", [spawnloc], [actionloc], [radius]]
["CONVOY",    [spawnloc], [actionloc], [speed, FlagRTB, FlagRoads, FlagDespawn, convoyType]]
["SENTRY",    [spawnloc], [actionloc], [radius]]
["PARADROP",  [spawnloc], [actionloc], [speed, altitude, FlagRTB, FlagSmokes]]  
["PATROLROUTE", [spawnloc], [actionloc], [behaviour, speed, [locations], FlagRTB, FlagRoads, FlagDespawn, flyHeight]    
    
*/
// **paste 'copy' below this line to add additional groups.

// **Start 'copy'****Spawn a Group of AI Config Data *********
// 3 rifleman that will spawn NW of encounter center and patrol all buildings within 70m
// Example below shows how town names can be used in place of spawn locations and offsets!
  //  [["RESISTANCE","COMBAT","RED","LINE"],[[8,"Rifleman"]],["TowerGuard",[0,0],[0,0], [70] ]], // 3 rifleman that will patrol all buildings within 70m for unlimited duration
// **End 'copy'******(see Patrol Options below for other AI behaviour)
// Example of a 3D map location. This loc is specific to ALTIS
//[["RESISTANCE","COMBAT","RED","LINE"],[[5,"Rifleman"]],["BoxPatrol",[21520,11491.9,0],[0,0],[70] ]],
    // 5 rifleman that spawn at [21520,11491.9,0] and march to encounter centr to set up a box patrol!    
// Expanded group example:
// 1 sniper, 2 rifleman, 2 hunters wil spawn east of encounter center and perform a box shaped patrol.
[[
    "EAST", // side: RESISTANCE, WEST, EAST, CIV
    "COMBAT",      // behaviour: SAFE, AWARE, COMBAT, STEALTH
    "RED",          //combatmode: BLUE, WHITE, GREEN, YELLOW, RED
    "COLUMN"    //formation: STAG COLUMN, WEDGE, ECH LEFT, ECH RIGHT, VEE, LINE, COLUMN
],[[1,"Sniper"],[3,"Rifleman"]],[  "BoxPatrol",[0,0], [0,0],[100] ]],
// 4 AI will spawn into the specified building.

 [["EAST","COMBAT","RED","LINE"],[[1,"Sniper"],[3,"Rifleman"]],[  "TowerGuard",[0,0], [0,0],[150,"ANY"] ]],
// if "ANY" is changed to a specific building type, ex: "Land_Cargo_Tower_V3_F", they will all spawn into this building type.

[["EAST","COMBAT","RED","LINE"],[[5,"Hunter"]],["Buildings",[6,6],[0,0],[100]]],
[["RESISTANCE","SAFE","BLUE","WEDGE"],[[1,"Civ01"]],["Captured",[-50,-50],[-25,-25],[-1,[[100,100]]  ]] ]

//[["RESISTANCE","COMBAT","RED","LINE"],[[1,"UGV"]],["BoxPatrol",[50,50],[50,50],[100]]]
// these 5 will patrol in and out of the buildings withn 100m of encounter center.
],
// NOTE: if no buildings are located within 'radius' both 'Buildings'  will locate nearest buildings to the encounter and move there!
// NOTE: See AI_LOGIC.txt for detailed and most current descriptions of AI logic.

//---------------------------------------------------------------------------------
//-----LAND Vehicle Configuration----- 
[
 [  // Convoy #1    
    // STATIC WEAPONS:
    // if defining a static weapon, in place of the 'crew', include the 'facing' for the weapon.
    // Example :  ["B_HMG_01_high_F",[2,62],[250],"None"] --> This weapon will face 250 deg on the compass.
    
    // Spawns 3 vehicles 600m south of encounter center. These 3 will move as a convoy and contain 3 groups of mixed troops.
    // These troops will be dropped off just south of encounter center, then the convoy will return to their spawn location and despawn.
 [         // Vehicle                                 Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
 //  [  "B_Truck_01_transport_EPOCH",[-50,-610],[1,"Rifleman"],        "TruckJunk"      ], 
 //  [  "C_Offroad_01_EPOCH"           ,[-50,-635],[1,"Rifleman"],     "None"      ], 
//   [  "C_Offroad_01_EPOCH"           ,[-50,-688],[1,"Rifleman"],     "None"      ]
   //[  "C_Offroad_01_EPOCH"           ,[13300,14600,0],[ 0, ""          ],       "TruckJunk"]   
        ["O_Mortar_01_F",[0,60],[0],"None"],
        ["B_HMG_01_high_F",[2,62],[250],"None"],
        ["B_static_AT_F",[5,60],[180],"None"]
                 // If driver-less vehicles are desired, place them at the bottom of the list. 
				 // Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
    ],[  
    // Drivers                                                         # and type  |         Patrol     |    spawn   | dest  | 'Patrol' options
   [["EAST","COMBAT","RED","COLUMN"],   [  [3, "Driver"]  ],   ["Gunner",[-25,0],[0,0],[0]   ]]
  ],[   
     // Troops : These are distributed across all vehicles in this convoy. These lines are identical to the lines in the group section.
     //  Troop behaviour and side options                        # and type of Troops     Patrol logic |  spawn     |dest |'Patrol' options
//    [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[1,"Rifleman"]],["BoxPatrol",[-70,-600],[0,0],[0]]],
  //  [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[2,"Rifleman"]],["BoxPatrol",[-70,-600],[50,0],[50]]],
 //   [["RESISTANCE","COMBAT","RED","COLUMN"],[[1,"Sniper"],[1,"Rifleman"]],["BoxPatrol",[-70,-600],[-50,0],[50]]]
   // 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
   // otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
     ]
   ],
   
     [  // Convoy #2                     
    [         // Vehicle                     Offset         Crew (only 1 type!)   Cargo
             ["I_UGV_01_rcws_F",[100,100],[0,""],"none"],           
             ["I_UAV_02_F",[125,100],[0,""],"none"],
             ["I_UGV_01_F",[175,100],[0,""],"none"]
      ],
      [                 
           // Drivers                                                          # and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
           [["EAST","COMBAT","RED","COLUMN"],   [  [3, "Driver"]  ],   ["BoxPatrol",[100,100],[0,0],[200]   ]]          
      ],
      // Troops : These are distributed across all vehicles in this convoy.                                                         
     [    
     ]
   ] ,
   [ // Convoy #3
     [
       ["I_UAV_02_CAS_F",[150,100],[0,""],"none"]
     ],
     [    
       [["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["TrackRoute",[0,0],[0,0],["COMBAT","NORMAL",["Villages","Villages","Cities","Capitals","Villages","Villages"],false,false,false,150   ]]]
     ],
     [
     ]
  ],
   [ // Convoy #4
     [
                ["I_UAV_01_F",[100,150],[0,""],"none"],
                ["I_UAV_01_F",[0,100],[0,""],"none"],
                ["I_UAV_01_F",[50,70],[0,""],"none"],
                ["I_UAV_01_F",[0,10],[0,""],"none"],
         [FuMS_Mil_ALL,[200,0],[0,""],"TruckJunk"],
         [FuMS_Mil_Hemmts,[205,0],[0,""],"TruckJunk"],
         [FuMS_Mil_Zamaks,[203,0],[0,""],"TruckJunk"],
         [FuMS_Mil_Tempests,[207,0],[0,""],"TruckJunk"]
     ],
     [    
         [["EAST","COMBAT","RED","COLUMN"],   [  [4, "Driver"]  ],   ["BoxPatrol",[100,100],[0,0],[200]   ]]          
     ],
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
	  ["PROX",["ProxPlayer",[0,0],10,1]  ],
	  ["LUCNT",["LowUnitCount","EAST",3,0,[0,0]]  ],
	  ["HUCNT",["HighUnitCount","EAST",6,0,[0,0]] ],
	  ["Detect",["Detected","ALL","ALL"] ],
	  ["BodyCount",["BodyCount",3] ],
	  ["Timer",["TIMER", 1800] ],
	  //                            offset      radius    time(s)  Name
	  ["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
                                [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
       ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
       ["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ],
       ["Captive1", ["Captive", 1]  ]
	  
	],
	[
	  // Define what actions should occur when above trigger logics evaluate to true
	   // Note: a comma between two logics is interpreted as "AND"
	  [["WIN"],["LUCNT","OR","DETECT","BODYCOUNT","OR","Zuppa", "OR", "Captive1"     ]],  // 
	//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
	// [["Reinforce","Help_Vehicle","Trig4"]], 
	  [["LOSE"],["TIMER", "OR", "VehDmg1", "BldgDmg1"]   ],
      [["END"],["TIMER","OR","LUCNT"      ]]  
	]

      
]
];
//*******************************************************************************
//******* Do not change this!                                       **********************************
//*******************************************************************************
