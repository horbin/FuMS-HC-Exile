// 	MilitaryRaid.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 12796.6,16673.9 as this map is specific to Altis
// 	This mission was ported from HeadlessRocket's missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Military Raid" static mission for Altis.
	Created by HeadlessRocket
	Credits to "HeadlessRocket" for creating the base.
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["MilitaryRaid", 150], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Military Base Raid","hd_objective","ELLIPSE","ColorRed","SolidBorder",150],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Military Base Raided",	// The first line is the title of the pop-up box
			"A small military base has been Raided KILL the raiders and claim their loot!..."		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Military Base Raid stopped!",
			"Convicts have successfully rooted out the raiders and claimed the loot for themselves!"
		],
	  
		// Mission Failure Message
		[
			"Military Base looted!",
			"The raiders found what they were looking for and left..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics	
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["MilitaryBaseLoot" , 	[12796.6,16673.9,0]],
			["MilitaryBaseLoot" , 	[12795.6,16671.9,0]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// Loot vehicle
		// Class Name, 			Offset, 			Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   				0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   
		["O_UGV_01_rcws_F",		[0,100],   				0, 			[.5,   1,     .5,         .5,         .5]],  
		
		["O_Truck_02_Ammo_F",	[12809.3,16654.1,0],	0,			[.5,   1,     .5,         .5,         .5]],
	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,												
			[	// paste your array of building objects here
				["Land_HBarrier_Big_F",[12856.1,16702.1,-0.400215],5.17504,[[0.0901989,0.995924,0],[0,0,1]],false],
				["Land_HBarrier_Big_F",[12803.3,16616.4,-0.600342],301.343,[[-0.854069,0.52016,0],[-0.0639947,-0.105075,0.992403]],false],
				["Land_Mil_WallBig_4m_F",[12806.2,16621.8,-0.201653],284.545,[[-0.967951,0.251141,0],[0,0,1]],false],
				["Land_HBarrierTower_F",[12787,16634.4,-0.995239],144.545,[[0.580063,-0.814571,0],[0,-0,1]],false],
				["Land_HBarrierBig_F",[12783.5,16627.7,0],115.455,[[0.900934,-0.432463,0.0359725],[-0.0713549,-0.0658635,0.995274]],false],
				["Land_HBarrierBig_F",[12797.5,16612.9,-0.596588],0,[[-0,1,0],[-0.0871038,0,0.996199]],false],
				["Land_HBarrierBig_F",[12789,16612.8,-0.595062],183.685,[[-0.0642713,-0.997932,0],[-0.0540536,0.00348129,0.998532]],false],
				["Land_HBarrier_3_F",[12792.3,16634.2,-0.0992203],36.3636,[[0.592907,0.805271,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[12797.8,16630.1,-0.0985565],31.8182,[[0.527226,0.849725,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[12798.2,16632.7,-0.200233],114.091,[[0.912898,-0.408187,0],[0,-0,1]],false],
				["Land_HBarrier_3_F",[12794.6,16635.4,-0.200096],135,[[0.707107,-0.707107,0],[0,-0,1]],false],
				["Land_BagFence_Round_F",[12790.7,16616.9,-0.0942459],28.1818,[[0.472271,0.881454,0],[0,0,1]],false],
				["Land_BagFence_Round_F",[12790.1,16618.9,-0.161102],118.182,[[0.881452,-0.472274,0],[0,-0,1]],false],
				["Land_Sign_WarningMilitaryArea_F",[12786.3,16611.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Sign_WarningMilitaryVehicles_F",[12787.5,16611.3,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Sign_WarningMilAreaSmall_F",[12781.2,16623.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_BarGate_F",[12783.6,16618.7,0],71.3636,[[0.947566,0.319561,0],[0,0,1]],false],
				["Land_Bunker_F",[12786.6,16665.3,0],262.273,[[-0.99092,-0.134453,0],[-0,0,1]],false],
				["Land_BagBunker_Tower_F",[12816.9,16679.3,-0.0990067],195.455,[[-0.266482,-0.96384,0],[-0.0695817,0.0192379,0.997391]],false],
				["Land_Cargo_HQ_V3_F",[12793.6,16650.1,0],271.818,[[-0.999497,0.0317249,0],[0,0,1]],false],
				["Land_HBarrier_Big_F",[12812.5,16703.6,0],301.364,[[-0.853878,0.520474,0],[0,0,1]],false],
				["Land_HBarrier_Big_F",[12808,16696.1,0],301.364,[[-0.853878,0.520474,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[12826.7,16668.2,0],45,[[0.707107,0.707107,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[12837.2,16660,0],37.2727,[[0.605609,0.795762,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[12840,16657.2,0],52.2727,[[0.790932,0.611904,0],[0,0,1]],false],
				["Land_Mil_WallBig_4m_F",[12820.5,16673.3,-0.504341],34.0909,[[0.560508,0.828149,0],[0,0,1]],false],
				["Land_HBarrier_1_F",[12831.5,16663.4,-0.00196838],311.364,[0,0,1],true],
				["Land_HBarrier_Big_F",[12830.5,16701.1,0],345,[[-0.258819,0.965926,0],[0,0,1]],false],
				["Land_HBarrier_Big_F",[12826,16694.7,0],294.545,[[-0.909635,0.415408,0],[0,0,1]],false],
				["Land_BagFence_Round_F",[12800.2,16634.6,-0.0942459],156.818,[[0.393653,-0.919259,0],[0,-0,1]],false],
				["Land_BagFence_Round_F",[12795.9,16638.1,-0.0942459],278.636,[[-0.988662,0.150157,0],[0,0,1]],false],
				["Land_LampSolar_F",[12784.2,16624.7,0],236.818,[[-0.836936,-0.5473,0],[-0,0,1]],false],
				["Land_LampSolar_F",[12798.1,16628,0],329.545,[[-0.506861,0.862028,0],[0,0,1]],false],
				["Land_HBarrierTower_F",[12816.3,16701.4,0],208.636,[[-0.479244,-0.877682,0],[-0,0,1]],false],
				["Land_Scrap_MRAP_01_F",[12828.5,16703.5,0],251.364,[[-0.947568,-0.319555,0],[-0,0,1]],false],
				["WaterPump_01_sand_F",[12785.6,16649.7,0],171.364,[[0.150156,-0.988662,0],[0,-0,1]],false],
				["Land_LampSolar_F",[12793.2,16615.8,0],60,[[0.866025,0.5,0],[0,0,1]],false],
				["Land_LampShabby_F",[12786.2,16644,0],85.9091,[[0.997452,0.0713388,0],[0,0,1]],false],
				["Land_LampShabby_F",[12807.5,16628.8,0],290.909,[[-0.934148,0.356885,0],[0,0,1]],false],
				["Land_LampShabby_F",[12824,16650.9,0],293.636,[[-0.916111,0.400925,0],[0,0,1]],false],
				["Land_LampShabby_F",[12816,16673.8,0],215.909,[[-0.5865,-0.809949,0],[-0,0,1]],false],
				["Land_LampShabby_F",[12836.1,16679.4,0],300.455,[[-0.862027,0.506862,0],[0,0,1]],false],
				["Land_LampShabby_F",[12782.4,16698.2,0],150,[[0.5,-0.866026,0],[0,-0,1]],false],
				["Land_LampShabby_F",[12783.1,16668.8,0],56.3636,[[0.832569,0.553921,0],[0,0,1]],false],
				["FlagPole_F",[12802.9,16689.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[12814.1,16680.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[12791.9,16633.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_PowerGenerator_F",[12783.8,16700.2,0],210.909,[[-0.513676,-0.857984,0],[-0,0,1]],false],
				["Land_Water_source_F",[12826.6,16638.3,0],118.182,[[0.881452,-0.472274,0],[0,-0,1]],false],
				["Land_HelipadSquare_F",[12796.6,16673.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_BagFence_Round_F",[12826.8,16689.9,-0.194855],15.909,[[0.27411,0.961698,0],[0,0,1]],false],
				["Land_BagFence_Round_F",[12824.2,16682,0],202.727,[[-0.386341,-0.922356,0],[-0,0,1]],false],
				["Land_HBarrierBig_F",[12785.9,16631.6,-0.302498],55.9091,[[0.828149,0.560508,0],[-0.00978205,0.014453,0.999848]],false],
				["Land_BarGate_F",[12820.6,16694.5,0],51.3636,[[0.781124,0.624376,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V3_F",[12857.8,16694.4,0],218.182,[[-0.618162,-0.786051,0],[-0,0,1]],false],
				["Land_Wreck_Heli_Attack_01_F",[12815.3,16727.9,-0.00127411],0,[0,0,1],true],
				["Land_Wreck_Ural_F",[12837.2,16715.2,0],115,[0,0,1],true],
				["Land_Wreck_Plane_Transport_01_F",[12917.5,16724.6,0],176.818,[[0.0555079,-0.998458,0],[0,-0,1]],false],
				["Land_Wreck_UAZ_F",[12855.2,16755.4,0],0,[0,0,1],true],
				["Land_Wreck_T72_hull_F",[12865.2,16727.9,0],322.273,[0,0,1],true],
				["Land_BagFence_Round_F",[12801.6,16691.3,-0.0942459],22.7271,[[0.386343,0.922355,0],[0,0,1]],false],
				["CamoNet_BLUFOR_F",[12846.5,16695.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V3_F",[12823.8,16654.2,-0.0331573],82.4424,[[0.991313,0.131523,0],[0,0,1]],false],
				["Land_Cargo_House_V3_F",[12821.3,16660.9,-0.0331573],60.1696,[[0.867502,0.497434,0],[0,0,1]],false],
				["Land_Cargo_House_V3_F",[12817,16666.4,-0.0331573],43.3515,[[0.686472,0.727156,0],[0,0,1]],false],
				["Land_UWreck_MV22_F",[12835.3,16753.6,0],0,[0,0,1],true],
				["Land_Cargo_Tower_V2_F",[12903,16719.5,0],8.1818,[0,0,1],true]
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   	["Loiter",		[12812.2,16626.7,17.7387],[12812.2,16626.7,17.7387],[10]]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   	["Loiter",		[12799.7,16708.2,17.8497],[12799.7,16708.2,17.8497],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   	["Loiter",		[12907.8,16721.3,18.4271],[12907.8,16721.3,18.4271],[10]   ]],
		[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   	["Loiter",		[12921.2,16768.3,4.26992],[12921.2,16768.3,4.26992],[10]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],   	["BoxPatrol",	[12796.6,16673.9,0],[12796.6,16673.9,0],	[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Hunter_E"]  ],   	["Buildings",	[12787,16634.4,0],[12787,16634.4,0],		[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],		["BoxPatrol",	[12786.6,16665.3,0],[12786.6,16665.3,0],	[75]   ]],		
		[["EAST","COMBAT","RED","COLUMN"],  		[  [2,"SMG_E"]  ],   		["Explore",		[12816.9,16679.3,0],[12816.9,16679.3,0],	[75]   ]],
		[["EAST","COMBAT","RED","VEE"],   			[  [2,"Rifleman_E"]  ],   	["BoxPatrol",	[12798.1,16628,0],[12798.1,16628,0],		[75]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],   	["BoxPatrol",	[12793.2,16615.8,0],[12793.2,16615.8,0],	[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Hunter_E"]  ],   	["Buildings",	[12802.9,16689.8,0],[12802.9,16689.8,0],	[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],   	["BoxPatrol",	[12826.6,16638.3,0],[12826.6,16638.3,0],	[75]   ]],		
		[["EAST","COMBAT","RED","COLUMN"],  		[  [2,"SMG_E"]  ],   		["Explore",		[12790.7,16616.9,0],[12790.7,16616.9,0],	[75]   ]],
		[["EAST","COMBAT","RED","VEE"],   			[  [2,"Rifleman_E"]  ],   	["BoxPatrol",	[12793.6,16650.1,0],[12793.6,16650.1,0],	[75]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     					Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F",		[12790.6,16618.3,-0.0982742],		[310],     	"None" ],	
				[  "O_HMG_01_high_F",		[12800.6,16633.9,0],				[310],     	"None" ],	
				[  "O_HMG_01_high_F",		[12795,16637.9,0],					[270],		"None" ], 	
				[  "O_HMG_01_high_F",		[12824.1,16681.4,-0.202408],		[0],        "None" ], 	
				[  "O_HMG_01_high_F",		[12826.9,16690.7,-0.203194],		[90],     	"None" ],	
				[  "O_HMG_01_high_F",		[12801.7,16692.1,-0.0822678],		[183],     	"None" ],	
				[  "O_HMG_01_high_F",		[12839.8,16682.2,2.8681],			[270],      "None" ], 	
				[  "O_HMG_01_high_F",		[12810.7,16637.3,17.7028],			[345],      "None" ], 	
				[  "O_HMG_01_high_F",		[12799.5,16698.7,17.7028],			[90],     	"None" ]	
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [9, "Rifleman_E"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
			["LUCNT",		["LowUnitCount","EAST",15,250,[0,0]]  ],		// Triggers call for reinforcements
			["LUCNT2",		["LowUnitCount","EAST",10,250,[0,0]]  ]		// Triggers call for reinforcements


		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],		["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],		["TIMER"     ]],
			[["CHILD",		["Help_VehicleE",[0,0],5,120]],["LUCNT"     ]],  
			[["CHILD",		["Help_Helo",[0,0],5,120]],["LUCNT2"     ]],  
			[["END"],		["AllDead","OR","TIMER"    ]]  
		]
	]
];
