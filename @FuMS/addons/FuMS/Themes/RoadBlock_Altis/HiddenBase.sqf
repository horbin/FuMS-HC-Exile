// HiddenBase.sqf
// TheOneWhoKnocks
// 9/30/18
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!


[
	[
		//------------------------------------------------------------------------------------
		//-----Mission Area Setup-----
		"HiddenBase",  // Mission Title NOSPACES!
		200   ,
		"LAND"             // encounter radius
	],
	[ 
		//------------------------------------------------------------------------------------
		//-----Notification Configuration-----
		//--Map Marker Config.
		"Hidden Base",  // Name, set to "" for nothing
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
			false,  // Notify players via global message - hint screen on right of game display -
			false,   // Show encounter area on the map
			120,      // Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
			//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
			// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
		],
		[
			// Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
			"Hidden Base",  // title line
			"A hidden base has become occupied by soldiers" //description/radio message.
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
		["M3Editor",[0,0],777,0,
			[
				//168154 Fuel Station Road Block
			
				["Land_HBarrier_5_F",[16894.9,15475.3,-6.58035e-005],156.494,[[0.398845,-0.917018,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[16884.7,15473.5,0.000782967],63.1717,[[0.892363,0.451318,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16882.1,15478.7,0.000782967],63.1717,[[0.892363,0.451318,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16879.5,15483.9,0.000782967],63.1717,[[0.892363,0.451318,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16884.6,15478.7,0.00114632],122.036,[[0.847715,-0.530452,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[16895.5,15478.5,0.000782967],63.1717,[[0.892363,0.451318,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16894,15481.5,0.000782967],63.1717,[[0.892363,0.451318,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16890.3,15488.8,0.000782967],63.1717,[[0.892363,0.451318,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16886.8,15490,-6.58035e-005],156.494,[[0.398845,-0.917018,0],[0,-0,1]],false],
				["Land_LampHalogen_F",[16885.6,15471.6,-5],231.151,[[-0.778802,-0.62727,0],[-0,0,1]],false],
				["Land_LampHalogen_F",[16896.6,15476.2,-5],258.43,[[-0.97968,-0.200565,0],[-0,0,1]],false],
				["Land_LampHalogen_F",[16889.1,15490.9,-5],51.6863,[[0.784628,0.619967,0],[0,0,1]],false],
				["Land_LampHalogen_F",[16878.4,15485.9,-5],74.6577,[[0.964362,0.264585,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[16902,15476.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[16892,15494.1,-0.000926018],134.958,[[0.707625,-0.706588,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16900.8,15472.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16897.1,15473.5,0.000845909],25.8431,[[0.435908,0.899991,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16904.8,15472.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16906.5,15474.4,0.00430679],272.787,[[-0.998817,0.048623,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16906.7,15478.4,0.00430679],272.787,[[-0.998817,0.048623,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16905.9,15482,0.0094223],238.33,[[-0.851086,-0.525026,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16903.8,15485.5,0.0094223],238.33,[[-0.851086,-0.525026,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16901.6,15488.9,0.0094223],238.33,[[-0.851087,-0.525025,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16899.3,15491.9,0.00863743],226.844,[[-0.729494,-0.683987,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16896.5,15494.9,0.00863743],226.844,[[-0.729494,-0.683987,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16893.7,15497.9,0.00863743],226.844,[[-0.729495,-0.683986,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16891.1,15498.1,0.0107584],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16888,15495.4,0.0107584],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16868.5,15452.6,8.67844e-005],67.4789,[[0.923738,0.383024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16871.3,15445.1,0.000110626],70.3503,[[0.941766,0.336268,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16869.9,15448.9,0.000110626],70.3503,[[0.941766,0.336268,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16866.9,15456.4,8.67844e-005],67.4789,[[0.923738,0.383024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16865.4,15460.1,8.67844e-005],67.4789,[[0.923738,0.383024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16863.8,15463.8,8.67844e-005],67.4789,[[0.923738,0.383024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16862.3,15467.6,8.67844e-005],67.4789,[[0.923738,0.383024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16860.7,15471.3,8.67844e-005],67.4789,[[0.923738,0.383024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16878.8,15446.1,-0.000533104],338.83,[[-0.361136,0.932513,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16882.6,15447.5,-0.000533104],338.83,[[-0.361136,0.932513,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16886.4,15449,-0.000533104],338.83,[[-0.361136,0.932513,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16890.2,15450.4,-0.000533104],338.83,[[-0.361136,0.932513,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16892.7,15452.9,-0.00114822],298.63,[[-0.877732,0.479152,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16892.9,15456.1,-0.000547409],246.944,[[-0.920123,-0.39163,0],[-0,0,1]],false],
				["Land_HBarrier_1_F",[16841.4,15464.5,0],61.736,[[0.880775,0.473535,0],[0,0,1]],false],
				["Land_HBarrier_1_F",[16840.8,15465.7,0],61.736,[[0.880775,0.473535,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16836.2,15476.8,-7.05719e-005],157.929,[[0.375755,-0.926719,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16839.9,15478.3,-7.05719e-005],157.929,[[0.375755,-0.926719,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16843.7,15479.8,-7.05719e-005],157.929,[[0.375755,-0.926719,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16847.4,15481.4,-7.05719e-005],157.929,[[0.375755,-0.926719,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16860.1,15496.4,0.00104618],116.293,[[0.896541,-0.442962,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16858.1,15492.9,0.000693321],124.907,[[0.820082,-0.572246,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16850.6,15483.6,0.00108242],132.086,[[0.74214,-0.670245,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16855.9,15489.5,0.000693321],124.907,[[0.820082,-0.572246,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16853.4,15486.5,-0.00104332],136.393,[[0.689708,-0.724088,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[16876.7,15486.5,0.000110626],238.329,[[-0.851077,-0.525041,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[16874.6,15489.9,0.000110626],238.329,[[-0.851077,-0.52504,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[16871.7,15488.4,0.000209808],156.494,[[0.398845,-0.917018,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[16867.2,15488.5,-0.000174522],21.5359,[[0.367084,0.930188,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16863.5,15496.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[16884.6,15469.2,-0.00114727],147.879,[[0.531709,-0.846927,0],[0,-0,1]],false],
				["Land_Cargo_Patrol_V1_F",[16888.3,15455.2,-0.000230789],301.501,[[-0.852631,0.522514,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[16864.7,15501.6,0.000612259],175.158,[[0.0844078,-0.996431,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[16864.5,15505.7,-0.000174522],1.4359,[[0.0250588,0.999686,0],[0,0,1]],false]
		
		
		
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
		[["EAST","COMBAT","RED","LINE"],[[3,"Rifleman_E"]],	["Buildings",	[0,0],	[0,0],	[70] ]], // 3 rifleman that will patrol all buildings within 70m for unlimited duration
		// **End 'copy'******(see Patrol Options below for other AI behaviour)
		// Example of a 3D map location. This loc is specific to ALTIS
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman_E"]],	["BoxPatrol",	[0,0],	[0,0],	[70] ]],
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman_E"]],	["BoxPatrol",	[0,0],	[0,0],	[70] ]],
		[["EAST","COMBAT","RED","LINE"],[[3,"Sniper_E"]],	["TowerGuard",	[0,0], 	[0,0],	[150,"Land_Cargo_Patrol_V1_F"] ]]
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
