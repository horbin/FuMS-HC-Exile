// 	AIBase1.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 4129.35,11023 as this map is specific to Chernarus
// 	This mission was ported from Clarkycal/ClarkycalLad mission that he has developed for the DMS mission system
//  Includes additoinal work by 
//	ORIGINAL CREDITS
/*
	"Ai Base" DMS static mission for Chernarus.
	Created by Clarkycal/ClarkycalLad using templates by eraser1 with mission code layout and features inspired by mission files from [CiC]red_ned and Riker. Thanks guys!	
	http://www.exilemod.com/topic/21734-release-dms-chernarus-static-ai-base-mission/
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["AIBase1", 250], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Military Soldiers Base","hd_objective","ELLIPSE","ColorRed","SolidBorder",250],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Military Soldiers Base",	// The first line is the title of the pop-up box
			"A large group of Military Soldiers have built a base and are awaiting your arrival....."		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Military Soldiers Base!",
			"Convicts have successfully killed the Military Soldiers and claimed all the loot for themselves!"
		],
	  
		// Mission Failure Message
		[
			"Military Soldiers Base",
			"The Military Soldiers have finished their beers and buggered off..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["AIBase1Loot" , 		[4085.28,10946.1,0]	],
			["AIBase1Loot" , 		[4134.72,11025.9,0]	],
			["AIBase1MedLoot" , 	[4173.56,11038.2,0]	],
			["AIBase1BuildLoot", 	[4044.35,10990.8,0]	],
			["AIBase1HELoot" , 		[
										[4183.65,10991,0],
										[4136.48,10937.9,0],
										[4101.73,11053.2,0],
										[4101.73,11053.2,0],
										[4097.91,10996,0]
									]
			]
		], // Win loot, offset location - spawns after mission success
		//["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	
		// Loot vehicle
		// Class Name, 			Offset, 	Rotation, 	Condition Array [Fuel, Ammo, Engine Damage, FuelTank Damage, Hull Damage, Optional Fire/Smoke parameter.
		//		Effect options: "FIRE_SMALL", "FIRE_MEDIUM", "FIRE_BIG", "SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG" 
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5]				]  
		// ["I_UGV_01_rcws_F",	[0,100],   	0, 			[.5,   1,     .5,         .5,         .5], "FIRE_SMALL"]   
		
		// SUGGESTED SPAWN POINTS FROM ORIGINAL MAP 
		// USED TO FIND GOOD LOCATIONS FOR SPAWN
		["Sign_Arrow_Blue_F", [4085,11009,0], 0, 0],
		["Sign_Arrow_Blue_F", [4077.07,10979.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [4102.46,10956.9,0], 0, 0],
		["Sign_Arrow_Blue_F", [4148.29,10971,0], 0, 0],
		["Sign_Arrow_Blue_F", [4109.96,11021,0], 0, 0],
		["Sign_Arrow_Blue_F", [4102.27,11081.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [4157.98,11104.7,0], 0, 0],
		["Sign_Arrow_Blue_F", [4196.95,11048.1,0], 0, 0],
		
		
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor-ASL", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_A_statue02",[4061.453369,11014.639648,336.601013],[[-0.720841,-0.692763,-0.0216243],[-0.0299852,0,0.99955]],[false,false]],
				["WarfareBAircraftFactory_CDF",[4154.208496,10979.507813,338.820099],[[-0.732061,0.681128,-0.0122979],[-0.00749312,0.0100004,0.999922]],[false,false]],
				["RU_WarfareBAircraftFactory",[4192.990723,11057.09375,338.671356],[[-0.77266,0.634804,-0.00455907],[-0.0100007,-0.00499109,0.999938]],[false,false]],
				["Ins_WarfareBArtilleryRadar",[4107,10938.366211,338.286499],[[-0.750861,0.66046,0],[0,0,1]],[false,false]],
				["Land_Mil_ControlTower_EP1",[4121.652344,10920.859375,339.0680542],[[0.732248,-0.681039,0],[0,0,1]],[false,false]],
				["Land_BagFenceRound",[4127.885742,11032.256836,338.0514832],[[-0.797605,0.60304,-0.0129781],[-0.0124963,0.00499106,0.999909]],[false,false]],
				["Land_BagFenceRound",[4127.693359,11034.490234,338.0359192],[[-0.704169,-0.710013,-0.00525628],[-0.0124963,0.00499106,0.999909]],[false,false]],
				["Land_BagFenceRound",[4125.717285,11032.0341797,338.013031],[[0.584983,0.811018,0.00675525],[-0.0149978,0.00248947,0.999884]],[false,false]],
				["Land_BagFenceRound",[4124.310059,11031.923828,337.999023],[[-0.792386,0.609873,-0.0134039],[-0.0149978,0.00248947,0.999884]],[false,false]],
				["Land_BagFenceRound",[4121.95752,11033.935547,337.950714],[[0.732702,-0.680431,0.0126843],[-0.0149978,0.00248947,0.999884]],[false,false]],
				["Land_BagFenceRound",[4122.141113,11031.695313,337.961304],[[0.638848,0.769312,0.00573333],[-0.0149978,0.00500282,0.999875]],[false,false]],
				["Land_BagFenceRound",[4127.62207,11035.788086,338.0302429],[[-0.69831,0.71569,-0.0122995],[-0.0124963,0.00499106,0.999909]],[false,false]],
				["Land_BagFenceRound",[4127.500488,11037.960938,338.0212708],[[-0.637097,-0.77076,-0.00604301],[-0.0124963,0.00248956,0.999919]],[false,false]],
				["Land_BagFenceRound",[4125.272461,11037.813477,337.988068],[[0.736953,-0.675856,0.0108927],[-0.0124963,0.00248956,0.999919]],[false,false]],
				["Land_BagFenceRound",[4123.918457,11037.617188,337.97757],[[-0.601169,-0.799091,-0.00702773],[-0.0149978,0.00248947,0.999884]],[false,false]],
				["Land_BagFenceRound",[4121.757324,11037.396484,337.939056],[[0.742234,-0.670019,0.0128014],[-0.0149978,0.00248947,0.999884]],[false,false]],
				["Land_BagFenceRound",[4121.946289,11035.15625,337.948517],[[0.615421,0.788165,0.00726871],[-0.0149978,0.00248947,0.999884]],[false,false]],
				["Land_BagFenceRound",[4121.881348,11107.501953,338.611145],[[-0.755811,0.654748,0.00742115],[-0.00750901,-0.0199998,0.999772]],[false,false]],
				["Land_BagFenceRound",[4121.770508,11109.674805,338.663147],[[-0.675964,-0.736668,-0.0198136],[-0.00750901,-0.0199998,0.999772]],[false,false]],
				["Land_BagFenceRound",[4119.724609,11107.275391,338.587219],[[0.658294,0.752496,0.0199854],[-0.00750107,-0.0199908,0.999772]],[false,false]],
				["Land_BagFenceRound",[4118.302734,11107.170898,338.57666],[[-0.638296,0.769718,0.0106018],[-0.00750107,-0.0199908,0.999772]],[false,false]],
				["Land_BagFenceRound",[4115.958984,11109.189453,338.607056],[[0.721229,-0.692645,-0.00844472],[-0.00750107,-0.0199998,0.999772]],[false,false]],
				["Land_BagFenceRound",[4116.144043,11106.933594,338.552979],[[0.467092,0.883955,0.0211794],[-0.00750107,-0.0199908,0.999772]],[false,false]],
				["Land_BagFenceRound",[4121.692871,11110.966797,338.677429],[[-0.761604,0.647999,0.00753236],[-0.00499145,-0.0174886,0.999835]],[false,false]],
				["Land_BagFenceRound",[4121.504883,11113.210938,338.727417],[[-0.677569,-0.735237,-0.0180921],[-0.00500338,-0.0199911,0.999788]],[false,false]],
				["Land_BagFenceRound",[4119.342285,11112.994141,338.707458],[[0.82342,-0.567409,-0.00516759],[-0.00750107,-0.0199908,0.999772]],[false,false]],
				["Land_BagFenceRound",[4117.994141,11112.797852,338.697784],[[-0.517219,-0.855596,-0.0209885],[-0.00750107,-0.0199908,0.999772]],[false,false]],
				["Land_BagFenceRound",[4115.76416,11112.641602,338.673889],[[0.797628,-0.60312,-0.00607515],[-0.00750107,-0.0199908,0.999772]],[false,false]],
				["Land_BagFenceRound",[4115.943359,11110.40332,338.621613],[[0.696193,0.717587,0.0195783],[-0.00750107,-0.0199998,0.999772]],[false,false]],
				["Land_BagFenceRound",[4226.0986328,11038.552734,338.89328],[[-0.76358,0.6457,-0.00412044],[-0.00750107,-0.00248932,0.999969]],[false,false]],
				["Land_BagFenceRound",[4225.989746,11040.734375,338.89679],[[-0.662105,-0.749395,-0.00496663],[-0.00750107,0,0.999972]],[false,false]],
				["Land_BagFenceRound",[4223.941406,11038.341797,338.87384],[[0.603636,0.797245,0.00500492],[-0.00500338,-0.00248936,0.999984]],[false,false]],
				["Land_BagFenceRound",[4222.522461,11038.220703,338.868713],[[-0.762074,0.647486,-0.00220116],[-0.00500338,-0.00248936,0.999984]],[false,false]],
				["Land_BagFenceRound",[4220.175781,11040.249023,338.859772],[[0.748845,-0.662734,0.0037468],[-0.00500338,0,0.999987]],[false,false]],
				["Land_BagFenceRound",[4220.361328,11038.0166016,338.855133],[[0.605558,0.795785,0.00500369],[-0.00499145,-0.00248936,0.999984]],[false,false]],
				["Land_BagFenceRound",[4225.91748,11042.0400391,338.896118],[[-0.764486,0.644615,-0.00573462],[-0.00750107,0,0.999972]],[false,false]],
				["Land_BagFenceRound",[4225.725098,11044.266602,338.897278],[[-0.671172,-0.74125,-0.00873459],[-0.00750107,-0.0049912,0.999959]],[false,false]],
				["Land_BagFenceRound",[4223.568848,11044.0585938,338.877441],[[0.772764,-0.634689,0.0022865],[-0.00500338,-0.00248936,0.999984]],[false,false]],
				["Land_BagFenceRound",[4222.21582,11043.859375,338.872101],[[-0.525459,-0.850815,-0.0026291],[-0.00500338,0,0.999987]],[false,false]],
				["Land_BagFenceRound",[4219.97998,11043.712891,338.858459],[[0.644327,-0.764735,0.00483328],[-0.00750107,0,0.999972]],[false,false]],
				["Land_BagFenceRound",[4220.158691,11041.467773,338.859711],[[0.57862,0.815592,0.00289509],[-0.00500338,0,0.999987]],[false,false]],
				["Land_BagFenceRound",[4154.265625,10942.0605469,339.0510559],[[-0.68799,0.725711,-0.00361372],[0,0.0049795,0.999988]],[false,false]],
				["Land_BagFenceRound",[4154.150879,10944.240234,339.0388184],[[-0.625916,-0.779888,0.00194174],[0,0.00248975,0.999997]],[false,false]],
				["Land_BagFenceRound",[4152.104492,10941.841797,339.052063],[[0.555064,0.831797,-0.00414198],[0,0.0049795,0.999988]],[false,false]],
				["Land_BagFenceRound",[4150.686035,10941.720703,339.0525818],[[-0.767403,0.641157,-0.00319268],[0,0.0049795,0.999988]],[false,false]],
				["Land_BagFenceRound",[4148.339355,10943.748047,339.0401306],[[0.78216,-0.62307,0.00310261],[0,0.0049795,0.999988]],[false,false]],
				["Land_BagFenceRound",[4148.524902,10941.516602,339.0474548],[[0.678717,0.7344,-0.000138631],[-0.00248975,0.00248975,0.999994]],[false,false]],
				["Land_BagFenceRound",[4154.0800781,10945.547852,339.0367737],[[-0.739557,0.673092,-0.00167584],[0,0.00248975,0.999997]],[false,false]],
				["Land_BagFenceRound",[4153.885742,10947.775391,339.0299683],[[-0.625031,-0.780597,0.0019435],[0,0.00248975,0.999997]],[false,false]],
				["Land_BagFenceRound",[4151.724609,10947.547852,339.0292664],[[0.748135,-0.663537,0.00351473],[-0.00248975,0.00248975,0.999994]],[false,false]],
				["Land_BagFenceRound",[4150.371582,10947.359375,339.0276489],[[-0.69162,-0.722261,7.62825e-005],[-0.00248975,0.00248975,0.999994]],[false,false]],
				["Land_BagFenceRound",[4148.143066,10947.209961,339.0227661],[[0.748439,-0.663195,0.00331826],[0,0.00500338,0.999987]],[false,false]],
				["Land_BagFenceRound",[4148.325684,10944.96582,339.036438],[[0.587032,0.809553,-0.00405055],[0,0.00500338,0.999987]],[false,false]],
				["Land_BagFenceRound",[4046.971191,11032.62793,336.229065],[[-0.759548,0.650205,-0.0179088],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["Land_BagFenceRound",[4046.778076,11034.852539,336.243805],[[-0.639202,-0.768635,-0.0249414],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["Land_BagFenceRound",[4044.802979,11032.405273,336.148529],[[0.637306,0.770209,0.0248963],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["Land_BagFenceRound",[4043.395752,11032.289063,336.119263],[[-0.758944,0.65091,-0.0178854],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["Land_BagFenceRound",[4041.0458984,11034.314453,336.054657],[[0.707372,-0.706662,0.0159201],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["Land_BagFenceRound",[4041.228027,11032.0722656,336.0394897],[[0.539135,0.841919,0.0224891],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["Land_BagFenceRound",[4046.705078,11036.157227,336.247375],[[-0.760343,0.649317,-0.0163152],[-0.0299832,-0.00999587,0.9995]],[false,false]],
				["Land_BagFenceRound",[4046.592041,11038.334961,336.270996],[[-0.681403,-0.731382,-0.0277553],[-0.0299832,-0.00999587,0.9995]],[false,false]],
				["Land_BagFenceRound",[4044.357422,11038.180664,336.188049],[[0.782102,-0.622912,0.017232],[-0.0299832,-0.00999587,0.9995]],[false,false]],
				["Land_BagFenceRound",[4043.00463867,11037.989258,336.157745],[[-0.626106,-0.77923,-0.0281431],[-0.0324838,-0.00999509,0.999422]],[false,false]],
				["Land_BagFenceRound",[4040.849121,11037.78125,336.0734863],[[0.802262,-0.59665,0.019592],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["Land_BagFenceRound",[4041.0324707,11035.526367,336.0587463],[[0.649377,0.76005,0.0251822],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["USMC_WarfareBBarracks",[4097.972656,11097.25293,338.0405884],[[0.616104,0.787255,0.0254214],[-0.0125011,-0.0224972,0.999669]],[false,false]],
				["Land_Fort_Watchtower",[4142.501953,11019.186523,338.310059],[[0.683996,0.729484,0.00137471],[-0.0100007,0.00749274,0.999922]],[false,false]],
				["Land_CamoNet_NATO",[4135.553711,10938.634766,339.0315857],[[-0.738536,0.674205,-0.00351739],[-0.00248975,0.00248975,0.999994]],[false,false]],
				["TK_WarfareBContructionSite1_Base_EP1",[4057.354736,11033.52832,339.149292],[[-0.753601,0.657049,-0.0193199],[-0.0299852,-0.00500101,0.999538]],[false,false]],
				["TK_GUE_WarfareBContructionSite1_Base_EP1",[4074.40625,11001.943359,337.0654907],[[-0.752656,0.657839,-0.027514],[-0.0299852,0.00749769,0.999522]],[false,false]],
				["TK_GUE_WarfareBContructionSite_Base_EP1",[4061.486084,11037.892578,336.684021],[[-0.705356,-0.708537,-0.0211577],[-0.0274846,-0.00248845,0.999619]],[false,false]],
				["TK_GUE_WarfareBContructionSite_Base_EP1",[4057.316406,11033.477539,336.545532],[[-0.753641,0.657002,-0.0193213],[-0.0299852,-0.00500101,0.999538]],[false,false]],
				["TK_GUE_WarfareBContructionSite_Base_EP1",[4053.208252,11028.999023,336.399902],[[-0.751687,0.659239,-0.0192575],[-0.0299932,-0.00500101,0.999538]],[false,false]],
				["Land_Carpet_rack_EP1",[4076.994629,10991.435547,337.22583],[[-0.750475,0.660257,-0.0291163],[-0.0299832,0.00999621,0.9995]],[false,false]],
				["Land_Stanek_1C",[4074.404785,10994.102539,337.126343],[[-0.758571,0.651004,-0.0276401],[-0.0299852,0.00749769,0.999522]],[false,false]],
				["Land_CratesWooden_F",[4083.0527344,10995.973633,337.372253],[[-0.751096,0.65955,-0.0291278],[-0.0299832,0.00999621,0.9995]],[false,false]],
				["Land_Scrap_MRAP_01_F",[4244.478516,11059.256836,339.105774],[[-0.754917,0.655812,0.0032656],[0,-0.00497941,0.999988]],[false,false]],
				["Land_fort_artillery_nest",[4119.294922,11029.839844,337.907166],[[-0.69682,-0.717213,-0.00686356],[-0.0149978,0.00500282,0.999875]],[false,false]],
				["Land_fort_artillery_nest",[4130.348633,11040.353516,338.0701904],[[0.665223,0.746617,0.00645779],[-0.0125011,0.00248956,0.999919]],[false,false]],
				["Land_fort_rampart",[4130.489258,10940.800781,338.986725],[[-0.69534,0.718626,-0.00886151],[-0.00499145,0.00750097,0.999959]],[false,false]],
				["Land_fort_rampart",[4137.078125,10947.136719,338.97403],[[-0.695755,0.718244,-0.00705804],[-0.00499145,0.00499139,0.999975]],[false,false]],
				["Land_Farm_WTower",[4211.601563,11052.481445,338.818726],[[-0.766963,0.641677,-0.00415583],[-0.00750107,-0.00248932,0.999969]],[false,false]],
				["MASH_EP1",[4120.475586,10995.776367,338.219788],[[0.749608,0.661865,0.00483829],[-0.0174891,0.0124992,0.999769]],[false,false]],
				["MASH_EP1",[4125.594727,10990.379883,338.373749],[[0.706732,0.70748,0.00175989],[-0.0149978,0.0124949,0.999809]],[false,false]],
				["INS_WarfareBFieldhHospital",[4147.143066,11096.720703,338.596863],[[-0.748421,0.663197,0.0059923],[-0.00750107,-0.0174988,0.999819]],[false,false]],
				["RU_WarfareBFieldhHospital",[4164.25293,10952.373047,339.0289001],[[-0.785108,0.619357,-0.00154205],[0,0.00248975,0.999997]],[false,false]],
				["USMC_WarfareBFieldhHospital",[4167.974121,11096.290039,338.805786],[[-0.761688,0.64794,0.00209758],[-0.0100007,-0.0149931,0.999838]],[false,false]],
				["USMC_WarfareBFieldhHospital",[4150.271484,11077.775391,338.39032],[[-0.7504,0.660984,0.000751637],[-0.0100007,-0.0124906,0.999872]],[false,false]],
				["Fortress2",[4138.542969,10994.411133,338.502075],[[0.696278,-0.717596,0.0158755],[-0.0124916,0.00999992,0.999872]],[false,false]],
				["Land_GeneralStore_01a_PMC",[4119.129395,10965.855469,338.660339],[[0.705818,0.708391,0.00171903],[-0.0174891,0.0149995,0.999735]],[false,false]],
				["PowGen_Big",[4132.921387,11007.230469,338.282959],[[-0.102589,-0.994686,0.0086664],[-0.0124916,0.00999992,0.999872]],[false,false]],
				["Land_Ss_hangar",[4174.46875,10996.572266,338.790771],[[0.721996,-0.691817,0.0105275],[-0.00500338,0.00999462,0.999938]],[false,false]],
				["TK_GUE_WarfareBBarrier5x_EP1",[4153.454102,10962.837891,338.938354],[[-0.730702,0.682617,-0.0104745],[-0.00499145,0.0100006,0.999938]],[false,false]],
				["Land_A_Hospital",[4066.800049,10973.431641,336.964233],[[-0.661561,-0.749892,0],[0,0,1]],[false,false]],
				["LAV25_HQ_unfolded",[4142.943848,10934.376953,339.0573425],[[-0.736923,0.675974,-0.00183476],[-0.00248975,0,0.999997]],[false,false]],
				["Land_Ind_Workshop01_03",[4037.617432,10984.198242,335.793915],[[-0.747697,0.663279,-0.0317798],[-0.0424653,0,0.999098]],[false,false]],
				["Gue_WarfareBLightFactory",[4137.76709,11122.96582,339.0702515],[[-0.768201,0.6401,0.0118349],[-0.00750107,-0.0274838,0.999594]],[false,false]],
				["Land_Market_shelter_EP1",[4066.153564,10994.445313,336.860352],[[-0.668434,-0.743596,-0.0161475],[-0.0324838,0.00749711,0.999444]],[false,false]],
				["Land_Market_stalls_01_EP1",[4087.168945,11002.540039,337.445099],[[-0.747266,0.664034,-0.0255343],[-0.0274933,0.00749823,0.999594]],[false,false]],
				["Land_Market_stalls_01_EP1",[4087.780273,10982.341797,337.67569],[[-0.735402,0.676943,-0.0305286],[-0.0299932,0.0124907,0.999472]],[false,false]],
				["Land_Market_stalls_01_EP1",[4103.291016,10985.546875,338.0312805],[[-0.738287,0.673958,-0.0267175],[-0.0224913,0.0149901,0.999635]],[false,false]],
				["Land_Cargo_House_V1_F",[4140.625,11047.382813,338.149384],[[0.700903,0.713257,0],[0,0,1]],[false,false]],
				["Land_Cargo_House_V1_F",[4147.927734,11040.133789,338.248932],[[0.688222,0.725501,0],[0,0,1]],[false,false]],
				["Land_Medevac_house_V1_F",[4161.0932617,11052.279297,338.330933],[[-0.759542,0.650458,0],[0,0,1]],[false,false]],
				["Land_Medevac_house_V1_F",[4150.571289,11062.431641,338.255371],[[-0.759542,0.650458,0],[0,0,1]],[false,false]],
				["Land_Medevac_house_V1_F",[4138.893066,11072.78125,338.216736],[[-0.759542,0.650458,0],[0,0,1]],[false,false]],
				["Land_Medevac_house_V1_F",[4128.369141,11082.938477,338.230408],[[-0.759542,0.650458,0],[0,0,1]],[false,false]],
				["Land_Cargo_HQ_V1_F",[4101.73291,11053.21875,337.646423],[[-0.759542,0.650458,0],[0,0,1]],[false,false]],
				["Land_Medevac_HQ_V1_F",[4169.239258,11069.485352,338.463531],[[-0.759542,0.650458,0],[0,0,1]],[false,false]],
				["Land_Cargo_Tower_V1_F",[4127.516113,11137.44043,339.359924],[[-0.759544,0.650456,0],[0,0,1]],[false,false]],
				["Land_Cargo_Tower_V1_F",[4173.733887,10963.110352,339.00448608],[[-0.759544,0.650456,0],[0,0,1]],[false,false]],
				["Land_A_Office01_EP1",[4075.552979,11070.919922,337.332611],[[-0.759646,0.650337,0],[0,0,1]],[false,false]],
				["Land_Offices_01_V1_F",[4208.832031,11024.989258,338.803741],[[-0.754812,0.655941,0],[0,0,1]],[false,false]],
				["Land_stand_small_EP1",[4093.819092,10986.303711,337.76709],[[-0.74365,0.668026,-0.0269383],[-0.024984,0.0124972,0.99961]],[false,false]],
				["Land_A_statue01",[4090.102051,11063.625,337.500397],[[0.754804,-0.655895,0.00853408],[-0.0199917,-0.00999837,0.99975]],[false,false]],
				["CampEast",[4123.608398,11063.158203,338.00558472],[[0.678189,0.734754,0.0139813],[-0.0124963,-0.00749219,0.999894]],[false,false]],
				["CampEast",[4130.3125,11056.792969,338.0446777],[[0.663448,0.74815,0.0103786],[-0.0100007,-0.00500301,0.999937]],[false,false]],
				["CampEast",[4116.786621,11071.0400391,337.969421],[[0.680788,0.732347,0.0139957],[-0.0124963,-0.00749219,0.999894]],[false,false]],
				["TK_WarfareBUAVterminal_Base_EP1",[4180.746582,11030.850586,338.574219],[[-0.764681,0.644347,-0.00895242],[-0.00750107,0.00499131,0.999959]],[false,false]],
				["Land_ScrapHeap_1_F",[4255.472656,11040.261719,339.0222168],[[-0.762101,0.64745,0.0032394],[0,-0.00500326,0.999987]],[false,false]],
				["Land_ScrapHeap_1_F",[4012.151123,11031.478516,334.901154],[[-0.76062,0.64852,-0.0296457],[-0.0474467,-0.0099891,0.998824]],[false,false]],
				["Land_ScrapHeap_2_F",[4022.261719,11052.974609,335.578156],[[-0.763097,0.646279,-0.00263242],[-0.0224913,-0.0224856,0.999494]],[false,false]],
				["INS_WarfareBVehicleServicePoint",[4154.00195313,11030.0146484,338.367645],[[-0.995467,0.0945048,-0.0106591],[-0.00999474,0.00750069,0.999922]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4145.614746,10914.660156,339.0599976],[[-0.761653,0.647985,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4155.763184,10926.672852,339.0599976],[[-0.772079,0.635527,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4176.0375977,10950.793945,339.0465393],[[0.753883,-0.656999,0.00351277],[-0.00248975,0.00248975,0.999994]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4165.759766,10938.780273,339.0599976],[[-0.767222,0.641382,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4186.166504,10962.612305,339.0259399],[[-0.77133,0.636425,-0.00350498],[-0.00248975,0.00248975,0.999994]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4196.17627,10974.642578,338.993225],[[-0.762031,0.647533,-0.00322443],[0,0.0049795,0.999988]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4216.584961,10998.421875,338.948761],[[-0.761197,0.648485,-0.00675972],[-0.00248975,0.00750104,0.999969]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4206.37207,10986.521484,338.973206],[[-0.757592,0.652708,-0.00515203],[-0.00248975,0.00500336,0.999984]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4226.738281,11010.408203,338.929565],[[-0.764651,0.644435,-0.00350829],[-0.00248975,0.00248975,0.999994]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4242.0195313,11037.492188,338.9617],[[0.948583,-0.316529,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4235.798828,11023.283203,338.943756],[[0.872754,-0.48816,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4224.106445,11058.0654297,338.929749],[[0.601258,0.798965,0.0119965],[-0.00999474,-0.0074924,0.999922]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4212.624023,11068.814453,338.925781],[[0.755245,0.655442,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4201.493652,11079.624023,338.884521],[[0.626095,0.779461,0.0210836],[-0.0149978,-0.014996,0.999775]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4190.496582,11090.762695,338.896973],[[0.791599,0.610694,0.0205865],[-0.0125011,-0.017498,0.999769]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4179.731445,11101.97168,339.0798645],[[0.63777,0.769237,0.0390345],[-0.0249936,-0.0299838,0.999238]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4167.581543,11111.735352,339.101776],[[0.614934,0.78721,0.0464385],[-0.0274846,-0.0374577,0.99892]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4158.125,11123.782227,339.371826],[[-0.91406,-0.402746,-0.0478608],[-0.0324838,-0.0449291,0.998462]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4148.866699,11135.855469,339.761963],[[0.652137,0.758052,0.00863424],[0.0100004,-0.0199903,0.99975]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4124.00292969,11144.745117,339.665466],[[-0.729634,0.683472,0.0223699],[-0.0324838,-0.0673161,0.997203]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4113.367676,11133.228516,339.204529],[[-0.742333,0.669215,0.0330658],[0.0174888,-0.0299805,0.999397]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4093.331543,11109.365234,338.425171],[[-0.757049,0.653179,0.0152878],[-0.0100007,-0.0349808,0.999338]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4103.294922,11121.301758,338.847076],[[-0.787747,0.615702,0.0191529],[-0.00499145,-0.0374714,0.999285]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4084.241699,11098.59668,338.00595093],[[-0.760085,0.649808,0.00456403],[-0.0174993,-0.027489,0.999469]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4074.25293,11086.629883,337.535431],[[-0.757606,0.652685,-0.00588842],[-0.0249936,-0.0199941,0.999488]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4054.105957,11062.787109,336.667053],[[-0.755221,0.655052,-0.0234168],[-0.0374783,-0.00748751,0.999269]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4064.175537,11074.698242,337.0787354],[[-0.759791,0.64992,-0.0179183],[-0.0299852,-0.00749751,0.999522]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4044.0129395,11050.852539,336.265076],[[-0.756911,0.653044,-0.0248681],[-0.0349809,-0.00248787,0.999385]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4026.248779,11022.863281,335.500183],[[-0.796553,0.604568,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4031.764648,11046.0830078,335.730804],[[0.231654,0.972769,0.00752855],[-0.032482,0,0.999472]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4136.202148,11145.238281,339.979218],[[0.525796,0.850252,0.0246946],[-0.00248975,-0.0274931,0.999619]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4124.959473,10900.457031,339.062439],[[-0.61574,-0.787947,-0.00196151],[0,-0.00248939,0.999997]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4113.207031,10910.651367,339.0982666],[[-0.672903,-0.739722,0.00351686],[0.00248939,0.00248975,0.999994]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4089.929932,10931.681641,338.573975],[[-0.657666,-0.753303,-0.00326078],[-0.0249936,0.0174938,0.999535]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4101.67334,10921.273438,338.958252],[[-0.673029,-0.739612,0.00250799],[-0.0100007,0.0124909,0.999872]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4077.881836,10941.691406,338.00363159],[[-0.623577,-0.781738,-0.00619536],[-0.0349741,0.0199795,0.999188]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4065.864014,10951.68457,337.336761],[[-0.649201,-0.76045,-0.0159185],[-0.0449609,0.0174748,0.998836]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4042.128418,10971.931641,336.032135],[[-0.64432,-0.764449,-0.0216515],[-0.0424639,0.0074943,0.99907]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4053.998047,10961.804688,336.656891],[[-0.640771,-0.767491,-0.0192523],[-0.0449596,0.0124789,0.998911]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4030.184814,10982.120117,335.487976],[[-0.650833,-0.758717,-0.0276573],[-0.0424569,0,0.999098]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4021.736328,11009.538086,335.272308],[[-0.999909,0.0135175,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4023.264404,10994.71875,335.266541],[[-0.978593,-0.202226,-0.0382119],[-0.037472,-0.00748751,0.99927]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4023.129395,11032.0419922,335.403839],[[0.313411,0.949446,0.0180348],[-0.0499397,-0.00248628,0.998749]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4144.893555,10964.173828,338.8815],[[-0.714393,-0.699743,0.00168296],[-0.00499145,0.00750097,0.999959]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4133.606445,10974.97168,338.667877],[[0.67953,0.733648,-0.000544961],[-0.00999474,0.0100002,0.9999]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4122.275879,10985.733398,338.376434],[[-0.687428,-0.726252,0.00058118],[-0.0149978,0.0149962,0.999775]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4110.98291,10996.526367,338.0469971],[[-0.691003,-0.722822,-0.00659713],[-0.0199977,0.00999274,0.99975]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4099.740723,11007.378906,337.704071],[[-0.697466,-0.716516,-0.0120633],[-0.0249936,0.00749872,0.999659]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4088.451172,11018.188477,337.369171],[[-0.681433,-0.731725,-0.015081],[-0.0274933,0.00500149,0.999609]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4065.832764,11039.733398,336.805389],[[0.683059,0.730118,0.0189124],[-0.0249936,-0.00251245,0.999684]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4054.611328,11050.466797,336.611786],[[-0.698388,-0.715234,-0.0263561],[-0.0274846,-0.00999659,0.999572]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4117.0322266,11086.887695,338.181366],[[0.962401,0.271254,0.0143741],[-0.0100007,-0.0174985,0.999797]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4124.604492,11073.714844,338.0918274],[[-0.721532,-0.692237,-0.0141395],[-0.0100007,-0.00999986,0.9999]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4135.69873,11062.901367,338.137543],[[-0.675201,-0.737559,-0.0104432],[-0.0100007,-0.00500301,0.999937]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4147.0263672,11052.149414,338.213867],[[-0.685102,-0.728415,-0.00684776],[-0.00999474,0,0.99995]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4158.400391,11041.296875,338.327423],[[-0.695176,-0.71884,0.000177361],[-0.00750107,0.00750086,0.999944]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4170.103516,11030.700195,338.480347],[[-0.644314,-0.76476,-0.000709659],[-0.00999474,0.00749274,0.999922]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4181.96582,11020.428711,338.642273],[[-0.659596,-0.751609,0.00422445],[-0.00499145,0.0100006,0.999938]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4193.617188,11009.921875,338.780701],[[-0.679861,-0.733338,0.00223958],[-0.00749312,0.0100004,0.999922]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4236.92627,11054.12207,339.0154419],[[-0.0532873,0.998569,0.00458453],[-0.00750107,-0.0049912,0.999959]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4251.850586,11045.982422,339.0257568],[[0.0680907,-0.997668,-0.00463988],[-0.00499145,-0.00499127,0.999975]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4135.448242,10902.728516,339.0599976],[[-0.759296,0.650746,0],[0,0,1]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4121.630371,11095.416016,338.36673],[[-0.0261586,0.999509,0.0172318],[-0.0100007,-0.0174985,0.999797]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4077.123047,11028.927734,337.0775757],[[-0.700732,-0.713209,-0.0175193],[-0.0249936,0,0.999688]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4190.893066,11078.160156,338.772522],[[-0.77398,0.633208,-0.00140751],[-0.00999474,-0.00999414,0.9999]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4164.195313,11047.135742,338.368286],[[-0.762016,0.647517,-0.00732827],[-0.00750107,0.00248968,0.999969]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4141.100098,11107.887695,338.741821],[[-0.781848,0.623445,0.00543892],[-0.00500338,-0.0149975,0.999875]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4150.674805,11120.25,339.0328064],[[-0.796414,0.604379,0.0212213],[-0.00749312,-0.0449501,0.998961]],[false,false]],
				["Land_Hlaska",[4048.656738,11050.347656,336.416168],[[-0.758597,0.651268,-0.0194987],[-0.0299852,-0.00500101,0.999538]],[false,false]],
				["Land_Hlaska",[4236.727539,11040.359375,338.943756],[[0.997841,-0.0655014,0.00481769],[-0.00499145,-0.00248936,0.999984]],[false,false]],
				["Land_Hlaska",[4120.853516,11090.341797,338.275726],[[-0.766066,0.642758,0.00229475],[-0.00749312,-0.0125004,0.999894]],[false,false]],
				["Land_Barn_W_02",[4035.532959,11008.972656,335.721375],[[-0.0853888,0.996348,-0.000507931],[-0.0349741,-0.00248787,0.999385]],[false,false]],
				["Land_transport_cart_EP1",[4089.442871,10991.0537109,337.599518],[[-0.742618,0.669166,-0.0271182],[-0.0274933,0.00999692,0.999572]],[false,false]],
				["Land_Shed_W03",[4058.121338,11041.955078,336.628632],[[0.742653,0.669261,0.0235881],[-0.0249936,-0.00749854,0.999659]],[false,false]],
				["TK_GUE_WarfareBBarrier10xTall_EP1",[4202.755371,11001.453125,338.875854],[[-0.679872,-0.733331,0.000275549],[-0.00499145,0.00500332,0.999975]],[false,false]],
				["CDF_WarfareBUAVterminal",[4109.93457,11015.367188,337.831085],[[-0.763655,0.645321,-0.0198201],[-0.0174993,0.00999917,0.999797]],[false,false]],
				["CampEast",[4089.955078,11034.141602,337.383087],[[-0.768962,-0.63911,-0.0153805],[-0.0199977,0,0.9998]],[false,false]]
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		//[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman"]  ],   				["Loiter",		[18297.931641,15587.395508,0.00136185],[18297.931641,15587.395508,0.00136185],[50]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18440.494141,15581.865234,17.889561],[18440.494141,15581.865234,17.889561],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18271.00390625,15474.366211,18.0308838],[18271.00390625,15474.366211,18.0308838],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18180.560547,15560.74707,17.798668],[18180.560547,15560.74707,17.798668],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18164.910156,15541.244141,4.348576],[18164.910156,15541.244141,4.348576],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18291.595703,15584.178711,4.353832],[18291.595703,15584.178711,4.353832],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18307.537109,15588.579102,4.360596],[18307.537109,15588.579102,4.360596],[10, "ANY"]   ]],
		//[["EAST","AWARE","YELLOW","COLUMN"],  [  [1,"Sniper"]  ],   				["TowerGuard",	[18426.212891,15537.683594,4.300941],[18426.212891,15537.683594,4.300941],[10, "ANY"]   ]],
		//[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman"]  ],   				["BoxPatrol",	[0,0],[0,0],[100]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman"]  ],   				["Explore",		[0,0],[0,0],[200]   ]],
		//[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper"],[3,"Rifleman"]  ],   	["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns 
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[4223.43,11041,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[4151.12,10944.5,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[4043.76,11035.3,0],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[4119.05,11110.4,0],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[4124.99,11034.5,0],		[0],     	"None" ]   
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [5, "Rifleman"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

				]
				// proceed from origin, move from City to City, stay on the roads, then RTB and despawn
			],
				// Troops : These are distributed across all vehicles in this convoy.                                                         
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
			]
		],
		[
			[   // Vehicle                     Offset     			Crew and number   	CargoLoot 		Damage
				[  FuMS_Mil_ArmedOffroads,	[4179.81,11122.1,0],	[1,"Rifleman"],      "TruckJunk",		[0.25]      ]

				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],[  [1, "Driver"]  ], ["BoxPatrol",[0,0],[75,-75],[100]   ]
				]
			],	// Troops : These are distributed across all vehicles in this convoy. 
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"]],["BoxPatrol",[0,0],[0,0],[75]]
				]

			],
		],
		[
			
			[   // Vehicle                     Offset     			Crew and number   	CargoLoot 		Damage
				[  FuMS_Mil_ArmedOffroads,	[4017.39,10948.5,0],	[1,"Rifleman"],      "TruckJunk",		[0.25]      ]

				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],[  [1, "Driver"]  ], ["BoxPatrol",[0,0],[-75,75],[100]   ]	
				]
			],	// Troops : These are distributed across all vehicles in this convoy. 
			[   //  Troop behaviour and side options    	# and type of Troops       Patrol logic |  spawn     |dest |'Patrol' options
				// 'dest' for troops is where they will go to perform their 'Patrol Logic' once the disembark the convoy IF their vehicle's driver group is using the 'Convoy' patrol logic.
				// otherwise troops will remain in vehicle unless it is engaged. Once vehicle destroyed, Troops will move onto their 'Patrol Logic'.
				[
					["EAST","COMBAT","RED","COLUMN"],[[1,"SMG"]],["BoxPatrol",[0,0],[0,0],[75]]
				]

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
