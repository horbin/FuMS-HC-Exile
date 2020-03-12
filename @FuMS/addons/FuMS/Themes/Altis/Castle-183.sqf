// 	Castle-183.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 11190,8708.3 as this map is specific to Altis
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Castle 183" v2.1 static mission for Altis.
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
	["Castle-183", 150], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Castle 183","hd_objective","ELLIPSE","ColorRed","SolidBorder",150],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Castle 183",	// The first line is the title of the pop-up box
			"Terrorist Pradatoru is building a new stronghold, go stop him!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Castle 183 Success",
			"Convicts have successfully killed Pradatoru and his minions"
		],
	  
		// Mission Failure Message
		[
			"Castle 183 Failure!",
			"Pradatoru has gone to get more supplies, he will be back..."
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[
			["AltisStaticLoot" , 	[[11221.1,8630.63,0],[11214.1,8650.32,0],[11227.8,8727.58,0],[11158.9,8742.59,0]]],
			["AltisStaticLoot" , 	[[11153.5,8713.62,0],[11148.4,8718.24,5.7063],[11169.7,8762.52,10.8516],[11186,8671.48,11.2788] ]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Castle_01_wall_14_F",[11164.1,8749.65,-0.270782],279.091,[[-0.987439,0.158003,0],[0,0,1]],false],
				["Land_Castle_01_wall_03_F",[11201.3,8681.35,-2.86694],102.273,[[0.977146,-0.21257,0],[0,-0,1]],false],
				["Land_Castle_01_step_F",[11196.7,8690.82,0],13.6363,[[0.235758,0.971812,0],[0,0,1]],false],
				["Land_Castle_01_step_F",[11159.8,8753.39,0.379395],11.3636,[[0.19549,0.972712,0.124962],[-0.0246218,-0.122512,0.992162]],false],
				["Land_Bunker_F",[11221.6,8701.7,0.628937],94.091,[[0.997452,-0.0713409,0],[0,-0,1]],false],
				["Land_ScrapHeap_1_F",[11207.4,8697.61,0.0400085],4.54546,[[0.0792503,0.996855,0],[0,0,1]],false],
				["Land_ScrapHeap_2_F",[11219.5,8694.95,-0.00123596],0,[[0,1,0],[0,0,1]],false],
				["Land_Scrap_MRAP_01_F",[11216.2,8704.31,-0.464767],0,[[0,1,0],[0,0,1]],false],
				["Land_LampHalogen_F",[11224.2,8706.54,0],5.90912,[[0.102951,0.994686,0],[0,0,1]],false],
				["Land_LampHalogen_F",[11230.2,8727.86,0],348.182,[[-0.204803,0.978803,0],[0,0,1]],false],
				["Land_LampHalogen_F",[11165,8754.02,0],277.727,[[-0.99092,0.134453,0],[0,0,1]],false],
				["Land_LampHalogen_F",[11151.9,8731.32,0],192.727,[[-0.220306,-0.975431,0],[-0,0,1]],false],
				["Land_LampHalogen_F",[11151.7,8707.9,0],149.545,[[0.506861,-0.862028,0],[0,-0,1]],false],
				["Land_LampHalogen_F",[11185.8,8685.39,0],94.0909,[[0.997452,-0.0713387,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11230.4,8684.41,-0.283401],91.8182,[[0.999497,-0.0317285,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11230.1,8678.84,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11229.8,8673.29,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11229.7,8667.72,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11229.6,8662.15,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11229.3,8656.52,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11227.6,8651.98,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11227.4,8646.36,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11227.1,8640.71,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11226.8,8635.07,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_Cargo20_military_green_F",[11222.4,8733.86,-0.0912323],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[11222.5,8731.34,-0.0912323],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[11222.5,8728.86,-0.0912323],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[11222.5,8726.38,-0.0912323],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[11222.4,8733.86,2.5533],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[11222.4,8731.38,2.58514],359.999,[[-1.74681e-005,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[11222.4,8728.9,2.58514],359.999,[[-1.74681e-005,1,0],[0,0,1]],false],
				["Land_Cargo20_military_green_F",[11222.4,8726.42,2.58514],359.999,[[-1.74681e-005,1,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[11153.8,8735.76,0.0576477],190.154,[[-0.176295,-0.984337,0],[-0,0,1]],false],
				["Land_Cargo10_military_green_F",[11153.3,8733.26,0.0576477],191.063,[[-0.191888,-0.981417,0],[-0,0,1]],false],
				["Land_Cargo10_military_green_F",[11153.8,8735.76,2.69817],190.154,[[-0.176295,-0.984337,0],[-0,0,1]],false],
				["Land_Cargo10_military_green_F",[11153.8,8735.76,5.31352],190.808,[[-0.187525,-0.98226,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[11226.5,8661.7,0],271.286,[[-0.999748,0.0224433,0],[0,0,1]],false],
				["Land_Unfinished_Building_02_F",[11216,8635.67,1.22298],0,[[0,1,0],[0,0,1]],false],
				["Campfire_burning_F",[11220.9,8721.92,-0.0147552],0,[[0,1,0],[0,0,1]],false],
				["Land_CampingTable_small_F",[11219.1,8718.38,0],0,[[0,1,0],[0,0,1]],false],
				["Land_CampingChair_V2_F",[11218.1,8719.59,0],333.636,[[-0.444072,0.895991,0],[0,0,1]],false],
				["Land_CampingChair_V2_F",[11219.2,8719.59,1.52588e-005],0.00813743,[[0.000142213,1,0],[0,0,1]],false],
				["Land_CampingChair_V2_F",[11220.7,8718.67,1.52588e-005],72.2809,[[0.95256,0.304351,0],[0,0,1]],false],
				["Land_CampingChair_V2_F",[11219.2,8716.87,1.52588e-005],193.645,[[-0.235906,-0.971776,0],[-0,0,1]],false],
				["Land_CampingChair_V2_F",[11217.8,8718.42,1.52588e-005],276.826,[[-0.992912,0.118855,0],[0,0,1]],false],
				["Land_CampingChair_V2_F",[11220.4,8719.63,1.52588e-005],29.5536,[[0.493237,0.869895,0],[0,0,1]],false],
				["Land_CampingChair_V2_F",[11218.3,8717.42,1.52588e-005],231.826,[[-0.786138,-0.618051,0],[-0,0,1]],false],
				["Land_CampingChair_V2_F",[11220.6,8717.42,1.52588e-005],125.008,[[0.819072,-0.573691,0],[0,-0,1]],false],
				["Land_TentA_F",[11231.1,8720.56,0.034317],95.4546,[[0.995472,-0.095057,0],[0,-0,1]],false],
				["Land_TentA_F",[11230.8,8718.17,0.0239716],99.5455,[[0.986154,-0.165831,0],[0,-0,1]],false],
				["Land_TentA_F",[11226.1,8718.82,0.0052948],185,[[-0.0871558,-0.996195,0],[-0,0,1]],false],
				["Land_FieldToilet_F",[11206.2,8700.84,0],274.091,[[-0.997452,0.0713414,0],[0,0,1]],false],
				["Land_FieldToilet_F",[11206.3,8702.14,0],274.091,[[-0.997452,0.0713414,0],[0,0,1]],false],
				["Land_MobileScafolding_01_F",[11206.7,8633.19,0],88.1819,[[0.999497,0.0317267,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.3,8672.51,0.0121307],1.66865,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.3,8673.63,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.4,8674.74,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.4,8675.85,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.4,8676.96,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.5,8678.07,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.5,8679.18,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.5,8680.29,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.6,8681.4,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.6,8682.51,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.6,8683.62,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.6,8684.73,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.7,8685.84,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.7,8686.95,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11228,8686.91,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11228,8685.8,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.9,8684.69,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.9,8683.58,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.9,8682.47,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.8,8681.36,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.8,8680.25,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.8,8679.14,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.7,8678.03,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.7,8676.92,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.7,8675.81,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.6,8674.7,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.6,8673.59,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.6,8672.48,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.3,8671.4,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11226.2,8670.29,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.5,8670.26,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11227.5,8671.37,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Bricks_V1_F",[11206.1,8637.06,0.0121307],1.66864,[[0.0291192,0.999576,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11224.1,8661.58,0.326813],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11221.7,8661.63,0.326813],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11219.2,8661.68,0.326813],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11216.7,8661.73,0.326813],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11216.7,8661.73,2.97078],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11219.2,8661.68,2.95471],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11221.7,8661.63,2.94658],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11224.1,8661.58,2.93243],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[11226.6,8661.54,2.65004],271.113,[[-0.999811,0.0194247,0],[0,0,1]],false],
				["Land_Cargo10_military_green_F",[11153.2,8733.34,2.69455],192.325,[[-0.213452,-0.976954,0],[-0,0,1]],false],
				["Land_Cargo10_military_green_F",[11153.2,8733.34,5.30055],191.416,[[-0.197925,-0.980217,0],[-0,0,1]],false],
				["Land_Pipes_large_F",[11204.5,8624.28,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11199.8,8624.28,0.00932312],359.992,[[-0.000139538,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11199.8,8623.12,0.00932312],359.993,[[-0.000121895,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11204.5,8623.12,0.00932312],359.993,[[-0.000121895,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11209.2,8623.12,0.00932312],359.993,[[-0.000121895,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11209.2,8621.96,0.00932312],359.993,[[-0.000121895,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11204.5,8621.96,0.00932312],359.993,[[-0.000121895,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11199.8,8621.96,0.00932312],359.993,[[-0.000121895,1,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11209.2,8624.29,0.00932312],359.992,[[-0.000139538,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[11226.6,8629.46,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11226.5,8623.7,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[11226.3,8617.98,-0.283401],91.8181,[[0.999497,-0.0317269,0],[0,-0,1]],false],
				["Land_Pallet_MilBoxes_F",[11216.2,8722,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[11214.3,8721.99,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[11214.4,8723.95,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Pallet_MilBoxes_F",[11216.2,8723.95,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V3_F",[11159.5,8719.62,0.942459],281.364,[[-0.980395,0.197042,0],[0,0,1]],false],
				["Land_Cargo_House_V3_F",[11167.7,8707.71,0.900497],192.273,[[-0.21257,-0.977146,0],[-0,0,1]],false],
				["Land_Cargo_House_V3_F",[11161.3,8712.28,0.977722],234.545,[[-0.814571,-0.580063,0],[-0,0,1]],false],
				["Land_Cargo_Patrol_V3_F",[11224.8,8619.05,0.0262299],271.364,[[-0.999717,0.0238043,0],[0,0,1]],false],
				["Land_Cargo_Patrol_V3_F",[11151.8,8693.23,0.0312195],65.4546,[[0.909632,0.415414,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_F",[11204.1,8759.69,5.57898],284.545,[[-0.967951,0.251141,0],[0,0,1]],false],
				["Land_TTowerSmall_2_F",[11170.8,8760.25,13.0221],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[11168.1,8760.76,11.3149],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[11176.5,8696.94,1.25031],0,[[0,1,0],[0,0,1]],false],
				["Land_BarGate_F",[11186.9,8758.01,0],7.72728,[[0.134458,0.990919,0],[0,0,1]],false],
				["Land_Stone_pillar_F",[11181.9,8758.89,0],10,[[0.173648,0.984808,0],[0,0,1]],false],
				["Land_Stone_pillar_F",[11192.4,8757.01,0],10,[[0.173648,0.984808,0],[0,0,1]],false],
				["Land_Pipes_large_F",[11223.9,8672.71,0],99.5454,[[0.986154,-0.165829,0],[0,-0,1]],false],
				["Land_Pipes_large_F",[11224.5,8679.28,0],99.5454,[[0.986154,-0.165829,0],[0,-0,1]],false],
				["Land_Pipes_large_F",[11224.8,8685.3,0],99.5454,[[0.986154,-0.165829,0],[0,-0,1]],false],
				["Land_Pipes_large_F",[11223.2,8685.54,0],99.5454,[[0.986154,-0.165829,0],[0,-0,1]],false],
				["Land_Pipes_large_F",[11223,8679.45,0],99.5454,[[0.986154,-0.165829,0],[0,-0,1]],false],
				["Land_Pipes_large_F",[11222.3,8673.22,0],99.5454,[[0.986154,-0.165829,0],[0,-0,1]],false],
				["Land_Timbers_F",[11218.1,8674.5,-0.000259399],0,[[0,0.984656,0.174509],[0,-0.174509,0.984656]],false],
				["Land_Timbers_F",[11218.1,8684.85,0.0724945],0,[[0,0.992162,0.124962],[0,-0.124962,0.992162]],false],
				["Land_TentA_F",[11223.5,8711.9,0.0052948],274.091,[[-0.997452,0.0713414,0],[0,0,1]],false],
				["Land_TentA_F",[11223.7,8714.6,0.0052948],274.091,[[-0.997452,0.0713414,0],[0,0,1]],false],
				["Land_Scaffolding_F",[11213.4,8762.79,0],183.636,[[-0.0634179,-0.997987,0],[-0,0,1]],false],
				["Land_Scaffolding_F",[11147.5,8747.62,0],16.8181,[[0.289334,0.957228,0],[0,0,1]],false],
				["Land_CncBarrierMedium4_F",[11142.4,8699.37,-0.603775],258.182,[[-0.978803,-0.204803,0],[-0.0204932,0.0979417,0.994981]],false],
				["Land_CncBarrierMedium4_F",[11143.9,8691.97,-0.597107],258.182,[[-0.978803,-0.204803,0],[-0,0,1]],false],
				["Land_CncBarrierMedium4_F",[11145.6,8684.72,-0.595978],75.0242,[[0.966035,0.258411,0],[0.0322915,-0.120717,0.992162]],false],
				["Land_CncBarrierMedium4_F",[11148.6,8678.04,-0.522461],57.273,[[0.841256,0.540637,0],[0.0675589,-0.105125,0.992162]],false],
				["Land_CncBarrierMedium4_F",[11152.9,8672.15,-0.464462],49.5457,[[0.760924,0.648841,0],[0.0971849,-0.113973,0.988719]],false],
				["Land_CncBarrierMedium4_F",[11158.3,8666.95,-0.455765],38.6366,[[0.624379,0.781122,0],[0,0,1]],false],
				["Land_CncBarrierMedium4_F",[11164.4,8662.88,-0.452011],28.5865,[[0.478485,0.878096,0],[0,0,1]],false],
				["Land_CncBarrierMedium4_F",[11171.2,8659.7,-0.455765],19.5457,[[0.334559,0.942375,0],[0,0,1]],false],
				["Land_CncBarrierMedium4_F",[11178,8656.88,-0.453918],206.283,[[-0.442805,-0.896618,0],[-0.0897202,0.0443094,0.994981]],false],
				["Land_CncBarrierMedium4_F",[11184.5,8653.42,-0.455688],208.939,[[-0.483878,-0.875135,0],[-0.152719,0.0844413,0.984656]],false],
				["Land_CncBarrierMedium4_F",[11191.2,8650.24,-0.435608],203.03,[[-0.391213,-0.9203,0],[-0.115004,0.0488876,0.992161]],false],
				["Land_CncWall4_F",[11193.3,8760.14,-0.70993],288.318,[[-0.949327,0.314291,0],[0.0477735,0.144302,0.98838]],false],
				["Land_CncWall4_F",[11194.9,8765.22,-0.697586],288.318,[[-0.949327,0.314291,0],[0.023605,0.0712998,0.997176]],false],
				["Land_CncWall4_F",[11198.4,8768.7,-0.694336],331.045,[[-0.484122,0.875,0],[0.0657175,0.0363603,0.997176]],false],
				["Land_CncWall4_F",[11203.6,8768.83,-0.694275],186.045,[[-0.10531,-0.994439,0],[-0,0,1]],false],
				["Land_CncWall4_F",[11208.4,8767.49,-0.694275],211.045,[[-0.515711,-0.856762,0],[-0,0,1]],false],
				["Land_CncWall4_F",[11181.8,8762.07,-0.694275],279.227,[[-0.987061,0.160347,0],[0,0,1]],false],
				["Land_CncWall4_F",[11181.4,8767.02,-0.694275],254.227,[[-0.962346,-0.271826,0],[-0,0,1]],false],
				["Land_CncWall4_F",[11178.8,8771.22,-0.694275],223.773,[[-0.691803,-0.722086,0],[-0,0,1]],false],
				["Land_CncWall4_F",[11174.5,8773.29,-0.694275],194.227,[[-0.245764,-0.96933,0],[-0,0,1]],false],
				["Land_CncWall4_F",[11169.8,8772.86,-0.694275],156.954,[[0.39147,-0.920191,0],[0,-0,1]],false],
				["Land_BagFence_Long_F",[11240.1,8711.41,-0.116699],94.5455,[[0.996855,-0.0792509,0],[-0.00990351,-0.124571,0.992161]],false],
				["Land_BagFence_Long_F",[11240.6,8717.61,-0.11293],94.5455,[[0.996855,-0.0792509,0],[0,-0,1]],false],
				["Land_BagFence_Round_F",[11241.7,8710.59,0],321.364,[[-0.62437,0.781129,0],[0,0,1]],false],
				["Land_BagFence_Round_F",[11243.1,8713.09,0],272.273,[[-0.999213,0.0396615,0],[0,0,1]],false],
				["Land_BagFence_Round_F",[11243,8715.96,-0.176392],255.909,[[-0.96991,-0.243462,0],[-0,0,1]],false],
				["Land_BagFence_Round_F",[11242.1,8718.32,0],221.364,[[-0.660841,-0.750526,0],[-0,0,1]],false],
				["Land_BagFence_Round_F",[11239.3,8713.11,0],165.909,[[0.243462,-0.96991,0],[0,-0,1]],false],
				["Land_BagFence_Round_F",[11239.4,8715.82,0],355.909,[[-0.0713408,0.997452,0],[0,0,1]],false],
				["Land_Research_house_V1_F",[11213.1,8733.84,0.272751],47.7273,[[0.739952,0.67266,0],[0,0,1]],false],
				["Land_Research_house_V1_F",[11201.8,8740.19,1.21947],355.455,[[-0.0792419,0.996855,0],[0,0,1]],false],
				["Land_Medevac_house_V1_F",[11190,8692.51,0.954269],200,[[-0.34202,-0.939693,0],[-0,0,1]],false],
				["Land_Radar_Small_F",[11204.8,8708.91,0.038208],345.454,[[-0.251157,0.967946,0],[0,0,1]],false]
			]
 		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","VEE"],   	[  [1,"Rifleman_E"],[2,"SMG_E"]  ], 	["Loiter",		[11186.226563,8756.0986328,0.00111389],[11186.226563,8756.0986328,0.00111389],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["Loiter",		[11219.361328,8713.09375,0.00143433],[11219.361328,8713.09375,0.00143433],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[11204.504883,8761.953125,23.675629],[11204.504883,8761.953125,23.675629],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[11225.90332,8618.645508,4.430069],[11225.90332,8618.645508,4.430069],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[11150.485352,8693.194336,4.376694],[11150.485352,8693.194336,4.376694],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],  ["Explore",		[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"LMG_E"]  ],   	["Buildings",	[0,0],[0,0],[100]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns                     
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[11241.7,8717.9,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[11241.1,8711.61,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[11226,8721.05,0],				[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[11163.5,8751.62,0],			[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[11174.8,8703.32,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[11217.5,8729.27,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[11195.5,8760.27,5.46542],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[11154.8,8729.5,0],			[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[11142.9,8727.56,7.96967],		[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[11139.2,8723.38,8.40753],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[11140.4,8717.04,7.24477],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[11175.2,8770.28,10.9824],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[11168.6,8769.16,11.515],		[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[11178.6,8669.11,11.7619],		[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[11191.8,8675.42,11.7433],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[11221.3,8638.48,5.22684],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[11213.5,8631,5.08504],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[11216.6,8639.21,5.0632],		[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list ND Hv less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [19, "Rifleman_E"]  ],   ["Gunner",[0,0],[12227,8371.93,3.08834],[0]   ]

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
			["AllDead",		["LowUnitCount","EAST",1,200,[0,0]]  ],		// Always leaves one behind as a special surprise for players.
			["LUCNT",		["LowUnitCount","EAST",10,200,[0,0]]  ]		// Triggers call for reinforcements

		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead"     ]],
			[["LOSE"],["TIMER"     ]],
			[["CHILD",	["Help_Helo",[0,0],5,120]],["LUCNT"     ]],  
			[["END"],["AllDead","OR","TIMER"    ]]  
		]
  
	]


];
