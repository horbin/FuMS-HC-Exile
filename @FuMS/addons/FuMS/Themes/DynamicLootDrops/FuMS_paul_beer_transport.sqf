// 	FuMS_paul_beer_transport.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Dynmic mission to spawn a beer shipment with guards
// 	This mission was ported from GolovaRaoul's collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS (Variable difficulty not supported in FuMS......yet
/*
	Beer Transport Mission with new difficulty selection system
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
	["BeerTruck", 100], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Beer and Guns","hd_objective","ELLIPSE","ColorOrange","Solid",100],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[						// NOTIFICATION Messages and Map display Control.
			true, "ALL",500, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
			true, 				// Notify players via global toast message
			true,				// Show encounter area on the map
			900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
								//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Beer and Guns Truck",	// The first line is the title of the pop-up box
			"A Beer Delivery Truck has been stopped and the Prisoners are trying to protect the crash site. Kill the Prisoners and get the Beer and their loot!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Beer and Guns taken",
			"The Prisoners are Killed and the Beer has been Stolen!"
		],
	  
		// Mission Failure Message
		[
			"Beer Transport repaired",
			"The Beer has been Drunken and the Guns are destroyed..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["BeerLoot" , 	[5,5] ], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// paste your array of building objects here
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   

		//["CUP_B_HMMWV_DSHKM_GPK_ACR",	[-30,-30],	0,	[.5,   1,     .5,         .5,         .5]],
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		// [classname        			[X offset,y offset],	rotation,	persist until restart (0:Flase, 1:True) ]
		// ["CamoNet_INDP_big_F",        [-20, 10],				0,        	0]		
		["Land_LampStreet_F",		[3.90027,8.875]		,(round random 360),			0],
		["Land_Wreck_Car2_F",		[3.63806,7.73828]	,(round random 360),			0],
		["Land_CampingTable_F",		[-4.58936,-1.69434]	,(round random 360),			0],
		["Land_CampingChair_V2_F",	[-4.10376,-2.92188]	,0,								0],
		["Land_CampingChair_V2_F",	[-5.26514,-0.529297],164.204,						0],
		["Land_CampingChair_V2_F",	[-3.94312,-0.419434],175.073,						0],
		["Land_CampingChair_V2_F",	[-5.37817,-2.99561]	,14.3409,						0],
		["Land_Camping_Light_off_F",[-4.43689,-1.72559]	,(round random 360),			0],
		["Campfire_burning_F",		[4.21326,-5.03174]	,(round random 360),			0],
		["Land_WoodPile_F",			[5.35144,-8.99365]	,235.813,						0],
		["Land_WoodPile_large_F",	[8.15515,-9.37549]	,(round random 360),			0],
		["Land_WoodenLog_F",		[5.76978,-6.22021]	,(round random 360),			0],
		["Land_Axe_F",				[5.3302,-7.14648]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[-5.14563,-1.68]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[-3.79651,-1.79443]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[-3.99939,-1.89648]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[-4.84216,-1.60352]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[-4.66138,-1.91211]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[-4.0719,-1.62988]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[4.26416,10.2529]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[4.34668,10.4028]	,(round random 360),			0],
		["Exile_Cosmetic_Beer",		[4.51453,10.1758]	,(round random 360),			0],
		["Body",					[5.08875,8.27051]	,(round random 360),			0]
		
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","YELLOW","VEE"],   [  [3,"Rifleman_E"]  ],   	["Loiter",		[0,0],[((random 20)-10),((random 20)-10)],[10]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_E"]  ],   	["BoxPatrol",	[((random 20)-10),((random 20)-10)],[((random 20)-10),((random 20)-10)],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [2,"Rifleman_E"]  ],   	["Explore",		[((random 20)-10),((random 20)-10)],[((random 20)-10),((random 20)-10)],[100]   ]]

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
