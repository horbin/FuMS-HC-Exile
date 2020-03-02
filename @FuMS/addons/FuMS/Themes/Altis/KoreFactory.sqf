// 	KoreFactory.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 6175.67,16243.9 as this map is specific to Altis
// 	This mission was ported from =CF=Dragunov's set of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Kore Factory" v2.1 static mission for Altis.
	Created by [CiC]red_ned using templates by eraser1
	Hardcore mode has Exile_Car_Ural_Covered_Military with 50% its persistent
	Credits to Pradatoru for mapping
	19 years of CiC
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["KoreFactory", 275], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Kore Factory Attack","hd_objective","ELLIPSE","ColorRed","SolidBorder",275],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[				// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 			// Notify players via global toast message
		true,			// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[		
			"Kore Factory",	// The first line is the title of the pop-up box
			"Terrorists are raiding a factory"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Kore Factory cleared!",
			"Convicts have successfully killed everyone and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Kore Factory looted!",
			"Terrorists got bored and buggered off taking all the goodies..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["AltisStaticLoot" , 	[[6158.78,16211.3,0.281509],[6145.2,16262.8,0],[6055.41,16237.9,0]]],
			["AltisStaticLoot" , 	[[6297.12,16218.4,0],[6112.29,16229.5,0] ]]
		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Device_assembled_F",[6143.13,16203.9,0],354.375,[0,0,1],true],
				["Land_Scrap_MRAP_01_F",[6163.02,16222.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Device_assembled_F",[6147.76,16204.4,0],354.375,[0,0,1],true],
				["Land_LampHalogen_F",[6197.29,16251.9,0],0,[0,0,1],true],
				["Land_LampHalogen_F",[5996.13,16223.5,0],0,[0,0,1],true],
				["Land_LampHalogen_F",[6097.93,16210.9,0],0,[0,0,1],true],
				["Land_LampHalogen_F",[6324.82,16225.6,0],0,[0,0,1],true],
				["Land_LampHalogen_F",[6166.1,16292.1,0],0,[0,0,1],true],
				["Land_LampHalogen_F",[6156.53,16215,0],0,[0,0,1],true],
				["Land_Wall_IndCnc_4_F",[6165.63,16307.5,0],176.42,[0,0,1],true],
				["Land_Wall_IndCnc_4_F",[6176.98,16307.5,0.0547981],358.965,[0,0,1],true],
				["Land_Cargo_HQ_V1_F",[6128.85,16266.7,0.666256],268.466,[[-0.999642,-0.0267698,0],[-0,0,1]],false],
				["Land_Cargo_Tower_V1_No1_F",[6063.8,16196,-0.241161],0,[[0,1,0],[0,0,1]],false],
				["Land_Wall_Tin_4",[6398.18,16230.7,0],264.886,[[-0.996019,-0.0891378,0],[-0,0,1]],false],
				["Land_Wall_Tin_4",[6398.58,16226.9,0],262.33,[[-0.991053,-0.133467,0],[-0,0,1]],false],
				["Land_Wall_Tin_4",[6368.68,16301.8,-0.0932045],193.295,[[-0.229965,-0.973199,0],[-0,0,1]],false],
				["Land_Wall_Tin_4",[6372.48,16300.9,-0.0444946],193.295,[[-0.229965,-0.973199,0],[-0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[6261.83,16309.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[6064.37,16282,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[6087.77,16187.2,0],354.886,[[-0.0891376,0.996019,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[6229.7,16192.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[6367.97,16202.6,0],349.261,[[-0.186335,0.982486,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No2_F",[6195.81,16205.1,-0.360775],1.02272,[[0.0178486,0.999841,0],[0,0,1]],false],
				["Land_BarGate_F",[6179.53,16192.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_BarGate_F",[6171.15,16307.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V2_F",[6179.61,16299.9,-0.147266],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No3_F",[6278.54,16299.6,-0.321877],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_HQ_V1_F",[6243.93,16214.2,0],92.0455,[[0.999363,-0.0356934,0],[0,-0,1]],false],
				["Land_BagBunker_Large_F",[6244.02,16273.2,-0.188171],0,[[0,1,0],[0,0,1]],false]
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","COLUMN"],  				[  [2,"Rifleman_E"]  ],		["Loiter",		[6179.83,16197.4,0],[6179.83,16197.4,0],[10]]],
		[["EAST","AWARE","RED","COLUMN"],  				[  [2,"Rifleman_E"]  ],   	["Loiter",		[6049.91,16206.1,0],[6049.91,16206.1,0],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  				[  [2,"Rifleman_E"]  ],   	["Loiter",		[6170.4,16304.8,0],[6170.4,16304.8,0],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  				[  [2,"Rifleman_E"]  ],   	["Loiter",		[6308.93,16200.3,0],[6308.93,16200.3,0],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  				[  [1,"Sniper_E"]  ],   	["Loiter",		[6061.08,16192.4,17.6498],[6061.08,16192.4,17.6498],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  				[  [1,"Sniper_E"]  ],   	["Loiter",		[6192.9,16201.3,17.5302],[6192.9,16201.3,17.5302],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  				[  [1,"Sniper_E"]  ],   	["Loiter",		[6275.65,16303.9,17.569],[6275.65,16303.9,17.569],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  				[  [1,"Sniper_E"]  ],   	["TowerGuard",	[6178.35,16299.4,4.19821],[6178.35,16299.4,4.19821],[10,"ANY"]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   		[  [3,"Hunter_E"]  ],   	["Sentry",		[6356.6,16228.2,0],[6356.6,16228.2,0],	[75]   ]],		
		[["EAST","AWARE","RED","COLUMN"],  				[  [2,"LMG_E"]  ],   		["Loiter",		[6245.25,16271.9,0],[6245.25,16271.9,0],[10]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   		[  [3,"Rifleman_E"]  ],   	["BoxPatrol",	[0,0],[0,0],	[50]   ]],	
		[["EAST","COMBAT","RED","STAG COLUMN"],   		[  [3,"LMG_E"]  ],   		["Buildings",	[0,0],[0,0],		[75]   ]],	
		[["EAST","COMBAT","RED","STAG COLUMN"],   		[  [3,"Rifleman_E"]  ],   	["BoxPatrol",	[0,0],[0,0],	[100]   ]],		
		[["EAST","COMBAT","RED","COLUMN"],  			[  [4,"Hunter_E"]  ],   	["Explore",		[0,0],[0,0],[150]   ]],
		[["EAST","COMBAT","RED","VEE"],   				[  [4,"Rifleman_E"]  ],   	["BoxPatrol",	[0,0],[0,0],[175]   ]],
		[["EAST","COMBAT","YELLOW","COLUMN"],  			[  [4,"SMG_E"]  ],   		["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],					[310],     	"None" ],	// 3 meters West of center pos
				[  "O_HMG_01_high_F"        ,[((round random 100)-50),((round random 100)-50)],					[270],      "None" ], 	// projected front
				[  "O_HMG_01_high_F"        ,[6272.85,16301.2,15.8243],	[270],      "None" ], 	// projected front
				[  "O_HMG_01_high_F"        ,[6129.94,16272.1,1.3512],	[0],        "None" ], 	// projected back
				[  "O_HMG_01_high_F"   		,[6242.14,16211.7,0.632],	[90],     	"None" ]	// reception desk - indoor
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [5, "Rifleman_E"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
			["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds and no players are withen 300 m
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],				// Player must be near event center to count as win
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Always leaves one behind as a special surprise for players.
			["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ]		// Triggers call for reinforcements

		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],		["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],		["TIMER"     ]],
			[["CHILD",		["Help_Helo",[0,0],5,120]],["LUCNT"     ]],  
			[["END"],		["AllDead","OR","TIMER"    ]]  
		]

  
	]


];
