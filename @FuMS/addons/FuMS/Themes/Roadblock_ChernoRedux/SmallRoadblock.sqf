// SmallRoadblock.sqf
// TheOneWhoKnocks
// 9/30/18
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!

/*

List of locations

[580.978,1773.2,0] - Roadblock coming into map in lower left corner

[2641.31,2140.8,0] - Campsite inside cave system

[8557.9,2745.87,0] - Inside Elektro tunnel - Center

[13169.1,10703.8,4.24615] - Underground terminal stairs side
[13182.3,10692,2.95931] - Underground terminal cave side







*/

[
	[
		//------------------------------------------------------------------------------------
		//-----Mission Area Setup-----
		"MannedRoadblocks",  // Mission Title NOSPACES!
		200   ,
		"LAND"             // encounter radius
	],
	[ 
		//------------------------------------------------------------------------------------
		//-----Notification Configuration-----
		//--Map Marker Config.
		"Road Block",  // Name, set to "" for nothing
		"plp_mark_as_checkpoint", // icon type:                                     https://community.bistudio.com/wiki/cfgMarkers for other options.
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
			true,   // Show encounter area on the map
			1800,      // Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
			//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
			// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
		],
		[
			// Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
			"Roadblock established",  // title line
			"A road block has been set up.  Look out" //description/radio message.
		],
		[  
			// Mission Success Message
			"Roadblock destroyed",  // title line
			"A roadblock has been cleared"
		],
		[
			// Mission Failure Message
			"Mission Failure!",
			""
		]
	],
	[
		//---------------------------------------------------------------------------------
		//-----Loot Configuration-----    
		// Refer to LootData.sqf for available loot types and contents.
		[
			//  ["Random",[0,0]],["Random",[5,5]],["Random",[-5,5]]
			//Array of loot now supported using above syntax.
			// replace "Random" with your desired loot option from LootData.sqf, or leave random for random results!
			// AND don't forget you can use these loot options to fill vehicles with loot too!(see vehicle section below)
			"None" ,            // Lose Loot.
			[0,0]                // Offset from mission center.

		],
		[
			"RoadBlock" ,        // WIN Loot
			[4,4]                // Offset from mission center x,y, 3 coords [x,y,z] places loot at a specific map location!  
		],
		[
			"None" ,            // Lose Loot.
			[0,0]                // Offset from mission center.
		]
	],
		//---------------------------------------------------------------------------------
		//-----Building Configuration-----       
		//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// building name                 | offset   |rotation|persist flag
	[

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
		[["EAST","CARELESS","RED","LINE"],[[3,"Rifleman_W"]],	["LOITER",	[0,0], [0,0], [10] ]], // 3 rifleman that will patrol all buildings within 70m for unlimited duration
		// **End 'copy'******(see Patrol Options below for other AI behaviour)
		// Example of a 3D map location. This loc is specific to ALTIS
		[["EAST","CARELESS","RED","VEE"],[[2,"Rifleman_W"]],	["SENTRY",	[5,5],	[5,5],	[50] ]],
		[["EAST","CARELESS","RED","LINE"],[[2,"Rifleman_W"]],	["BoxPatrol",	[-5,0],	[0,-5],	[75] ]],
		[["EAST","CARELESS","YELLOW","LINE"],[[1,"Sniper_W"]],	["TowerGuard",	[0,0], 	[0,0],	[150,"Land_Cargo_Patrol_V1_F"] ]]
		// 5 rifleman that spawn at [21520,11491.9,0] and march to encounter centr to set up a box patrol!    
		// Expanded group example:
		// 1 sniper, 2 rifleman, 2 hunters wil spawn east of encounter center and perform a box shaped patrol.

		// 2 hunters that will spawn near encounter center and take up guard positions.
		// This example the AI are spawned 6 meters NE of encoutner center, and will look for a building within 30meters of encounter senter to take up Sentry postions.
		// [["RESISTANCE","COMBAT","RED","LINE"],[[2,"Hunter"]],["Sentry",[0,0],[0,0],[30]]
	],
		// NOTE: if no buildings are located within 'radius' both 'Buildings' and 'Lookout' will locate nearest buildings to the encounter and move there!
		// NOTE: See AI_LOGIC.txt for detailed and most current descriptions of AI logic.

		//---------------------------------------------------------------------------------
		//-----LAND Vehicle Configuration----- 
	[
	 
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			["LUCNT",["LowUnitCount","EAST",0,0,[0,0]]  ]
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
