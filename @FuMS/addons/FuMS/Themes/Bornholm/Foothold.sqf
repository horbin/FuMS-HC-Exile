// 	Foothold.sqf
// 	TheOneWhoKnocks
// 	4/20/19
// 	Spawn location should be 7100.12,15745.2 as this map is specific to Bornholm
// 	This mission was ported from [CiC]red_ned's amazing collection of missions that he has developed for the DMS mission system
//	ORIGINAL CREDITS
/*
	"Operation Foothold" v2.1 static mission for Bornholm.
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
	["Foothold", 150], 	// Mission Title NOSPACES!, and encounter radius.  This example has no options
	["Operation Foothold","hd_objective","ELLIPSE","ColorRed","SolidBorder",150],    // Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[				// NOTIFICATION Messages and Map display Control.
		false, "ALL",0, // Notify players via Radio Message, radio channel, range from encounter center (0=unlimited.
		true, 			// Notify players via global toast message
		true,			// Show encounter area on the map
		900,    		// Win delay: Time in seconds after a WIN before mission cleanup is performed
		300       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
						//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
		[		
			"Operation Foothold",	// The first line is the title of the pop-up box
			"Terrorists are trying to get a foothold in the area, stop them!"		// The second line is the actual text in the box
		],
		
		// Mission Success Message
		[
			"Operation Foothold stopped!",
			"Convicts have successfully killed the terrorists and stolen all the crates"
		],
	  
		// Mission Failure Message
		[
			"Foothold Established!",
			"The terrorists have moved off to resupply..."
		] 
	],
	[  	//  Loot Config:  Refer to LootData.sqf for specifics	

									
									


	
		["None" , 		[5,5] ], //[static loot, offset location] - spawns with the mission
		[	
			["FootholdLoot" , 	[[7156.96,15697.6,-0.0548019],[7135.64,15696.4,0],[7114.54,15740.7,0]]],
			["FootholdLoot" , 	[[7068.9,15692.1,0],[7071.96,15751.4,0],[7134.71,15781.9,0]]]

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
		
		// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.

		
		["Sign_Arrow_Blue_F", [7061.15,15688.4,0.0294113], 0, 0],
		["Sign_Arrow_Blue_F", [7049.15,15691.5,4.50158], 0, 0],
		["Sign_Arrow_Blue_F", [7056.9,15698.8,4.50158], 0, 0],
		["Sign_Arrow_Blue_F", [7052.89,15722,0], 0, 0],
		["Sign_Arrow_Blue_F", [7053.45,15755.7,0], 0, 0],
		["Sign_Arrow_Blue_F", [7052.1,15790.5,0], 0, 0],
		["Sign_Arrow_Blue_F", [7060.78,15774.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [7081.85,15764.7,0], 0, 0],
		["Sign_Arrow_Blue_F", [7102.5,15761.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [7131.38,15762.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [7084.99,15796.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [7218.88,15767.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [7218.94,15752.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [7181.74,15779.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [7168.35,15779.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [7150.28,15798.3,4.21044], 0, 0],
		["Sign_Arrow_Blue_F", [7157.44,15790.1,3.98317], 0, 0],
		["Sign_Arrow_Blue_F", [7185.44,15738.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [7187.86,15743.2,4.16763], 0, 0],
		["Sign_Arrow_Blue_F", [7187.34,15772.1,4.26975], 0, 0],
		["Sign_Arrow_Blue_F", [7190.82,15717.9,0], 0, 0],
		["Sign_Arrow_Blue_F", [7190.84,15690.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [7177.29,15686.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [7120.79,15699.5,0], 0, 0],
		["Sign_Arrow_Blue_F", [7100.18,15700.6,0], 0, 0],
		["Sign_Arrow_Blue_F", [7080.71,15703,0], 0, 0],
		["Sign_Arrow_Blue_F", [7079.81,15731,0], 0, 0],
		["Sign_Arrow_Blue_F", [7120.98,15734.8,0], 0, 0],
		["Sign_Arrow_Blue_F", [7109.03,15735.3,0], 0, 0],
		["Sign_Arrow_Blue_F", [7145.6,15735.5,0], 0, 0],
		["Sign_Arrow_Blue_F", [7160.64,15693.4,0], 0, 0],
		["Sign_Arrow_Blue_F", [7139.41,15692.5,0], 0, 0],

		
		["M3Editor", [-1,-1], "NONE", 0,											
			[	// paste your array of building objects here
				["Land_Cargo_House_V1_F",[7086.95,15776.9,1.28775],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[7096.29,15775.7,1.01137],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[7105.53,15775.6,0.953346],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[7114.57,15775.6,0.928482],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[7123.83,15775.3,0.81089],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[7133.59,15775.4,1.01137],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[7076.94,15777,1.04096],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_House_V1_F",[7078.92,15757.4,1.01137],179.091,[[0.0158643,-0.999874,0],[0,-0,1]],false],
				["Land_Cargo_House_V1_F",[7088.34,15756.9,1.01137],179.091,[[0.0158643,-0.999874,0],[0,-0,1]],false],
				["Land_Cargo_House_V1_F",[7097.18,15756.5,1.01137],179.091,[[0.0158643,-0.999874,0],[0,-0,1]],false],
				["Land_Cargo_House_V1_F",[7105.66,15756.8,1.01137],179.091,[[0.0158643,-0.999874,0],[0,-0,1]],false],
				["Land_Cargo_House_V1_F",[7114.58,15756.7,1.01137],179.091,[[0.0158643,-0.999874,0],[0,-0,1]],false],
				["Land_Cargo_House_V1_F",[7123.69,15756.4,1.01137],179.091,[[0.0158643,-0.999874,0],[0,-0,1]],false],
				["Land_Cargo_House_V1_F",[7133.18,15756.4,1.01137],179.091,[[0.0158643,-0.999874,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7133.81,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7128.01,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7122.2,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7116.39,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7110.58,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7104.78,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7098.97,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7093.16,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7087.39,15787,-0.0965958],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7081.54,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7075.74,15786.9,-0.156639],0,[[0,1,0],[0.0500967,0,0.998744]],false],
				["Land_HBarrier_5_F",[7069.93,15786.9,-0.0993958],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7139.62,15786.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7067.76,15783.3,-0.00799561],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7067.63,15777.5,-0.00799561],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7067.49,15771.7,-0.00799561],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7067.35,15765.9,-0.00799561],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7067.21,15760.1,-0.00799561],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7067.07,15754.3,-0.00799561],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7066.94,15748.5,-0.00799561],91.3636,[[0.999717,-0.023797,0],[0,-0,1]],false],
				["Land_HBarrier_5_F",[7070.64,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7076.45,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7082.26,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7088.06,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7093.87,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7099.68,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7105.49,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7111.29,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7117.1,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7122.91,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7128.72,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7134.52,15746.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7140.33,15746.2,3.05176e-005],180,[[-8.74228e-008,-1,0],[-0.0244322,2.13593e-009,0.999701]],false],
				["Land_HBarrier_5_F",[7142.4,15750.1,0],269.545,[[-0.999968,-0.00794067,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[7141.69,15783.4,0],268.636,[[-0.999717,-0.0238038,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[7142.35,15755.9,0],269.545,[[-0.999968,-0.00794067,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[7146.11,15757.9,0],358.182,[[-0.0317247,0.999497,0],[0,0,1]],false],
				["Land_HBarrier_5_F",[7141.83,15777.6,0],268.636,[[-0.999717,-0.0238038,0],[-0,0,1]],false],
				["Land_HBarrier_5_F",[7145.64,15775.7,0],358.182,[[-0.0317247,0.999497,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7071.11,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7079.48,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7087.86,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7096.23,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7104.61,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7112.98,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7121.36,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7129.73,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7138.1,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7146.48,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7154.85,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7163.23,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7062.73,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7054.36,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7047.86,15797.6,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7047.39,15789.2,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7046.93,15780.9,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7046.46,15772.5,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7046.2,15764.2,-0.265404],273.182,[[-0.998458,0.0555082,0],[0.00290508,0.0522553,0.99863]],false],
				["Land_HBarrierWall6_F",[7045.53,15755.8,-0.233345],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall_corner_F",[7042.06,15682.8,0],181.364,[[-0.0238044,-0.999717,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7045.07,15747.4,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7044.6,15739.1,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7044.14,15730.7,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7043.67,15722.3,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7043.21,15714,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7042.74,15705.6,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7042.28,15697.3,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7041.81,15688.9,0.0985641],273.182,[[-0.998458,0.0555082,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7049.17,15682.9,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7057.54,15682.6,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7065.91,15682.3,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7074.28,15682.1,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7082.65,15681.8,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7091.02,15681.5,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7099.39,15681.3,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7107.76,15681,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7116.13,15680.8,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7124.5,15680.5,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7132.87,15680.2,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7141.24,15680,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7149.61,15679.7,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7157.98,15679.4,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7166.35,15679.2,0.0985641],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7174.72,15678.9,0.0985641],181.819,[[-0.0317423,-0.999496,0],[-0,0,1]],false],
				["Land_HBarrierTower_F",[7182.32,15680.9,-0.248375],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall_corner_F",[7196.13,15679.6,0],89.5455,[[0.999969,0.00793242,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7190.03,15679,0.0985641],181.819,[[-0.0317423,-0.999496,0],[-0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.89,15686.7,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7171.6,15805.4,0.0985641],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.75,15695.1,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.62,15703.5,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.49,15711.8,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.36,15720.2,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.22,15728.6,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.09,15736.9,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7194.96,15745.3,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7194.79,15791.2,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7194.6,15799.4,0.0985641],89.5458,[[0.999969,0.00792693,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7186.88,15805.3,0.0985641],2.72763,[[0.0475882,0.998867,0],[0,0,1]],false],
				["Land_HBarrierWall_corner_F",[7193.81,15805.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7194.92,15782.9,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7195.06,15774.5,0.0985641],89.0913,[[0.999874,0.0158589,0],[0,0,1]],false],
				["Land_Cargo_HQ_V3_F",[7054.92,15694.9,1.18875],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[7188.76,15774,-0.0395432],268.636,[[-0.999717,-0.0238038,0],[-0,0,1]],false],
				["Land_Cargo_Patrol_V1_F",[7188.87,15744.9,-0.0395432],268.636,[[-0.999717,-0.0238038,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.16,15714.7,-0.064064],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.16,15712.2,-0.064064],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.16,15709.7,-0.064064],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.16,15707.2,-0.0640106],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.16,15707.2,2.51329],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.25,15709.7,2.50975],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.16,15712.2,2.54948],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.16,15714.7,2.51055],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15730.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15733.3,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15735.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15738.3,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15738.3,2.6041],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15735.8,2.56903],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15733.3,2.563],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7063.3,15730.9,2.5782],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrierWall6_F",[7179.98,15805.4,-0.115517],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo_HQ_V3_F",[7153.75,15792.3,0.88311],269.545,[[-0.999968,-0.00794067,0],[-0,0,1]],false],
				["Land_TentA_F",[7187.52,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7184.81,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7182.1,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7179.39,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7176.68,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7173.96,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7171.25,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7168.54,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7165.83,15799.7,0.0195007],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7163.12,15799.7,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7163.12,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7165.83,15794.9,0.0304871],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7168.54,15794.9,0.0153122],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7171.25,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7173.96,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7176.68,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7179.39,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7182.1,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7184.81,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7187.52,15794.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7187.52,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7184.81,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7182.1,15790.1,0.010994],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7179.39,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7176.68,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7173.96,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7171.25,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7168.54,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7165.83,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TentA_F",[7163.12,15790.1,0],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7197.41,15770.4,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7196.85,15750.3,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7202.05,15750.3,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7207.24,15750.3,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7212.45,15750.3,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7217.67,15750.3,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7202.61,15770.4,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7207.82,15770.5,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7213.01,15770.5,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_CncWall4_F",[7218.17,15770.5,-0.497177],0,[[0,1,0],[0,0,1]],false],
				["Land_LampHalogen_F",[7068.6,15747.7,0],131.818,[[0.745267,-0.666767,0],[0,-0,1]],false],
				["Land_LampHalogen_F",[7069.67,15785.3,0],229.545,[[-0.760916,-0.648851,0],[-0,0,1]],false],
				["Land_LampHalogen_F",[7139.94,15748.3,0],33.6363,[[0.553919,0.83257,0],[0,0,1]],false],
				["Land_LampHalogen_F",[7139.3,15785.2,0],320.455,[[-0.636684,0.771125,0],[0,0,1]],false],
				["Land_LampHalogen_F",[7143.85,15756,0],87.2727,[[0.998867,0.0475823,0],[0,0,1]],false],
				["Land_LampHalogen_F",[7143.47,15777.3,0],269.546,[[-0.999969,-0.00792351,0],[-0,0,1]],false],
				["Land_Communication_F",[7140.55,15795.2,0.204666],0,[[0,1,0],[0,0,1]],false],
				["Land_spp_Panel_F",[7113.2,15795.5,-0.151917],0,[[0,1,0],[0,0,1]],false],
				["Land_spp_Panel_F",[7121.32,15795.5,-0.151917],0,[[0,1,0],[0,0,1]],false],
				["Land_spp_Panel_F",[7096.59,15795.7,-0.151917],0,[[0,1,0],[0,0,1]],false],
				["Land_spp_Panel_F",[7105.07,15795.5,-0.151917],0,[[0,1,0],[0,0,1]],false],
				["Land_dp_transformer_F",[7128.21,15796,-0.984184],268.182,[[-0.999497,-0.0317244,0],[-0,0,1]],false],
				["Land_Loudspeakers_F",[7191.1,15799.4,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[7070.25,15781.8,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[7069.53,15750,0],0,[[0,1,0],[0,0,1]],false],
				["Land_TTowerSmall_2_F",[7134.28,15796,2.12813],0,[[0,1,0],[0,0,1]],false],
				["Land_BagBunker_Small_F",[7221.58,15767.5,0.098793],269.545,[[-0.999968,-0.00794067,0],[-0,0,1]],false],
				["Land_BagBunker_Small_F",[7221.12,15753,0.167198],269.546,[[-0.999969,-0.00792351,0],[-0,0,1]],false],
				["Land_BarGate_F",[7222.6,15760,0],270.909,[[-0.999874,0.0158647,0],[0,0,1]],false],
				["Land_Medevac_house_V1_F",[7099.25,15693,0.627663],181.364,[[-0.0238044,-0.999717,0],[-0,0,1]],false],
				["Land_Medevac_house_V1_F",[7105.49,15692.8,0.627663],181.364,[[-0.0238044,-0.999717,0],[-0,0,1]],false],
				["Land_Medevac_house_V1_F",[7111.72,15692.7,0.627663],181.364,[[-0.0238044,-0.999717,0],[-0,0,1]],false],
				["Land_Medevac_house_V1_F",[7117.96,15692.5,0.627663],181.364,[[-0.0238044,-0.999717,0],[-0,0,1]],false],
				["Land_TentHangar_V1_F",[7137.49,15697.1,0.112762],180.901,[[-0.0157248,-0.999876,0],[-0.0250508,0.000393967,0.999686]],false],
				["Land_TentHangar_V1_F",[7158.97,15696.8,0.114044],180.901,[[-0.0157248,-0.999876,0],[-0,0,1]],false],
				["Land_Device_assembled_F",[7153,15692.7,0.0579453],91.3636,[[0.998461,-0.0237671,0.0500989],[-0.0500848,0.0011922,0.998744]],false],
				["Land_Device_assembled_F",[7153.11,15697.3,0.0558624],91.3636,[[0.998462,-0.0237671,0.050092],[-0.0500778,0.00119204,0.998745]],false],
				["Land_Device_assembled_F",[7153.22,15702,0.0567703],91.3636,[[0.998462,-0.0237671,0.0500967],[-0.0500825,0.00119215,0.998744]],false],
				["Land_Device_assembled_F",[7131.38,15691.1,0.0548325],91.3636,[[0.996893,-0.0237298,0.0751056],[-0.0750843,0.00178729,0.997176]],false],
				["Land_Device_assembled_F",[7131.49,15695.8,0.0542908],91.3636,[[0.998462,-0.0237671,0.0500967],[-0.0500825,0.00119215,0.998744]],false],
				["Land_Device_assembled_F",[7131.6,15700.5,0.0524826],91.3636,[[0.996893,-0.0237298,0.0751056],[-0.0750843,0.00178729,0.997176]],false],
				["Land_ReservoirTower_F",[7182.12,15708.1,1.84949],0,[[0,1,0],[0,0,1]],false],
				["Land_dp_smallTank_F",[7183.55,15721.1,-0.0363464],0,[[0,1,0],[0,0,1]],false],
				["Land_dp_smallTank_F",[7183.55,15729,-0.0295639],0,[[0,1,0],[0,0,1]],false],
				["Land_dp_smallTank_F",[7065.63,15723.1,0],0,[[0,1,0],[0,0,1]],false],
				["Exile_Plant_GreenBush7",[7036.98,15774.1,0.914322],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
				["Exile_Plant_GreenBush7",[7038.63,15784.5,0.914246],0,[[0,1,0],[0,0,1]],false],
				["Exile_Plant_GreenBush7",[7038.55,15796.7,0.914246],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
				["Exile_Plant_GreenBush7",[7037.32,15762.3,0.914246],0,[[0,1,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7048.49,15805.3,0],355.909,[[-0.0713408,0.997452,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7052.57,15802.2,0.0294266],88.6363,[[0.999717,0.0237988,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7052.59,15796.8,-0.0650406],88.6363,[[0.999717,0.0237988,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7055.97,15799.2,-0.0297089],88.6363,[[0.999717,0.0237988,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7056.01,15794.1,-0.0862274],89.091,[[0.999874,0.0158641,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7045.81,15806,0],270,[[-1,4.88762e-007,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7048.37,15806.9,-0.0716629],355.909,[[-0.0713408,0.997452,0],[0,0,1]],false],
				["Land_HBarrier_3_F",[7048.37,15806.9,1.21348],355.909,[[-0.0713408,0.997452,0],[0,0,1]],false],
				["Exile_Plant_GreenBush7",[7039.76,15808.6,0.129814],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
				["Land_Coil_F",[7051.93,15783.8,-0.0637436],0,[[0,1,0],[0,0,1]],false],
				["Land_Coil_F",[7051.93,15779.3,-0.0637436],0,[[0,1,0],[0,0,1]],false],
				["Land_FieldToilet_F",[7051.26,15774.9,-0.0538177],0,[[0,1,0],[0,0,1]],false],
				["Land_Portable_generator_F",[7052.59,15788.1,-0.0273209],0,[[0,1,0],[0,0,1]],false],
				["Land_Workbench_01_F",[7053.25,15790.1,-0.122643],269.545,[[-0.999968,-0.00794067,0],[-0,0,1]],false],
				["Land_PortableLight_double_F",[7054.24,15787.9,0],142.727,[[0.605613,-0.795759,0],[0,-0,1]],false],
				["Land_FieldToilet_F",[7189.36,15780.8,-0.0538177],88.1818,[[0.999497,0.0317283,0],[0,0,1]],false],
				["Land_FieldToilet_F",[7189.32,15782.1,-0.0538177],88.1818,[[0.999497,0.0317283,0],[0,0,1]],false],
				["Land_FieldToilet_F",[7189.28,15783.4,-0.0538177],88.1818,[[0.999497,0.0317283,0],[0,0,1]],false],
				["Land_FieldToilet_F",[7189.24,15784.7,-0.0538177],88.1818,[[0.999497,0.0317283,0],[0,0,1]],false],
				["Land_FieldToilet_F",[7189.2,15786,-0.0538177],88.1818,[[0.999497,0.0317283,0],[0,0,1]],false],
				["Land_FieldToilet_F",[7189.16,15787.3,-0.0538177],88.1818,[[0.999497,0.0317283,0],[0,0,1]],false],
				["Land_bo_Hlidac_budka",[7152.2,15755.6,0],270,[[-1,4.88762e-007,0],[0,0,1]],false],
				["Land_bo_Hlidac_budka",[7152.2,15748.5,0],270,[[-1,4.88762e-007,0],[0,0,1]],false],
				["Land_bo_vysilac_FM",[7077.05,15689.9,0.0702286],0,[[0,1,0],[0,0,1]],false],
				["Land_dp_transformer_F",[7084.18,15692.1,0.0694504],271.818,[[-0.999497,0.0317249,0],[0,0,1]],false],
				["Land_spp_Panel_F",[7090.63,15692,0],181.818,[[-0.0317247,-0.999497,0],[-0,0,1]],false],
				["Land_wpp_Turbine_V2_F",[7057.58,15771.5,0],138.636,[[0.66084,-0.750527,0],[0,-0,1]],false],
				["Land_wpp_Turbine_V2_F",[7057.64,15748.5,0],138.636,[[0.66084,-0.750527,0],[0,-0,1]],false],
				["CargoNet_01_barrels_F",[7087.05,15698.1,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7088.53,15698.1,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7090.02,15698.1,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7091.5,15698.1,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7092.98,15698.1,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7094.47,15698.1,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7094.47,15699.5,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7092.98,15699.5,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7091.5,15699.5,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7090.02,15699.5,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7088.53,15699.5,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7087.05,15699.5,0],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7087.05,15699.5,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7087.05,15698.1,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7088.53,15698.1,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7090.02,15698.1,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7091.5,15698.1,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7092.98,15698.1,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7094.47,15698.1,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7094.47,15699.5,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7092.98,15699.5,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7091.5,15699.5,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7090.02,15699.5,1.02726],0,[[0,1,0],[0,0,1]],false],
				["CargoNet_01_barrels_F",[7088.53,15699.5,1.02726],0,[[0,1,0],[0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15731.3,0],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15733.8,0],180,[[-5.6426e-007,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15736.3,0],180,[[-8.02679e-007,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15738.7,0],180,[[-1.27952e-006,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15738.7,2.5974],180,[[-1.75635e-006,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15736.3,2.59014],180,[[-1.75635e-006,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15733.8,2.5751],180,[[-1.75635e-006,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7100.6,15731.3,2.55138],180,[[-1.75635e-006,-1,0],[-0,0,1]],false],
				["Land_Cargo40_military_green_F",[7129.41,15731.5,-0.000457764],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_Cargo40_military_green_F",[7129.41,15734,-0.000183105],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_Cargo40_military_green_F",[7129.41,15736.5,0.000320435],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_Cargo40_military_green_F",[7129.41,15739,0],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_Cargo40_military_green_F",[7129.41,15739,2.56361],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_Cargo40_military_green_F",[7129.41,15736.5,2.54512],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_Cargo40_military_green_F",[7129.41,15734,2.58372],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_Cargo40_military_green_F",[7129.41,15731.5,2.55064],180,[[-8.74228e-008,-1,0],[-0.0505929,4.42298e-009,0.998719]],false],
				["Land_WaterTank_F",[7145.94,15779.9,0],0,[[0,1,0],[0,0,1]],false],
				["Land_WaterTank_F",[7145.98,15783.5,0],0,[[0,1,0],[0,0,1]],false],
				["Land_Loudspeakers_F",[7057.1,15686.2,0],0,[[0,1,0],[0,0,1]],false],
				["Land_LampHalogen_F",[7198.57,15748.5,0],160,[[0.342023,-0.939692,0],[0,-0,1]],false],
				["Land_LampHalogen_F",[7199.3,15772,0],204.091,[[-0.408183,-0.9129,0],[-0,0,1]],false],
				["Campfire_burning_F",[7164.88,15784.7,0.115242],0,[[0,1,0],[0,0,1]],false],
				["Campfire_burning_F",[7174.85,15784.8,0.115242],0,[[0,1,0],[0,0,1]],false],
				["Campfire_burning_F",[7183.67,15784.9,0.115242],0,[[0,1,0],[0,0,1]],false],
				["MetalBarrel_burning_F",[7195.05,15769.4,0],0,[[0,1,0],[0,0,1]],false],
				["MetalBarrel_burning_F",[7194.65,15750.8,0],0,[[0,1,0],[0,0,1]],false],
				["MetalBarrel_burning_F",[7217.85,15750.9,0],0,[[0,1,0],[0,0,1]],false],
				["MetalBarrel_burning_F",[7218.35,15769.4,0],0,[[0,1,0],[0,0,1]],false]			]
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
				[  "O_HMG_01_high_F"       	,[7146.33,15746,0],				[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[7183.31,15729.1,10.0807],		[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[7183.17,15720.8,10.0625],		[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[7167.24,15703.8,0],			[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[7145.74,15704.1,0],			[0],     	"None" ],   
				[  "O_HMG_01_high_F"       	,[7066.01,15723.3,10.0097],		[0],     	"None" ],
				[  "O_HMG_01_high_F"        ,[7083.87,15755.9,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"        ,[7128.77,15778.5,0],			[0],        "None" ], 
				[  "O_HMG_01_high_F"   		,[7109.59,15755.2,0],			[0],     	"None" ],				
				[  "O_HMG_01_high_F"   		,[7115.51,15734.3,0],			[0],     	"None" ],
				[  "O_HMG_01_high_F"   		,[7056.56,15694,4.45152],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[7181.89,15711.2,24.3318],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[7181.94,15704.8,24.3318],		[0],     	"None" ],   
				[  "O_HMG_01_high_F"   		,[7151.94,15790.9,4.25827],		[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [14, "Rifleman"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
				// If driver-less vehicles are desired, place them at the bottom of the list AND have less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
			],	// Troops : These are distributed across all vehicles in this convoy. 
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
			//["Timer",		["TimerNoPlayers", 1800] ],   				// Trigger true if the mission timer reaches 1800 seconds
			["AllDead",		["LowUnitCount","EAST",1,250,[0,0]]  ],		// Always leaves one behind as a special surprise for players.
			["LUCNT",		["LowUnitCount","EAST",10,250,[0,0]]  ],		// Triggers call for reinforcements
			["PLAYERNEAR",	["ProxPlayer",[7100.12,15745.2,0], 100, 1]]
		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],["AllDead","PLAYERNEAR"    ]],
			//[["LOSE"],["TIMER"     ]],
			[["CHILD",	["Help_Helo",[0,0],5,300]],["LUCNT"     ]],  
			[["END"],["TIMER","OR","PLAYERNEAR", "AllDead"   ]]  
		]
	]
];
