// 	Mission Template.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	This file will help document the various components of the FuMS mission system to help underdstand how to modify and create missions 

// 	NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// 	Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// 	Ex: [12100,11000,0] is a specific point on the map.
// 	absolute 3d locations can be subsituted for any offset within this file!

//	------------------------------------------------------------------------------------
//	----- Mission Setup-----
//	----- This section sets up the mission in terms of internal names, radius, etc. as well as the mission map marker
//  File has been tabbed to help debug in contextual editors like Notepad ++, pay attention to the bracket locations.
/*
    [
	"MISSIONNAME",  // Mission Title NOSPACES! This is an internal name for tagging and cleaning up mission assets
    200 ,			// encounter radius in meters
	]				// You can stop here and close the bracket, or include the following options and REMOVE this bracket
	
					// remember to put a closing bracket at the end of these options if you choose to use them
    "LAND",			// Options "LAND","WATER","NONE". Setting this will force a scan of 'encounter Radius' meters around the center of the mission to ensure the same type of water/land is present.
					// This setting should hopefully reduce the chance of the mission being randomly placed too near water for example.
					// this paramater is optional, but if a value is present it MUST be one of the three above values.
					// This option is only used if a mission location is not set via the Theme's 'Locations' section, or the mission loc is not specified elsewhere in the ThemeData.sqf.
    [0,0,0],		// WHAT IS THIS OPTION?
    "NONE",			// WHAT IS THIS OPTION?
    "NONE"			// WHAT IS THIS OPTION?
	]				// remember to put a closing bracket at the end of these options if you choose to use them
	
	ex. 
	["MissionTitle", 200], 	// Mission title NOSPACES!, and encounter radius.  This example has no options
	["MissionTitle", 200, "LAND", [0,0,0], "NONE", "NONE" ], // Mission Title NOSPACES!, and encounter radius.  This example has options
			
// Comma is required at the of this block


	
//	----- Marker Setup-----
//  ----- This section sets up the mission marker with the following options
    [						// Need opening bracket
	"Map Marker Name",  	// Name, set to "" for nothing.  Can have spaces
    "mil_dot", 				// icon type: see https://community.bistudio.com/wiki/cfgMarkers for other options.
							// ex. mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
    "ELLIPSE", 				// "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
    "ColorYellow",			//  Color of marker: see https://community.bistudio.com/wiki/setMarkerColor
    "FDiagonal",			// Cross, Vertical, Horizontal, etc: see https://community.bistudio.com/wiki/setMarkerBrush 
    200           			// size of the marker.    
	],						// Be sure to close this section and have comma in place
	
	ex. 
	["Sniper Alley","mil_objective","ELLIPSE","ColorOrange","FDiagonal",75],    
   
//	----- This section determines how the players will be notified about the start of a mission    
	[  
		[					// NOTIFICATION Messages and Map display Control.
		true,				// Notify players via Radio Message (NOT SURE IF RADIO IS WORKING YET)
		1,					// radio channel. "ALL" = no radio required. (NOT SURE IF RADIO IS WORKING YET)
		0,					// range from encounter center AI radio's can be heard (0=unlimited.) (NOT SURE IF RADIO IS WORKING YET)	
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		300,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		30       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
	
*/

[
	["MissionTitle", 200], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Mission Title on Map","mil_objective","ELLIPSE","ColorRed","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[				// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 			// Notify players via global toast message
		true,			// Show encounter area on the map
		60,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		60       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
	
		// This section sets up the toast notifications in the upper left corner.  This is using the built in toast notificaiton system which is defined in the Arma system 
		
		// Spawn Mission Message
		[
			"Mission Title",	// The first line is the title of the pop-up box
			"Description"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Mission Success",
			"Mission has been accomplished text"
		],
	  
		// Mission Failure Message
		[
			"Mission Failure!",
			"Mission has not been accomplished and has timed out / failed"
		] 
	],
	[  	// Loot Config:  Refer to GlobalLootData.sqf (or LootData.sqf if you are using a custom loot file) for available loot types and contents.
		// "Random" will select a random configuration, ignoring all 'ScatterXX' options.
		// "ScatterXX" loot will not appear in a box, but will be scattered about on the ground around the location/offset
		// Ex: ["Scatter01",[0,0]]  will take the loot contained in the "Scatter01" option and spread it around at offset [0,0] to the mission center.
		//Array of loot now supported using syntax:  [["LOOTBOX" , 	[0,0]],["LOOTBOX" , 	[0,0]] ]

		["LOOTBOX" , 	[0,0] ], //[static loot, offset location] - spawns with the mission
		["None" , 		[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// Buildings and Vehicles: Anything defined in this section will spawn in at mission start, and any vehicles will spawn in empty
		// This is a great way to offer vehicles as "loot" without the need to kill the AI
		//
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// NOTE: if using 3D coordinates for buildings, the 1st building uses a location of [0,0] (This is the spawn point selected for the mission 
		// ALL other buildings will assume their locations are offsets from this first building 
		// building name              | offset   |rotation|persist flag
		["Land_BagBunker_Tower_F",  	[0,0],     	0,			0],  
		["Land_BarrelWater_F",          [-7,-7], 	0,			0],
		["Land_Wreck_Car2_F",          	[12,12],  	0,			0],
		["Land_Wreck_Offroad2_F",   	[-10,-10],	0,	        0],
		["Land_HighVoltageTower_F",    	[20,-10],	0,       	0],
		["CamoNet_INDP_big_F",        	[-20, 10],	0,        	0],
		
		// VEHICLES: 1 for fuel and ammo is full 100%, DmgEngine=1 is 100% damaged, everything else is a percentage
		// NOTE: 100% damage to hull will usually destroy the vehicle as soon as the player gets close 
		// All vehicles are static and remain until server reset.  It is not possible to spawn permanent vehicles yet
		// Vehicle Name                | offset | rotation | Fuel, Ammo, DmgEngine, Dmg FuelTank, DmgHull
		["O_G_Offroad_01_F",			[0,100],   	0,		[.5,   1,     	.5,         .5,         .5]],
		// You can also use this to spawn in wrecked vehicles and attach either "FIRE" or "SMOKE"
		// Vehicle Name  			  | offset | rotation | Fuel, Ammo, DmgEngine, Dmg FuelTank, DmgHull
		["Land_Wreck_Car2_F",			[0,50],		0, 		[.5, 	1, 		.5,			.5,			.5], "Fire_Small"]
		// You can also have the system choose a random model by sending an array of options
		// 				System will pick one of these						Offset	Rotation	Persist?	effect 
		// ["Land_UWreck_Heli_Attack_02_F","Land_Wreck_Heli_Attack_01_F"],	[0,0],	0,				0,		"Fire_Big"]



		
		// How to import M3Editor buildings (ADVANCED) You really need to know how to deconstruct existing missions to use this
		// There are two functions to import missions depending on how the original files are created.  You have to know if your export relies
		// on the SetPosATL function or SetPosASL function as the layouts are different. See https://community.bistudio.com/wiki/Position
		//
		// Most exports that rely on the SetPosATL look like this: (last option changes how placement works!!)
		// Building className						position above TERRAIN 		direction		vector 						placemnt detail
		// ["Land_TentHangar_V1_F",				[14692.4,16710.5,0],			312.727,		[0,0,1],							true]
		// Since last option is true, building is created, then direction is set, and then building is re-placed, vector is ignored
		//
		// If last option is false as follows:
		// 		Building className					position above TERRAIN 		direction		vector and direction up					placement detail
		//	["Land_Unfinished_Building_02_F",	[5817.45,20114.6,0.541473],		49.091,		[[0.755751,0.654859,0],[0,0,1]],		false]
		// Then the building is created, then the position is recomputed to Above Terrain Level, then vector and direction up is set, and direction is ignored
		//
		// If this is how your import looks, start this section with 
		// ["M3Editor", [0,0], "NONE", 0, 
		//		[ // paste your array of building objects here
		//			["Land_TentHangar_V1_F",[14692.4,16710.5,0],312.727,[0,0,1],true]
		//		]
		//
		// Most exports that rely on SetPosASL look like this:
		// 	Building className			position about SEA LEVEL			direction and vector 		enable simulation 		enable damage
		// ["Land_BarGate_F",	[16205.299805,17003.912109,13.336671],	[[0.866025,-0.5,0],[0,0,1]],	[true,						true]],
		//
		// If this is how your import looks, start this section with 
		// ["M3Editor-ASL", [0,0], "NONE", 0, 
		//		[ // paste your array of building objects here
		//			["Land_BarGate_F",[16205.299805,17003.912109,13.336671],[[0.866025,-0.5,0],[0,0,1]],[true,true]],
		//			["Land_BarGate_F",[15930.188477,16993.994141,14.217404],[[0.951057,0.309017,0],[0,0,1]],[true,true]]
		//		]
		//
		// In either case, the [0,0] in the keyword indicates to use the mission start location as the anchor for the first building
		// and calcualte the offsets for the rest of the buildings automatically
		// If however you are importing a "map specific" set of buildings, use [-1, -1] and the building placement will use the exact location given
		// This will make the mission "map specific" and you should be sure to include it in the proper Theme directory for proper functioning
	],	// Don't forget to close this section out properly
		//
	[	// ---------------------------------------------------------------------------------
		// ----- AI Group Configuration-----  see Land Vehicle section for AI in vehicles! 
		// --- See Global SolderData.sqf for AI type options.
		/*
		
		AI Example
				Side		Behavior	Combat Mode 	Formation      AI quantity and type		AI Logic	Specific logic parameters
		[ ["RESISTANCE",	"COMBAT",	"RED",			"LINE"],	[[1,"Sniper"],[3,"Rifleman"]],[  "TowerGuard",	[0,0], [0,0],[150,"ANY"] ]]
		
		Defined sides:
		RESISTANCE, WEST, EAST, CIV
		Multiple sides can be defined within one mission
		
		Defined Behaviours:
		SAFE, AWARE, COMBAT, STEALTH
		
		Defined Combat Modes
		BLUE, WHITE, GREEN, YELLOW, RED
		
		Defined Formations:
		STAG COLUMN, WEDGE, ECH LEFT, ECH RIGHT, VEE, LINE, COLUMN
		
		Defined AI logic options: See 'Documenation' for details'
		["BUILDINGS", 	[spawnloc], [actionloc], [range]]  
		["EXPLORE   ",	[spawnloc], [actionloc], [radius]]
		["BOXPATROL", 	[spawnloc], [actionloc], [radius]]
		["CONVOY",    	[spawnloc], [actionloc], [speed, FlagRTB, FlagRoads, FlagDespawn, convoyType]]
		["SENTRY",    	[spawnloc], [actionloc], [radius]]
		["PARADROP",  	[spawnloc], [actionloc], [speed, altitude, FlagRTB, FlagSmokes]]  
		["PATROLROUTE", [spawnloc], [actionloc], [behaviour, speed, [locations], FlagRTB, FlagRoads, FlagDespawn, flyHeight]    
		["ZOMBIE", 		[spawnloc], [actionloc], [detection_Range, FlagCanThrow, Wonder_range]
		["TRACKROUTE", 	[spawnloc], [actionloc], [behaviour, speed, [locations], FlagRTB, FlagRoads, FlagDespawn, flyHeight]
		["TOWERGUARD", 	[spawnloc], [actionloc], [radius,"Optional_Building_Name"]]
		["GUNNER", 		[spawnloc], [actionloc], [0]]
		["LOITER", 		[spawnloc], [actionloc]]

		Under development
		PERIMETER
  
		*/
		// Example AI spawns
		// 3 rifleman that will spawn 20 m to the west of mission center and patrol buildings within 50m for unlimited duration
		[["EAST","COMBAT","RED","LINE"],[[3,"Rifleman"]],["Buildings",[-20,0],[-20,0],[50] ]], 

		// 5 rifleman that will spawn 25 m to the north of mission center and patrol in a box pattern for a 50 m radius
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman"]],["BoxPatrol",[0,25],[0,25],[50] ]],

		// 5 rifleman that will spawn 40 m to the west of mission center and run around amoungst all strcutures withen 50m 
		[["EAST","COMBAT","RED","LINE"],[[5,"Rifleman"]],["Explore",[-40,0],[-40,0],[50] ]],

		// 3 snipers that will spawn on top of buildings of classname "Land_Cargo_Patrol_V2_F" found withen 150 m of mission center
		[["EAST","COMBAT","RED","LINE"],[[3,"Sniper"]],[  "TowerGuard",[0,0], [0,0],[150,"Land_Cargo_Patrol_V2_F"] ]]
		// 5 rifleman that spawn at [21520,11491.9,0] and march to encounter centr to set up a box patrol!    
		// Expanded group example:
		// 1 sniper, 2 rifleman, 2 hunters wil spawn east of encounter center and perform a box shaped patrol.

		// 2 hunters that will spawn near encounter center and take up guard positions.
		// This example the AI are spawned 6 meters NE of encoutner center, and will look for a building within 30meters of encounter senter to take up Sentry postions.
		// [["RESISTANCE","COMBAT","RED","LINE"],[[2,"Hunter"]],["Sentry",[0,0],[0,0],[30]]
		// NOTE: if no buildings are located within 'radius' both 'Buildings' and 'Lookout' will locate nearest buildings to the encounter and move there!
		// NOTE: See AI_LOGIC.txt for detailed and most current descriptions of AI logic.
	],

		//---------------------------------------------------------------------------------
		//-----LAND Vehicle Configuration----- 
	[	// This section defines the AI vehicles, their drivers, and their troops
		// You can also define static weapons here and their gunners by following the proper format
		// Each main section is a grouping of vehicles and can contain vehicles defined as follows
		//
		// VEHICLES
		// Vehicle classname			  spawn 		crew # and type			loot			damage (optional)
		//[  "O_MRAP_02_hmg_F ",		[-50,-610],		[1,"Rifleman"],        "TruckJunk",		[1.0]      ]
		//
		// STATIC WEAPONS  
		// Vehicle classname			  spawn 		facing					loot			damage (optinal
		// ["O_Mortar_01_F",			[0,60],			[0],					"None"						]  
		// NOTE: in above example for static guns, crew section is replaced with a 'facing' for intial direction
		//
		// See documentaion for examples of how to apply damage to specific hitpoints 
		// You can also privide an array as the vehicle classnames and the system will choose one 
		
		// Following examples show how to define each vehicle grouping
		[  // GROUP #1 (Aquatic Example)
			// Spawns 1 vehicle 10m north of encounter center and one on center. These 2 will move as a convoy and contain 3 troops each.
			// These troops will be dropped off just south of encounter center, then the convoy will return to their spawn location and despawn.
			[	// VEHICLES IN GROUP  
				//   Vehicle classname			Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[ "B_Boat_Armed_01_minigun_F",	[10,0],		[3,"Rifleman"],     	"TruckJunk"], 
				[ FuMS_H20_RubberDucks,			[0,0], 		[3,"Rifleman"],     	"TruckJunk"]
				// If driver-less vehicles are desired, place them at the bottom of the list and put less drivers than vehicles
				// Troops below WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[	// DRIVERS FOR VEHICLES (Review notes from above on AI setup and behaviors
				// This example provides enough drivers for each vehicle above
				// Driver behavior						# and type  |         AI Logic     |    	spawn   | 	dest  | 'AI Logic' options
				[["EAST","COMBAT","RED","COLUMN"],   [  [2, "Driver"]  ],   ["BoxPatrol",		[0,0],		[0,0],	[50]   ]]
			],
			[	// Troops : These are distributed across all vehicles in this group. These lines are identical to the lines in the group section.
				// Because these are boats, they don't need troops or disembark logic, but included for examples
				// Troop behaviour and side options          # and type of Troops     	Patrol logic |  	spawn     |	dest |		'Patrol' options
				// [["EAST","COMBAT","RED","COLUMN"],	[[1,"Sniper"],[1,"Rifleman"]],	["BoxPatrol",	[-70,-600],		[0,0],		[0]]],
				// [["EAST","COMBAT","RED","COLUMN"],	[[1,"Sniper"],[2,"Rifleman"]],	["BoxPatrol",	[-70,-600],		[50,0],		[50]]],
				// [["EAST","COMBAT","RED","COLUMN"],	[[1,"Sniper"],[1,"Rifleman"]],	["BoxPatrol",	[-70,-600],		[-50,0],	[50]]]
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		], 	// End of GROUP #1 configuration
			//
		[ 	// GROUP #2  (Unmanned vehicle example)
			[	// Vehicle              Offset		Crew (only 1 type!)   Cargo
				["I_UGV_01_F",			[175,100],		[0,""],			"none"]
			],
			[   // DRIVERS FOR VEHICLES              
				// Driver behavior                          # and type  |         AI Logic     |    spawn   | dest   | 'AI Logic' options
				[["EAST","COMBAT","RED","COLUMN"],   	[  [1, "Driver"]  ],   ["BoxPatrol",	[100,100],	[0,0],		[100]   ]]          
			],
			[	//TROOPS
				// None included becuase this is a UGV
			],	
		],	// End of GROUP #2 configuration 
			//
		[ 	// GROUP #3 (Unmanned Ground Vehicle (loot vehicles) Example )
			[   // Vehicle              Offset		Crew    	Cargo       damage (Optional)     
				[FUMS_Civ_Offroads,		[50,0],		[0,""],		"None",		[["engine",.9],["fuel",.9],["hull",.9],["RGlass",1],["Glass1",1]]], // sets damage to specific parts.
				[FuMS_Mil_Hemmts,		[60,0],		[0,""],		"None",		[.5]] // overall damage 50%
			],
			[	// DRIVERS    
				// Since no drivers defined, these vehicles spawn in empty.  In this example, it appears the civilians were attacked
				// and everyone must be out of the vehicles.  Both can be grabbed as loot
			],	// TROOPS 
			[
				// None defined, they must be all deployed already...
			]
		],	// End of GROUP #3
			//
		[  	// GROUP #4 (Armed convoy example)
			[ // VEHICLES
				// Vehicle                     Offset     Crew (only 1 type!)   	CargoLoot (see Loot section below for more detail!)
				[  FuMS_Mil_Hemmts,				[0,0],		[1 ,"Rifleman"],        "Random"      ], 
				[  FuMS_Mil_ArmedOffroads,		[0,50],		[1 ,"Rifleman"],     	"Random"      ], 
				[  FuMS_Mil_Hunters,			[0,75],		[1 ,"Rifleman"],     	"Random"      ]
			],
			[  
			//    Drivers behavior             		     # and type  |         AI Logic     |    spawn   | 	dest       | 	AI Logic options
				[["EAST","COMBAT","RED","COLUMN"],   [  [3, "Driver"]  ],   ["TrackRoute",		[0,0],		[0,0],		["SAFE","LIMITED",["Cities","Cities"],true,true,false,0]   ]]
			],
			// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options                # and type of Troops          Patrol logic |  	spawn     |		dest |		AI Logic options
				[["EAST","COMBAT","RED","COLUMN"],   			[  [3,"Sniper"],[2,"Rifleman"] ],   ["BoxPatrol",	[0,0],			[0,0],		[100]   ]]
				[["EAST","COMBAT","RED","COLUMN"],   			[  [1,"Sniper"],[2,"Rifleman"] ],   ["BoxPatrol",	[-70,-600],		[50,0],		[50]   ]]
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		],  // End of GROUP #4
		[	// GROUP #5 (Airborne Vehicle example)
			[	// VEHICLES
				//	Vehicle classname           Offset     	Crew (only 1 type!)   	CargoLoot (see Loot section below for more detail!)
				[  "B_Heli_Light_01_armed_F",	[0,0],		[1,"Rifleman"],			"TruckJunk"      ], //AH-9 Pawnee 
				[  "B_Heli_Light_01_armed_F",	[0,-100],	[1,"Rifleman"],			"TruckJunk"      ], //AH-9 Pawnee
				[  "B_Heli_Transport_01_F",		[100,0],	[1,"Rifleman"],			"TruckJunk"      ]  //U-80 Ghost Hawk
			],
			[	// DRIVERS  
				// Pilot behavior                       	# and type  |         AI Logic     |    spawn  | dest  | 'AI Logic' options  (see documentation)                                                     RTB, 	Roads, 	Despawn, 	Height
				[["EAST","COMBAT","RED","COLUMN"],		[  [3, "Driver"]  ],   ["TrackRoute",		[0,0],	[0,0],	["COMBAT","NORMAL",["Villages","Villages","Cities","Capitals","Villages","Villages"],		false,	false,	false,		100   ]]]
			],
			[   
				// TROOPS : These are distributed across all aircraft in the group 
				//  Troop behaviour and side options        	# and type of Troops     	Patrol logic |  spawn   |dest |	'AI Logic options  		locations		RTB, 	Roads, 	Despawn, 	fly height
				[["EAST","COMBAT","RED","COLUMN"],			[[1,"Sniper"],[1,"Rifleman"]],	["PatrolRoute",	[0,0],	[0,0],	["COMBAT","NORMAL",		["Villages"],	true,	false,	true,		100   ]]]
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once they get on deck
				]
			]
	],		// End of GROUP #5
	[	//----- Trigger and Action section
		[
			// Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!
			// Read documentation to understand trigger rules
			//
			// DEFINED TRIGGERS:
			// ["LowUnitCount", side, numAI, radius, offset]
			// ["HighUnitCount", side, numAI, radius, ofset]
			// ["ProxPlayer",offset, range, numPlayers]
			// ["Detected", group#, vehicle#]
			// ["BodyCount", numAI] 
			// ["Timer", seconds]
			// ["AllDeadorGone"]
			// ["Reinforce", chance, "mission"] <-- only use in Win State trigger area!
			// ["ZupaCapture", [[ [offset], radius, time], [ [offset], radius, time] ]
			// ["DmgBuildings","INDEXER", amount]
			// ["DmgVehicles","INDEXER", amount]
			// ["OK"]
			// ["Captive", numAI]
			//
			// Example triggers 
			//
			//	["PROX",["ProxPlayer",[0,0],80,1]  ],			// Trigger true if 1 player comes withen 80 m of mission center
			//	["LUCNT",["LowUnitCount","GUER",1,0,[0,0]]  ]	// Trigger true if unit count for GUER side spawned on this mission drops to 1 anywhere on the map (ex they run away, it won't ignore them
			//	["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ], 	// Trigger true if unit count for GUER side spawned on this mission exceeds 6 anywhere on the map (ex reinforcements show up)
			//	["Detect",["Detected","ALL","ALL"] ],			// Trigger true if any vehicle or AI detects a player
			["BodyCount",	["BodyCount",20] ],					// Trigger true if the player kills 20 AI
			["Timer",		["TIMER", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds
			["TimerEvac", 	["TIMER", 1400] ] 					// Trigger true if the mission timer reaches 1400 seconds (Multiple timers possible)
			//
			//	Zuppa triggers can include multiple points
			//	       							offset      radius    time(s)  Name
			//	["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 	50,         90,  "Point 1" ],
			//                              [ [100,100],   	50,         90,  "Point 2" ]   ]]  ],
			// NOTE: PAY ATTENTION TO THE BRACKET STRUCTURE
			//       ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
			//       ["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ]


		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["BodyCount"     ]],  							// WIN mission by meeting Bodycount requirement
			[["CHILD",	["EvacTown",[0,0],3,10]],["TimerEvac"      ]],  // SPAWN CHILD mission "EvacTown" up to 3 times every 10 seconds by meeting TimerEvac requirement
			[["LOSE"],	["TIMER"]   ],									// LOSE mission one Timer trigger is true
			[["END"],	["BodyCount","OR","TIMER"     ]]  				// End mission if BodyCount OR Timer is true
 
		]    
	]

];
