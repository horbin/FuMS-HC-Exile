//VanCrash.sqf
// TheOneWhoKnocks
// 1/15/2020
// Based on Horbin Mission Scripts

[
	["VanCrash", 100,"LAND"], // Mission Title NOSPACES!, and encounter radius
	["Van Crash","plp_mark_civ_roadworks","ELLIPSE","ColorGreen","FDiagonal",200],    
	   
	[  
		[// NOTIFICATION Messages and Map display Control.
		true, "ALL",1000, 	// Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 				// Notify players via global message
		true,				// Show encounter area on the map
		900,    			// Win delay: Time in seconds after a WIN before mission cleanup is performed
		90       			// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		// Spawn Mission Message
	[
		"Supply Van Crash!",
		"A supply van has crashed and is being ransacked by enemy soldiers.  Get there, stop them, and steal the loot for yourself!"
	],
		
		// Mission Success Message
	[
		"Supply Van crash captured",
		"The bandits have been destroyed."
	],
	  
		// Mission Failure Message
	[
		"Supply Van crash looted!",
		"The bandits have escaped."
	] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , 			[18,-9] ], 	// [static loot, offset location] - spawns with the mission
		["WreckageLoot",	[-5,0] ], 	// Win loot, offset location - spawns after mission success
		["None" , 			[0,0] ]  	// Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		[CAMS_Wreck_Mil,	[6,6],		0,	0,	"SMOKE_MEDIUM"],   //type, offset, rotation, presist flag
		[CAMS_Wreck_Mil,	[-6,-6],	0,	0,	"SMOKE_MEDIUM"]  
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
	//   [["RESISTANCE","COMBAT","RED","COLUMN"],   [  [1,"Sniper"],[2,"Rifleman"],[2,"Hunter"]  ],   ["BoxPatrol",[0,75],[0,0],[0]   ]],
		[["EAST","STEALTH","RED","LINE"],   [  [1,"Sniper"]           ],     ["LOITER",[6,-6],[0,0],[10]     ]],
		[["EAST","CARELESS","RED","LINE"], 	[  [2,"Rifleman"],[2,"LMG"] ],   ["EXPLORE",[7,7],[0,0],[50]     ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman"]           ],   ["BOXPATROL",[-5,-5],[0,0],[70]     ]]
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
			["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds and no players are withen 300 m
			//["TimerEvac", 	["Timer", 1400] ], // 1400		  
			["PLAYERNEAR",	["ProxPlayer",[0,0], 100, 1]],// Player must be near event center to count as win
			["LUCNT",		["LowUnitCount","EAST",4,500,[0,0]]  ],		// Triggers call for reinforcements
			["AllDead",		["LowUnitCount","EAST",1,500,[0,0]]  ]		// Always leaves one behind as a special surprise for players.
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			//[["WIN"],["BodyCount"     ]],  // 
			[["WIN"],	["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],	["Timer"     ]],
			//[["CHILD",	["EvacTownAir",[0,0],1,30]],["TimerEvac"      ]],  // 
			[["CHILD",	["Help_Helo",[0,0],1,300]],["LUCNT"     ]],  
			[["END"],	["AllDead","OR","TIMER"    ]]  
		]       
	]
];
