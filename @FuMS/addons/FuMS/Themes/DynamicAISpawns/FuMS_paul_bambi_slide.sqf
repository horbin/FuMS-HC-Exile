// 	FuMS_paul_bambi_slide.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynmic mission to spawn a bambi playground with guards
// 	This mission was ported from GolovaRaoul's collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	Bambi Slide Mission with new difficulty selection system
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
	["BambiSlide", 200], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Bambis Playing","hd_objective","ELLIPSE","ColorBlue","Cross",100],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Silly Bambis",	// The first line is the title of the pop-up box
			"Bambis are playing on a slide. Stop them!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Bambis Annihilated",
			"The Bambis are stopped by a true hero!"
		],
	  
		// Mission Failure Message
		[
			"Bambis escaped",
			"The Bambis stopped playing on the slide and moved on with their lives!"
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["BambiLoot" , 	[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		[ImFX_Exile_Land_Hatchbacks_ALL,	[((round random 40)-20),((round random 40)-20)],	(round random 360),	[.5,   1,     .5,         .5,         .5]],
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        	0]
		["Land_Slide_F",			[-3,-2],				(round random 360),	0],
		["Land_Slide_F",			[3,2],					(round random 360),	0],
		["Land_Slide_F",			[4,6],					(round random 360),	0]		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["CIV","SAFE","GREEN","WEDGE"],   	[  [4,"Bambi"]  ],   		["Buildings",	[0,0],[0,0],[25]   ]],
		[["EAST","AWARE","RED","VEE"],   	[  [2,"CivNonCombat"]  ],   ["Explore",		[0,0],[0,0],[50]   ]],
		[["EAST","AWARE","RED","COLUMN"],  	[  [2,"CivCombat"]  ],   	["Explore",		[0,0],[0,0],[75]   ]]

	],
	[			// Vehicles	
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	
			["Timer", 		["TimerNoPlayers", 		2400]],	//40 minutes	
			["LUCNT",		["LowUnitCount","CIV",0,200,[0,0]]  ]			
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
