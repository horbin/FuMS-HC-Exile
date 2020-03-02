// 	Storage.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 18294.3,15534.6 as this map is specific to Altis
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Storage Invasion" v2.1 static mission for Altis.
	Exile_Car_Ural_Open_Military increases persistent chance with difficulty
	Created by [CiC]red_ned using templates by eraser1 
	Credits to Pradatoru for mapping
	19 years of CiC
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Storage", 250], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Storage Invasion","hd_objective","ELLIPSE","ColorRed","SolidBorder",250],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Storage Invasion",	// The first line is the title of the pop-up box
			"Terrorists are raiding a storage facility"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Storage area cleared!",
			"Convicts have successfully killed the Terrorists and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Storage area looted!",
			"Terrorists have got away with all the loot..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["AltisStaticLoot" , 	[[18342.7,15569.2,0],[18360.9,15528.6,0],[18416.3,15548.5,0]]],
			["AltisStaticLoot" , 	[[18218.5,15566.5,0],[18246.7,15522.4,0] ]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Wall_IndCnc_4_F",[18276.1,15467.2,0.213551],15.7187,[[0.270914,0.962603,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18281.8,15466.2,0],3.22435,[[0.0562461,0.998417,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18230.5,15478.8,0],194.268,[[-0.246458,-0.969153,0],[-0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18219.7,15492.2,0],58.0385,[[0.848404,0.529349,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18182.6,15499.1,-0.0407372],351.536,[[-0.147188,0.989109,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18152.6,15486.3,0],50.3807,[[0.770299,0.637683,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18142.1,15514.1,0],72.5482,[[0.95397,0.299903,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18144.2,15517.9,0],160.412,[[0.335254,-0.942128,0],[0,-0,1]],false],
				["Land_Wall_IndCnc_4_F",[18149.9,15519.9,0],160.412,[[0.335254,-0.942128,0],[0,-0,1]],false],
				["Land_Wall_IndCnc_4_F",[18152.7,15520.9,0],160.412,[[0.335254,-0.942128,0],[0,-0,1]],false],
				["Land_Wall_IndCnc_4_F",[18155.2,15524.9,0],86.6547,[[0.998296,0.0583534,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18163.7,15545.3,0],20.1523,[[0.344517,0.93878,0],[0,0,1]],false],
				["Land_BarGate_F",[18157.8,15546.7,0],358.388,[[-0.0281305,0.999604,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18179.7,15567.5,0],355.163,[[-0.0843212,0.996439,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18233.2,15571.8,0],175.728,[[0.0744913,-0.997222,0],[0,-0,1]],false],
				["Land_Wall_IndCnc_4_F",[18262.5,15575.3,0],155.172,[[0.419896,-0.907572,0],[0,-0,1]],false],
				["Land_Wall_IndCnc_4_F",[18367.8,15591.1,0],182.579,[[-0.0449971,-0.998987,0],[-0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18373.5,15590.9,0],2.33762,[[0.0407878,0.999168,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18364.8,15591.1,0],181.773,[[-0.0309397,-0.999521,0],[-0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18449.8,15589.3,-0.0344887],183.789,[[-0.0660825,-0.997814,0],[-0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18450.6,15562.4,0],94.7156,[[0.996615,-0.0822101,0],[0,-0,1]],false],
				["Land_Wall_IndCnc_4_F",[18399.4,15477.8,0],116.077,[[0.898204,-0.439579,0],[0,-0,1]],false],
				["Land_BagBunker_Tower_F",[18413.7,15537.3,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[18424.9,15537.5,0],316.874,[[-0.683605,0.729852,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[18401.2,15497.7,0],270.121,[[-0.999998,0.00211192,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[18164.9,15540.5,0],177.824,[[0.0379692,-0.999279,0],[0,-0,1]],false],
				["Land_Wall_IndCnc_4_F",[18154.9,15530.9,0],86.6547,[[0.998296,0.0583534,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18154.5,15537,0],86.6547,[[0.998296,0.0583534,0],[0,0,1]],false],
				["Land_Wall_IndCnc_4_F",[18154.2,15543,0],86.6547,[[0.998296,0.0583534,0],[0,0,1]],false],
				["Land_BagBunker_Small_F",[18163.3,15549.4,0],178.63,[[0.0239084,-0.999714,0],[0,-0,1]],false],
				["Land_BagBunker_Small_F",[18152.6,15549.3,0],178.63,[[0.0239084,-0.999714,0],[0,-0,1]],false],
				["Land_Wreck_HMMWV_F",[18149.9,15509.4,0],75.3695,[[0.967575,0.252584,0],[0,0,1]],false],
				["Land_Wreck_Skodovka_F",[18153.2,15503.8,0],71.742,[[0.949655,0.313296,0],[0,0,1]],false],
				["Land_Wreck_Skodovka_F",[18154.5,15499.8,0],71.742,[[0.949655,0.313296,0],[0,0,1]],false],
				["Land_Wreck_Truck_F",[18155.3,15493.6,0],72.1451,[[0.951836,0.306607,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[18168.6,15497.1,0],324.129,[[-0.585962,0.810338,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[18167.2,15499.1,0],324.129,[[-0.585962,0.810338,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[18207.6,15561.6,3.8147e-006],354.357,[[-0.0983295,0.995154,0],[0,0,1]],false],
				["Land_dp_smallTank_F",[18232.3,15485.3,0],0,[[0,1,0],[0,0,1]],false],
				["Land_dp_smallTank_F",[18241.5,15483,0],0,[[0,1,0],[0,0,1]],false],
				["Land_dp_transformer_F",[18226.4,15492.1,0],327.756,[[-0.533526,0.845784,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[18292.1,15583.8,0],153.56,[[0.44526,-0.895401,0],[0,-0,1]],false],
				["Land_Cargo_Patrol_V1_F",[18309,15587.3,0],176.131,[[0.0674754,-0.997721,0],[0,-0,1]],false],
				["Land_Cargo_Tower_V1_No1_F",[18444,15583.6,0],2.01522,[[0.0351651,0.999382,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No2_F",[18274.3,15476.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No3_F",[18177.4,15558.7,0],181.37,[[-0.0239088,-0.999714,0],[-0,0,1]],false],
				["Land_Cargo40_cyan_F",[18347.3,15514.4,0.0882835],28.5268,[[0.47757,0.878594,0],[0,0,1]],false],
				["Land_Cargo20_orange_F",[18350.7,15549.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_orange_F",[18345.7,15551.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_red_F",[18366.9,15530.3,0],88.2669,[[0.999543,0.0302435,0],[0,0,1]],false],
				["Land_Cargo20_red_F",[18367.9,15549.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_light_green_F",[18362.8,15552,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[18375,15523.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo10_cyan_F",[18380.1,15521,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[18390.8,15529.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_blue_F",[18381.6,15532.4,0],20.5553,[[0.351111,0.936334,0],[0,0,1]],false],
				["Land_Cargo20_grey_F",[18382.9,15545.7,0],331.747,[[-0.473366,0.880866,0],[0,0,1]],false],
				["Land_Cargo20_grey_F",[18350.1,15539.3,0.148941],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_light_green_F",[18345.9,15534.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_light_green_F",[18350.2,15525.5,0],37.4832,[[0.608529,0.793532,0],[0,0,1]],false],
				["Land_Cargo20_light_green_F",[18364.6,15530.1,2.6369],88.2669,[[0.999543,0.0302435,0],[0,0,1]],false],
				["Land_Cargo20_light_blue_F",[18348.1,15530.6,2.62628],87.8639,[[0.999305,0.0372734,0],[0,0,1]],false],
				["Land_Cargo20_light_green_F",[18386.3,15530.4,2.64364],19.3462,[[0.331275,0.943534,0],[0,0,1]],false],
				["Land_Cargo40_white_F",[18397.5,15531,0],89.073,[[0.999869,0.0161785,0],[0,0,1]],false],
				["Land_Cargo20_cyan_F",[18399.4,15523.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_cyan_F",[18403.8,15539.4,0],310.179,[[-0.764033,0.645178,0],[0,0,1]],false],
				["Land_Cargo40_cyan_F",[18402.6,15554,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo10_grey_F",[18396.9,15551.3,0],270.804,[[-0.999902,0.0140319,0],[0,0,1]],false],
				["Land_Cargo40_white_F",[18428.7,15549.9,0],90.4018,[[0.999975,-0.00701259,0],[0,-0,1]],false],
				["Land_Cargo20_blue_F",[18360.6,15514.4,0],90,[[1,-4.37114e-008,0],[0,-0,1]],false],
				["Land_Cargo20_cyan_F",[18356.3,15512.6,0],0,[[0,1,0],[0,0,1]],false]
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["Loiter",		[18297.931641,15587.395508,0.00136185],[18297.931641,15587.395508,0.00136185],[50]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18440.494141,15581.865234,17.889561],[18440.494141,15581.865234,17.889561],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18271.00390625,15474.366211,18.0308838],[18271.00390625,15474.366211,18.0308838],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18180.560547,15560.74707,17.798668],[18180.560547,15560.74707,17.798668],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18164.910156,15541.244141,4.348576],[18164.910156,15541.244141,4.348576],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18291.595703,15584.178711,4.353832],[18291.595703,15584.178711,4.353832],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18307.537109,15588.579102,4.360596],[18307.537109,15588.579102,4.360596],[150, "ANY"]   ]],
		[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18426.212891,15537.683594,4.300941],[18426.212891,15537.683594,4.300941],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[-5,0],					[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[0,-5],					[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[18425,15547.9,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[18294.6,15545.7,0],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[18364.2,15531.2,0],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"       	,[18278.2,15511.9,0],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[18343.9,15549.6,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[18344.5,15526,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[18208.6,15557.2,0],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[18358.5,15496.3,0],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[18209.4,15513.7,0],		[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [11, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
