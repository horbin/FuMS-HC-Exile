// Captive.sqf
// Horbin
// 7/9/15
// Updated by TheOneWhoKnocks
// 3/15/19
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!
[
	[
							//------------------------------------------------------------------------------------
							//-----Mission Area Setup-----
		"Captive",  		// Mission Title NOSPACES!
		200 ,               // encounter radius, detemrines size of marker and 
		"LAND"				// Options "LAND","WATER","NONE". Setting this will force a scan of 'encounter Radius' meters around the center of the mission to ensure the same type of water/land is present.
							// This setting should hopefully reduce the chance of the mission being randomly placed too near water for example.
							// this paramater is optional, but if a value is present it MUST be one of the three above values.
							// This option is only used if a mission location is not set via the Theme's 'Locations' section, or the mission loc is not specified elsewhere in the ThemeData.sqf.
	],
	[ 
							//------------------------------------------------------------------------------------
							//-----Notification Configuration-----
							//--Map Marker Config.
		"Captives",  		// Name, set to "" for nothing
		"mil_dot", 			// icon type: see https://community.bistudio.com/wiki/cfgMarkers for other options.
							// mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
		"ELLIPSE", 			// "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
		"ColorYellow",		// https://community.bistudio.com/wiki/setMarkerColor
		"FDiagonal",		// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
		200           		// size of the marker.    
	],
	[
		[
							// NOTIFICATION Messages and Map display Control.
			true,    		// Notify players via Radio Message
			2,   			// radio channel. "ALL" = no radio required.
			0,         		//range from encounter center AI radio's can be heard (0=unlimited.)
			true,  			// Notify players via global message - hint screen on right of game display -
			true,   		// Show encounter area on the map
			30,      		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
							// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
		],
		[
							// Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
							// Modified for Exile Hints
							// MISSION TITLE
			"Locals have been captured", 
							//MISSION DESCRIPTION
			"The Authority has captured convicts for testing. Go free them!"
		],
		[  					// Mission Success Message
							// SUCCESS title line
			"Mission Success",  	
							// SUCCESS message text
			"Captives have been rescued." 	
		],
		[
			// Mission Failure Message
			"Mission Failure!",				
			"The Authority has escaped with its captives." 
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
		   ["Random",[0,0]]
						   //Array of loot now supported using above syntax.
						   // replace "Random" with your desired loot option from LootData.sqf, or leave random for random results!
						   // AND don't forget you can use these loot options to fill vehicles with loot too!(see vehicle section below)
		],
		[
			"Random" ,     // WIN Loot
			[30,30]      // Offset from mission center x,y, 3 coords [x,y,z] places loot at a specific map location!  
		],
		[
			"None" ,       // Lose Loot.
			 [0,0]         // Offset from mission center.
		]
	],
	[
							//---------------------------------------------------------------------------------
							//-----Building  and stand alone vehicle Configuration-----       
							// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
							// NOTE: if using 3D coordinates for buildings, if the 1st building uses a location of [0,0] 
							// ALL other buildings will assume their locations are offsets!
							// building name                 | offset   |rotation|persist flag
							//  ["Land_BagBunker_Tower_F",  [0,0],     0,         0],  
							//  ["Land_BarrelWater_F",          [-7,-7], 0,         0],
							//  ["Land_Wreck_Car2_F",          [12,12],  0,         0],
							//  ["Land_Wreck_Offroad2_F",   [-10,-10],0,        0],
							//  ["Land_HighVoltageTower_F",    [20,-10],0,       0],
							//  ["CamoNet_INDP_big_F",        [-20, 10],0,        0],
							// VEHICLES
							// Vehicle Name  | offset | rotation | Fuel, Ammo, DmgEngine, Dmg FuelTank, DmgHull
		//["B_G_Van_02_vehicle_F",[0,100],   0,       [.5,   1,     .5,         .5,         .5]],
							// Spawns a van at 100 m offset as loot
							// ["Land_Wreck_Car2_F",[0,50],0, [.5, 1, .5, .5,.5], "Fire"]
							// Previous line would spawn a wreck on fire
							// vehicles: 1 for fuel and ammo is full 100%, DmgEngine=1 is 100% damaged
							// test_EmptyObjectForFireBig = "Fire"
							// test_EmptyObjectForSmoke = "Smoke"
							// These vehicles are static and remain until server reset.
							// M3Editor buildings all with 'big_smoke'
		["M3Editor", [0,0], "NONE", 0,
							// paste your array of building objects here
			[
				["Land_TentHangar_V1_F",[14692.4,16710.5,0],312.727,[0,0,1],true]
			]
 		]
	],
	[
							//---------------------------------------------------------------------------------
							//-----Group Configuration-----  see Convoy section for AI in vehicles! 
							// Expanded group example:
							// 1 sniper, 3 rifleman, 2 hunters will spawn east of encounter center and perform a box shaped patrol.
							// [
							// "EAST", 		// side: RESISTANCE, WEST, EAST, CIV
							// "COMBAT",   	// behaviour: SAFE, AWARE, COMBAT, STEALTH
							// "RED",      	// combatmode: BLUE, WHITE, GREEN, YELLOW, RED
							// "COLUMN"    	// formation: STAG COLUMN, WEDGE, ECH LEFT, ECH RIGHT, VEE, LINE, COLUMN
							// ],
		[["EAST", "COMBAT", "RED", "COLUMN"],[[1,"Sniper"],[3,"Rifleman"]],[  "BoxPatrol",[0,0], [0,0],[25] ]]
							// GROUP 0 - Spawns 4 AI into a 25m box patrol around the building
		//[["EAST","COMBAT","RED","LINE"],[[1,"Sniper"],[3,"Rifleman"]],[  "TowerGuard",[0,0], [0,0],[150,"ANY"] ]],
							// GROUP 1 - Spawns 4 AI will spawn into the specified building using TOWERGUARD logic.
							// if "ANY" is changed to a specific building type, ex: "Land_Cargo_Tower_V3_F", they will all spawn into this building type.
		//[["EAST","COMBAT","RED","LINE"],[[2,"Hunter"]],["Buildings",[6,6],[0,0],[100]]]
							// GROUP 2 - These 2 will patrol in and out of the buildings withn 100m of encounter center.
		//[["RESISTANCE","SAFE","BLUE","WEDGE"],[[10,"Civ01"]],["Captured",[0,0],[0,0],[-1,[[300,300],[-300,-300],[300,-300],[-300,300]]  ]] ],
							// This grp of 10 prisoners should stand around
		//[["RESISTANCE","SAFE","BLUE","WEDGE"],[[3,"Civ01"]],["Captured",[25,0],[25,0],[0,[[300,300],[-300,-300],[300,-300],[-300,300]]  ]] ]
							// This grp of 3 prisoners should follow the group leader of grp '0' (BoxPatrol group above)!

	],
							// NOTE: if no buildings are located within 'radius' both 'Buildings'  will locate nearest buildings to the encounter and move there!
							// NOTE: See AI_LOGIC.txt for detailed and most current descriptions of AI logic.
							//---------------------------------------------------------------------------------
							//-----LAND Vehicle Configuration----- 
	[
		[  					// Convoy #1                     
			[         		// Vehicle                     Offset         Crew (only 1 type!)   Cargo
				//["I_UGV_01_F",[175,100],[0,""],"none"]
			],
			[               // Drivers  
				//[["EAST","COMBAT","RED","COLUMN"],   [  [1, "Driver"]  ],   ["BoxPatrol",[100,100],[0,0],[100]   ]]          
			],
							// Troops : These are distributed across all vehicles in this convoy.                                                         
			[    
			]
		] ,
		[ 					// Convoy #2
			[               
				//[FUMS_Civ_Offroads,[50,0],[0,""],"None",[["engine",.9],["fuel",.9],["hull",1],["RGlass",1],["Glass1",1]]], // sets damage to specific parts.
				//[FuMS_Mil_Hemmts,[60,0],[0,""],"None",[.5]] // overall damage 50%
			],
			[    			// DRIVERS 
							// If no drivers, this is basically loot
							//  ex.      [["RESISTANCE","COMBAT","RED","COLUMN"],   [  [4, "Driver"]  ],   ["BoxPatrol",[100,100],[0,0],[200]   ]]          
			],
			[				// TROOPS
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
			["LUCNT3",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Triggers call for reinforcements

			//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			["AllDead",		["LowUnitCount","EAST",0,250,[0,0]]  ]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["CHILD",	["Help_Helo",[0,0],1,120]],["LUCNT3"     ]],  

			[["WIN"],	["AllDead"     ]],  // 
			[["END"],	["AllDead"     ]]  
		]      
	]
];
/*
		[
							//Define all the triggers this mission will be using
							// Trigger names must be unique within each mission.
							// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
							// NOTE: "OK" is a reserved trigger. Do not define it here.
							//  "OK" can be used in the actions section to force an action to occur at mission start!	 
							//  ["PROX",["ProxPlayer",[0,0],10,1]  ],
			["LUCNT",["LowUnitCount","EAST",5,0,[0,0]]  ],
			["LUCNT2",["LowUnitCount","EAST",0,0,[0,0]]  ]

			//["LowCaptive", ["LowUnitCount","CAPTIVE",0,0,[0,0]] ],
							//  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
							//  ["Detect",["Detected","ALL","ALL"] ],
							//  ["BodyCount",["BodyCount",3] ],
							// 	["Timer",["TIMER", 1800] ],
							//  offset      radius    time(s)  Name
							//  ["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
							//              [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
							//   ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
							//   ["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ],
			//["Captive1", ["Captive", 7]  ]
	  
		],
		[
							// Define what actions should occur when above trigger logics evaluate to true
							// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["LUCNT2"     ]],  
			[["CHILD"],	["Help_Helo",[0,0],3,120],["LUCNT"     ]],  
			//[["LOSE"],	["LowCaptive"]   ],
			[["END"],	["LUCNT2"      ]]  
		]
*/		