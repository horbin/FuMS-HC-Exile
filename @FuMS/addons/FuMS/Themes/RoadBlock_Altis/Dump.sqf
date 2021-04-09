// Dump.sqf
// Horbin
// 12/31/14
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!


[
	[
		//------------------------------------------------------------------------------------
		//-----Mission Area Setup-----
		"Dump",  // Mission Title NOSPACES!
		200   ,
		"LAND"             // encounter radius
	],
	[ 
		//------------------------------------------------------------------------------------
		//-----Notification Configuration-----
		//--Map Marker Config.
		"Free Gas",  	// Name, set to "" for nothing
		"mil_dot", 		// icon type:                                     https://community.bistudio.com/wiki/cfgMarkers for other options.
						// mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
		"ELLIPSE", 		// "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
		"ColorYellow",	//                                                  https://community.bistudio.com/wiki/setMarkerColor
		"FDiagonal",	// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
		200           	// size of the marker.    
	],
	[
		[
			// NOTIFICATION Messages and Map display Control.
			false,    // Notify players via Radio Message
			"ALL",   // radio channel. "ALL" = no radio required.
			0,         //range from encounter center AI radio's can be heard (0=unlimited.)
			false,  // Notify players via global message - hint screen on right of game display -
			true,   // Show encounter area on the map
			120,      // Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
			//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
			// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
		],
		[
			// Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
			"Road Block",  // title line
			"A station has been occupied by soldiers" //description/radio message.
		],
		[  
			// Mission Success Message
			"Mission Success",  // title line
			"Notifying High Command that the FOB has been captured."
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
			"None" ,            // Spawn Loot.
			[0,0]   
		],
		[
			"RoadBlock" ,        // WIN Loot
			[0,0]                // Offset from mission center x,y, 3 coords [x,y,z] places loot at a specific map location!  
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
	   ["M3Editor",[0,0],777,0,
		   [

				//Dump Fuel Station Road Block
				
				["Land_Cargo_Patrol_V3_F",[5786.56,20082.1,0.00038147],272.787,[[-0.998817,0.048623,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V3_F",[5746.12,20086.1,0.00202942],94.7575,[[0.996555,-0.0829388,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[5742.42,20084.9,-3.05176e-005],93.3219,[[0.99832,-0.0579457,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[5742.65,20088.9,-3.05176e-005],93.3219,[[0.99832,-0.0579457,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[5743.85,20083.2,-0.00285339],4.30716,[[0.0751033,0.997176,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5747.89,20082.9,-0.00285339],4.30716,[[0.0751033,0.997176,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5747.04,20093.1,-0.000244141],182.336,[[-0.0407598,-0.999169,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5751.09,20092.9,-0.000244141],182.336,[[-0.0407603,-0.999169,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5787.96,20086.4,0.000213623],183.772,[[-0.0657866,-0.997834,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5789.91,20084.3,-0.00161743],271.351,[[-0.999722,0.0235774,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5789.84,20080.3,-0.00161743],271.351,[[-0.999722,0.0235774,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5787.81,20078.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5784.61,20077,-0.00126648],308.68,[[-0.780648,0.62497,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5781.49,20075.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5751.63,20081.8,-0.00288391],35.8932,[[0.586276,0.810111,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[5754.9,20079.7,0.00300598],35.893,[[0.586274,0.810113,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5788.87,20096.3,-0.000183105],96.1932,[[0.994164,-0.107882,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[5793.22,20097.8,-0.00134277],183.772,[[-0.0657866,-0.997834,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[5795.73,20100.1,-0.00128174],96.1933,[[0.994164,-0.107883,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[5794.28,20087.1,0.000488281],163.672,[[0.281136,-0.959668,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[5799.85,20088.7,0.000488281],163.672,[[0.281136,-0.959668,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[5799.84,20101.4,1.52588e-005],8.61445,[[0.149785,0.988719,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5805.54,20090.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5772.38,20104.4,-0.000274658],4.30702,[[0.0751007,0.997176,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5766.78,20104.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5757.9,20094.9,-0.00012207],87.5789,[[0.999107,0.0422431,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5745.14,20103,-0.00012207],91.886,[[0.999458,-0.0329108,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[5755.14,20092.8,-0.000244141],182.336,[[-0.0407608,-0.999169,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[5760.98,20104.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5755.17,20104.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[5749.36,20104.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Mound02_8m_F",[5797.83,20093.6,4.57764e-005],67.4787,[[0.923737,0.383027,0],[0,0,1]],false],
				["Land_Mound02_8m_F",[5745.24,20097.9,4.57764e-005],93.3219,[[0.99832,-0.0579457,0],[0,-0,1]],false],
				["Land_Mound02_8m_F",[5758.28,20101.7,0],93.3218,[[0.99832,-0.0579445,0],[0,-0,1]],false]
			
			]  
		]
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
		[["EAST","COMBAT","RED","LINE"],[[3,"Rifleman_E"]],	["Buildings",	[-20,0],	[-20,0],	[50] ]], // 3 rifleman that will patrol all buildings within 70m for unlimited duration
		// **End 'copy'******(see Patrol Options below for other AI behaviour)
		// Example of a 3D map location. This loc is specific to ALTIS
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman_E"]],	["BoxPatrol",	[0,25],		[0,25],		[50] ]],
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman_E"]],	["BoxPatrol",	[-40,0],	[-40,0],	[50] ]],
		[["EAST","COMBAT","RED","LINE"],[[3,"Sniper_E"]],	["TowerGuard",	[0,0], 		[0,0],		[150,"Land_Cargo_Patrol_V2_F"] ]]
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
