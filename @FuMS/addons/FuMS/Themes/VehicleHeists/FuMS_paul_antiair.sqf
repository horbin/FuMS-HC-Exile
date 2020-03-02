// 	FuMS_paul_antiair.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynmic mission to spawn a little bird with guards
// 	This mission was ported from GolovaRaoul's collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	Anti-Air Mission with new difficulty selection system
	Hardcore now gives persistent vehicle
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
	based on work by Defent and eraser1
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//  
//  Be cautious when editing data.

[
	["AntiAir", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Anti-Air soldiers","hd_objective","ELLIPSE","ColorKhaki","DiagGrid",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[					// NOTIFICATION Messages and Map display Control.
			false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global toast message
			true,			// Show encounter area on the map
			900,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Anti-Air soldiers",	// The first line is the title of the pop-up box
			"Soldiers are setting up Anti Air to reduce the amount of Jets... Go stop them and steal their Tigiris!!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Anti-Air stolen",
			"The soldiers are cleaned up and the MBT-52 Kuma is being stolen!"
		],
	  
		// Mission Failure Message
		[
			"Anti-Air destroyed",
			"The soldiers accidently destroyed their Anti-Air vehicle. Everyone died"
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 			[5,5] ], //[static loot, offset location] - spawns with the mission
		["AntiAirLoot" , 	[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 			[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		["B_APC_Tracked_01_AA_F",				[-10,-10],				0,			[.5,   1,     .5,         .5,         .5]],
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        			0]
		["TK_WarfareBAntiAirRadar_Base_EP1",	[-9.68477,-6.65947],	0,			0],
		["Land_tent_east",						[18.0818,-0.867676],	0,			0],
		["Land_tent_east",						[18.1936,-8.85889],		0,			0],
		["Land_tent_east",						[18.3862,-17.2026],		0,			0],
		["Land_Wreck_BRDM2_F",					[1.77808,-15.0469],		0,			0],
		["WallMap",								[20.145,-2.40625],		306.383,	0],
		["Land_Map_unfolded_F",					[6.59229,-10.9336],		0,			0],
		["Land_Cargo_House_V1_F",				[0.273193,18.5063],		0.552,		0],
		["Land_Cargo_House_V1_F",				[7.77026,18.8364],		0.552,		0],
		["USMC_WarfareBVehicleServicePoint",	[-15.1865,-19.0991],	98.2193,	0],
		["Land_UWreck_MV22_F",					[-74.1875,35.4346],		118.993,	0]
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","VEE"],   	[  [3,"Sniper"]  ],   					["Loiter",		[0,0],[0,0],[10]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"SMG"]  ],   						["BoxPatrol",	[0,0],[0,0],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [2,"Rifleman"]  ],   				["Explore",		[0,0],[0,0],[100]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[-3,3],						[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[-7,7],						[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[7,7],							[0],     	"None" ],  
				[  "O_HMG_01_high_F"   		,[3,-7],						[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [4, "Rifleman"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
		
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)  
				[  "B_G_Offroad_01_armed_F",[50,50],	[1,"Hunter"],        "TruckJunk",[0]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [ [ 1, "Rifleman"]  ],   ["BoxPatrol",[50,50],[-50,-50],[150]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],    [[ 1, "Rifleman"]]  ,   ["BoxPatrol",[50,50],[-50,-50],[150] ]   
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
			["VehDmg1", 	["DmgVehicles", "0",1]  ],			
			["Timer", 		["TimerNoPlayers", 		1800]],	//30 minutes				
			["LUCNT",		["LowUnitCount","EAST",1,0,[0,0]]  ]			
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["LUCNT"     			]],
			[["LOSE"],	["Timer","OR","VehDmg1"	]],
			[["END"],	["LUCNT","OR","Timer"	]]  
		]

  
	]


];
