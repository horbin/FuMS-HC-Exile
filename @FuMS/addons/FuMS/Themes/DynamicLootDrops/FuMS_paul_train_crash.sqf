// 	FuMS_paul_train_crash.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynmic mission to spawn a cargo pod with IKEA loot drop with guards
// 	This mission was ported from GolovaRaoul's collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	IKEA train wreck with new difficulty selection system
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
	["IKEACrash", 200], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["IKEA Transport Pod","hd_objective","ELLIPSE","ColorOrange","Solid",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[					// NOTIFICATION Messages and Map display Control.
			true, "ALL",700, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 			// Notify players via global toast message
			true,			// Show encounter area on the map
			900,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"IKEA Supplies",	// The first line is the title of the pop-up box
			"An IKEA transport pod has been dropped. Rumors are being spread that they have a lot of building materials..."		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"IKEA loot taken",
			"The Prisoners have been eliminated and the Building Supplies are stolen!"
		],
	  
		// Mission Failure Message
		[
			"IKEA Transport pod looted",
			"The Transport pod has been looted and the Building Supplies are gone...."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["IKEALoot" , 	[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		[CAMS_Land_Van_C,						[1,1],	0,	[.5,   1,     .5,         .5,         .5]],
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        	0]
		["Land_loco_742_blue",				[2.74121,25.9517],		(round random 360),		0],
		["Land_wagon_box",					[3.13965,13.5854],		(round random 360),		0],
		["Land_wagon_box",					[3.13037,1.84424],		(round random 360),		0],
		["Land_wagon_tanker",				[2.7085,-9.4292],		(round random 360),		0],
		["Land_wagon_box",					[3.08813,-20.7246],		(round random 360),		0],
		["Land_wagon_flat",					[2.67603,-34.9854],		(round random 360),		0],
		["CUP_sign_krizeni_s_trati",		[5.77979,33.4868],		(round random 360),		0],
		["Land_BluntStone_02",				[2.39795,33.3604],		(round random 360),		0],
		["Land_Wreck_Heli_Attack_01_F",		[-40.0642,-2.28564],	(round random 360),		0],
		["Land_HistoricalPlaneWreck_01_F",	[43.7849,17.5664],		(round random 360),		0],
		//["cwa_CampEast",					[15.2898,1.7915],		180.16,		0], //CUP Terrains CWA - uncomment if you have this installed
		//["cwa_CampEast",					[15.2097,11.6899],		180.16,		0], //CUP Terrains CWA - uncomment if you have this installed
		//["cwa_CampEast",					[15.3953,21.4136],		180.16,		0], //CUP Terrains CWA - uncomment if you have this installed
		["Camp_EP1",						[-15.7988,-21.605],		(round random 360),		0],
		["Camp_EP1",						[-16.0012,-14.7319],	(round random 360),		0],
		["Camp_EP1",						[-16.2834,-8.10059],	(round random 360),		0],
		["Land_Crates_EP1",					[-18.1858,-9.90771],	(round random 360),		0],
		["Land_transport_crates_EP1",		[-16.3994,-7.89551],	(round random 360),		0],
		["CUP_hromada_beden_dekorativniX",	[-17.6592,-15.7769],	(round random 360),		0],
		["AmmoCrates_NoInteractive_Large",	[-17.6487,-14.1675],	(round random 360),		0],
		["Land_Crates_stack_EP1",			[-17.8672,-21.0947],	(round random 360),		0],
		["AmmoCrates_NoInteractive_Large",	[-17.8623,-23.3926],	(round random 360),		0],
		["Land_WoodenCrate_01_stack_x3_F",	[-15.1353,-22.9233],	(round random 360),		0],
		["Land_PortableGenerator_01_F",		[12.5583,3.97217],		(round random 360),		0],
		["Land_PaperBox_closed_F",			[11.9631,-0.224121],	(round random 360),		0],
		["Land_PaperBox_open_empty_F",		[14.0903,-0.220215],	(round random 360),		0],
		["Land_Device_disassembled_F",		[15.7361,12.6533],		90.472,					0],
		["Land_ScrapHeap_2_F",				[7.32495,-7.34082],		201.825,				0],
		["Land_Ind_BoardsPack2",			[13.4478,22.6548],		106.041,				0],
		["Computer",						[11.613,19.2949],		(round random 360),		0],
		["Land_CampingTable_F",				[11.5535,19.5879],		95.2015,				0]
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","VEE"],   	[  [3,"Rifleman_E"]	],   	["Loiter",		[0,0],[((random 20)-10),((random 20)-10)],[10]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_E"]	],   	["BoxPatrol",	[((random 20)-10),((random 20)-10)],[((random 20)-10),((random 20)-10)],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [2,"Hunter_E"]	],   	["Explore",		[((random 20)-10),((random 20)-10)],[((random 20)-10),((random 20)-10)],[100]   ]]

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
			["Timer", 		["TimerNoPlayers", 		1200]],	//20 minutes
			["LUCNT",		["LowUnitCount","EAST",1,0,[0,0]]  ]			
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["LUCNT"     			]],
			[["LOSE"],	["Timer"					]],
			[["END"],	["LUCNT","OR","Timer"	]]  
		]

  
	]


];
