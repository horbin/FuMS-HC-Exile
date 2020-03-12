// 	FuMS_paul_littlebird_mission.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynamic mission to spawn a little bird with guards
// 	This mission was ported from GolovaRaoul's collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	Littlebird Mission with new difficulty selection system
	Easy difficulty vehicle is not persistent
	based on work by Defent and eraser1
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//  
//  Be cautious when editing data.

[
	["LittlebirdSteal", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Littlebird Steal","hd_objective","ELLIPSE","ColorKhaki","DiagGrid",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Littlebird Steal",	// The first line is the title of the pop-up box
			"A Littlebird Crash Landed at a Small Military Base. Kill the Military while they're reparing the heli, and steal it!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Littlebird captured",
			"Convicts killed everyone and made off with the heli."
		],
	  
		// Mission Failure Message
		[
			"Littlebird repaired",
			"The Military flew off with the Littlebird and escaped attack."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["LOOTBOX" , 	[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		[ImFX_Exile_Heli_Hummingbirds, 	[-10,-10],	0,	[.5,   1,     .6,         .5,         .75]],
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        	0]
		
		["76n6ClamShell_EP1",			[-6.98804,-15.313],		0,			0],
		["Land_ScrapHeap_2_F",			[12.4622,5.20117],		0,			0],
		["Land_Lampa_sidl_2",			[11.0742,3.27734],		0,			0],
		["CampEast_EP1",				[-3.75806,0.942627],	0,			0],
		["MetalBarrel_burning_F",		[-2.52075,-2.05981],	0,			0],
		["Land_MetalCase_01_large_F",	[-6.05566,-1.16357],	0,			0],
		["Land_WaterTank_F",			[-5.29736,3.33496],		88.8556,	0]
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["Loiter",		[-13,-13],[0,0],[10]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_E"]  ],   				["BoxPatrol",	[-13,-13],[0,0],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [2,"LMG_E"]  ],   						["Explore",		[-13,-13],[0,0],[100]   ]]

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
