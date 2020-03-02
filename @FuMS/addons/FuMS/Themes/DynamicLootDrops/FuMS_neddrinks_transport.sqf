// 	FuMS_neddrinks_transport.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynamic mission to spawn a drink shipment with guards
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	Drink Transport Mission with new difficulty selection system
	Originally Beer Transport Created by Defent and eraser1
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
	now with rocket and mine chance - mines cleaned on mission win - updated June 2018
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//  
//  Be cautious when editing data.

[
	["DrinkTruck", 100], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Drink Supply","hd_objective","ELLIPSE","ColorOrange","Solid",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[					// NOTIFICATION Messages and Map display Control.
			true, "ALL",500, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global toast message
			true,			// Show encounter area on the map
			900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Drink Supplies",	// The first line is the title of the pop-up box
			"Bandits are moving a truck carrying their drink supplies, stop the bandits and steal their supplies!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Drink supplies Seized",
			"Convicts have successfully claimed all of the supplies."
		],
	  
		// Mission Failure Message
		[
			"Drink supply escaped",
			"The robbers have taken off with all theit supplies, you missed out there!"
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["DrinkLoot" , 	[-10,-3] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		
		["Land_Wreck_Van_F",   [-10,-0.2], 0, 0, "FIRE_SMALL" ]
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        	0]		

	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   ["Loiter",	[0,0],[0,0],[10]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_E"]  ],   ["BoxPatrol",	[0,0],[0,0],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [2,"Rifleman_E"]  ],   ["Explore",	[0,0],[0,0],[100]   ]]

	],
	[	// Vehicles	
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	
			["Timer", 		["TimerNoPlayers", 		1200]],	//20 minutes
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
