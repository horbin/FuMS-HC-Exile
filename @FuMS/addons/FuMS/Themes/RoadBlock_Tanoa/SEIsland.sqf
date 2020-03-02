// SEIsland.sqf
// TheOneWhoKnocks
// Originally created as "Ioannina.sqf" from Horbin
// New locations specific to Tanoa, and solder spawns have been moved to prevent them dogpiling each other (funny, but slows them down)
// Also, these snipers are not setting up on towers properly. This will be fixed in future versions 
// 9/26/18

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!


[
	[
		//------------------------------------------------------------------------------------
		//-----Mission Area Setup-----
		"SEIslandRoadblock",  		// Mission Title NOSPACES!
		200   , "LAND"             	// encounter radius
	],
	[ 
		//------------------------------------------------------------------------------------
		//-----Notification Configuration-----
		//--Map Marker Config.
		"Free Gas",  		// Name, set to "" for nothing
		"mil_dot", 			// icon type:https://community.bistudio.com/wiki/cfgMarkers for other options.
							// mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
		"ELLIPSE", 			// "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
		"ColorYellow",		// https://community.bistudio.com/wiki/setMarkerColor
		"FDiagonal",		// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
		200           	// size of the marker.    
	],
	[
		[
			// NOTIFICATION Messages and Map display Control.
			false,    		// Notify players via Radio Message
			"ALL",   		// radio channel. "ALL" = no radio required.
			1000,         	//range from encounter center AI radio's can be heard (0=unlimited.)
			false,  		// Notify players via global message - hint screen on right of game display -
			true,   		// Show encounter area on the map
			120,      		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
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

				//Ioannina Fuel Station Road Block
				
				["Land_Cargo_HQ_V1_F",[23337.7,19770.1,-0.000535011],140.701,[[0.633367,-0.773851,0],[0,-0,1]],false],
				["Land_Cargo_House_V1_F",[23345.7,19788.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[23351.9,19788.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[23335.7,19781.5,-0.000230789],267.044,[[-0.998669,-0.051569,0],[-0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[23340.2,19758.4,-0.000125885],50.2503,[[0.768845,0.639435,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[23379.5,19818.9,-0.000192642],162.236,[[0.305097,-0.952321,0],[0,-0,1]],false],
				["Land_Cargo_Patrol_V1_F",[23372.6,19781.5,-0.000126839],234.022,[[-0.809243,-0.587474,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23368.5,19818.8,-0.00028038],160.801,[[0.32885,-0.944382,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23372.3,19820.1,-0.00028038],160.801,[[0.32885,-0.944382,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23376.1,19821.4,-0.00028038],160.801,[[0.32885,-0.944382,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23380,19822.8,-0.00028038],160.801,[[0.32885,-0.944382,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23382.8,19821.8,-0.000359535],226.844,[[-0.729494,-0.683987,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23385.6,19818.8,-0.000359535],226.844,[[-0.729494,-0.683987,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23388.4,19815.9,-0.000359535],226.844,[[-0.729495,-0.683986,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23391.1,19812.9,-0.000359535],226.844,[[-0.729495,-0.683986,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23393.9,19810,-0.000359535],226.844,[[-0.729495,-0.683986,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23396.7,19807,-0.000359535],226.844,[[-0.729496,-0.683986,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23399.5,19804.1,-0.000359535],226.844,[[-0.729496,-0.683985,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23402.2,19801.1,-0.000359535],226.844,[[-0.729496,-0.683985,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23401.8,19798.9,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23398.6,19796.5,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23388.9,19789.2,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23385.6,19786.8,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23382.4,19784.3,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23379.2,19781.9,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23375.9,19779.5,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23372.7,19777,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23369.4,19774.6,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23366.2,19772.2,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23363,19769.7,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23350,19760,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23346.8,19757.5,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23343.5,19755.1,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[23347.7,19742.7,-0.000745773],140.7,[[0.633381,-0.77384,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[23352.2,19746.4,-0.000745773],140.7,[[0.633381,-0.77384,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[23356.7,19750.1,-0.000745773],140.7,[[0.633381,-0.77384,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[23359.9,19754.1,-0.000200272],116.293,[[0.896541,-0.442962,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[23339.9,19747.9,-0.000754356],226.843,[[-0.729482,-0.684,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[23362.4,19759.3,-0.000200272],116.293,[[0.896541,-0.442962,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[23362.8,19765.1,-0.000200272],70.3501,[[0.941765,0.336272,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[23353.3,19750.4,-0.000754356],226.843,[[-0.729482,-0.683999,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23340.3,19752.7,-0.00036335],323.037,[[-0.601299,0.799024,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23337.7,19752.5,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23335.1,19755.6,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23332.5,19758.7,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23329.9,19761.9,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23327.3,19765,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23324.7,19768.1,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23322.1,19771.2,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23319.6,19774.3,-0.000258446],50.2501,[[0.768843,0.639438,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23319.9,19776.5,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23323,19779.2,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23326.1,19781.8,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23329.2,19784.5,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23332.2,19787.1,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23335.3,19789.8,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23338.4,19792.4,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23341.4,19795.1,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23344.5,19797.7,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23347.6,19800.3,0.0001297],139.265,[[0.652561,-0.757736,0],[0,-0,1]],false],
				["Land_Mil_WallBig_4m_F",[23375.7,19783.8,-0.000167847],229.715,[[-0.762838,-0.64659,0],[-0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[23369.8,19779.7,0.000382423],51.6859,[[0.784624,0.619972,0],[0,0,1]],false]
		
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
		[["EAST","COMBAT","RED","LINE"],[[4,"Rifleman_E"]],	["Buildings",	[15,5],		[15,5],		[70] ]], // 3 rifleman that will patrol all buildings within 70m for unlimited duration
		// **End 'copy'******(see Patrol Options below for other AI behaviour)
		// Example of a 3D map location. This loc is specific to ALTIS
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman_E"]],	["BoxPatrol",	[5,40],		[5,40],		[50] ]],
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman_E"]],	["BoxPatrol",	[40,-20],	[40,-20],	[50] ]],
		[["EAST","COMBAT","RED","LINE"],[[3,"Sniper_E"]],	["TowerGuard",	[20,0], 	[20,0],		[200,"Land_Cargo_Patrol_V1_F"] ]]

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
