// 	UndergroundStation.sqf
// 	TheOneWhoKnocks
// 	6/1/2020
// 	Spawn location should be 4129.35,11023 as this map is specific to Chernarus
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["UndergroundStation", 250], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Station Attack","hd_objective","ELLIPSE","ColorRed","SolidBorder",250],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Undergroud Station Attack",	// The first line is the title of the pop-up box
			"The underground station is under siege by drug smugglers."		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Underground Station smugglers killed",
			"Convicts have successfully killed the Military Soldiers and claimed all the loot for themselves!"
		],
	  
		// Mission Failure Message
		[
			"Underground Station smugglers esaped",
			"The Military Soldiers have finished their beers and buggered off..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics		

		["None" , 		[5,5] 	], //[static loot, offset location] - spawns with the mission
		["None" , 		[5,5] 	], //[static loot, offset location] - spawns with the mission
		["None" , 		[0,0] 	]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   
		
		// SUGGESTED SPAWN POINTS FROM ORIGINAL MAP 
		// USED TO FIND GOOD LOCATIONS FOR SPAWN		
		
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		//[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["Loiter",		[18297.931641,15587.395508,0.00136185],[18297.931641,15587.395508,0.00136185],[50]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18440.494141,15581.865234,17.889561],[18440.494141,15581.865234,17.889561],[10, "ANY"]   ]],
		[["EAST","STEALTH","RED","COLUMN"],  [  [1,"Sniper_E"]  ]   				["TowerGuard",	[13194.9,10712.9,9.6955],[13194.9,10712.9,9.6955],[10]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18180.560547,15560.74707,17.798668],[18180.560547,15560.74707,17.798668],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18164.910156,15541.244141,4.348576],[18164.910156,15541.244141,4.348576],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18291.595703,15584.178711,4.353832],[18291.595703,15584.178711,4.353832],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18307.537109,15588.579102,4.360596],[18307.537109,15588.579102,4.360596],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[18426.212891,15537.683594,4.300941],[18426.212891,15537.683594,4.300941],[10, "ANY"]   ]],
		//[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[200]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],   	["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
	/*
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
			/*
				[  "O_HMG_01_high_F"       	,[4223.43,11041,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[4151.12,10944.5,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[4043.76,11035.3,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[4119.05,11110.4,0],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[4124.99,11034.5,0],		[0],     	"None" ]   
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
				*/
			],
			[  
				/*
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					//["EAST","COMBAT","RED","COLUMN"],   [  [5, "Rifleman_E"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
				*/
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		]
		/*
		[
			[   // Vehicle                     Offset     			Crew and number   	CargoLoot 		Damage
				//[  FuMS_Mil_ArmedOffroads,	[4179.81,11122.1,0],	[1,"Rifleman_E"],      "TruckJunk",		[0.25]      ]

				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					//["EAST","COMBAT","RED","COLUMN"],[  [1, "Driver_E"]  ], ["BoxPatrol",[0,0],[75,-75],[100]   ]
				]
			],	// Troops : These are distributed across all vehicles in this convoy. 
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					//["EAST","COMBAT","RED","COLUMN"],[[1,"SMG_E"]],["BoxPatrol",[0,0],[0,0],[75]]
				]

			]
		],
		[
			
			[   // Vehicle                     Offset     			Crew and number   	CargoLoot 		Damage
				[  FuMS_Mil_ArmedOffroads,	[4017.39,10948.5,0],	[1,"Rifleman_E"],      "TruckJunk",		[0.25]      ]

				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],[  [1, "Driver_E"]  ], ["BoxPatrol",[0,0],[-75,75],[100]   ]	
				]
			],	// Troops : These are distributed across all vehicles in this convoy. 
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],[[1,"SMG_E"]],["BoxPatrol",[0,0],[0,0],[75]]
				]

			]
			
		]
		*/		
	],
	[
		[
			//Define all the triggers this mission will be using
			// Trigger names must be unique within each mission.
			// NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
			// NOTE: "OK" is a reserved trigger. Do not define it here.
			//  "OK" can be used in the actions section to force an action to occur at mission start!	 
			["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Always leaves one behind as a special surprise for players.
			["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ],		// Triggers call for reinforcements
			["PLAYERNEAR",	["ProxPlayer",[4129.35,11023,0], 100, 1]]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead","PLAYERNEAR"    ]],
			[["LOSE"],["TIMER"     ]],
			[["CHILD",	["Help_Helo",[0,0],5,300]],["LUCNT"     ]],  
			[["END"],["TIMER","OR","PLAYERNEAR", "AllDead"   ]]  
		]
	]


];








				/*			


private _objects = [
	["TK_GUE_WarfareBBarrier10xTall_EP1",[-19.5884,-23.1123,0.000366211],240.123,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[-29.728,-4.85254,0.000366211],240.123,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[-8.58838,-31.6426,0.000366211],194.884,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[-31.5181,8.86719,0.000366211],104.923,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[23.5518,-19.6523,0.000366211],150.043,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[5.31201,-29.833,0.000366211],150.043,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[32.0718,-8.64258,0.000366211],104.804,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[20.0718,23.4268,0.000366211],59.8588,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[30.312,5.2168,0.000366211],59.8588,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[9.04199,31.9072,0.000366211],14.6196,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[-4.92822,30.0576,0.000366211],150.043,[true,false]],
	["TK_GUE_WarfareBBarrier10xTall_EP1",[-23.1685,19.877,0.000366211],150.043,[true,false]],
	["Land_Mil_Barracks_i",[-1.71826,16.7168,0.000366211],239.926,[true,false]],
	["Land_Mil_Barracks_i",[-12.5781,10.4473,0.000366211],239.926,[true,false]],
	["CampEast",[-23.1582,11.2275,-0.0400696],151.096,[true,false]],
	["CampEast",[-25.728,-0.522461,-0.0400696],151.096,[true,false]],
	["CampEast",[-15.2983,-19.543,-0.0400696],330.451,[true,false]],
	["CampEast",[-3.19824,-24.9131,-0.0400696],331.611,[true,false]],
	["Land_Mil_Barracks_i",[13.1616,-10.2725,0.000366211],60.107,[true,false]],
	["Land_Mil_Barracks_i",[2.29199,-16.5127,0.000366211],60.107,[true,false]],
	["Land_Mil_Barracks_i",[-1.1084,-0.692383,0.000366211],330.289,[true,false]],
	["Land_BagBunker_Tower_F",[14.8516,23.1572,-0.00198364],328.669,[true,false]],
	["Land_BagBunker_Tower_F",[27.2017,0.836914,-0.00198364],328.669,[true,false]],
	["Land_Razorwire_F",[16.8618,9.97754,6.10352e-005],0,[true,false]]
];

private _center = [3300,10000,0];
{
	private _object =  create3DENEntity ["Object",(_x select 0),(_x select 1),true];
	_object setDir (_x select 2);
	_object setPosATL (_center vectorAdd (_x select 1));
	_object enableSimulationGlobal ((_x select 3) select 0);
	_object allowDamage ((_x select 3) select 1);
} forEach _objects;						

						private _objects = [
					["TK_GUE_WarfareBBarrier10xTall_EP1",[74.4819,85.8389,-0.0221558],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[58.8916,85.8389,-0.0221252],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[27.7417,85.7393,-0.0236511],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[43.2817,85.7393,-0.0252991],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[13.6416,85.6387,-0.032135],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-1.9585,85.5391,-0.0292969],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-33.1685,85.5391,-0.0178833],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-17.5684,85.5391,-0.0241699],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-48.7983,85.5391,-0.0149536],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-78.2983,81.1387,-0.00180054],325.422,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-64.3984,85.4395,-0.0153809],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-85.498,53.9395,0.00894165],273.101,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-86.3584,38.3389,0.00643921],273.096,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-87.1582,22.7393,0.00466919],273.091,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-88.0181,7.13867,0.00302124],273.089,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-88.9482,-8.46094,0.00271606],273.087,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-89.8081,-24.0605,0.000152588],273.082,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-90.6084,-39.6611,0.000549316],273.082,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-91.4683,-55.1611,0.00256348],273.08,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-86.1582,-79.1611,0.0214539],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-70.5581,-79.0605,0.0224609],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-39.4082,-78.7607,0.00177002],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-54.9482,-78.9609,-0.000762939],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-25.3081,-78.6611,-0.00186157],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-9.71826,-78.4609,0.00167847],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[21.4917,-78.2607,0.000793457],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[5.8916,-78.3613,0.00115967],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[37.1216,-78.1611,0.000793457],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[66.6016,-73.6611,0.00088501],145.116,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[48.7119,-84.3613,0.00991821],237.054,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-92.3184,-70.7607,0.00238037],273.082,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[97.9819,79.3389,-0.00970459],269.948,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.0117,63.7393,-0.00564575],269.971,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.0815,32.6387,-0.00088501],269.984,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.0317,48.1387,-0.00350952],269.979,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.2017,18.5391,0.000274658],269.993,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.2319,2.93945,0.000152588],269.996,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.2915,-28.2607,0.0015564],270.019,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.2617,-12.6611,0.00167847],270.007,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[98.3218,-43.9609,0.000274658],270.023,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[79.2417,-64.7607,0.0159607],145.096,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[92.0718,-55.8613,0.0155334],145.095,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[64.6118,-83.7607,0.00942993],237.053,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[37.3418,54.8389,0.00216675],273.082,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[36.4819,39.2393,0.00201416],273.082,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[35.6816,23.6387,0.00170898],273.082,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[34.8218,8.03906,0.00177002],273.082,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[33.8916,-7.56055,0.000427246],273.079,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[33.0317,-23.1611,0.000640869],273.079,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[31.3716,-54.3613,-0.00119019],273.079,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[30.5215,-69.8613,0.00234985],273.079,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-37.3081,-45.8613,-0.0106812],305.098,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-32.5283,-31.9609,0.00296021],273.085,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-31.6685,-16.3613,0.00613403],273.094,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-30.8682,-0.760742,0.00588989],273.093,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-30.0083,14.8389,0.00762939],273.096,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-29.0781,30.4395,0.00802612],273.099,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-28.2183,45.9395,0.00598145],273.101,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-27.4185,61.5391,0.00738525],273.106,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-26.5581,77.1387,0.0090332],273.112,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-90.8384,66.2393,0.0154419],220.303,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-90.0781,81.8389,0.0157776],220.3,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[90.1519,85.8389,-0.021637],0,[true,false]],
					["Land_Offices_01_V1_F",[-42.2583,62.1387,-0.00161743],272.074,[true,false]],
					["Land_A_Office01_EP1",[1.36182,-67.2607,0.00357056],0,[true,false]],
					["Land_Hlaska",[33.4819,-74.8613,-0.00692749],0,[true,false]],
					["Land_Hlaska",[-80.2583,75.0391,-0.00216675],141.773,[true,false]],
					["CampEast",[-26.3481,-30.3613,3.05176e-005],93.2497,[true,false]],
					["CampEast",[-25.6382,-18.2607,-0.00311279],93.2556,[true,false]],
					["Land_Ss_hangar",[-8.34814,56.8389,-0.0518494],182.534,[true,false]],
					["Land_Scrap_MRAP_01_F",[-99.6484,68.6387,-0.00216675],356.031,[true,false]],
					["Land_ScrapHeap_1_F",[-92.3784,89.3389,0.00439453],0,[true,false]],
					["Land_ScrapHeap_2_F",[49.6616,-96.0605,-0.0103455],267.759,[true,false]],
					["Land_ScrapHeap_1_F",[72.5615,-89.7607,0.00256348],0,[true,false]],
					["TK_WarfareBUAVterminal_Base_EP1",[-42.5781,30.0391,-0.00946045],31.1692,[true,false]],
					["Land_Mil_House_dam_EP1",[25.0215,-8.26074,-0.0805054],93.5106,[true,false]],
					["Land_BagFenceRound",[-3.30811,-2.36133,-0.012146],0,[true,false]],
					["Land_BagFenceRound",[-4.87842,-3.96094,-0.00146484],270.034,[true,false]],
					["Land_BagFenceRound",[-1.72852,-3.86133,0.000976563],89.5266,[true,false]],
					["Land_BagFenceRound",[-0.728516,-4.86133,-0.0127869],0,[true,false]],
					["Land_BagFenceRound",[-0.728516,-7.96094,0.0120239],180.08,[true,false]],
					["Land_BagFenceRound",[0.851563,-6.36133,0.000640869],89.5236,[true,false]],
					["Land_BagFenceRound",[-5.81836,-4.86133,-0.013855],0,[true,false]],
					["Land_BagFenceRound",[-7.38818,-6.36133,0.000305176],270.038,[true,false]],
					["Land_BagFenceRound",[-5.82813,-7.96094,0.0116272],180.08,[true,false]],
					["Land_BagFenceRound",[-4.79834,-8.86133,-0.00192261],270.038,[true,false]],
					["Land_BagFenceRound",[-3.22852,-10.3613,0.0134583],180.08,[true,false]],
					["Land_BagFenceRound",[-1.64844,-8.76074,0.000823975],89.5266,[true,false]],
					["TK_GUE_WarfareBBarrier5x_EP1",[32.7217,62.0391,0.000183105],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-47.1685,-45.9609,-0.0191956],42.5095,[true,false]],
					["Land_Medevac_house_V1_F",[-40.1182,9.83887,-0.0116577],271.784,[true,false]],
					["Land_Medevac_house_V1_F",[-40.9883,-4.76074,-0.00375366],271.784,[true,false]],
					["Land_Medevac_house_V1_F",[-41.248,-20.3613,0.000518799],271.784,[true,false]],
					["Land_Medevac_house_V1_F",[-42.1182,-34.9609,0.00012207],271.784,[true,false]],
					["Land_Medevac_HQ_V1_F",[-58.4785,4.83887,-0.000274658],1.46135,[true,false]],
					["RU_WarfareBAircraftFactory",[-64.5181,30.9395,-0.0393982],0,[true,false]],
					["Land_Cargo_HQ_V1_F",[-2.21826,-35.8613,0.00167847],0,[true,false]],
					["Land_Cargo_House_V1_F",[-23.1782,-4.06055,0.000762939],88.773,[true,false]],
					["Land_Cargo_House_V1_F",[-22.3281,7.73926,-0.000335693],88.773,[true,false]],
					["Land_Cargo_Tower_V1_F",[-82.9585,-71.0605,-0.00198364],0,[true,false]],
					["CampEast",[-27.0283,-42.5605,-0.00149536],93.2497,[true,false]],
					["Land_Mil_ControlTower_EP1",[89.6118,70.8389,-0.185608],89.9878,[true,false]],
					["Land_BagFenceRound",[-56.3281,-56.8613,-0.0128784],0,[true,false]],
					["Land_BagFenceRound",[-57.9082,-58.3613,-0.000549316],270.026,[true,false]],
					["Land_BagFenceRound",[-54.7583,-58.3613,0.000274658],89.5206,[true,false]],
					["Land_BagFenceRound",[-53.748,-59.3613,-0.0137634],0,[true,false]],
					["Land_BagFenceRound",[-53.7583,-62.4609,0.0100098],180.08,[true,false]],
					["Land_BagFenceRound",[-52.1685,-60.8613,-0.000579834],89.5206,[true,false]],
					["Land_BagFenceRound",[-58.8384,-59.2607,-0.0104675],0,[true,false]],
					["Land_BagFenceRound",[-60.4185,-60.8613,-0.00256348],270.026,[true,false]],
					["Land_BagFenceRound",[-58.8481,-62.3613,0.0125732],180.08,[true,false]],
					["Land_BagFenceRound",[-57.8184,-63.2607,0],270.026,[true,false]],
					["Land_BagFenceRound",[-56.2583,-64.8613,0.0107727],180.08,[true,false]],
					["Land_BagFenceRound",[-54.6685,-63.2607,0.000518799],89.5177,[true,false]],
					["Land_BagFenceRound",[-71.9785,68.1387,-0.00933838],0,[true,false]],
					["Land_BagFenceRound",[-73.5581,66.6387,0.00634766],270.053,[true,false]],
					["Land_BagFenceRound",[-70.4082,66.6387,-0.00540161],89.5446,[true,false]],
					["Land_BagFenceRound",[-69.3984,65.6387,-0.00952148],0,[true,false]],
					["Land_BagFenceRound",[-69.4082,62.5391,0.0088501],180.08,[true,false]],
					["Land_BagFenceRound",[-67.8281,64.1387,-0.00457764],89.542,[true,false]],
					["Land_BagFenceRound",[-74.498,65.7393,-0.0101929],0,[true,false]],
					["Land_BagFenceRound",[-76.0684,64.1387,0.00280762],270.048,[true,false]],
					["Land_BagFenceRound",[-74.5083,62.6387,0.00784302],180.08,[true,false]],
					["Land_BagFenceRound",[-73.4785,61.7393,0.00366211],270.048,[true,false]],
					["Land_BagFenceRound",[-71.9082,60.1387,0.00643921],180.08,[true,false]],
					["Land_BagFenceRound",[-70.3184,61.7393,-0.00619507],89.546,[true,false]],
					["Land_A_Hospital",[85.0518,1.13867,0.068573],270.64,[true,false]],
					["Land_BagFenceRound",[48.0415,76.3389,-0.01297],0,[true,false]],
					["Land_BagFenceRound",[46.4619,74.8389,-0.000976563],270.023,[true,false]],
					["Land_BagFenceRound",[49.6118,74.8389,0.00128174],89.5148,[true,false]],
					["Land_BagFenceRound",[50.6216,73.8389,-0.0140686],0,[true,false]],
					["Land_BagFenceRound",[50.6118,70.7393,0.0113525],180.08,[true,false]],
					["Land_BagFenceRound",[52.1919,72.3389,0.000732422],89.5119,[true,false]],
					["Land_BagFenceRound",[45.5215,73.9395,-0.0113525],0,[true,false]],
					["Land_BagFenceRound",[43.9517,72.3389,-0.00195313],270.026,[true,false]],
					["Land_BagFenceRound",[45.5215,70.8389,0.0140076],180.08,[true,false]],
					["Land_BagFenceRound",[46.5518,69.9395,-0.000579834],270.023,[true,false]],
					["Land_BagFenceRound",[48.1118,68.3389,0.0118713],180.08,[true,false]],
					["Land_BagFenceRound",[49.7017,69.9395,0.0017395],89.5148,[true,false]],
					["Land_BagFenceRound",[49.0415,-64.0605,-0.0126648],0,[true,false]],
					["Land_BagFenceRound",[47.4717,-65.6611,-0.00436401],270.022,[true,false]],
					["Land_BagFenceRound",[50.6216,-65.5605,0.00308228],89.5147,[true,false]],
					["Land_BagFenceRound",[51.6216,-66.5605,-0.0131226],0,[true,false]],
					["Land_BagFenceRound",[51.6118,-69.6611,0.0120544],180.08,[true,false]],
					["Land_BagFenceRound",[53.2017,-68.0605,0.00158691],89.5147,[true,false]],
					["Land_BagFenceRound",[46.5317,-66.5605,-0.0153503],0,[true,false]],
					["Land_BagFenceRound",[44.9517,-68.0605,-0.00198364],270.022,[true,false]],
					["Land_BagFenceRound",[46.5215,-69.6611,0.0108337],180.08,[true,false]],
					["Land_BagFenceRound",[47.5518,-70.5605,-0.0039978],270.023,[true,false]],
					["Land_BagFenceRound",[49.1118,-72.0605,0.00894165],180.08,[true,false]],
					["Land_BagFenceRound",[50.7017,-70.4609,0.00149536],89.515,[true,false]],
					["Ins_WarfareBArtilleryRadar",[81.5918,42.8389,-0.0714417],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[32.2319,-38.7607,-0.000183105],273.079,[true,false]],
					["Land_Market_stalls_01_EP1",[45.7417,-13.9609,0.0122681],90.2017,[true,false]],
					["Land_CratesWooden_F",[55.5615,-12.0605,0.00112915],25.6609,[true,false]],
					["Land_Stanek_1C",[60.4619,-18.1611,0.000946045],0,[true,false]],
					["Land_Carpet_rack_EP1",[60.8018,-14.4609,-0.00259399],93.722,[true,false]],
					["Land_Market_stalls_01_EP1",[60.6919,-0.361328,0.0142212],90.1986,[true,false]],
					["Land_Market_stalls_01_EP1",[48.1719,9.33887,0.031311],131.907,[true,false]],
					["Land_stand_small_EP1",[52.8315,0.338867,-0.00012207],0,[true,false]],
					["Land_transport_cart_EP1",[52.9917,-4.76074,-0.0010376],0,[true,false]],
					["Land_GeneralStore_01a_PMC",[60.4316,30.7393,0.0749817],0,[true,false]],
					["Land_Ind_Workshop01_03",[91.9116,-39.6611,-0.00247192],359.752,[true,false]],
					["INS_WarfareBFieldhHospital",[-64.7983,-29.6611,0.00323486],1.21793,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-79.1582,15.6387,-0.0168457],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-38.2285,15.5391,-0.0205078],0,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-71.5283,-40.7607,0.0189209],179.706,[true,false]],
					["TK_GUE_WarfareBBarrier10xTall_EP1",[-82.4883,-40.7607,0.0197144],179.706,[true,false]],
					["Gue_WarfareBLightFactory",[-78.6382,-53.8613,0.0148315],0,[true,false]],
					["CDF_WarfareBUAVterminal",[16.5518,-41.4609,0.0120239],0,[true,false]],
					["INS_WarfareBVehicleServicePoint",[-18.5884,18.9395,-0.0228882],305.759,[true,false]],
					["USMC_WarfareBFieldhHospital",[-78.0181,-13.5605,0.0602112],2.92803,[true,false]],
					["USMC_WarfareBFieldhHospital",[-52.4385,-14.9609,-0.0602417],183.549,[true,false]],
					["WarfareBAircraftFactory_CDF",[19.6318,51.9395,-0.101715],50.5335,[true,false]],
					["MASH_EP1",[29.2217,15.7393,-0.0246582],95.2381,[true,false]],
					["MASH_EP1",[29.9917,23.1387,-0.021759],95.2281,[true,false]],
					["Fortress2",[18.2715,30.5391,-0.0120544],189.888,[true,false]],
					["USMC_WarfareBBarracks",[-33.2183,-67.3613,0.0472717],267.312,[true,false]],
					["Land_fort_artillery_nest",[5.8916,-7.66113,0.00308228],277.226,[true,false]],
					["Land_fort_artillery_nest",[-11.5581,-5.66113,0.00549316],94.1135,[true,false]],
					["Land_Fort_Watchtower",[-2.88818,17.2393,-0.0136108],302.561,[true,false]],
					["Land_Barn_W_02",[74.4517,-57.3613,-0.0207825],232.599,[true,false]],
					["Land_A_statue02",[53.2817,-41.3613,-0.00402832],0,[true,false]],
					["Land_A_statue01",[-2.55811,-51.4609,-0.00460815],0,[true,false]],
					["Land_Market_shelter_EP1",[74.5518,-30.6611,-0.0239258],0,[true,false]],
					["TK_GUE_WarfareBContructionSite_Base_EP1",[35.6016,-56.4609,-0.000335693],92.4908,[true,false]],
					["TK_GUE_WarfareBContructionSite_Base_EP1",[41.6616,-56.7607,-0.00323486],92.4874,[true,false]],
					["TK_GUE_WarfareBContructionSite_Base_EP1",[47.7417,-56.9609,0.000152588],92.4874,[true,false]],
					["TK_WarfareBContructionSite1_Base_EP1",[41.6016,-56.7607,-2.6051],91.3965,[true,false]],
					["Land_Shed_W03",[34.7017,-61.6611,-0.0198669],94.0499,[true,false]],
					["Land_Hlaska",[-41.6182,-43.8613,-0.00912476],328.978,[true,false]],
					["Land_Farm_WTower",[-64.5083,50.6387,-0.00674438],0,[true,false]],
					["TK_GUE_WarfareBContructionSite1_Base_EP1",[54.502,-23.2607,-0.00180054],133.738,[true,false]],
					["Land_fort_rampart",[61.7715,60.4395,0.0865784],332.604,[true,false]],
					["Land_fort_rampart",[53.9517,58.7393,0.0841064],3.81937,[true,false]],
					["Land_CamoNet_NATO",[75.4316,65.2393,0.00424194],194.834,[true,false]],
					["LAV25_HQ_unfolded",[61.2417,72.7393,-0.0012207],0,[true,false]],
					["Land_Cargo_Tower_V1_F",[19.3916,77.4395,-0.000457764],0,[true,false]],
					["RU_WarfareBFieldhHospital",[34.9517,79.9395,0.00247192],0,[true,false]],
					["PowGen_Big",[12.4219,17.7393,0.0267029],320.42,[true,false]]
				];
				private _center = [0,0,0];
				{
					private _object = (_x select 0) createVehicle [0,0,0];
					_object setDir (_x select 2);
					_object setPosATL (_center vectorAdd (_x select 1));
					_object enableSimulationGlobal ((_x select 3) select 0);
					_object allowDamage ((_x select 3) select 1);
				} forEach _objects;				
*/


			
			
			
			
			
