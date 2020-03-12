//chasecar.sqf
// Horbin
// 10/28/2015
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!
[
	[
		//------------------------------------------------------------------------------------
		//-----Mission Area Setup-----
		"chasecar",  // Mission Title NOSPACES!
		200 ,               // encounter radius
		"LAND",// Options "LAND","WATER","NONE". Setting this will force a scan of 'encounter Radius' meters around the center of the mission to ensure the same type of water/land is present.
        // This setting should hopefully reduce the chance of the mission being randomly placed too near water for example.
        // this paramater is optional, but if a value is present it MUST be one of the three above values.
        // This option is only used if a mission location is not set via the Theme's 'Locations' section, or the mission loc is not specified elsewhere in the ThemeData.sqf.
		[0,0,0],
		"NONE",
		"NONE"	
	],
	[ 
		//------------------------------------------------------------------------------------
		//-----Notification Configuration-----
		//--Map Marker Config.
		"chasecar",  // Name, set to "" for nothing
		"mil_dot", // icon type:                                     https://community.bistudio.com/wiki/cfgMarkers for other options.
                     // mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
		"ELLIPSE", // "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
		"ColorYellow",//                                                  https://community.bistudio.com/wiki/setMarkerColor
		"FDiagonal",// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
		200           // size of the marker.    
	],
	[
		[
		// NOTIFICATION Messages and Map display Control.
		false,    // Notify players via Radio Message
		"ALL",   // radio channel. "ALL" = no radio required.
		0,         //range from encounter center AI radio's can be heard (0=unlimited.)
		true,  // Notify players via global message - hint screen on right of game display -
		false,   // Show encounter area on the map
		30,      // Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
		//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
		// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
		],
		[
			// Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
			"Patrol Vehicle",  // title line
			"Wait, is that truck following me..." //description/radio message.
		],
		[  
			// Mission Success Message
			"Mission Success",  // title line
			"Patrol Vehicle was destroyed."
		],
		[
			// Mission Failure Message
			"Mission Failure!",
			"This should never fail"
		]
	],
	[
		//---------------------------------------------------------------------------------
		//-----Loot Configuration-----    
		// Refer to LootData.sqf for available loot types and contents.
		// "Random" will select a random configuration, ignoring all 'ScatterXX' options.
		// "ScatterXX" this loot will not appear in a box, but will be scattered about on the ground around the location/offset
		// Ex: ["Scatter01",[0,0]]  will take the loot contained in the "Scatter01" option and spread it around at offset [0,0] to the mission center.
		[
			"None",[0,0]
			//Array of loot now supported using above syntax.
			// replace "Random" with your desired loot option from LootData.sqf, or leave random for random results!
			// AND don't forget you can use these loot options to fill vehicles with loot too!(see vehicle section below)
		],
		[
			"Random" ,        // WIN Loot
			[0,0]                // Offset from mission center x,y, 3 coords [x,y,z] places loot at a specific map location!  
		],
		[
			"None" ,            // Lose Loot.
			[0,0]                // Offset from mission center.
		]
	],
	[
		//---------------------------------------------------------------------------------
		//-----Building  and stand alone vehicle Configuration-----       
		//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// NOTE: if using 3D coordinates for buildings, if the 1st building uses a location of [0,0] 
		// ALL other buildings will assume their locations are offsets!
	],
	[
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


		// [["EAST","COMBAT","RED","LINE"],[[1,"Sniper"],[3,"Rifleman"]],[  "TowerGuard",[0,0], [0,0],[150,"ANY"] ]],
		// if "ANY" is changed to a specific building type, ex: "Land_Cargo_Tower_V3_F", they will all spawn into this building type.

		//[["EAST","COMBAT","RED","LINE"],[[5,"Hunter"]],["Buildings",[6,6],[0,0],[100]]],
		//[["RESISTANCE","SAFE","BLUE","WEDGE"],[[1,"Civ01"]],["Captured",[-50,-50],[-25,-25],[-1,[[100,100]]  ]] ]

		//[["RESISTANCE","COMBAT","RED","LINE"],[[1,"UGV"]],["BoxPatrol",[50,50],[50,50],[100]]]
		// these 5 will patrol in and out of the buildings withn 100m of encounter center.
	],
	// NOTE: if no buildings are located within 'radius' both 'Buildings'  will locate nearest buildings to the encounter and move there!
	// NOTE: See AI_LOGIC.txt for detailed and most current descriptions of AI logic.

	//---------------------------------------------------------------------------------		
	//-----LAND Vehicle Configuration----- 
	[
  
		[  // Convoy #1                     
			[         // Vehicle                     Offset         Crew (only 1 type!)   Cargo
				["Exile_Car_Offroad_Rusty1",[200,200],[0,0],"none"]           
				//["I_UAV_02_F",[125,100],[0,""],"none"],
				//["I_UGV_01_F",[175,100],[0,""],"none"]
			],
			[                 
				// Drivers                                                          # and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver_E"]  ],   ["BoxPatrol",[200,200],[0,0],[200]   ]]          
			],
			// Troops : These are distributed across all vehicles in this convoy.                                                         
			[    
				[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Hunter_E"]  ],   ["BoxPatrol",[200,200],[0,0],[200]   ]]          

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
			//  ["PROX",["ProxPlayer",[0,0],10,1]  ],
			["LUCNT",["LowUnitCount","EAST",0,0,[0,0]]  ]
			//  ["HUCNT",["HighUnitCount","EAST",6,0,[0,0]] ],
			//  ["Detect",["Detected","ALL","ALL"] ],
			//  ["BodyCount",["BodyCount",3] ],
			//  ["Timer",["TIMER", 1800] ],
			//                           	 offset      radius    time(s)  Name
			//  ["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
			//                           [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
			//  ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
			//  ["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ],
			//  ["Captive1", ["Captive", 1]  ]
	  
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			// [["WIN"],["LUCNT","OR","DETECT","BODYCOUNT","OR","Zuppa", "OR", "Captive1"     ]],  // 
			//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			//  [["LOSE"],["TIMER", "OR", "VehDmg1", "BldgDmg1"]   ],
			[["END"],["LUCNT"      ]]  
		]

      
	]
];
//*******************************************************************************
//******* Do not change this!                                       **********************************
//*******************************************************************************
