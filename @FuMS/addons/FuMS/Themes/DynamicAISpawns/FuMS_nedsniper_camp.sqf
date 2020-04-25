// 	FuMS_nedsniper_camp.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynamic mission to spawn a sniper camp with guards
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	Sniper Camp Mission with new difficulty selection system
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
	["SniperCamp", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Sniper Camp","hd_objective","ELLIPSE","ColorBlue","Cross",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[					// NOTIFICATION Messages and Map display Control.
			true, "ALL",1000, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global toast message
			true,			// Show encounter area on the map
			900,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Sniper Camp",	// The first line is the title of the pop-up box
			"Snipers have set up a training camp, go steal their rifles"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Sniper Camp",
			"Convicts have killed the snipers and stolen their rifles"
		],
	  
		// Mission Failure Message
		[
			"Sniper Camp",
			"The Snipers have packed up and left, no rifles for you!"
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 			[5,5] ], //[static loot, offset location] - spawns with the mission
		["SniperLoot" ,		[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 			[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		[ImFX_Mil_Ural_ALL,		[17.2,0],				(round random 360),			[.5,   1,     .5,         .5,         .5]],
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        			0]
		["Land_PartyTent_01_F",		[0,0],		0,		0],
		["Land_TentA_F",			[0,-10],	0,		0],
		["Land_TentA_F",			[-2.7,-10],	0,		0],
		["Land_TentA_F",			[2.7,-10],	0,		0],
		["Land_TentA_F",			[0,10],		180,	0],
		["Land_TentA_F",			[2.7,10],	180,	0],
		["Land_TentA_F",			[-2.7,10],	180,	0],
		["MapBoard_stratis_F",		[-2,0],		0,		0],
		["MapBoard_altis_F",		[2,0],		0,		0],
		["Land_RattanChair_01_F",	[-4,-3],	0,		0]
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","VEE"],   	[  [4,"Sniper"]  ],		["Loiter",		[2,2],[0,0],[30]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"Sniper"]  ],		["BoxPatrol",	[5,5],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Sniper"]  ],		["Explore",		[-5,-5],[0,0],[150]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  		
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[-6,4],						[(round random 360)],     	"None" ],
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[(round random 360)],     	"None" ] 
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [2, "Sniper"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
				[  "B_G_Offroad_01_armed_F",[50,50],	[1,"Sniper"],        "TruckJunk",[0]      ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [ [ 1, "Sniper"]  ],   ["BoxPatrol",[75,75],[-75,-75],[150]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],    [[ 1, "Sniper"]]  ,   ["BoxPatrol",[75,75],[-75,-75],[150]]   
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
			["Timer", 		["TimerNoPlayers", 		2400]],	//40 minutes	
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
