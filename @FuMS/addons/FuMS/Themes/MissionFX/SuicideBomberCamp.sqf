// SuicideBomberCamp.sqf
// TheOneWhoKnocks
// 5/12/19
// Based upon drsubo Mission Scripts
// Sets up a suicide bomber training camp tha just graduated!

[
	["SuicideBomberCamp", 200, "LAND",[0,0,0],"MissionFXStart","MissionFXEnd"], // Mission Title NOSPACES!, and encounter radius
	["Bomber Camp","mil_objective", "ELLIPSE","ColorGreen","FDiagonal",200],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
		[   "Bomber Camp Party",
			 "A suicide bomber training camp has just graduated another class.  Catch them at their graduation party and keep them from getting to work!"
		],
		
		// Mission Success Message
		[   "Bomber Camp dispatched",
			 "The training camp party has been crashed and the threat is over"
		],
	  
		// Mission Failure Message
		[  "Bomber Camp Failure!",
			"The party is over and the bommbers have left on their missions.  Good luck out there..."
		] 
	],
	[  //  Loot Config:  Refer to LootData.sqf for specifcs
		["None" , 			[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["PoptabLoot" , 	[7,5]],	
			["PoptabLoot" , 	[-8,3]], 
			["PoptabLoot" , 	[2,-8]], 
			["PoptabLoot" , 	[-8,-2]] 
		],
		["None" , 			[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		//[ ImFX_Land_Cars,								[-10,10],	321,		[.5,   1,     .5,         .5,         .5]],
		//[ ImFX_Land_Cars,								[-12,14],	45,			[.5,   1,     .5,         .5,         .5]],
		//[ ImFX_Land_Cars,								[-15,10],	204,		[.5,   1,     .5,         .5,         .5]],


		// This line will spawn a group of kamikaze crazies in the mission
		["Land_Sign_WarningUnexplodedAmmo_F",		[((round random 50)-25),((round random 50)-25)],	(round random 360),		0],  //type, offset, rotation, presist flag
		["Land_Sign_WarningUnexplodedAmmo_F",		[((round random 50)-25),((round random 50)-25)],	(round random 360),		0],  //type, offset, rotation, presist flag
		["Land_Sign_WarningUnexplodedAmmo_F",		[((round random 50)-25),((round random 50)-25)],	(round random 360),		0],  //type, offset, rotation, presist flag
		["Land_Sign_WarningUnexplodedAmmo_F",		[((round random 50)-25),((round random 50)-25)],	(round random 360),		0],  //type, offset, rotation, presist flag

		["Land_CampingTable_small_white_F",[-4.70117,-0.396484,0],286.635,0],
		["Land_CampingTable_small_F",[2.37695,-1.14844,0],64.6661,0],
		["Land_Camping_Light_off_F",[-1.65234,2.03711,-0.815598],0,0],
		["Land_CampingChair_V2_F",[-2.21973,1.62695,0],0,0],
		["Land_CampingChair_V2_F",[-1.1123,1.67188,0],0,0],
		["Land_CampingChair_V2_white_F",[-4.26074,-0.570313,0],286.905,0],
		["Land_CampingChair_V1_F",[-2.20605,-3.23047,0],0,0],
		["Land_CampingChair_V1_F",[-0.466797,-3.59766,0],0,0],
		["Land_CampingTable_white_F",[-1.46777,2.05664,0],0,0],
		["Land_CampingChair_V1_folded_F",[2.36719,-2.55078,0],0,0],
		["Land_Campfire_F",[0.354492,-10.293,0],0,0],
		["Land_CampingChair_V2_F",[1.91895,-1.34766,0],59.0305,0],
		["Land_FoodContainer_01_F",[3.68457,3.375,0],0,0],
		["Exile_Cosmetic_DogFood",[2.41797,-0.90625,-0.813005],0,0],
		["Exile_Cosmetic_CatFood",[2.33203,-1.41797,-0.813005],0,0],
		["Land_PaperBox_01_small_closed_brown_food_F",[-0.523438,-0.449219,0],238.801,0],
		["Land_WoodPile_F",[3.76563,-9.79102,0],0,0],
		["Land_PartyTent_01_F",[-0.944336,0.363281,-0.511202],0,0],
		["Land_Sink_F",[-5.25391,-9.08594,0],0,0],
		["Exile_Cosmetic_Beer",[-0.610352,5.27344,0],0,0],
		["Land_Can_Dented_F",[5.02637,2.46875,0],0,0],
		["Land_Can_Rusty_F",[4.42773,-3.53906,0],0,0],
		["Land_Tableware_01_knife_F",[3.06738,-2.08984,0],0,0],
		["Land_Tableware_01_spoon_F",[1.11914,2.06445,0],171.183,0],
		["Exile_Cosmetic_GasMask",[-5.6543,5.47461,0],248.004,0],
		["Land_BottlePlastic_V1_F",[-0.847656,2.14648,-0.815598],0,0],
		["Exile_Cosmetic_Beer",[-1.67383,2.19336,-0.815598],0,0],
		["Exile_Cosmetic_CockONut",[2.21289,-0.769531,-0.813005],0,0],
		["Land_LiquidDispenser_01_F",[-1.70117,-0.789063,0],0,0],
		["Land_Tableware_01_stackOfNapkins_F",[-4.45703,-0.144531,-0.813005],0,0],
		["Land_PaperBox_01_small_ransacked_brown_IDAP_F",[2.2998,6.93555,0],0,0],
		["Land_PaperBox_01_open_empty_F",[-2.68945,8.55273,0],0,0],
		["Land_TinContainer_F",[5.02246,5.78516,0],0,0]


		//["Land_BagBunker_Tower_F",		[0,0],		0,		0]   //type, offset, rotation, presist flag
	],
	[ // AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","LINE"],   [  [4,"Rifleman_E"]           ],   ["BoxPatrol",[-6,-6],[0,0],[10]     ]],
		[["EAST","COMBAT","RED","LINE"],   [  [4,"Rifleman_E"]           ],   ["BoxPatrol",[6,6],[0,0],[25]     ]]

	],

	// Vehicles
	[
		[  		// Convoy #1                     
			[   // Vehicle                     Offset     				Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  ImFX_Land_Cars       	,[((round random 100)-50),((round random 100)-50)],		[0,"Driver_E"],     	"None" ],					 
				[  ImFX_Land_Cars       	,[((round random 100)-50),((round random 100)-50)],		[0,"Driver_E"],     	"None" ],					 
				[  ImFX_Land_Cars       	,[((round random 100)-50),((round random 100)-50)],		[0,"Driver_E"],     	"None" ]					 
			],
			[  
			],
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
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
			//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
			//["Timer", 		["TimerNoPlayers", 		1800]],	//30 minutes
			["LUCNT",		["LowUnitCount","EAST",0,0,[0,0]]  ]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],		["LUCNT"]],   
			//[["LOSE"],		["Timer"]],
			[["END"],		["LUCNT"]]  
		]      
	]
];
