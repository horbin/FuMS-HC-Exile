// 	Bosmos.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// Spawn location should be 2414.53,22288.7 as this map is specific to Altis
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Bomos" v2.1 static mission for Altis.
	Created by [CiC]red_ned using templates by eraser1 
	19 years of CiC http://cic-gaming.co.uk
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Bosmos", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Bosmos Invasion","hd_objective","ELLIPSE","ColorRed","SolidBorder",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Bosmos Invasion",	// The first line is the title of the pop-up box
			"A large group of Terrorists have invaded Bomos"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Bosmos Invasion Success",
			"Convicts have successfully killed the Terrorists and claimed all the crates"
		],
	  
		// Mission Failure Message
		[
			"Bosmos Invasion Failure!",
			"The Terrorists have buggered off..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["AltisStaticLoot" , 	[[2305.08,22389.6,0.083992], [2364.02,22426.5,0.141647], [2489.12,22425.9,-0.0554581]]],
			["AltisStaticLoot" , 	[[2238.04,22159.5,0.0163651], [2079.59,22185.9,0.262085] ]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Cargo_Tower_V1_No1_F",[2237.35,22160.1,-0.282707],9.54542,[[0.165829,0.986154,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No2_F",[2302.51,22390.6,-0.39859],38.6364,[[0.624376,0.781124,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No3_F",[2487.58,22426,0.287491],59.0909,[[0.857983,0.513677,0],[0,0,1]],false],
				["Land_CncWall4_F",[2256.35,22164,0.150826],287.273,[[-0.954901,0.296925,0],[0,0,1]],false],
				["Land_CncWall4_F",[2254.75,22159.1,-0.136581],288.636,[[-0.947568,0.319555,0],[0,0,1]],false],
				["Land_CncWall4_F",[2253.08,22154.2,-0.595497],289.091,[[-0.945,0.32707,0],[0,0,1]],false],
				["Land_CncWall4_F",[2257.83,22168.9,-0.543625],285.909,[[-0.961698,0.274111,0],[0,0,1]],false],
				["Land_CncWall4_F",[2239.82,22153.4,-1.67255],7.72725,[[0.134458,0.990919,0],[0,0,1]],false],
				["Land_CncWall4_F",[2234.68,22154.2,-1.88926],10,[[0.173648,0.984808,0],[0,0,1]],false],
				["Land_CncWall4_F",[2244.94,22152.8,-1.47111],6.36363,[[0.110838,0.993838,0],[0,0,1]],false],
				["Land_CncWall4_F",[2229.66,22155.2,-1.41071],11.8182,[[0.204807,0.978802,0],[0,0,1]],false],
				["Land_CncWall4_F",[2250.09,22152.3,-1.05058],7.27271,[[0.126592,0.991955,0],[0,0,1]],false],
				["Land_CncWall4_F",[2259.28,22174,-1.01704],285.909,[[-0.961698,0.274111,0],[0,0,1]],false],
				["Land_CncWall4_F",[2257.77,22176.7,-1.12769],192.575,[[-0.217717,-0.976012,0],[-0,0,1]],false],
				["Land_CncWall4_F",[2252.65,22177.9,-1.69871],192.575,[[-0.217717,-0.976012,0],[-0,0,1]],false],
				["Land_CncWall4_F",[2247.56,22178.9,-1.66676],190.757,[[-0.186644,-0.982428,0],[-0,0,1]],false],
				["Land_CncWall4_F",[2242.45,22179.8,-1.41085],190.757,[[-0.186644,-0.982428,0],[-0,0,1]],false],
				["Land_CncWall4_F",[2237.37,22180.8,-0.822983],190.757,[[-0.186644,-0.982428,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[2684.54,22109,-0.263537],309.545,[[-0.771125,0.636684,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[2679.7,22102.2,-1.07833],307.273,[[-0.795759,0.605614,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[2667.37,22086.1,-1.95216],303.636,[[-0.832573,0.553915,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[2663.18,22082.2,-0.874968],307.273,[[-0.795759,0.605614,0],[0,0,1]],false],
				["Land_HBarrierWall_corner_F",[2688.65,22114.8,-0.618547],306.364,[[-0.805266,0.592914,0],[0,0,1]],false],
				["Land_HBarrierWall_corridor_F",[2673,22099.1,-2.33291],37.2727,[[0.605609,0.795762,0],[0,0,1]],false],
				["Land_HBarrierWall_corridor_F",[2673.06,22099,0],37.2727,[[0.605609,0.795762,0],[0,0,1]],false],
				["Land_CncBarrier_F",[2667.54,22098.4,-0.135859],128.636,[0,0,1],true],
				["Land_CncBarrier_F",[2663.9,22097.5,-0.110137],128.636,[0,0,1],true],
				["Land_CncBarrier_F",[2663.91,22094,-0.0747344],128.636,[0,0,1],true],
				["Land_CncBarrier_F",[2660.06,22092.7,-0.0648956],128.429,[0,0,1],true],
				["Land_Mound02_8m_F",[2656.95,22107.3,0.141945],315.909,[[-0.6958,0.718236,0],[0,0,1]],false],
				["Land_LampShabby_F",[2674.16,22096.3,-3.51859],117.727,[[0.885175,-0.465259,0],[0,-0,1]],false],
				["Land_LampShabby_F",[2675.99,22098.8,-2.79319],117.727,[[0.885175,-0.465259,0],[0,-0,1]],false],
				["Land_ScrapHeap_2_F",[2658.6,22132.3,0.144349],81.3637,[[0.988661,0.150162,0],[0,0,1]],false],
				["Land_Scrap_MRAP_01_F",[2649.12,22145.5,-0.253129],89.0952,[0,0,1],true],
				["Land_IronPipes_F",[2652.34,22149.8,1.19209e-007],0,[[0,1,0],[0,0,1]],false],
				["Land_IronPipes_F",[2644.14,22148.9,-0.114095],0,[[0,1,0],[0,0,1]],false],
				["Land_Coil_F",[2647.12,22154.6,0],0,[0,0,1],true],
				["Land_Coil_F",[2642.7,22154.6,0.00531244],359.879,[0,0,1],true],
				["Land_Coil_F",[2638.27,22154.6,0.0106254],359.758,[0,0,1],true],
				["Land_GarbageWashingMachine_F",[2645.07,22141.1,-0.103173],0,[[0,1,0],[0,0,1]],false],
				["Land_GarbagePallet_F",[2649.47,22136.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_ScrapHeap_1_F",[2638.44,22144.3,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[2555.5,22122.7,0.167185],274.091,[[-0.997452,0.0713414,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[2560.49,22132.3,0.144482],274.091,[[-0.997452,0.0713414,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[2557.01,22143.6,0.104097],274.091,[[-0.997452,0.0713414,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[2470.19,22141.8,0.422634],274.091,[[-0.989634,0.0707822,0.124962],[0.124643,-0.00891495,0.992162]],false],
				["Land_Cargo_House_V2_F",[2468.87,22130.6,0.471004],274.091,[[-0.9962,0.0712519,0.0500942],[0.0499666,-0.0035738,0.998744]],false],
				["Land_d_Windmill01_F",[2633.98,22304,0],210.909,[[-0.513676,-0.857984,0],[-0,0,1]],false],
				["Land_d_Windmill01_F",[2648.82,22362.5,0.313301],209.091,[[-0.486198,-0.873848,0],[-0,0,1]],false],
				["Land_Cargo_House_V2_F",[2322.87,22395.2,0.860031],80.0001,[[0.984808,0.173646,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[2322.46,22385.1,0.92025],104.546,[[0.967946,-0.251157,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[2315.91,22375.6,0.984314],138.182,[[0.666766,-0.745267,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[2304.62,22370,1.21142],166.364,[[0.235753,-0.971813,0],[0,-0,1]],false],
				["Land_LampHalogen_F",[2320.17,22380,0.188919],40,[[0.642788,0.766044,0],[0,0,1]],false],
				["Land_LampHalogen_F",[2310.75,22372.6,0.188919],64.5455,[[0.902927,0.429794,0],[0,0,1]],false],
				["Land_LampHalogen_F",[2323.44,22390.3,0.188919],350.909,[[-0.158002,0.987439,0],[0,0,1]],false],
				["Land_CncBarrierMedium4_F",[2491.05,22414,-0.39222],345.455,[[-0.25114,0.967951,0],[0,0,1]],false],
				["Land_CncBarrierMedium4_F",[2477.28,22423.5,-0.291321],70.4545,[[0.942376,0.334555,0],[0.0418082,-0.117765,0.992161]],false],
				["Land_CncBarrierMedium4_F",[2482.03,22416.2,-0.492416],40.0863,[[0.643941,0.765075,0],[0.0574597,-0.0483621,0.997176]],false],
				["Land_CncBarrierMedium4_F",[2478.83,22431.9,-0.389885],120.021,[[0.865842,-0.500317,0],[-0.0250642,-0.0433758,0.998744]],false],
				["Land_HBarrier_5_F",[2327.16,22390.1,-0.18335],268.182,[[-0.999497,-0.0317244,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[2311.55,22370.3,-0.138321],330.455,[[-0.493107,0.869969,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2321.85,22379,-0.199486],305,[[-0.819152,0.573577,0],[0,0,1]],false],
				["Land_Net_Fence_Gate_F",[2074.6,22178.4,0],18.1818,[[0.312033,0.950071,0],[0,0,1]],false],
				["Land_Net_Fence_Gate_F",[2068.45,22180.2,0],19.0909,[[0.327068,0.945001,0],[0,0,1]],false],
				["Land_BagBunker_Tower_F",[2368.9,22420.2,0],258.636,[0,0,1],true],
				["Land_HBarrier_5_F",[2376.86,22422,-0.0882301],76.2998,[[0.971548,0.236842,0],[0.0295962,-0.121406,0.992162]],false],
				["Land_HBarrier_5_F",[2375.49,22429.1,-0.433384],80.9164,[[0.987459,0.157875,0],[0.0275501,-0.172317,0.984656]],false],
				["Land_HBarrier_5_F",[2378.21,22415.4,-0.0709457],76.7325,[[0.973309,0.229498,0],[0.0172361,-0.0730988,0.997176]],false],
				["Land_HBarrier_5_F",[2359.13,22428.9,-0.0334396],79.6983,[[0.98388,0.178831,0],[0.0312071,-0.171693,0.984656]],false],
				["Land_HBarrier_5_F",[2360.25,22422.1,-0.110985],81.6806,[[0.989477,0.144691,0],[0.0180815,-0.123651,0.992161]],false],
				["Land_HBarrier_5_F",[2361.11,22415.1,0.0211029],82.0134,[[0.990301,0.138942,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2371.27,22433.6,-0.0514984],350.207,[[-0.170089,0.985429,0],[0.220358,0.0380345,0.974677]],false],
				["Land_HBarrier_5_F",[2364.29,22432.5,-0.375572],350.683,[[-0.161896,0.986808,0],[0.196498,0.0322376,0.979974]],false],
				["Land_Stone_4m_F",[2649.53,22374.1,-0.0191135],11.3641,[[0.197043,0.980395,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2653.44,22373.4,-0.00943756],187.728,[[-0.13447,-0.990918,0],[-0,0,1]],false],
				["Land_Stone_4m_F",[2637.47,22357.6,-0.182674],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2635.57,22354.2,-0.319784],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2633.66,22350.7,-0.516186],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2631.79,22347.3,-0.103943],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Mound02_8m_F",[2581.16,22398.6,0.0663223],300.909,[[-0.857984,0.513676,0],[0,0,1]],false],
				["Land_Mound02_8m_F",[2567.99,22398.5,0.322994],300.909,[[-0.857984,0.513676,0],[-0.0481358,-0.0804004,0.9956]],false],
				["Land_Stone_4m_F",[2629.94,22343.8,0.110285],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2628.04,22340.3,0.13842],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2626.22,22336.9,0.147802],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2624.36,22333.5,0.244816],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2622.54,22330.1,0.354067],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Stone_4m_F",[2620.69,22326.6,0.0684938],299.091,[[-0.873848,0.486199,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V2_F",[2645.2,22285.6,0.0186996],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[2603.49,22282.4,0.0286446],340.455,[[-0.334555,0.942376,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[2599.74,22269.1,0.137274],331.364,[[-0.478641,0.87658,0.0500967],[0.0240085,-0.043969,0.998744]],false],
				["Land_Cargo_House_V2_F",[2587.83,22261.8,0.194265],326.364,[[-0.55392,0.83257,0],[0,0,1]],false],
				["Land_d_Shop_02_V1_F",[2624.89,22185.9,-1.12626],42.2727,[[0.67266,0.739952,0],[0,0,1]],false],
				["Land_d_Shop_02_V1_F",[2621.94,22206.5,-1.81614],221.364,[[-0.660835,-0.750531,0],[-0,0,1]],false],
				["Land_d_Shop_02_V1_F",[2642.63,22097.9,-1.11794],29.0908,[[0.486195,0.87385,0],[0,0,1]],false],
				["Land_Wreck_HMMWV_F",[2660.41,22127.2,0],91.3636,[[0.999717,-0.0237979,0],[0,-0,1]],false],
				["Land_Wreck_Skodovka_F",[2645.37,22106,-0.699988],305.909,[[-0.809949,0.586501,0],[0,0,1]],false],
				["Land_Wreck_Truck_F",[2655.96,22136.7,0],85.4546,[[0.996855,0.079249,0],[0,0,1]],false],
				["Land_Wreck_Truck_dropside_F",[2652.81,22141,0],83.6363,[[0.993838,0.110839,0],[0,0,1]],false],
				["Land_ScrapHeap_1_F",[2645.8,22133.4,-0.607368],287.273,[[-0.954902,0.296921,0],[0,0,1]],false],
				["Land_Wreck_Plane_Transport_01_F",[2554.2,22345.5,-1.72118],110.909,[[0.934148,-0.356886,0],[0,-0,1]],false],
				["Land_BagFence_Round_F",[2300.39,22182.6,-0.29158],242.727,[[-0.888836,-0.458226,0],[-0,0,1]],false],
				["Land_BagFence_Round_F",[2298.57,22183.2,-0.156364],160,[[0.342019,-0.939693,0],[0,-0,1]],false],
				["Land_BagFence_Long_F",[2301.41,22179.9,-0.381905],71.8182,[[0.950071,0.312033,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[2297.05,22183.8,-0.199203],244.091,[[-0.899488,-0.436945,0],[-0,0,1]],false],
				["Land_BagFence_Long_F",[2295.85,22186.3,-0.25943],244.091,[[-0.899489,-0.436944,0],[-0,0,1]],false]
			]
 		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[2,"Rifleman_E"]  ],  ["BoxPatrol",	[2596.875,22186.306641,0.00127316],[2596.875,22186.306641,0.00127316],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[2,"SMG_E"]  ],   	["BoxPatrol",	[2550.0390625,22133.759766,0.00175858],[2550.0390625,22133.759766,0.00175858],[25]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[2,"Rifleman_E"]  ],  ["Loiter",		[2467.342285,22136.255859,0.00204468],[2467.342285,22136.255859,0.00204468],[25]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[2237.369141,22167.857422,0.00189209],[2237.369141,22167.857422,0.00189209],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_E"],[1,"LMG_E"]  ],  	["Loiter",		[2292.80127,22179.146484,0.0014801],[2292.80127,22179.146484,0.0014801],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_E"],[1,"SMG_E"]  ],  	["Loiter",		[2367.587402,22424.962891,0.00186157],[2367.587402,22424.962891,0.00186157],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["Loiter",		[2556.192139,22336.0585938,0.00190735],[2556.192139,22336.0585938,0.00190735],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[2233.165527,22158.974609,18.0527191],[2233.165527,22158.974609,18.0527191],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[2297.575439,22390.974609,17.726105],[2297.575439,22390.974609,17.726105],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[2483.620361,22428.603516,18.00691986],[2483.620361,22428.603516,18.00691986],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[2646.0808105,22284.441406,4.315912],[2646.0808105,22284.441406,4.315912],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Hunter_E"]  ],   				["BoxPatrol",	[2482.924561,22426.599609,0.00146484],[2482.924561,22426.599609,0.00146484],[50]   ]],

		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[2658.112061,22109.888672,0.00101995],[2658.112061,22109.888672,0.00101995],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Hunter_E"]  ],   				["Explore",		[0,0],[0,0],[150]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["Buildings",	[2308.292725,22387.501953,0.00139618],[2308.292725,22387.501953,0.00139618],[15]   ]],

		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"SMG_E"]  ],   	["Buildings",	[0,0],[0,0],[100]   ]]

	],
	[			// Vehicles
		[  		// Convoy #1                     
			[   // Vehicle                     Offset     				Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"   		,[((round random 100)-50),((round random 100)-50)],						[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[2505.22,22432.2,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[2006.28,22156.8,4.87243],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[2079.59,22185.9,0.262085],	[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[2247.48,22157.4,0],			[0],     	"None" ]
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
