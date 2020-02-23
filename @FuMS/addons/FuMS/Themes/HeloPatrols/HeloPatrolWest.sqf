// HeliPatrolW.sqf
// TheOneWhoKnocks
// 
// Spawns (WEST) heli patrol that flies around until shot down.
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!


[
	[
							//------------------------------------------------------------------------------------
							//-----Mission Area Setup-----
		"HeloPatrolWest",  	// Mission Title NOSPACES!
		200                	// encounter radius
	],
	[ 
							//------------------------------------------------------------------------------------
							//-----Notification Configuration-----
							//--Map Marker Config.
		"Helo PatrolW",  	// Name, set to "" for nothing
		"mil_dot", 			// icon type:                                     https://community.bistudio.com/wiki/cfgMarkers for other options.
							// mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
		"ELLIPSE", 			// "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
		"ColorBlue",			//                                                  https://community.bistudio.com/wiki/setMarkerColor
		"FDiagonal",		// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
       200           		// size of the marker.    
	],
	[
		[
							// NOTIFICATION Messages and Map display Control.
			true,    		// Notify players via Radio Message
			"ALL",   			// radio channel. "ALL" = no radio required.
			0,         		//range from encounter center AI radio's can be heard (0=unlimited.)
			false,  		// Notify players via global message - hint screen on right of game display -
			false,   		// Show encounter area on the map
			30,      		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
							// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
		],
		[
			// Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
			"BLUEFOR Combat Air Patrol launched",  // title line
			"Radio chatter indicates the enemy has launched a heli patrol!" //description/radio message.
		],
		[	// Mission Success Message
			"BLUEFOR Combat Air Patrol destroyed",  // title line
			"Someone knocked down a combat air patrol and the radio is going crazy!"
		],
		[	// Mission Failure Message
			"Combat Air Patrol mission complete",
			"Mission complete. All forces are to RTB."
		]
	],
	[
		//---------------------------------------------------------------------------------
		//-----Loot Configuration-----    
		// Refer to LootData.sqf for available loot types and contents.
		[
		   "None",
		   [0,0]
		   //Array of loot now supported using above syntax.
		   // replace "Random" with your desired loot option from LootData.sqf, or leave random for random results!
		   // AND don't forget you can use these loot options to fill vehicles with loot too!(see vehicle section below)
		],
		[
			"None" ,        // WIN Loot
			[0,0]           // Offset from mission center x,y, 3 coords [x,y,z] places loot at a specific map location!  
		],
		[
			"None" ,        // Lose Loot.
			 [0,0]          // Offset from mission center.
		]
	],
	[
		//---------------------------------------------------------------------------------
		//-----Building Configuration-----       
		//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
	],
	[
		//---------------------------------------------------------------------------------
		//-----Group Configuration-----  see Convoy section for AI in vehicles! 
		//--- See SoldierData.sqf for AI type options.
	],
		//---------------------------------------------------------------------------------
		//-----LAND Vehicle Configuration----- 
	[
		//Airborne Vehicle Configuration
		[  // Division #1
			[ // Vehicle                         Offset     Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  CAMS_Heli_Armed_W,		[0,0],		[1,"Rifleman_W"],	"HeliJunk" ],  
				[  CAMS_Heli_Armed_W,		[0,-100],	[1,"Rifleman_W"],	"HeliJunk" ], 
				[  CAMS_Heli_Transport_W,	[100,0],	[1,"Rifleman_W"],	"HeliJunk" ]  
			],
			[  
			// Pilots                              # and type  |      Patrol  |  spawn  | dest | 'Patrol' options                                                                                                RTB, Roads, Despawn, Height
				[["WEST","COMBAT","RED","COLUMN"],   [[3, "Pilot_W"]],	["TrackRoute",[0,0],[0,0],["COMBAT","NORMAL",["Villages","Villages","Cities","Capitals","Villages","Villages"],false,false,false,100   ]]]
			],
			[   
				// Troops : These are distributed across all aircraft in the division. These lines are identical to the lines in the group section.
				//  Troop options               	# and type of Troops     		Patrol logic | spawn | dest |'Patrol' options
				[["WEST","COMBAT","RED","COLUMN"],	[[1,"Sniper_W"],[1,"Rifleman_W"]],	["PatrolRoute",[0,0],[0,0],["COMBAT","NORMAL",["Villages"],true,false,true,100   ]]]
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once they get on deck
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
			//	  ["LUCNT",["LowUnitCount","GUER",3,0,[0,0]]  ],
			//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
			//	  ["Detect",["Detected","ALL","ALL"] ],
			["Deadpool",["BodyCount",8] ]
			//	  ["Timer",["TIMER", 1800] ],
			//                            offset      radius    time(s)  Name
			//	  ["Zuppa", ["ZuppaCapture",[ [ [-100,-100], 50,         90,  "Point 1" ],
			//                               [ [100,100],   50,         90,  "Point 2" ]   ]]  ],
			//       ["VehDmg1", ["DmgVehicles", "1",0.8]  ],
			//       ["BldgDmg1",["DmgBuildings","2,3,7",1.0]  ]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["Deadpool"     ]],  // 
			//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
			// [["Reinforce","Help_Vehicle","Trig4"]], 
			//	  [["LOSE"],["TIMER", "OR", "VehDmg1", "BldgDmg1"]   ],
			[["END"],["Deadpool"     ]]  
		]      
	]
];
