// 	Mayor.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 22755.4,7766.04 as this map is specific to Altis
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Kill the Mayor" v2.1 static mission for Altis.
	Credits to Pradatoru for mapping
	Created by [CiC]red_ned using templates by eraser1 
	19 years of CiC http://cic-gaming.co.uk
*/
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["Mayor", 300], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Stop the Mayor","hd_objective","ELLIPSE","ColorRed","SolidBorder",300],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
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
			"Stop the Mayor",	// The first line is the title of the pop-up box
			"The old Mayors troops are trying to set up his old home as a new base"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Mayor's return has been stopped!",
			"Convicts have successfully killed the Mayors troops and prevented his return"
		],
	  
		// Mission Failure Message
		[
			"Mayor has returned to power!",
			"The Mayors troops have left his house and the Mayor is free to rule..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics																		

		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[		
			["AltisStaticLoot" , 	[[22753.7,7663.57,0.481731],[22698.5,7758.17,0],[22785.9,7709.83,0.799274]]],
			["AltisStaticLoot" , 	[[22673.5,7763.94,3.58486],[22681.8,7823.54,0],[22750.5,7761.01,0.97084] ]]

		], // Win loot, offset location - spawns after mission success
		["None" , 		[0,0] ]  // Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Land_Cargo_HQ_V1_F",[22676.7,7769.34,0],136.023,[[0.69437,-0.719619,0],[0,-0,1]],false],
				["Land_i_House_Big_01_V2_dam_F",[22686.6,7812.83,0],316.534,[[-0.687924,0.725783,0],[0,0,1]],false],
				["Land_i_House_Big_02_V1_dam_F",[22694.4,7805.1,0],48.0682,[[0.743941,0.668245,0],[0,0,1]],false],
				["Land_ToiletBox_F",[22663.5,7775.41,0],42.4432,[[0.674859,0.737947,0],[0,0,1]],false],
				["Land_Cargo20_grey_F",[22673,7819.68,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22643.6,7815.53,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22768.7,7733.11,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22770,7646.47,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22707.1,7716.92,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22719.4,7790.34,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22681.8,7745.16,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22754.3,7747.04,1.0983],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22703.9,7810.88,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22672.5,7779.55,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22680.1,7829.83,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22705.3,7762.51,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22642.6,7788.86,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Scrap_MRAP_01_F",[22736.1,7725.87,0],0,[[0,1,0],[0,0,1]],false],
				["Land_i_Shop_01_V1_F",[22703.9,7789.32,-0.000495911],52.1591,[[0.789717,0.613471,0],[0.0214098,-0.0275607,0.999391]],false],
				["Land_FuelStation_Shed_F",[22715.7,7776,0.00218201],48.5796,[[0.749875,0.661579,0],[0.0576604,-0.065356,0.996195]],false],
				["Land_wpp_Turbine_V2_F",[22662.3,7768.91,0],38.8636,[[0.627468,0.778642,0],[0,0,1]],false],
				["Land_i_Barracks_V2_F",[22738.5,7744.8,-0.267296],47.5568,[[0.737552,0.67326,0.052328],[-0.0268594,-0.0481807,0.998477]],false],
				["Land_cargo_house_slum_F",[22669.7,7758.68,0],0,[[0,1,0],[0,0,1]],false],
				["Land_cargo_house_slum_F",[22713.3,7808.26,0.00949097],0,[[0,1,0],[0.173648,0,0.984808]],false],
				["Land_cargo_house_slum_F",[22707.3,7813.94,-0.133644],272.046,[[-0.98418,0.0351594,0.173648],[0.173537,-0.00619955,0.984808]],false],
				["Land_i_House_Big_01_V2_dam_F",[22713.1,7728.11,-0.00172424],141.136,[[0.627474,-0.778638,0],[-0.054315,-0.0437704,0.997564]],false],
				["Land_u_House_Big_01_V1_dam_F",[22759.2,7720.68,0],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_i_House_Big_01_V2_dam_F",[22760.4,7651.12,0.768269],323.693,[[-0.592111,0.805856,0],[0,0,1]],false],
				["Land_Chapel_V1_F",[22811.9,7633.82,0],348.75,[[-0.19509,0.980785,0],[0,0,1]],false],
				["Land_Wreck_T72_hull_F",[22638.5,7794.22,0.00543213],151.875,[[0.471397,-0.881921,0],[-0.137963,-0.0737427,0.987688]],false],
				["Land_Wreck_T72_turret_F",[22642.4,7795.98,-0.828842],329.83,[[-0.502567,0.864538,-0],[-7.55803e-008,-4.39358e-008,-1]],false],
				["Land_Wreck_Ural_F",[22754.5,7702.63,0.0303345],3.06819,[[0.0535242,0.998567,0],[0,0,1]],false],
				["Land_Wreck_BRDM2_F",[22700.6,7761.6,0.244194],16.8746,[[0.290278,0.956942,0],[0,0,1]],false],
				["Land_Wreck_Heli_Attack_01_F",[22723,7740.25,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No1_F",[22845.8,7697.38,-0.00379562],359.488,[[-0.00893563,0.99996,0],[0.0174517,0.000155948,0.999848]],false],
				["Land_Cargo_Tower_V1_No2_F",[22816,7783.68,0.304016],320.113,[[-0.641275,0.767311,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No3_F",[22739.2,7870.37,0.228844],298.125,[[-0.881921,0.471397,0],[0,0,1]],false],
				["Land_Cargo_Tower_V1_No4_F",[22680,7937.4,-0.277687],273.068,[[-0.998567,0.0535213,0],[0,0,1]],false],
				["Land_City2_8m_F",[22703.3,7709.21,-0.130154],50.1136,[[0.767317,0.641268,0],[0.0223799,-0.026779,0.999391]],false],
				["Land_City2_8m_F",[22698.8,7714.59,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22694.3,7719.98,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22689.8,7725.41,2.67029e-005],50.1136,[[0.767317,0.641268,0],[0.0781509,-0.0935125,0.992546]],false],
				["Land_City2_8m_F",[22685.3,7730.75,2.67029e-005],50.1136,[[0.767317,0.641268,0],[0.0781509,-0.0935125,0.992546]],false],
				["Land_City2_8m_F",[22680.8,7736.06,-0.141922],50.1136,[[0.767317,0.641268,0],[0.12236,-0.146411,0.981627]],false],
				["Land_City2_8m_F",[22676.4,7741.27,-0.0872612],50.1136,[[0.767317,0.641268,0],[0.133327,-0.159534,0.978148]],false],
				["Land_City2_8m_F",[22672,7746.49,5.72205e-005],50.1136,[[0.767317,0.641268,0],[0.133327,-0.159534,0.978148]],false],
				["Land_City2_8m_F",[22667.7,7751.67,-0.269814],50.1136,[[0.767317,0.641268,0],[0.111355,-0.133243,0.984808]],false],
				["Land_City2_8m_F",[22663.4,7756.85,-0.175133],51.1364,[[0.778642,0.627468,0],[0.108959,-0.13521,0.984808]],false],
				["Land_City2_8m_F",[22659.1,7762.11,0.250526],50.1136,[[0.767317,0.641268,0],[0.0558902,-0.0668761,0.996195]],false],
				["Land_City2_8m_F",[22654.7,7767.33,0.219757],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22650.3,7772.72,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22645.9,7777.9,-0.0412445],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22641.4,7783.1,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22636.9,7788.49,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22632.5,7793.8,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22707.8,7703.82,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22712.4,7698.43,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22716.9,7693.04,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22721.4,7687.66,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22725.8,7682.16,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22730.1,7676.61,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22734.4,7671.07,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22738.7,7665.52,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22743,7659.98,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22747.3,7654.43,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22751.6,7648.89,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22755.9,7643.35,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22760.2,7637.8,0],52.159,[[0.789716,0.613472,0],[0,0,1]],false],
				["Land_City2_8m_F",[22764.2,7632.51,-4.95911e-005],52.159,[[0.789716,0.613472,0],[0.0214099,-0.0275607,0.999391]],false],
				["Land_City2_8m_F",[22768.5,7627.05,0.225006],52.159,[[0.789716,0.613472,0],[0.0427937,-0.0550878,0.997564]],false],
				["Land_City2_8m_F",[22773.7,7625.95,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22779.5,7629.85,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22793.7,7639.31,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22799.5,7643.21,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22805.4,7647.11,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22811.2,7651.01,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22817.1,7654.91,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22822.9,7658.81,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22828.7,7662.71,0.216385],326.25,[[-0.55557,0.83147,0],[0,0,1]],false],
				["Land_City2_8m_F",[22829.7,7667.31,0.840748],234.716,[[-0.816299,-0.57763,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22825.7,7673.04,0.840748],234.716,[[-0.816299,-0.57763,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22821.6,7678.77,0.840748],234.716,[[-0.816299,-0.57763,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22817.6,7684.5,0.840748],234.716,[[-0.816299,-0.57763,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22813.6,7690.1,0.840755],234.716,[[-0.816299,-0.57763,0],[-0.0402934,0.0569421,0.997564]],false],
				["Land_City2_8m_F",[22809.6,7695.75,0.840748],234.716,[[-0.816299,-0.57763,0],[-0.0402934,0.0569421,0.997564]],false],
				["Land_City2_8m_F",[22805.6,7701.45,1.55832],234.716,[[-0.816299,-0.57763,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22801.5,7707.05,1.13583],54.2047,[[0.811112,0.584891,0],[0.0509766,-0.0706931,0.996195]],false],
				["Land_City2_8m_F",[22797.6,7712.77,0.740505],54.716,[[0.816299,0.57763,0],[0.0803905,-0.113607,0.990268]],false],
				["Land_City2_8m_F",[22793.6,7718.37,0.460152],53.6933,[[0.805859,0.592107,0],[0.112979,-0.153765,0.981627]],false],
				["Land_City2_8m_F",[22789.5,7723.84,0.231682],52.1592,[[0.789719,0.613469,0],[0.138001,-0.177648,0.97437]],false],
				["Land_City2_8m_F",[22785.6,7729.43,0.195328],56.2501,[[0.83147,0.555569,0],[0.134404,-0.201151,0.970296]],false],
				["Land_City2_8m_F",[22781.6,7734.83,0.169189],51.6478,[[0.784211,0.620494,0],[0.107748,-0.136177,0.984808]],false],
				["Land_City2_8m_F",[22777.6,7740.1,0.0246124],53.6933,[[0.805859,0.592107,0],[0.0206643,-0.0281241,0.999391]],false],
				["Land_City2_8m_F",[22768.9,7753.27,0.840744],234.716,[[-0.816299,-0.57763,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22764.6,7758.66,1.23117],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22760,7763.92,1.55804],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22755.3,7769.19,1.23117],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22750.7,7774.45,1.23117],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22746,7779.72,1.66387],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22741.4,7784.98,1.23117],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22736.7,7790.25,1.44505],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22732.1,7795.51,1.23121],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22727.4,7800.77,0.888077],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22722.8,7806.11,0.883614],48.58,[[0.74988,0.661573,0],[0.046149,-0.052309,0.997564]],false],
				["Land_City2_8m_F",[22718.2,7811.3,0.705246],48.0687,[[0.743947,0.668239,0],[0.0349729,-0.0389352,0.99863]],false],
				["Land_City2_8m_F",[22708.7,7821.99,0.167656],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22704.2,7827.1,0.481499],228.58,[[-0.74988,-0.661574,0],[-0.046149,0.052309,0.997564]],false],
				["Land_City2_8m_F",[22699.6,7832.36,0.515564],228.58,[[-0.74988,-0.661574,0],[-0.0346241,0.0392457,0.99863]],false],
				["Land_City2_8m_F",[22694.9,7837.63,0.347473],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22690.2,7842.91,0.425446],228.58,[[-0.74988,-0.661574,0],[-0,0,1]],false],
				["Land_City2_8m_F",[22685.7,7847.99,0.799789],228.58,[[-0.74988,-0.661574,0],[-0.0806255,0.0913874,0.992546]],false],
				["Land_City2_8m_F",[22681.1,7853.23,1.5052],228.58,[[-0.74988,-0.661574,0],[-0.0806255,0.0913874,0.992546]],false],
				["Land_City2_8m_F",[22628.1,7798.97,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22623.8,7804.18,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22619.9,7814.14,0.190086],143.534,[[0.594346,-0.80421,0],[0,-0,1]],false],
				["Land_City2_PillarD_F",[22715.4,7814.24,0.412369],42.9545,[[0.681417,0.731895,0],[0,0,1]],false],
				["Land_City2_PillarD_F",[22775.4,7743.12,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22619.3,7809.57,0],50.1136,[[0.767317,0.641268,0],[0,0,1]],false],
				["Land_City2_8m_F",[22625.6,7818.32,0.190086],143.534,[[0.594346,-0.80421,0],[0,-0,1]],false],
				["Land_City2_8m_F",[22631.2,7822.49,0.190086],143.534,[[0.594346,-0.80421,0],[0,-0,1]],false],
				["Land_City2_8m_F",[22636.9,7826.66,0.190086],143.534,[[0.594346,-0.80421,0],[0,-0,1]],false],
				["Land_City2_8m_F",[22675.8,7853.84,1.4545],145.068,[[0.572604,-0.819832,0],[0,-0,1]],false],
				["Land_City2_8m_F",[22670,7849.82,0.787693],145.068,[[0.572604,-0.819832,0],[0,-0,1]],false],
				["Land_City2_8m_F",[22664.3,7845.8,1.4545],145.068,[[0.572604,-0.819832,0],[0,-0,1]],false],
				["Land_City2_8m_F",[22658.5,7841.78,1.4545],145.068,[[0.572604,-0.819832,0],[0,-0,1]],false],
				["Land_City2_8m_F",[22652.8,7837.76,0.628738],145.068,[[0.572604,-0.819832,0],[0,-0,1]],false],
				["Land_i_Stone_HouseSmall_V1_F",[22637.9,7811.88,0],230.625,[[-0.773011,-0.634393,0],[-0,0,1]],false],
				["Land_Unfinished_Building_02_F",[22771.4,7704.74,0],54.7159,[[0.816298,0.577631,0],[0,0,1]],false],
				["Land_Crane_F",[22776,7714.17,0],104.83,[[0.966689,-0.255952,0],[0,-0,1]],false],
				["Land_dp_smallFactory_F",[22776,7640.59,0],324.205,[[-0.584887,0.811115,0],[0,0,1]],false],
				["Land_i_Shop_02_V1_F",[22668.8,7833.04,0],136.023,[[0.69437,-0.719619,0],[0,-0,1]],false],
				["Land_i_Shop_01_V2_F",[22810.3,7663.23,-0.300602],57.2727,[[0.841253,0.540641,0],[0,0,1]],false],
				["Land_i_Shop_02_V3_F",[22725.6,7762.62,0],316.534,[[-0.686248,0.724015,0.0697565],[0.0479872,-0.050628,0.997564]],false],
				["Land_Offices_01_V1_F",[22797.6,7686,-0.283375],56.25,[[0.83147,0.55557,0],[0,0,1]],false],
				["Land_BC_Court_F",[22750.4,7761.3,0.382629],136.534,[[0.687924,-0.725783,0],[0,-0,1]],false],
				["Land_BC_Basket_F",[22759.4,7751.74,0],316.534,[[-0.687924,0.725783,0],[0,0,1]],false],
				["Land_BC_Basket_F",[22741.2,7770.82,0],136.534,[[0.687924,-0.725783,0],[0,-0,1]],false],
				["Land_LampDecor_F",[22746.7,7775.64,1.67447],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22736.6,7766,0.484039],0,[[0,1,0],[0,0,1]],false],
				["Land_LampDecor_F",[22764.7,7756.84,1.21416],0,[[0,1,0],[0,0,1]],false],
				["Land_City2_8m_F",[22642.5,7830.83,0.190086],143.534,[[0.594346,-0.80421,0],[0,-0,1]],false],
				["Land_wpp_Turbine_V2_F",[22796,7656.85,0],38.8636,[[0.627468,0.778642,0],[0,0,1]],false],
				["Land_i_House_Big_02_V3_F",[22724,7709.9,0.663048],51.6483,[[0.784217,0.620487,0],[0,0,1]],false],
				["Land_i_House_Big_01_V2_F",[22734.6,7693.5,0.886032],330.341,[[-0.494837,0.868986,0],[0,0,1]],false],
				["Land_i_House_Small_02_V1_F",[22743,7679.97,0.303696],146.761,[[0.548132,-0.836392,0],[0,-0,1]],false],
				["Land_i_House_Small_01_V2_F",[22748.8,7669.95,0.286724],233.182,[[-0.800543,-0.599275,0],[-0,0,1]],false],
				["Land_i_House_Small_01_V2_F",[22702.6,7740.06,1.44091],53.1818,[[0.800541,0.599278,0],[0,0,1]],false],
				["Land_BarGate_F",[22647.2,7834.83,0.0992126],327.273,[[-0.540636,0.841257,0],[0,0,1]],false],
				["Land_BarGate_F",[22786.9,7633.65,0],329.318,[[-0.510273,0.860013,0],[0,0,1]],false],
				["Land_BagBunker_Tower_F",[22781.2,7624.64,0],239.318,[[-0.860013,-0.510273,0],[-0,0,1]],false],
				["Land_BagBunker_Tower_F",[22638.6,7834.16,0],56.7614,[[0.836395,0.548127,0],[0,0,1]],false]
			]
		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"Rifleman_E"]  ],   				["Loiter",		[22788.0078125,7630.733887,0.0015831],[22788.0078125,7630.733887,0.0015831],[50]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [3,"LMG_E"]  ],   					["Loiter",		[22648.419922,7833.15625,0.00106049],[22648.419922,7833.15625,0.00106049],[50]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Hunter_E"]  ],   	["Buildings",	[22767.582031,7667.0234375,0.00132751],[22767.582031,7667.0234375,0.00132751],[75]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [2,"Sniper_E"]  ],   				["TowerGuard",	[22793.271484,7689.626465,17.810936],[22793.271484,7689.626465,17.810936],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22849.380859,7697.429688,18.547241],[22849.380859,7697.429688,18.547241],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22818.0625,7785.050293,18.912285],[22818.0625,7785.050293,18.912285],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22740.378906,7873.231934,18.979851],[22740.378906,7873.231934,18.979851],[100, "ANY"]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"]  ],   				["TowerGuard",	[22679.738281,7940.896484,17.935356],[22679.738281,7940.896484,17.935356],[150, "ANY"]   ]],
		[["EAST","COMBAT","RED","VEE"],   	[  [4,"Hunter_E"]  ],   				["BoxPatrol",	[0,0],[0,0],[200]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [4,"Rifleman_E"]  ],   				["Explore",		[0,0],[0,0],[100]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"SMG_E"]  ],   	["Buildings",	[22683.398438,7782.279785,0.0014267],[22683.398438,7782.279785,0.0014267],[75]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Hunter_E"]  ],   	["Buildings",	[22737.0664063,7714.027832,0.00156021],[22737.0664063,7714.027832,0.00156021],[75]   ]],
		[["EAST","COMBAT","RED","COLUMN"],  [  [1,"Sniper_E"],[3,"Rifleman_E"]  ],	["Explore",		[0,0],[0,0],[200]   ]]

	],
	[			// Vehicles	
		[  		// Static Guns  
			[   // Vehicle                     Offset     				Direction   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[((round random 100)-50),((round random 100)-50)],						[0],     	"None" ],
				[  "O_HMG_01_high_F"       	,[22842.4,7695.57,17.8621],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[22813.9,7780.85,18.2571],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[22738.4,7867.2,17.6482],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[22716.8,7733.74,0.381149],	[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[22694.9,7793.23,0.257057],	[0],     	"None" ], 
				[  "O_HMG_01_high_F"       	,[22681.8,7933.78,18.1068],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[22811.7,7672.22,0.245289],	[0],        "None" ],  
				[  "O_HMG_01_high_F"   		,[22656.9,7794.08,0],			[0],     	"None" ]
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
			[["WIN"],	["AllDead" ,"PLAYERNEAR"   ]],
			[["LOSE"],	["TIMER"     ]],
			[["CHILD",	["Help_Helo",[0,0],5,120]],["LUCNT"     ]],  
			[["END"],	["AllDead","OR","TIMER"    ]]  
		]
	]


];
