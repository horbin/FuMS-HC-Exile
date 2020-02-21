//BanditCamp.sqf
// Horbin
// 12/31/14
// Based upon drsubo Mission Scripts

[
	["NukeCamp", 200, "LAND",[0,0,0],"MissionFXStart","MissionFXEnd"], // Mission Title NOSPACES!, and encounter radius
	["Nuke Camp","mil_objective", "ELLIPSE","ColorGreen","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[// NOTIFICATION Messages and Map display Control.
		true, 1,0,
		true, // Notify players via global message
		true,// Show encounter area on the map
		300,    // Win delay: Time in seconds after a WIN before mission cleanup is performed
		30       // Lose delay: Time in seconds after a lose before mission cleanup is performed
			  //NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
		[   "Bandit Base Camp",
			 "A bandit camp has been located!"
		],
		
		// Mission Success Message
		[   "Mission Success",
			 "The Bandits have been terminated."
		],
	  
		// Mission Failure Message
		[  "Mission Failure!",
			"The Bandits have escaped!"
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["PoptabLoot" , 	[[5,5], [-5,-5], [5,0]]],
			[FuMS_Mil_Prowler , 	[[10,10], [-10,-10], [10,0] ]]		
		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		[ FuMS_Civ_All,					[-10,10],	0,		[.5,   1,     .5,         .5,         .5]],
		
		//These lines will spawn in a minefield of the sam type of mine aronud these ones.
		["ATMine",						[-25,-25],	0,		0],  //type, offset, rotation, presist flag
		["APERSMine",					[25,25],	0,		0],  //type, offset, rotation, presist flag
		["Sign_Arrow_Blue_F",			[-25,-25],	0,		0],  //type, offset, rotation, presist flag
		["Sign_Arrow_Blue_F",			[25,25],	0,		0],  //type, offset, rotation, presist flag 

		
		// This line will spawn a flamer anomoly in the mission
		//["FirePlace_burning_F",				[25,-25],	0,		0],  //type, offset, rotation, presist flag
		
		// This line will spawn a single pool at this location in the mission
		//["Skeet_Clay_F",				[25,-25],	0,		0],  //type, offset, rotation, presist flag

		// This line will spawn e toxic pool with (first item) or without (second item) an anomoly in the mission
		//["Land_GarbageBarrel_01_F",		[-25,25],	0,		0],  //type, offset, rotation, presist flag
		//["Land_GarbageBarrel_01_english_F",		[-25,25],	0,		0],  //type, offset, rotation, presist flag

		// This line will spawn a screamer anomoly in the mission
		//["Land_AncientStatue_01_F",		[-25,25],	90,		0],  //type, offset, rotation, presist flag

		// This line will spawn a strigoi anomoly in the mission
		//["Land_Grave_rocks_f",		[-25,25],	90,		0],  //type, offset, rotation, presist flag

		// This line will spawn a sparky anomoly in the mission
		//["Land_RoadCrack_01_4x4_F",		[-25,25],	90,		0],  //type, offset, rotation, presist flag
		
		// This line will spawn a group of kamikaze crazies in the mission
		//["Land_Sign_WarningUnexplodedAmmo_F",		[-25,25],	90,		0],  //type, offset, rotation, presist flag
		
		// This line will spawn an irradiated object
		["Land_Device_disassembled_F",		[25,25],	90,		0],  //type, offset, rotation, presist flag
				
		// This line will irradiate all objects (with a nuke)
		["Land_Device_assembled_F",		[-25,25],	90,		0],  //type, offset, rotation, presist flag

		
		["Land_BagBunker_Tower_F",		[0,0],		0,		0]   //type, offset, rotation, presist flag
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","LINE"],   [  [4,"Rifleman"]           ],   ["BoxPatrol",[-6,-6],[0,0],[10]     ]]
	],

	// Vehicles
	[
					 
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			["LUCNT",		["LowUnitCount","EAST",3,250,[0,0]]  ],		// Triggers call for reinforcements
			["LUCNT2",		["LowUnitCount","EAST",2,250,[0,0]]  ],		// Triggers call for reinforcements
			["LUCNT3",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Triggers call for reinforcements

			//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			["AllDead",		["LowUnitCount","EAST",0,250,[0,0]]  ]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["CHILD",	["Help_Ground",[0,0],1,120]],["LUCNT"     ]],  
			[["CHILD",	["Help_Vehicle",[0,0],2,120]],["LUCNT2"     ]],  
			[["CHILD",	["Help_Helo",[0,0],1,120]],["LUCNT3"     ]],  

			[["WIN"],	["AllDead"     ]],  // 
			[["END"],	["AllDead"     ]]  
		]      
	]

];
