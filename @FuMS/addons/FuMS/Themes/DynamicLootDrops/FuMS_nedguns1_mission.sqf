// 	FuMS_nedguns1_mission.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynamic mission to spawn a guns loot box with guards
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	Guns Guns Guns Mission with new difficulty selection system
	Mission gives % chance of persistent vehicle
	based on work by Defent and eraser1
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
	now with rocket and mine chance - mines cleaned on mission win - updated June 2018
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//  
//  Be cautious when editing data.

[
	["GunsMission", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Guns guns guns","plp_mark_as_container","ELLIPSE","ColorOrange","Solid",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[					// NOTIFICATION Messages and Map display Control.
			true, "ALL",700, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global toast message
			true,			// Show encounter area on the map
			1800,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Guns guns guns",	// The first line is the title of the pop-up box
			"Some terrorists are out stealing guns, get in there first!!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Guns stolen",
			"Convicts have got their hands on the weapons"
		],
	  
		// Mission Failure Message
		[
			"Guns stolen",
			"The attackers stole everything, no guns for you!"
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics																		

		["GunsLoot", 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["GunsLoot" ,		[15,25] ], // Win loot, offset location - spawns after mission success
		["None" , 			[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        			0]
			["Land_Cargo_House_V3_F",		[0,15],		0,		0],
			["Land_Cargo_House_V3_F",		[6.2,15],	0,		0],
			["Land_Cargo_House_V3_F",		[-6.2,15],	0,		0],
			["Land_Cargo_House_V3_F",		[15,0],		90,		0],
			["Land_Cargo_House_V3_F",		[15,6.2],	90,		0],
			["Land_Cargo_House_V3_F",		[15,-6.2],	90,		0],
			["Land_Cargo_House_V3_F",		[0,-15],	180,	0],
			["Land_Cargo_House_V3_F",		[-6.2,-15],	180,	0],
			["Land_Cargo_House_V3_F",		[6.2,-15],	180,	0],
			["Land_Cargo_House_V3_F",		[-15,0],	270,	0],
			["Land_Cargo_House_V3_F",		[-15,-6.2],	270,	0],
			["Land_Cargo_House_V3_F",		[-15,6.2],	270,	0]
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","VEE"],   	[  [3,"Rifleman_I"]  ],   	["Loiter",		[2,2],[0,0],[10]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"LMG_I"]  ],   		["BoxPatrol",	[5,5],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_I"]  ],   	["Explore",		[-5,-5],[0,0],[150]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  	
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F",		[-17,3],					[0],     	"None" ],
			//	[  "O_HMG_01_high_F",		[-7,-13],					[0],     	"None" ],
			//	[  "O_HMG_01_high_F",		[17,7],						[0],     	"None" ],
				[  "O_HMG_01_high_F",		[13,-7],					[0],     	"None" ] 
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [2, "Rifleman_E"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		],		

		[
		
			[   // Vehicle                     	Offset     				Direction   CargoLoot (see Loot section below for more detail!)  
				[  ImFX_Work_BoxVans,		[((round random 100)-50),((round random 100)-50)],	[0,"Rifleman_E"],        "TruckJunk",[0]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [ [ 0, "Rifleman_E"]  ],   ["BoxPatrol",[50,50],[-50,-50],[150]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],    [[ 0, "Rifleman_E"]]  ,   ["BoxPatrol",[50,50],[-50,-50],[150]]   
				]
			]
		],

		[
		
			[   // Vehicle                     	Offset     				Direction   CargoLoot (see Loot section below for more detail!)  
				[  "B_G_Offroad_01_armed_F",		[50,50],	[1,"Rifleman_E"],        "TruckJunk",[0]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [ [ 1, "Rifleman_E"]  ],   ["BoxPatrol",[50,50],[-50,-50],[150]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],    [[ 1, "Rifleman_E"]]  ,   ["BoxPatrol",[50,50],[-50,-50],[150]]   
				]
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
			["Timer", 		["TimerNoPlayers", 		(round random [1000,1300,1200])]],	//1000 - 1300 second mission timer
			["LUCNT",		["LowUnitCount","EAST",1,0,[0,0]]  ]			
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["LUCNT"     			]],
			[["LOSE"],	["Timer"	]],
			[["END"],	["LUCNT","OR","Timer"	]]  
		]
	]
];
