// 	CoolCar.sqf
// 	TheOneWhoKnocks
// 	5/13/2020
// 	Dynamic mission to spawn a Civilian vehicle with guards
///////////////////////////////////////////////////////////////////////////////////
//  THIS MISSION REQUIRES THE CAMS ARRAY ImFX_Land_CoolCars
////////////////////////////////////////////////////////////////////////////////////
//	Make sure you have this populated with whatever vehicles you want to be offered here.  
//	This is used to offer specific vehicles from addon content (ex, Foxcars, MadMax, Unsung) 
//  Make sure you update your ImmersionFX.bat file to populate this array or thsi mission will throw errors
//
//	10:56:37   Error Undefined variable in expression: imfx_land_coolcars
//	10:56:37 File FuMS\Themes\StaticSpawns\LootVics.sqf..., line 56
//
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//  
//  Be cautious when editing data.

[
	["CoolCar", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Cool car spotted","plp_mark_civ_carWorkshop","ELLIPSE","ColorKhaki","DiagGrid",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[					// NOTIFICATION Messages and Map display Control.
			false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global toast message
			true,			// Show encounter area on the map
			1800,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Cool car spotted",	// The first line is the title of the pop-up box
			"Bandits with a classic car have broken down. Go kill the bandits and steal their car"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Cool Car captured",
			"Convicts killed everyone and made off with the cool car."
		],
	  
		// Mission Failure Message
		[
			"Civilian Car gone",
			"The attackers drove off and escaped attack."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 			[5,5] ], //[static loot, offset location] - spawns with the mission
		["SmallLoot" ,		[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 			[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		[ImFX_Land_CoolCars,					[-5,5],				(round random 360),			[.5,   1,     .5,         .5,         .5]]
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        			0]

		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","VEE"],   	[  [2,"Rifleman_I"]  ],   				["Loiter",		[2,2],[0,0],[10]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_I"]  ],   				["BoxPatrol",	[5,5],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [2,"Rifleman_I"]  ],   				["Explore",		[-5,-5],[0,0],[150]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				//[  "O_HMG_01_high_F",		[((round random 100)-50),((round random 100)-50)],						[(round random 360)],     	"None" ],
				[  "O_HMG_01_high_F",		[((round random 100)-50),((round random 100)-50)],						[(round random 360)],     	"None" ] 
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [1, "Rifleman_I"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
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
			["Timer", 		["TimerNoPlayers", 		1800]],	//30 minutes
			["LUCNT",		["LowUnitCount","EAST",1,0,[0,0]]  ]			
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["LUCNT"     			]],
			[["LOSE"],	["Timer"				]],
			[["END"],	["LUCNT","OR","Timer"	]]  
		]

  
	]


];
