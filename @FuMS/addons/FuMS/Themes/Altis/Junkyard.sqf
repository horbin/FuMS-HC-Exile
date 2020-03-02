// 	Junkyard.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 6094.97,12612.9 as this map is specific to Altis
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Military Junkyard" v2.1 static mission for Altis.
	Created by [CiC]red_ned using templates by eraser1 
	Mapping by [CiC]red_ned and Pradatoru
	19 years of CiC http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Junkyard", 250], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Military Junkyard","hd_objective","ELLIPSE","ColorRed","SolidBorder",250],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Military Junkyard",	// The first line is the title of the pop-up box
			"A large group of terrorists have invaded the military junkyard"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Military Junkyard cleared!",
			"Convicts have successfully killed the terrorists and claimed all the crates"
		],
	  
		// Mission Failure Message
		[
			"Military Junkyard looted!",
			"The terrorists have gone off to find more parts for their vehicles..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["AltisStaticLoot" , 	[[6014.65,12545.9,0],[5998.48,12580.3,3.78252],[6083.06,12669.1,0],[6085.62,12629.8,0]]],
			["AltisStaticLoot" , 	[[6056.47,12536.6,17.5502],[5998.86,12603.7,3.78252],[5997.91,12559.2,3.96569],[5963.36,12664.3,-0.0194626] ]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Cargo_House_V2_F",[6011.06,12533.5,1.16807],142.273,[[0.6119,-0.790935,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6016,12537.3,1.16807],142.273,[[0.6119,-0.790935,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6020.93,12541.1,1.16807],142.273,[[0.6119,-0.790935,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6025.87,12544.9,1.16807],142.273,[[0.6119,-0.790935,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6030.8,12548.7,1.16807],142.273,[[0.6119,-0.790935,0],[0,-0,1]],false],
				["Land_Wreck_Slammer_F",[6063.84,12543.7,-0.205872],108.182,[[0.95007,-0.312037,0],[0,-0,1]],false],
				["Land_Wreck_Slammer_F",[6068.57,12558,-0.503708],108.182,[[0.95007,-0.312037,0],[0,-0,1]],false],
				["Land_Wreck_Slammer_F",[6073.29,12572.4,-0.45163],108.182,[[0.95007,-0.312037,0],[0,-0,1]],false],
				["Land_Wreck_Slammer_F",[6078.01,12586.8,-0.237236],108.182,[[0.95007,-0.312037,0],[0,-0,1]],false],
				["Land_JunkPile_F",[6069.79,12566,-0.11322],0,[[0,1,0],[0,0,1]],false],
				["Land_JunkPile_F",[6064.89,12550.4,-0.0416107],0,[[0,1,0],[0,0,1]],false],
				["Land_JunkPile_F",[6076.36,12580.9,-0.203934],0,[[0,1,0],[0,0,1]],false],
				["Land_Wreck_Plane_Transport_01_F",[6115.75,12577.8,-2.1338],38.6364,[[0.624376,0.781124,0],[0.174672,-0.13962,0.974677]],false],
				["Land_Wreck_Plane_Transport_01_F",[6128.49,12601.3,-2.13338],7.72729,[[0.132395,0.975714,0.174509],[-0.0234642,-0.172925,0.984656]],false],
				["Land_Wreck_Plane_Transport_01_F",[6131.9,12635.2,-1.95513],199.091,[[-0.32707,-0.945,0],[0.549127,-0.190056,0.813842]],false],
				["Land_Cargo_House_V2_F",[6078.37,12551.3,0.781067],149.091,[[0.513676,-0.857984,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6084.1,12555.1,0.803627],149.091,[[0.513676,-0.857984,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6089.59,12558.6,0.752213],149.091,[[0.513676,-0.857984,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6094.77,12562.6,0.417877],149.091,[[0.513676,-0.857984,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[6100.6,12565.8,0.282318],149.091,[[0.513676,-0.857984,0],[0,-0,1]],false],
				["Land_Wreck_BMP2_F",[6066.12,12583.4,-0.00170135],104.545,[[0.967951,-0.25114,0],[0,-0,1]],false],
				["Land_Wreck_BMP2_F",[6068.75,12590.8,-0.244957],289.545,[[-0.942379,0.334547,0],[0.0175089,0.0493203,0.99863]],false],
				["Land_Wreck_BMP2_F",[6071.41,12598.5,-0.430824],111.363,[[0.930122,-0.363818,0.0500967],[-0.0466546,0.018249,0.998744]],false],
				["Land_Wreck_BMP2_F",[6074,12605.6,-0.557938],289.545,[[-0.937448,0.344684,0.0488257],[0.121924,0.193707,0.973454]],false],
				["Land_Wreck_Slammer_hull_F",[6083,12597.9,-0.212067],285,[[-0.965926,0.258819,0],[0,0,1]],false],
				["Land_Wreck_T72_hull_F",[6068.17,12615.9,-0.641487],205.455,[[-0.429802,-0.902923,0],[-0,0,1]],false],
				["Land_Wreck_T72_hull_F",[6076.59,12611.6,-0.576546],20.9091,[[0.366776,0.924996,0.0992807],[0.0804394,-0.137851,0.987181]],false],
				["Land_Wreck_T72_hull_F",[6095.22,12603.8,-0.425591],20.9091,[[0.347849,0.910493,0.223616],[-0.0798054,-0.20889,0.974677]],false],
				["Land_Wreck_T72_hull_F",[6086.72,12607,-0.858261],207.553,[[-0.462569,-0.886583,0],[-0,0,1]],false],
				["Land_Wreck_T72_turret_F",[6092.14,12600.8,-0.238853],0,[[0,1,0],[0.435905,0,0.899993]],false],
				["Land_GarbagePallet_F",[6065.82,12608.9,-0.20591],0,[[0,1,0],[0,0,1]],false],
				["Land_GarbagePallet_F",[6064.81,12597.1,-0.284416],256.818,[[-0.973651,-0.228045,0],[-0.0114243,0.0487767,0.998744]],false],
				["Land_u_Barracks_V2_F",[6035.15,12569.5,0.0844498],89.0909,[[0.999874,0.0158664,0],[0.00055373,-0.0348951,0.999391]],false],
				["Land_u_Barracks_V2_F",[6035.49,12606.4,-0.347031],89.0909,[[0.999874,0.0158664,0],[0.000397514,-0.0250507,0.999686]],false],
				["Land_Cargo_House_V2_F",[5997.79,12523.2,1.06781],141.818,[[0.618162,-0.786051,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[5991.84,12519.2,1.06781],141.818,[[0.618162,-0.786051,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[5985.97,12514.9,1.06781],141.818,[[0.618162,-0.786051,0],[0,-0,1]],false],
				["Land_Cargo_House_V2_F",[5980.01,12510.4,1.06781],141.818,[[0.618162,-0.786051,0],[0,-0,1]],false],
				["Land_Cargo_Patrol_V2_F",[5981.24,12491.3,-0.122292],340.455,[[-0.334547,0.942379,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V2_F",[5970.7,12472.5,0.000190735],350.454,[[-0.165839,0.986153,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V2_F",[6028.45,12684.8,0.000190735],199.091,[[-0.32707,-0.945,0],[-0,0,1]],false],
				["Land_Cargo_Patrol_V2_F",[6044.17,12678,0.000190735],199.091,[[-0.32707,-0.945,0],[-0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[5998.36,12538,-0.0408096],0,[[0,1,0],[0.124962,0,0.992162]],false],
				["Land_Pallet_MilBoxes_F",[5996.55,12538,-0.053215],0,[[0,1,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[5994.73,12538,-0.053215],0,[[0,1,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[5994.73,12539.9,-0.053215],0,[[0,1,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[5996.55,12539.9,-0.053215],0,[[0,1,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[5998.37,12539.9,-0.053215],0,[[0,1,0],[0,0,1]],false],
				["Land_Wreck_HMMWV_F",[6090.61,12616.2,0],100,[[0.984808,-0.173648,0],[0,-0,1]],false],
				["Land_Wreck_HMMWV_F",[6099.07,12618.7,-0.0001297],100,[[0.941727,-0.200586,0.270028],[-0.288907,-0.0711576,0.954709]],false],
				["Land_Wreck_HMMWV_F",[6093.24,12624.3,-0.267731],100,[[0.984808,-0.173648,0],[0,-0,1]],false],
				["Land_Wreck_HMMWV_F",[6100.57,12627.2,0.000167847],100,[[0.982701,-0.178367,0.0498406],[-0.0666853,-0.0897228,0.993732]],false],
				["Land_Wreck_HMMWV_F",[6093.99,12632.1,0.000366211],100,[[0.954051,-0.168225,0.247966],[-0.244199,0.0430589,0.968769]],false],
				["Land_Wreck_HMMWV_F",[6102.07,12635.7,0.000213623],100,[[0.984808,-0.173648,0],[-0.0430595,-0.244202,0.968768]],false],
				["Land_Scrap_MRAP_01_F",[6078.3,12624.9,-0.398659],24.0909,[[0.400012,0.894618,0.199123],[-0.0812793,-0.18178,0.979974]],false],
				["Land_Scrap_MRAP_01_F",[6082.49,12634.8,-1.0471],24.0909,[[0.426571,0.903303,0.0456196],[0.356305,-0.214191,0.909488]],false],
				["Land_Scrap_MRAP_01_F",[6072.24,12627.7,-0.561279],24.0909,[[0.408186,0.912899,0],[0,0,1]],false],
				["Land_Scrap_MRAP_01_F",[6076.55,12637.3,-0.551369],24.0909,[[0.383325,0.857298,0.343661],[-0.140278,-0.313728,0.939094]],false],
				["Land_Scrap_MRAP_01_F",[6084.52,12644.3,-0.763771],24.0909,[[0.408186,0.912899,0],[0,0,1]],false],
				["Land_ScrapHeap_1_F",[6084.74,12624.9,-0.253517],0,[[0,1,0],[0,0,1]],false],
				["Land_ScrapHeap_1_F",[6090.63,12641.1,-0.253517],0,[[0.00625998,0.998744,0.0497016],[0.124807,-0.0500942,0.990916]],false],
				["Land_ScrapHeap_1_F",[6098.42,12611.2,-0.253998],0,[[0,1,0],[0.272163,0,0.962251]],false],
				["Land_ScrapHeap_2_F",[6105.6,12642.3,-0.589668],0,[[0,1,0],[0,0,1]],false],
				["Land_ScrapHeap_2_F",[6096.23,12642,-0.589996],0,[[0,1,0],[0.647173,0,0.762343]],false],
				["Land_GarbagePallet_F",[6088.46,12587.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_GarbagePallet_F",[6087.44,12583.9,-0.0905762],224.545,[[-0.701469,-0.7127,0],[-0,0,1]],false],
				["Land_GarbagePallet_F",[6086.13,12579.4,0.0571594],224.545,[[-0.701469,-0.7127,0],[-0,0,1]],false],
				["Land_Wreck_Offroad_F",[5938.82,12651.6,-0.0947952],17.2727,[[0.29692,0.954902,0],[0,0,1]],false],
				["Land_Wreck_Truck_F",[5945.76,12667.2,-0.329994],21.8182,[[0.371663,0.928368,0],[0,0,1]],false],
				["Land_Wreck_Truck_F",[5935.92,12643.5,-0.242325],10.9091,[[0.189251,0.981929,0],[0,0,1]],false],
				["Land_Wreck_Truck_dropside_F",[5941.91,12659.7,-0.431908],21.3636,[[0.364285,0.931288,0],[0,0,1]],false],
				["Land_Wreck_Truck_dropside_F",[5933.83,12635.2,-0.431908],10.9091,[[0.189251,0.981929,0],[0,0,1]],false],
				["Land_Wreck_Van_F",[5949.52,12674.7,-0.634209],16.8182,[[0.289336,0.957228,0],[0,0,1]],false],
				["Land_Wreck_Van_F",[5934.37,12626.6,-0.0841293],353.636,[[-0.110845,0.993838,0],[0,0,1]],false],
				["Land_Wreck_Offroad_F",[5953.54,12681.4,-0.253586],7.72726,[[0.134458,0.990919,0],[0,0,1]],false],
				["Land_Wreck_Skodovka_F",[5985.45,12689.9,-0.205795],278.636,[[-0.988662,0.150157,0],[0,0,1]],false],
				["Land_Wreck_Skodovka_F",[6002.99,12689.4,-0.154678],92.7273,[[0.998867,-0.0475825,0],[0,-0,1]],false],
				["Land_Wreck_Skodovka_F",[5992.98,12690.3,-0.0815659],101.66,[[0.979364,-0.202104,0],[0,-0,1]],false],
				["Land_Wreck_Skodovka_F",[6008.44,12688.4,0],97.7273,[[0.990919,-0.134458,0],[0,-0,1]],false],
				["Land_Wreck_Skodovka_F",[6013.45,12686.9,-0.310516],125,[[0.809911,-0.567106,0.14978],[-0.122693,0.0859103,0.988719]],false],
				["Land_Wreck_Skodovka_F",[6020.15,12685.1,-0.193977],98.1818,[[0.989821,-0.142314,0],[0,-0,1]],false],
				["Land_Wreck_Skodovka_F",[5998.01,12689.8,-0.375427],101.66,[[0.979364,-0.202104,0],[0,-0,1]],false],
				["Land_Wreck_Plane_Transport_01_F",[6156.57,12661.7,-2.43435],239.545,[[-0.862028,-0.506861,0],[-0,0,1]],false],
				["Land_Wreck_Plane_Transport_01_F",[6183.79,12676.2,-2.60163],200.454,[[-0.357083,-0.928751,0.0995629],[-0.0583152,0.128548,0.989987]],false],
				["Land_Wreck_Offroad_F",[5936.44,12617.9,-0.316055],353.182,[[-0.118715,0.992928,0],[0,0,1]],false],
				["Land_Wreck_Truck_F",[5938.38,12609,-0.169838],0.909115,[[0.0158664,0.999874,0],[0,0,1]],false],
				["Land_Wreck_Truck_dropside_F",[5939.96,12599.6,-0.348419],360,[[1.74846e-007,1,0],[0,0,1]],false],
				["Land_Wreck_Van_F",[5939.77,12591.9,-0.0841293],2.72726,[[0.0475818,0.998867,0],[0,0,1]],false],
				["Land_Wreck_Offroad_F",[5940.49,12582.8,-0.405472],353.182,[[-0.118715,0.992928,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[6006.14,12539.9,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[6010.29,12543.1,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[6006.15,12544,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[6010.63,12547.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[5953.05,12664.3,-0.187996],15.4546,[[0.266475,0.963842,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[5951.69,12660,-0.155678],14.5455,[[0.251149,0.967948,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[5950.12,12656.2,-0.103348],11.8182,[[0.204807,0.978802,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[5949.01,12652.2,-0.0543213],10.9091,[[0.189251,0.981929,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[5948.29,12648.5,-0.153671],11.3636,[[0.197034,0.980397,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[5947.35,12644.8,0],9.99997,[[0.173648,0.984808,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[6079.1,12664.9,-0.0922852],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6095.4,12678,-0.27771],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6087.2,12671.9,-0.169975],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6027.93,12642.8,0],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6064.37,12645.9,-0.179108],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6051.99,12633.2,0.260094],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6058.71,12638.5,-0.0472565],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6046.03,12627.3,0],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6037.31,12633.9,0],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6019.8,12651.3,-0.355492],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6071.01,12658,-0.2118],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6102.12,12685,-0.151657],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_orange_F",[6183.31,12694.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6171.06,12698.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6156.57,12698.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6142.45,12699.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6128.15,12699.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6112.45,12699.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6029.95,12700.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6067.88,12694.4,0],359.091,[[-0.015864,0.999874,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6050.58,12700.2,-0.0648956],0,[[0,1,0],[0.0500967,0,0.998744]],false],
				["Land_Cargo40_orange_F",[6059.1,12695.3,0],268.182,[[-0.999497,-0.0317244,0],[-0,0,1]],false],
				["Land_Cargo40_orange_F",[6021.7,12695.3,0],270.455,[[-0.999968,0.00794117,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6083.19,12694.3,0],359.091,[[-0.015864,0.999874,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6098.86,12695.1,0],359.091,[[-0.015864,0.999874,0],[0,0,1]],false],
				["Land_Crane_F",[6126.94,12655.9,-0.399368],0,[[0,1,0],[0,0,1]],false],
				["Land_Crane_F",[6114.65,12592.9,-0.389832],27.2727,[[0.458226,0.888836,0],[0,0,1]],false],
				["Land_Crane_F",[6059.59,12678.1,0],256.364,[[-0.971813,-0.235752,0],[-0,0,1]],false],
				["Land_Cargo40_orange_F",[6050.71,12700.2,2.56917],0,[[0,1,0],[0.0500942,0,0.998744]],false],
				["Land_Cargo40_orange_F",[6029.95,12700.5,2.60011],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6059.1,12695.3,2.60561],268.182,[[-0.999497,-0.0317244,0],[-0,0,1]],false],
				["Land_Cargo40_orange_F",[6021.7,12695.3,2.62205],270.455,[[-0.999968,0.00794117,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6075.71,12694.5,2.72358],359.091,[[-0.015864,0.999874,0],[0,0,1]],false],
				["Land_Cargo40_orange_F",[6091.23,12694.6,2.61308],179.46,[[0.00942422,-0.999956,0],[-0.025055,-0.000236134,0.999686]],false],
				["Land_Cargo40_military_green_F",[6019.8,12651.3,2.27519],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6027.93,12642.8,2.51962],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6037.31,12633.9,2.48881],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6046.03,12627.3,2.45998],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6051.99,12633.2,2.79472],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6058.71,12638.5,2.46267],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6102.12,12685,2.37163],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6095.4,12678,2.28504],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6087.2,12671.9,2.18729],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6079.1,12664.9,2.53764],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6071.01,12658,2.34284],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[6064.37,12645.9,2.3447],265.909,[[-0.997452,-0.0713409,0],[-0,0,1]],false],
				["Land_Cargo_HQ_V2_F",[5962.16,12593.5,0.109612],19.8301,[[0.339232,0.940703,0],[0,0,1]],false],
				["Land_Cargo_HQ_V2_F",[5934.27,12502.8,0.78035],131.818,[[0.745267,-0.666767,0],[0,-0,1]],false],
				["Land_Wreck_Truck_F",[5931.15,12540.5,-0.537468],2.7273,[[0.0475823,0.998867,0],[0,0,1]],false],
				["Land_Wreck_Truck_dropside_F",[5935.27,12565.5,-0.431908],15.9091,[[0.274112,0.961698,0],[0,0,1]],false],
				["Land_Wreck_Truck_F",[5932.37,12557.5,-0.169838],9.54549,[[0.165831,0.986154,0],[0,0,1]],false],
				["Land_Wreck_Van_F",[5931.12,12549.1,-0.447441],2.72726,[[0.0475818,0.998867,0],[0,0,1]],false],
				["Land_Wreck_Offroad_F",[5938.71,12573.4,-0.633194],7.2728,[[0.126594,0.991955,0],[0,0,1]],false],
				["Land_Wreck_Truck_dropside_F",[5931.06,12532.4,-0.348419],360,[[1.74846e-007,1,0],[0,0,1]],false],
				["Land_Wreck_Offroad_F",[5930.07,12523.5,-0.633194],354.546,[[-0.0950462,0.995473,0],[0,0,1]],false],
				["Land_Wreck_Truck_F",[5930.57,12515,-0.537468],351.364,[[-0.150156,0.988662,0],[0,0,1]],false],
				["Land_Cargo_Tower_V2_F",[6052.92,12538.1,-0.523964],227.273,[[-0.734595,-0.678506,0],[-0,0,1]],false],
				["Land_Cargo_House_V2_F",[5976.47,12607.4,0],306.364,[[-0.805266,0.592914,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[5983.3,12614.7,0],306.364,[[-0.805266,0.592914,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[5990.45,12623,0],310.909,[[-0.755751,0.65486,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[5998.05,12630.2,0],320.454,[[-0.636697,0.771114,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[6005.93,12636.1,0],328.636,[[-0.520473,0.853878,0],[0,0,1]],false],
				["Land_Cargo_House_V2_F",[6013.45,12641.1,0],334.545,[[-0.429802,0.902923,0],[0,0,1]],false],
				["Land_FuelStation_Shed_F",[5954.22,12522.2,0],54.5455,[[0.816461,0.575245,0.0498428],[0.0171663,-0.110468,0.993731]],false],
				["Land_FuelStation_Feed_F",[5959.55,12519.5,-0.0656204],327.727,[[-0.533954,0.845514,0],[0,0,1]],false],
				["Land_FuelStation_Feed_F",[5955.21,12524.7,-0.246178],328.182,[[-0.527223,0.849727,0],[0,0,1]],false],
				["Land_FuelStation_Build_F",[5949.29,12534.1,0],98.6364,[[0.988661,-0.150164,0],[0,-0,1]],false],
				["Land_FuelStation_Feed_F",[5951.06,12522,0],150,[[0.5,-0.866026,0],[0,-0,1]],false],
				["Land_FuelStation_Feed_F",[5954.83,12516.4,0],150.455,[[0.493107,-0.869969,0],[0,-0,1]],false],
				["Land_Research_HQ_F",[5997.08,12560.5,0.676788],177.273,[[0.047577,-0.998868,0],[0,-0,1]],false],
				["Land_Research_HQ_F",[5997.62,12581.4,0.415794],177.273,[[0.047577,-0.998868,0],[0,-0,1]],false],
				["Land_Research_HQ_F",[5997.99,12604.8,0.574135],177.273,[[0.047577,-0.998868,0],[0,-0,1]],false],
				["CamoNet_INDP_Curator_F",[5972.63,12667.8,0],0,[[0,1,0],[0,0,1]],false],
				["CamoNet_INDP_Curator_F",[5960.22,12666.9,0],0,[[0,1,0],[0,0,1]],false],
				["CamoNet_INDP_Curator_F",[5984.27,12667.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TableDesk_F",[5958.37,12663.5,0],5.11363,[[0.089131,0.99602,0],[0,0,1]],false],
				["Land_WaterCooler_01_new_F",[5955.13,12663.4,0],318.58,[[-0.661574,0.74988,0],[0,0,1]],false],
				["MapBoard_altis_F",[5956.18,12665.8,0],342.102,[[-0.307324,0.951605,0],[0,0,1]],false],
				["Land_ChairWood_F",[5958.73,12664.6,0],36.8182,[[0.599278,0.800541,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5955.57,12661.3,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5957.28,12661,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5959,12660.6,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5960.71,12660.3,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5960.41,12658.7,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5958.7,12659,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5956.98,12659.3,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5955.27,12659.6,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5954.97,12657.9,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5956.69,12657.6,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5958.4,12657.3,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5960.12,12657,0],280.227,[[-0.984112,0.177549,0],[0,0,1]],false],
				["Land_TableDesk_F",[5974.4,12663.5,0],5.11362,[[0.089131,0.99602,0],[0,0,1]],false],
				["Land_TableDesk_F",[5986.43,12662.3,0],5.11362,[[0.089131,0.99602,0],[0,0,1]],false],
				["MapBoard_altis_F",[5971.32,12666.7,0],342.102,[[-0.307324,0.951605,0],[0,0,1]],false],
				["MapBoard_altis_F",[5981.07,12665.8,0],342.102,[[-0.307324,0.951605,0],[0,0,1]],false],
				["Land_ChairWood_F",[5975.21,12664.7,0],36.8182,[[0.599278,0.800541,0],[0,0,1]],false],
				["Land_ChairWood_F",[5987.15,12663.7,0],33.75,[[0.55557,0.83147,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5970.48,12659.9,0],279.205,[[-0.987122,0.159968,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5970.5,12658.2,0],277.159,[[-0.992204,0.124624,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5970.51,12656.5,0],275.625,[[-0.995185,0.0980174,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5987.44,12659.3,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5985.7,12659.3,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5983.95,12659.4,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5982.21,12659.4,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5982.17,12657.7,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5983.91,12657.7,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5985.65,12657.6,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5987.39,12657.6,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5987.35,12655.9,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5985.61,12656,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5983.86,12656,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5982.12,12656.1,0],271.534,[[-0.999642,0.0267703,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5972.25,12656.3,0],275.625,[[-0.995185,0.0980174,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5973.98,12656.2,0],275.625,[[-0.995185,0.0980174,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5975.72,12656,0],275.625,[[-0.995185,0.0980174,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5972.23,12658,0],277.159,[[-0.992204,0.124624,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5973.96,12657.7,0],277.159,[[-0.992204,0.124624,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5975.69,12657.5,0],277.159,[[-0.992204,0.124624,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5972.2,12659.6,0],279.205,[[-0.987122,0.159968,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5973.92,12659.3,0],279.205,[[-0.987122,0.159968,0],[0,0,1]],false],
				["Land_ChairPlastic_F",[5975.64,12659,0],279.205,[[-0.987122,0.159968,0],[0,0,1]],false],
				["Land_Airport_Tower_F",[5944.96,12627.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Sea_Wall_F",[6152.07,12680.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Bunker_F",[6127.17,12679.6,-0.126671],82.841,[[0.992204,0.124623,0],[0,0,1]],false],
				["Land_Cargo_HQ_V2_F",[5959.78,12542.9,0],20.4546,[[0.349465,0.936949,0],[0,0,1]],false],
				["Land_Cargo_HQ_V2_F",[5961.84,12558.6,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_HQ_V2_F",[5961.52,12576.4,-0.161758],0,[[0,1,0],[0,0,1]],false]
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","VEE"],   	[  [1,"Sniper_E"],[2,"LMG_E"]  ],   	["Loiter",		[5976.144043,12666.0556641,0.00170898],[5976.144043,12666.0556641,0.00170898],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Hunter_E"]  ],  	["Buildings",	[6014.294922,12585.0244141,0.00127411],[6014.294922,12585.0244141,0.00127411],[75]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[5935.428711,12502.824219,3.865746],[5935.428711,12502.824219,3.865746],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[6028.772949,12685.713867,4.328835],[6028.772949,12685.713867,4.328835],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[6043.688477,12679.378906,4.326355],[6043.688477,12679.378906,4.326355],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[5981.788574,12490.404297,4.254456],[5981.788574,12490.404297,4.254456],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[5970.976074,12471.899414,4.360695],[5970.976074,12471.899414,4.360695],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"Hunter_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"SMG_E"]  ],   					["Explore",		[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"LMG_E"]  ],   	["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[6027.27,12695.3,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[6052.7,12695.6,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[6124.95,12679.5,0.0772552],	[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[6075.14,12663.2,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[5967.52,12579.6,2.64754],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[5968.27,12594.7,3.83613],		[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[5966.66,12562.8,2.79882],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"       	,[5965.49,12545,2.59589],		[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[5944.36,12633.5,12.1842],		[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[5967,12640.2,0],				[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[5971.04,12684,0],				[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[6031.15,12590.3,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[6047.44,12538.3,17.4298],		[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[6052.82,12542.4,17.0943],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[6076.89,12600,0],				[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [16, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
