// 	Kastro.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 3064.69,13170 as this map is specific to Altis
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Kastro Castle" v2.1 static mission for Altis.
	Created by [CiC]red_ned using templates by eraser1 
	Credits to Lunchbox for mapping
	19 years of CiC http://cic-gaming.co.uk
	easy/mod/difficult/hardcore - reworked by [CiC]red_ned http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Kastro", 250], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Kastro Castle","hd_objective","ELLIPSE","ColorRed","SolidBorder",250],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Kastro Castle",	// The first line is the title of the pop-up box
			"Terrorists have invaded the castle gift shop"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Kastro Castle Success",
			"Convicts have successfully killed the Terrorists and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Kastro Castle Failure!",
			"Terrorists got bored and buggered off taking all the goodies..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["AltisStaticLoot" , 	[[3049.73,13202.9,18.3091],[2995.75,13238.9,-0.0138435],[2992.14,13289.1,7.87374],[3053.48,13255.4,-0.0370255]]],
			["AltisStaticLoot" , 	[[3151.6,13084.6,8.69122],[3177.64,13150.8,3.96083],[3118.58,13210.5,0] ]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Cargo_HQ_V1_F",[3180.35,13148.1,0.743511],360,[[1.74846e-007,1,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[3204.37,13189,13.8068],270.455,[[-0.999968,0.00794117,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[3201.08,13094.2,11.9687],271.818,[[-0.999497,0.0317249,0],[0,0,1]],false],
				["Land_BagFence_Short_F",[3135.45,13076.6,4.5501],29.5455,[[0.493115,0.869964,0],[0,0,1]],false],
				["Land_BagFence_Short_F",[3133.87,13077.4,4.16687],37.2727,[[0.605609,0.795762,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[3131.84,13077.9,4.30487],356.364,[[-0.0634166,0.997987,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[3128.72,13077.7,4.95618],356.364,[[-0.0634166,0.997987,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[3125.88,13077.5,4.82941],356.364,[[-0.0634166,0.997987,0],[-0.192475,-0.0122308,0.981226]],false],
				["Land_BagFence_Long_F",[3120.28,13077.3,4.33146],356.364,[[-0.0634166,0.997987,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[3123.02,13077.3,4.89867],356.364,[[-0.0634166,0.997987,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[3123.02,13077.3,4.32752],356.818,[[-0.0555076,0.998458,0],[-0.167954,-0.0093371,0.985751]],false],
				["Land_BagFence_Long_F",[3117.41,13077.4,4.07681],9.091,[[0.158003,0.987439,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[3115.35,13077.3,3.76051],343.182,[[-0.289332,0.957229,0],[0,0,1]],false],
				["Land_BagFence_Long_F",[3146.22,13076.3,9.3385],359,[[-0.0174521,0.999848,0],[-0.452568,-0.00789948,0.891695]],false],
				["Land_BagBunker_Tower_F",[3073.4,13087,8.37717],283.182,[[-0.973651,0.228045,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3134.71,13088.3,-0.0903473],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_Cargo_Tower_V1_No1_F",[3023.51,13114,0.249813],104.091,[[0.96991,-0.243463,0],[0,-0,1]],false],
				["Land_HBarrierBig_F",[3030.55,13106.2,3.97356],31.8183,[[0.527227,0.849724,0],[-0.242841,0.150675,0.958293]],false],
				["Land_HBarrier_3_F",[3017.32,13110.9,8.77987],12.7273,[[0.220311,0.97543,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[3021.25,13110.9,6.60207],19.5455,[[0.334555,0.942376,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[2979.6,13154.6,5.0471],272.273,[[-0.999213,0.0396615,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No2_F",[2991.7,13294.8,11.057],257.273,[[-0.975431,-0.220306,0],[-0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[3093.56,13281.5,0.263166],222.727,[[-0.678506,-0.734595,0],[-0,0,1]],false],
				["Land_HBarrierTower_F",[2961.56,13245.5,1.09501],89.0909,[[0.999874,0.0158664,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[2958.7,13241,2.86916],50.4545,[[0.771119,0.636691,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[2958.4,13249.9,2.63117],312.273,[[-0.739948,0.672664,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2978.57,13283.1,1.7298],17.2728,[[0.296922,0.954902,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2978.55,13283.1,2.97138],17.2728,[[0.296922,0.954902,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2983.51,13283.1,1.80709],343.182,[[-0.289332,0.957229,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2983.51,13283.1,2.69305],343.182,[[-0.289332,0.957229,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2986.79,13287.2,5.57966],270,[[-1,4.88762e-007,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2986.1,13291.6,8.87492],69.0909,[[0.934148,0.356887,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[2984.03,13297,12.0924],69.0909,[[0.934148,0.356887,0],[0,0,1]],false],
				["Land_Crash_barrier_F",[3018.99,13288.5,4.10043],206.197,[[-0.441459,-0.897281,0],[-0,0,1]],false],
				["Land_Crash_barrier_F",[3025.55,13287,3.52871],180.288,[[-0.00502665,-0.999987,0],[-0,0,1]],false],
				["Land_Crash_barrier_F",[3032.55,13286.9,3.2905],180.288,[[-0.00502665,-0.999987,0],[-0,0,1]],false],
				["Land_Crash_barrier_F",[3039.55,13286.9,3.2905],180.288,[[-0.00502665,-0.999987,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[3047.33,13289.3,4.53235],341.364,[[-0.319554,0.947568,0],[0,0,1]],false],
				["Land_HBarrier_1_F",[3044.28,13288,3.9212],319.091,[[-0.654859,0.755751,0],[0,0,1]],false],
				["Land_HBarrier_1_F",[3043.5,13287.3,3.40563],321.364,[[-0.62437,0.781129,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No3_F",[3138.34,13243.4,3.41757],275.455,[[-0.995471,0.0950639,0],[0,0,1]],false],
				["Land_BagBunker_Small_F",[3264.85,13093.3,-0.619246],334.545,[[-0.429802,0.902923,0],[0,0,1]],false],
				["Land_BagBunker_Small_F",[3273.16,13100.6,-0.100368],283.636,[[-0.971813,0.235752,0],[0,0,1]],false],
				["Land_BarGate_F",[3271.35,13094.7,0.167815],140,[[0.642787,-0.766045,0],[0,-0,1]],false],
				["Land_BagFence_Long_F",[3273.07,13104.2,0],253.636,[[-0.959491,-0.281738,0],[-0,0,1]],false],
				["Land_Cargo_HQ_V1_F",[3091.05,13200.3,0.561001],189.545,[[-0.165822,-0.986156,0],[-0,0,1]],false],
				["Land_HelipadSquare_F",[3162.37,13172.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Wreck_Heli_Attack_01_F",[3085.25,13102,-0.724144],310.454,[[-0.760926,0.648839,0],[0,0,1]],false],
				["Land_TacticalBacon_F",[3099.6,13201.8,0],0,[[0,1,0],[0,0,1]],false],
				["MapBoard_altis_F",[3083.56,13196,1.2545],230.454,[[-0.771114,-0.636697,0],[-0,0,1]],false],
				["Land_TableDesk_F",[3086.16,13197.7,1.10786],189.091,[[-0.158003,-0.987439,0],[-0,0,1]],false],
				["Land_OfficeChair_01_F",[3086.05,13196.9,1.13114],197.273,[[-0.296925,-0.954901,0],[-0,0,1]],false],
				["Land_Laptop_device_F",[3086.28,13198.2,1.96549],185.909,[[-0.102949,-0.994687,0],[-0,0,1]],false],
				["Land_Tablet_02_F",[3085.6,13197.8,1.9522],328.182,[[-0.527223,0.849727,0],[0,0,1]],false],
				["Land_MapBoard_F",[3087.47,13195.2,1.10374],152.273,[[0.465259,-0.885175,0],[0,-0,1]],false],
				["Land_WaterCooler_01_new_F",[3084.79,13195.9,1.26621],190,[[-0.173648,-0.984808,0],[-0,0,1]],false],
				["Land_DataTerminal_01_F",[3089.81,13197.5,1.05593],278.636,[[-0.988662,0.150157,0],[0,0,1]],false],
				["Land_PaperBox_open_full_F",[3093.89,13196.9,1.04873],280.909,[[-0.981929,0.18925,0],[0,0,1]],false],
				["Land_MetalCase_01_large_F",[3095.7,13198.6,1.23101],9.0909,[[0.158001,0.987439,0],[0,0,1]],false],
				["Land_Box_AmmoOld_F",[3086.9,13205.4,1.13428],96.3636,[[0.993839,-0.110837,0],[0,-0,1]],false],
				["Land_Metal_rack_Tall_F",[3082.83,13197.8,1.41442],278.636,[[-0.988662,0.150157,0],[0,0,1]],false],
				["Land_Metal_rack_Tall_F",[3082.49,13198.9,1.41442],278.636,[[-0.988662,0.150157,0],[0,0,1]],false],
				["Land_Ammobox_rounds_F",[3082.53,13198.9,2.29125],100.909,[[0.981929,-0.18925,0],[0,-0,1]],false],
				["Land_Ammobox_rounds_F",[3082.31,13197.8,2.29125],100.909,[[0.981929,-0.18925,0],[0,-0,1]],false],
				["Land_Ammobox_rounds_F",[3082.34,13197.7,1.51608],100.909,[[0.981929,-0.18925,0],[0,-0,1]],false],
				["Land_File_research_F",[3086.71,13197.5,1.89957],27.2727,[[0.458226,0.888836,0],[0,0,1]],false],
				["Land_SatellitePhone_F",[3082.58,13197.9,3.0271],280.455,[[-0.983398,0.181463,0],[0,0,1]],false],
				["Land_BottlePlastic_V2_F",[3086.88,13197.6,1.8967],0,[[0,1,0],[0,0,1]],false],
				["Land_CampingTable_small_F",[3083.48,13203.6,1.22092],280.909,[[-0.981929,0.18925,0],[0,0,1]],false],
				["Exile_Cosmetic_UAV",[3083.45,13203.6,2.03317],8.1818,[[0.142314,0.989821,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[3089.5,13204.6,1.22128],278.182,[[-0.989821,0.142318,0],[0,0,1]],false],
				["Fridge_01_closed_F",[3083.39,13202.7,1.37901],279.091,[[-0.987439,0.158003,0],[0,0,1]],false],
				["Land_Rack_F",[3091.78,13206.1,1.41844],100,[[0.984808,-0.173648,0],[0,-0,1]],false],
				["Land_Rack_F",[3093.21,13206.1,1.47969],100,[[0.984808,-0.173648,0],[0,-0,1]],false],
				["Land_BakedBeans_F",[3091.28,13206.3,2.49731],114.545,[[0.909635,-0.415408,0],[0,-0,1]],false],
				["Land_BakedBeans_F",[3092.39,13206.4,1.55827],30.9091,[[0.513677,0.857983,0],[0,0,1]],false],
				["Land_Can_V3_F",[3093.31,13205.8,2.30704],0,[[0,1,0],[0,0,1]],false],
				["Land_CerealsBox_F",[3092.77,13206.1,2.57247],0,[[0,1,0],[0,0,1]],false],
				["Fridge_01_closed_F",[3094.85,13205.6,1.56696],9.54547,[[0.16583,0.986154,0],[0,0,1]],false],
				["Fridge_01_closed_F",[3095.34,13205.8,1.60316],9.54547,[[0.16583,0.986154,0],[0,0,1]],false],
				["Land_Microwave_01_F",[3094.46,13206.2,2.61023],6.36364,[[0.110838,0.993838,0],[0,0,1]],false],
				["Land_FlatTV_01_F",[3095.3,13205.7,2.65439],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_RiceBox_F",[3091.72,13206.4,1.84035],0,[[0,1,0],[0,0,1]],false],
				["Land_ScrapHeap_2_F",[3113.63,13194.7,0.496262],183.182,[[-0.0555083,-0.998458,0],[-0,0,1]],false],
				["Land_PaperBox_closed_F",[3097.54,13196.4,0],58.6364,[[0.853882,0.520467,0],[0,0,1]],false],
				["Land_PaperBox_open_empty_F",[3098,13198.9,0],38.1818,[[0.618159,0.786053,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3123.17,13174.9,0],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3117.26,13176.9,0],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3111.35,13178.9,0],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3105.43,13180.9,0],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3099.52,13182.8,0],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3093.61,13184.8,0],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3087.7,13186.8,0],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3076.2,13191,0.0996552],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3070.29,13192.9,0.0996552],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[3064.38,13194.9,0.0996552],18.6364,[[0.319562,0.947565,0],[0,0,1]],false],
				["Land_HelipadSquare_F",[3133.95,13201.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_BarGate_F",[3205.73,13104.4,0.710495],89.5454,[[0.999969,0.00793385,0],[0,0,1]],false],
				["Land_BarGate_F",[3171.74,13122.7,0],92.2727,[[0.999213,-0.0396559,0],[0,-0,1]],false],
				["Land_BagBunker_Small_F",[3193.43,13131.4,3.54037],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[3204.45,13117,11.4799],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[3082.06,13192.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[3001.54,13285.5,3.08523],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[3032.06,13119.8,0.537224],0,[[0,1,0],[0,0,1]],false],
				["Land_LampHalogen_F",[3171.69,13117.4,0],53.1818,[[0.800541,0.599278,0],[0,0,1]],false],
				["Land_LampHalogen_F",[3196,13124.4,0],304.545,[[-0.823681,0.567054,0],[0,0,1]],false],
				["Land_LampHalogen_F",[3207.13,13094.5,0],132.727,[[0.734595,-0.678506,0],[0,-0,1]],false],
				["Land_LampHalogen_F",[3096.13,13193.9,0],142.727,[[0.605613,-0.795759,0],[0,-0,1]],false],
				["Land_LampHalogen_F",[3084.6,13189.2,0],286.818,[[-0.957229,0.289333,0],[0,0,1]],false],
				["Land_LampHalogen_F",[3128.43,13178.1,0],294.091,[[-0.912898,0.408188,0],[0,0,1]],false],
				["Land_LampHalogen_F",[3268.03,13104.8,-0.709259],255,[[-0.965926,-0.258819,0],[-0,0,1]],false],
				["Land_LampHalogen_F",[3208.59,13110.7,-0.163017],228.636,[[-0.750526,-0.66084,0],[-0,0,1]],false]
			]
 		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"SMG_E"]  ],   						["Loiter",		[3268.481445,13100.238281,0.00134373],[3268.481445,13100.238281,0.00134373],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Rifleman_E"]  ],   				["Loiter",		[3200.346924,13104.117188,0.00228882],[3200.346924,13104.117188,0.00228882],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [2,"Hunter_E"]  ],   					["Loiter",		[3163.12085,13127.618164,0.00205994],[3163.12085,13127.618164,0.00205994],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   					["TowerGuard",	[3022.249023,13118.271484,16.580124],[3022.249023,13118.271484,16.580124],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   					["TowerGuard",	[2994.250977,13292.257813,26.59515],[2994.250977,13292.257813,26.59515],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   					["TowerGuard",	[3139.492188,13240.59668,20.269386],[3139.492188,13240.59668,20.269386],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   					["TowerGuard",	[3205.129395,13189.0576172,19.355854],[3205.129395,13189.0576172,19.355854],[100, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   					["TowerGuard",	[3201.924805,13094.3125,16.595306],[3201.924805,13094.3125,16.595306],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Hunter_E"]  ],  	 				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],   	["Buildings",	[3081.108643,13180.0175781,0.00157547],[3081.108643,13180.0175781,0.00157547],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"SMG_E"]  ],   		["Buildings",	[0,0],[0,0],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Hunter_E"]  ],   		["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[3175,13121.1,14.3893],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[3176.8,13143,6.37492],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[3076.92,13228.2,6.1297],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[3120.96,13206.3,0],			[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[3179.46,13165,0],				[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[3108.45,13156.5,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[3133.36,13097.6,0.0566711],	[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[3118.96,13102.7,10.7199],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[3164.29,13188.2,0],			[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list ND Hv less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [10, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
