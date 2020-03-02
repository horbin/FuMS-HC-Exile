// 	AbandonedVillage.sqf
// 	TheOneWhoKnocks
// 	4/20/19
//
//  5/10/19 - Added custom loot and helo reinforcements
//  Spawn location should be 5911.43,20216.8,0 as this map is specific to Altis
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Abandoned Village" v2.1 static mission for Altis.
	Created by [CiC]red_ned using templates by eraser1 
	Credits to Pradatoru for mapping
	19 years of CiC http://cic-gaming.co.uk
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
//  Be cautious when editing data.

[
	["AbandonedVillage", 200], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Abandoned Village","hd_objective","ELLIPSE","ColorRed","SolidBorder",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[				// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 			// Notify players via global toast message
		true,			// Show encounter area on the map
		900,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
		10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[
			"Abandoned Village",	// The first line is the title of the pop-up box
			"Terrorists are raiding the abandoned village for cake and beer"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Abandoned Village Success",
			"Convicts have successfully killed the Terrorists and stolen all the cake"
		],
	  
		// Mission Failure Message
		[
			"Abandoned Village Failure!",
			"Terrorists got bored and buggered off taking all the goodies..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics																		
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["AltisStaticLoot" , 	[[5923.92,20082,0.152863], [5811.33,20133.5,0.104599], [5868.06,20230.9,0.889114]]],
			["AltisStaticLoot" , 	[[5934.36,20212.2,0.37941], [5999.94,20250.2,9.38257], [5892.74,20174.7,0] ]]		
		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_i_Barracks_V1_F",[5901.69,20084.3,-0.37468],218.352,[[-0.620491,-0.784213,0],[-0.0273687,0.0216548,0.999391]],false],
				["Land_Unfinished_Building_02_F",[5817.45,20114.6,0.541473],49.091,[[0.755751,0.654859,0],[0,0,1]],false],
				["Land_Airport_Tower_dam_F",[6002.87,20248.3,0],147.784,[[0.533112,-0.846044,0],[0,-0,1]],false],
				["Land_i_Barracks_V2_F",[5956.44,20280.6,0.303787],51.1364,[[0.772838,0.622791,0.121869],[-0.0948926,-0.0764692,0.992546]],false],
				["Land_Mil_WiredFence_F",[5842.31,20253.7,-0.00914001],65.9659,[[0.913303,0.407281,0],[0,0,1]],false],
				["Land_Mil_WiredFence_F",[5814.26,20325.5,0.0188141],77.7273,[[0.952103,0.207117,0.224951],[-0.21981,-0.0478167,0.97437]],false],
				["Land_d_Shop_01_V1_F",[5916.75,20308.3,0.470703],355.398,[[-0.0802207,0.996624,0.0174524],[0.00140026,-0.0173961,0.999848]],false],
				["Land_i_House_Big_01_V1_dam_F",[5818.37,20151.3,1.1833],216.307,[[-0.592037,-0.80421,0.052328],[0.0169439,0.0524948,0.998477]],false],
				["Land_i_House_Big_02_V3_dam_F",[5824.51,20160.5,1.81531],307.841,[[-0.789716,0.613473,0],[0.0427937,0.0550878,0.997564]],false],
				["Land_u_House_Big_01_V1_dam_F",[5835.29,20175,0.333939],216.307,[[-0.592242,-0.805004,0.0348942],[0.00660886,0.0384514,0.999239]],false],
				["Land_i_Addon_04_V1_F",[5840.83,20183.6,-0.0823517],217.329,[[-0.60556,-0.794077,0.052336],[0.0317361,0.0416158,0.99863]],false],
				["Land_i_Garage_V1_F",[5982.15,20212.1,0],34.2614,[[0.56297,0.826478,0],[0,0,1]],false],
				["Land_i_House_Big_01_V1_dam_F",[5986.85,20220.7,0],33.2386,[[0.548127,0.836395,0],[0,0,1]],false],
				["Land_i_House_Big_02_V2_dam_F",[5979.52,20203.4,0.147217],303.75,[[-0.831469,0.55557,0],[0,0,1]],false],
				["Land_i_Garage_V1_F",[5974.61,20198.1,0],33.2387,[[0.548128,0.836394,0],[0,0,1]],false],
				["Land_Chapel_V2_F",[5862.33,20235.6,1.19267],240.341,[[-0.869606,-0.49344,0.017386],[-0.0279554,0.0843617,0.996043]],false],
				["Land_i_Addon_03mid_V1_F",[5935.87,20212.8,-0.617477],277.159,[[-0.992204,0.124624,0],[0,0,1]],false],
				["Land_i_Addon_03_V1_F",[5943.12,20212,-0.502045],276.136,[[-0.994271,0.106889,0],[0,0,1]],false],
				["Land_i_Addon_03mid_V1_F",[5929.44,20213.7,-0.629135],277.159,[[-0.992204,0.124624,0],[0,0,1]],false],
				["Land_i_Addon_03_V1_F",[5922.21,20214.5,-0.663101],96.6477,[[0.993277,-0.115764,0],[0,-0,1]],false],
				["Land_MilOffices_V1_F",[5972.88,20173.8,0.0848999],287.898,[[-0.951605,0.307324,0],[0.0321241,0.0994698,0.994522]],false],
				["Land_MilOffices_V1_F",[5962.2,20140.9,0.0549164],287.898,[[-0.951605,0.307324,0],[0.026785,0.0829378,0.996195]],false]
			]
 		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
	
		[["EAST","COMBAT","RED","COLUMN"],  [  [3,"Sniper_E"],[2,"SMG_E"]  ],   	["BoxPatrol",	[5788.61,20139.4],[5788.61,20139.4],[75]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [5,"Hunter_E"]  ],   				["BoxPatrol",	[6001.65,20233.9,0],[6001.65,20233.9,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Sniper_E"]  ],   				["TowerGuard",	[0,0],[0,0],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Sentry",		[2,2],[0,0],[150]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"LMG_E"]  ],   					["Sentry",		[-3,-1],[0,0],[150]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [6,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[150]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[4,"Rifleman_E"]  ],  ["Buildings",	[0,0],[0,0],[100]   ]]

	],
	[			// Vehicles
		[  		// Convoy #1                     
			[   // Vehicle                     Offset     				Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"        ,[5832.84,20163.5,0.806427],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[5849.92,20310.2,0.216583],		[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[5875.51,20097.5,0],				[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[5938.46,20107,0.244873],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[6006.6,20241.9,12.8492],			[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list ND Hv less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [5, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
			[["WIN"],["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],["TIMER"     ]],
			[["CHILD",	["Help_Helo",[0,0],5,120]],["LUCNT"     ]],  
			[["END"],["AllDead","OR","TIMER"    ]]  
		]

  
	]


];
