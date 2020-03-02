// MarshBattle.sqf
// Ported by TheOneWhoKnocks
// 4/20/19
// 	Spawn location should be 20889,14623.7 as this map is specific to Altis
// 	This mission was ported from Mythbuster©MD™'s set of missions that he has developed for the DMS mission system
// Original credits:
/*
	"Marsh Battle" static mission for Altis.
	Created by Mythbuster UID 76561198049774329
	Credits to "Mythbuster" for creating the base.
	Missions Trailer: https://youtu.be/yGk_0qvEzdo
*/
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Be cautious when editing data.

[
	["MarshBattle", 600, "LAND"], 											// Mission Title NOSPACES!, and encounter radius
	["Marsh Battle","hd_objective","ELLIPSE","ColorRed","SolidBorder",600],  	// Map Markers ["MapText", "SHAPE", "COLOR", "FILL", size];
	[  
		[																	// NOTIFICATION Messages and Map display Control.
			true,    		// Notify players via Radio Message
			0,   			// radio channel. "ALL" = no radio required.
			0,         		//range from encounter center AI radio's can be heard (0=unlimited.)
			true,  			// Notify players via global message - hint screen on right of game display -
			true,   		// Show encounter area on the map
			900,      		// Win delay: Time in seconds after a WIN before mission cleanup is performed
			10       		// Lose delay: Time in seconds after a lose before mission cleanup is performed
							//NOTE: the above delay must occur before the mission is considered 'complete' by the mission manager control loop.
		],
																			// Spawn Mission Message 
		[
			"Marsh Battle",												// title line, do not remove these!
			"Bandits have set up a small base in the marshes, conquer it..." 	//description/radio message.
		],  
																			// Mission Success Message
		[
			"Marsh Battle won",
			"The Marsh Base bandits have been destroyed!"
		], 
																			// Mission Failure Message
		[
			"Marsh Battle lost",
			"The Marsh Battle is over and the bandits have escaped"
		] 
	],
	[  																		//  Loot Config:  Refer to LootData.sqf for specifics																		
		["None" , [0,0] ], 													//[static loot, offset location] - spawns with the mission
																			// static loot will also spawn if 'NO TRIGGERS' is enabled.
		[																	// Win loot, offset location - spawns after mission success
			["MarshLoot" , [[20903.4,14562.4,0],[20916.5,14612.4,0], [20928.8,14608.7,3.45173],[20891,14629.8,0]]],
			["MarshLoot" , [[20870.1,14622.4,0],[20896.3,14623.8,0], [20887.8,14617.3,0],[20882.3,14623.7,0]]] 		
		],	
		["None" , [0,0] ]  													// Failure loot, offset location - spawns on mission failure
	],
	[	// BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
		["M3Editor-ASL", [-1,-1], "NONE", 0,
												
			[	// paste your array of building objects here
				["Flag_RedCrystal_F",[20889.103516,14624.0888672,2.668944],[[0,1,0],[0,0,1]],[false,false]],
				["Land_Slum_House01_F",[20904.759766,14614.920898,2.612204],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20900.404297,14628.734375,2.435137],[[-1,1.19249e-008,0],[0,0,1]],[true,false]],
				["Land_cargo_addon02_V1_F",[20899.470703,14634.169922,2.363447],[[0,1,0],[0,0,1]],[false,false]],
				["Land_cargo_house_slum_F",[20874.878906,14615.0849609,2.684286],[[0.999819,-0.0190385,0],[0,0,1]],[false,false]],
				["Land_Cargo_HQ_V2_F",[20928.804688,14608.426758,1.929844],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Cargo_Patrol_V2_F",[20852.728516,14652.740234,2.342685],[[-1,1.19249e-008,0],[0,0,1]],[true,false]],
				["Land_Cargo_Patrol_V2_F",[20858.892578,14590.798828,2.768235],[[0,0.999304,0.0373065],[0.00134403,-0.0373065,0.999303]],[true,false]],
				["Land_Cargo_Patrol_V2_F",[20901.0820313,14679.694336,1.727711],[[-8.74228e-008,-1,0],[0,0,1]],[true,false]],
				["Land_Cargo_Patrol_V2_F",[20881.5625,14694.515625,1.735622],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Cargo_Patrol_V2_F",[20921.654297,14564.481445,2.248775],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Cargo_Patrol_V2_F",[20971.732422,14583.943359,2.283454],[[-0.780136,0.62561,0],[0,0,1]],[true,false]],
				["Land_Cargo_HQ_V2_F",[21036.804688,14639.426758,2.452451],[[0,1,0],[0,0,1]],[true,false]],
				["Land_i_Stone_Shed_V2_dam_F",[20871.736328,14569.748047,1.854138],[[0,1,0],[0,0,1]],[false,false]],
				["Land_d_Stone_HouseBig_V1_F",[20855.208984,14574.443359,2.187242],[[0,1,0],[0,0,1]],[false,false]],
				["Land_Wall_IndCnc_2deco_F",[20879.955078,14690.97168,1.828192],[[0,0.999712,-0.0239912],[0.0226603,0.0239851,0.999455]],[false,false]],
				["Land_HBarrierWall_corner_F",[20906.412109,14640.828125,2.0954115],[[0,0.999645,-0.0266571],[0.0186628,0.0266524,0.999471]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20900.195313,14642.404297,2.169257],[[0.654747,0.755155,-0.0323632],[0.0186628,0.0266524,0.999471]],[false,false]],
				["Land_HBarrierWall4_F",[20893.416016,14640.59375,2.306681],[[0,0.999147,-0.0412979],[0.00665923,0.041297,0.999125]],[false,false]],
				["Land_HBarrierWall6_F",[20886.474609,14640.566406,2.345841],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20878.269531,14640.349609,2.449353],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20868.0664063,14636.561523,2.488306],[[-0.610643,0.791906,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20872.152344,14640.78418,2.399114],[[0.870669,0.491402,-0.0214382],[0.0133317,0.0199929,0.999711]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20866.335938,14625.758789,2.572227],[[-0.0570853,0.998367,-0.00232436],[-0.0173282,0.00133701,0.999849]],[false,false]],
				["Land_HBarrierWall6_F",[20865.960938,14630.93457,2.558899],[[-1,1.19249e-008,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20866.279297,14619.640625,2.594931],[[-0.996332,0.0855733,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20865.382813,14602.0390625,3.0190341],[[-0.998369,0.0570936,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20863.603516,14597.0849609,2.922792],[[0.441221,0.897399,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corner_F",[20857.955078,14594.78418,2.959216],[[-0.0665823,0.997405,0.0273941],[0.011995,-0.0266529,0.999573]],[false,false]],
				["Land_HBarrierWall6_F",[20852.175781,14594.435547,2.985691],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20843.863281,14594.115234,2.87091],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corner_F",[20838.0117188,14593.615234,2.784828],[[-0.999747,-0.0187637,-0.0124212],[-0.011995,-0.0226586,0.999671]],[false,false]],
				["Land_HBarrierWall6_F",[20838.0664063,14586.818359,2.645207],[[-0.999592,0.0285496,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20837.966797,14578.702148,2.407065],[[-0.999592,0.0285496,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20837.667969,14570.28125,1.993723],[[-0.999592,0.0285496,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20837.462891,14561.855469,1.22631],[[-0.999592,0.0285496,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20840.763672,14558.855469,0.947112],[[-0.318066,-0.948069,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20848.654297,14556.171875,0.864007],[[-0.318066,-0.948069,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20856.556641,14553.585938,0.909985],[[-0.318066,-0.948069,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20863.84375,14550.0859375,0.961595],[[-0.564448,-0.825468,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20910.896484,14637.0458984,2.0713379],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20919.298828,14637.0449219,1.826176],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20927.759766,14637.114258,1.565378],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corner_F",[20934.105469,14637.25,0.899641],[[0,0.994498,-0.104754],[0.0532575,0.104605,0.993087]],[false,false]],
				["Land_HBarrierWall6_F",[20934.714844,14631.617188,1.459822],[[0.999592,-0.0285567,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20935.386719,14624.914063,1.492023],[[-0.696934,0.717105,-0.00660524],[-0.00399675,0.00532646,0.999978]],[false,false]],
				["Land_HBarrierWall6_F",[20942.355469,14623.438477,1.580354],[[0,1,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20946.955078,14621.138672,1.71221],[[0.901558,0.432659,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20950.59375,14613.633789,1.667738],[[0.901558,0.432659,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20951.994141,14606.949219,1.695616],[[0.999275,-0.0380703,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20955.171875,14601.610352,1.730594],[[0.0285556,0.999592,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20966.888672,14593.314453,2.233669],[[0.991132,0.132884,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20959.892578,14601.03125,1.836658],[[0.380483,0.924788,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20963.888672,14598.731445,1.992456],[[0.683158,0.730271,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20968.986328,14598.729492,2.0948963],[[-0.683159,0.73027,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20969.978516,14604.704102,1.960945],[[0.755751,-0.654859,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20971.0996094,14589.514648,2.362517],[[0.0190386,0.999819,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20974,14588.415039,2.383042],[[0.76195,0.647636,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20977.607422,14584.0791016,2.307968],[[0.76195,0.647636,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20977.507813,14581.779297,2.247694],[[0.774139,-0.633016,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20973.888672,14577.46582,2.0330739],[[0.774139,-0.633016,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20970.404297,14573.180664,1.915379],[[0.774139,-0.633016,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20969.220703,14572.907227,1.917821],[[-0.640351,-0.768083,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20964.921875,14576.407227,2.00441957],[[-0.640351,-0.768083,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20964.0957031,14578.480469,2.0124261],[[-0.956768,0.290852,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20965.695313,14583.886719,2.134016],[[-0.956768,0.290852,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20963.677734,14588.907227,2.203676],[[0.983685,-0.179901,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20945.693359,14577.841797,1.751452],[[0.038074,-0.999275,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20951.863281,14595.224609,1.776865],[[0.999275,-0.0380703,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20951.865234,14587.431641,1.742304],[[0.999275,-0.0380703,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20949.857422,14580.333008,1.737224],[[0.86123,-0.508215,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall4_F",[20939.431641,14576.616211,1.976416],[[0.65486,-0.755751,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20935.691406,14570.126953,2.121458],[[0.797679,-0.603083,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20930.681641,14563.417969,2.127951],[[0.797679,-0.603083,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20925.587891,14556.823242,2.100974],[[0.797679,-0.603083,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20920.59375,14550.12207,2.113755],[[0.797679,-0.603083,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20915.482422,14547.306641,2.112428],[[0.038074,-0.999275,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20907.0996094,14547.0166016,2.289531],[[0.038074,-0.999275,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20898.763672,14546.725586,2.425444],[[0.038074,-0.999275,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20881.951172,14546.146484,2.339391],[[0.038074,-0.999275,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20870.59375,14546.930664,1.570215],[[-0.23577,-0.971809,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20875.744141,14544.597656,2.0131602],[[0.993482,-0.113992,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20896.0234375,14645.768555,2.156411],[[0.654763,0.75522,-0.0304856],[0.0173316,0.0253213,0.999529]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20891.570313,14649.429688,2.0442109],[[0.654832,0.755624,-0.0150449],[-0.0093285,0.0279861,0.999565]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20887.220703,14652.941406,1.907878],[[0.654861,0.755453,-0.021153],[0,0.0279894,0.999608]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20882.863281,14656.323242,1.85708],[[0.654861,0.755739,0.0040255],[0,-0.0053265,0.999986]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20878.535156,14659.730469,1.926496],[[0.654468,0.75586,-0.0186622],[0.0346456,-0.0053233,0.999385]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20874.263672,14663.28418,2.082027],[[0.654468,0.755505,-0.029737],[0.0346456,0.0093229,0.999356]],[false,false]],
				["Land_HBarrierWall6_F",[20866.869141,14668.668945,2.0897102],[[0.791461,-0.611182,0.00676006],[-0.00133721,0.00932849,0.999956]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20868.140625,14663.1875,2.2117],[[-0.749346,0.662157,-0.00542958],[0.0186628,0.0293151,0.999396]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20873.0332031,14669.576172,2.0691469],[[-0.749473,0.661816,0.0169889],[0.00265204,-0.0226602,0.99974]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20864.78125,14659.831055,2.310225],[[0.555762,-0.831092,0.020356],[-0.0226603,0.00933249,0.9997]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20860.226563,14657.489258,2.274586],[[-0.458229,0.888415,-0.0272755],[-0.00265204,0.0293201,0.999567]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20869.0214844,14643.654297,2.383485],[[0.564393,0.825157,-0.0240285],[0.0133317,0.0199929,0.999711]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20864.820313,14646.104492,2.355117],[[-0.432821,-0.901464,-0.00527693],[-0.00666818,-0.00265198,0.999974]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20859.779297,14647.963867,2.32707],[[0.406728,0.913527,0.00636338],[-0.00666818,-0.00399666,0.99997]],[false,false]],
				["Land_HBarrierWall4_F",[20857.841797,14652.355469,2.331727],[[0.969502,0.244972,0.0074441],[-0.00666818,-0.00399666,0.99997]],[false,false]],
				["Land_HBarrierWall6_F",[20854.478516,14645.952148,2.363464],[[0.353916,-0.935277,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20869.837891,14674.735352,2.0263796],[[-0.603078,-0.797495,0.0172968],[0.00399675,0.0186626,0.999818]],[false,false]],
				["Land_HBarrierWall6_F",[20865.177734,14682.738281,1.941123],[[-0.884434,0.466664,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20869.0800781,14690.136719,1.996831],[[-0.884434,0.466664,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20872.992188,14697.55957,1.780747],[[-0.884434,0.466664,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20877.0917969,14700.435547,1.598777],[[-0.0665871,0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20885.359375,14701.0449219,1.629261],[[-0.0665871,0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20893.763672,14701.533203,1.834024],[[-0.0665871,0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20902.0976563,14702.147461,1.733224],[[-0.0665871,0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20910.492188,14702.630859,1.499538],[[-0.0665871,0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20913.492188,14700.430664,1.422755],[[0.995472,0.0950552,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20914.302734,14692.133789,1.345581],[[0.995472,0.0950552,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20915.101563,14683.831055,1.28211],[[0.995472,0.0950552,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20915.904297,14675.438477,1.298102],[[0.995472,0.0950552,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20913.900391,14672.833984,1.390357],[[0.0665872,-0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20905.587891,14672.329102,1.618017],[[0.0665872,-0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20897.1875,14671.746094,1.731395],[[0.0665872,-0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20888.898438,14671.149414,1.963088],[[0.0665872,-0.997781,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20881.478516,14672.0361328,2.0486448],[[-0.353916,-0.935277,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20875.0859375,14673.483398,2.00823975],[[-0.969801,0.243889,-0.00195831],[0.00267442,0.0186627,0.999822]],[false,false]],
				["Land_HBarrierWall6_F",[20865.492188,14679.379883,1.966142],[[-0.958129,-0.286287,0.00535441],[0.00399675,0.00532646,0.999978]],[false,false]],
				["Land_HBarrierWall6_F",[20879.927734,14549.349609,2.230326],[[-0.995471,0.0950635,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20873.427734,14549.849609,1.830314],[[0.99778,-0.0665909,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20884.365234,14548.760742,2.314192],[[0.962132,-0.272582,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20886.650391,14556.738281,2.2784],[[0.962132,-0.272582,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20888.867188,14564.858398,2.399516],[[0.962132,-0.272582,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20894.660156,14569.65332,2.336581],[[-0.00951189,-0.999955,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20911.675781,14565.932617,2.316775],[[-0.905635,-0.424057,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20905.380859,14569.733398,2.35711],[[-0.038074,-0.999275,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20915.171875,14558.329102,2.298236],[[-0.905635,-0.424057,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20918.794922,14550.722656,2.168116],[[-0.905635,-0.424057,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20865.576172,14611.370117,2.90532],[[-0.996332,0.0855733,0],[0,0,1]],[false,false]],
				["Land_cargo_house_slum_F",[20880.179688,14555.227539,2.0977328],[[0.104521,0.994348,-0.0186311],[-0.012,0.0199933,0.999728]],[false,false]],
				["Land_cargo_house_slum_F",[20883.214844,14557.00585938,2.16902],[[0.983223,-0.179861,0.0303918],[-0.0306514,0.00133658,0.999529]],[false,false]],
				["Land_Slum_House03_F",[20872.212891,14558.589844,1.621904],[[0.999275,-0.0380703,0],[0,0,1]],[true,false]],
				["Land_Slum_House03_F",[20866.671875,14558.739258,1.401982],[[0.0570887,0.998369,0],[0,0,1]],[true,false]],
				["Land_Slum_House01_F",[20868.318359,14552.933594,1.438631],[[0.997101,-0.0760856,0],[0,0,1]],[true,false]],
				["Land_Slum_House01_F",[20859.259766,14559.820313,1.428281],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20852.0078125,14566.355469,1.788451],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20842.705078,14564.734375,1.716951],[[-1,1.19249e-008,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20848.0703125,14560.80957,1.301716],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20847.246094,14580.114258,2.48127],[[0.999955,0.0095207,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20870.503906,14600.334961,2.861533],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20870.384766,14595.354492,2.649685],[[0.870742,-0.49174,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20872.404297,14582.834961,2.420426],[[-0.913545,0.406737,0],[0,0,1]],[false,false]],
				["Land_Slum_House02_F",[20878.404297,14591.134766,2.413442],[[-0.999955,-0.00951227,0],[0,0,1]],[true,false]],
				["Land_HBarrierWall_corridor_F",[20860.203125,14600.485352,2.995331],[[0.913545,0.406737,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20857.503906,14604.399414,3.0425205],[[0.710464,0.703733,0],[0,0,1]],[false,false]],
				["Land_cargo_addon02_V2_F",[20871.945313,14632.338867,2.664967],[[-0.959491,0.281739,0],[0,0,1]],[false,false]],
				["Land_cargo_addon02_V2_F",[20871.316406,14616.787109,2.635706],[[0.999947,0.00931636,-0.00444834],[0.00399675,0.0479432,0.998842]],[false,false]],
				["Land_HBarrierWall6_F",[20853.195313,14659.217773,2.242331],[[0.654859,0.755563,-0.016862],[0.00267442,0.0199946,0.999797]],[false,false]],
				["Land_HBarrierWall6_F",[20847.992188,14659.548828,2.314851],[[-0.235753,0.971813,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20839.777344,14657.527344,2.343878],[[-0.235753,0.971813,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20836.650391,14653.90332,2.0978169],[[-0.981929,0.189249,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20835.0839844,14645.639648,1.669471],[[-0.981929,0.189249,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20837.128906,14643.240234,1.800386],[[-0.170519,-0.985354,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall6_F",[20846.851563,14643.949219,2.329206],[[0.0760924,-0.997101,0],[0,0,1]],[false,false]],
				["Land_Chapel_Small_V1_F",[20842.4375,14654.755859,2.329604],[[0.207912,-0.978148,0],[0,0,1]],[false,false]],
				["Land_Maroula_F",[20868.896484,14679.504883,1.943245],[[-0.89739,-0.441199,0.0059368],[0.00399675,0.00532646,0.999978]],[false,false]],
				["Land_Chapel_Small_V2_F",[20900.679688,14697.567383,1.781841],[[-0.0665871,0.997781,0],[0,0,1]],[false,false]],
				["Land_Chapel_V2_F",[20923.554688,14625.658203,1.835178],[[-0.749476,0.662031,0],[0,0,1]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20931.771484,14621.418945,1.497463],[[-0.696306,0.717005,0.0325748],[0.0426276,-0.00399311,0.999083]],[false,false]],
				["Land_HBarrierWall_corridor_F",[20928.0703125,14618.619141,1.693442],[[-0.39736,0.917571,0.0129979],[0.0572399,0.0106466,0.998304]],[false,false]],
				["Land_i_Stone_Shed_V3_dam_F",[20942.236328,14585.847656,1.813436],[[0,1,0],[0,0,1]],[false,false]],
				["Land_i_Stone_HouseSmall_V3_F",[20938.208984,14592.68457,1.940798],[[0,1,0],[0,0,1]],[false,false]],
				["Land_d_Stone_HouseBig_V1_F",[20898.695313,14573.90332,2.331712],[[0,1,0],[0,0,1]],[false,false]],
				["Land_d_Stone_HouseSmall_V1_F",[20915.0527344,14587.298828,2.292631],[[0.736747,-0.676169,0],[0,0,1]],[false,false]],
				["Land_Slum_House02_F",[20933.00390625,14577.234375,2.15594],[[0,1,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20926.105469,14571.53418,2.295974],[[0.610648,0.791902,0],[0,0,1]],[true,false]],
				["Land_Slum_House02_F",[20888.00390625,14593.93457,2.514558],[[0,1,0],[0,0,1]],[true,false]],
				["Land_cargo_house_slum_F",[20908.0898438,14609.347656,2.510717],[[0,1,0],[0,0,1]],[false,false]],
				["Land_cargo_house_slum_F",[20911.296875,14602.973633,2.312086],[[0.861223,-0.507919,-0.0176654],[0.00399675,-0.0279892,0.9996]],[false,false]],
				["Land_cargo_house_slum_F",[20906.332031,14594.123047,2.421894],[[0.869901,-0.492248,-0.0310607],[0.0439577,0.0146501,0.998926]],[false,false]],
				["Land_cargo_house_slum_F",[20901.167969,14595.445313,2.625616],[[0,1,0],[0,0,1]],[false,false]],
				["Land_cargo_house_slum_F",[20884.873047,14581.249023,2.301437],[[0,1,0],[0,0,1]],[false,false]],
				["Land_cargo_house_slum_F",[20895.675781,14583.964844,2.281797],[[-0.353915,0.935277,0],[0,0,1]],[false,false]],
				["Land_cargo_house_slum_F",[20880.673828,14572.0615234,2.0214903],[[-0.999819,-0.0190404,0],[0,0,1]],[false,false]],
				["Land_cargo_house_slum_F",[20890.140625,14683.882813,1.826926],[[0.749439,0.662073,-0.00093219],[0.0106641,-0.0106635,0.999886]],[false,false]],
				["Land_cargo_addon01_V2_F",[20905.402344,14606.489258,2.534478],[[0,1,0],[0,0,1]],[false,false]],
				["Land_cargo_addon01_V2_F",[20882,14569.288086,2.112963],[[-0.999592,-0.0285496,0],[0,0,1]],[false,false]],
				["Land_cargo_addon02_V1_F",[20848.1875,14574.595703,3.00342083],[[-0.00951189,-0.999955,0],[0,0,1]],[false,false]],
				["Land_cargo_addon02_V2_F",[20897.539063,14591.504883,2.475918],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20892.203125,14633.308594,2.571075],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20892.296875,14607.503906,2.609659],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20903.802734,14572.998047,2.376615],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20863.400391,14567.586914,1.824408],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20878.587891,14559.901367,1.979728],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20845.902344,14573.290039,2.196304],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20878.404297,14601.488281,2.752663],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20854.5,14652.298828,2.337194],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20892.601563,14686.299805,1.787285],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20940.900391,14609.800781,1.768898],[[0,1,0],[0,0,1]],[false,false]],
				["Campfire_burning_F",[20968.998047,14579.194336,2.0628614],[[0,1,0],[0,0,1]],[false,false]]
			]
 		]
	  
	],
	[ 	// AI GROUPS. Only options marked 'Def:' implemented.
		//[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   					["Loiter",		[20685.7,14725.9,0],[20685.7,14725.9,0],[10]]],
		//[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   					["Loiter",		[12799.7,16708.2,17.8497],[12799.7,16708.2,17.8497],[10]   ]],
		//[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   					["Loiter",		[12907.8,16721.3,18.4271],[12907.8,16721.3,18.4271],[10]   ]],
		//[["EAST","AWARE","RED","COLUMN"],  			[  [1,"Sniper_E"]  ],   					["TowerGuard",	[20685.7,14725.9,0],[20685.7,14725.9,0],[10]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],			["BoxPatrol",	[21096.4,14758.3,0],[21096.4,14758.3,0],	[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Hunter_E"]  ],   		["Buildings",	[20685.7,14725.9,0],[20685.7,14725.9,0],	[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],   		["BoxPatrol",	[20809.1,14740.7,0],[20809.1,14740.7,0],	[75]   ]],		
		[["EAST","COMBAT","RED","COLUMN"],  		[  [2,"SMG_E"]  ],   			["Explore",		[21050.4,14632.9,0],[21050.4,14632.9,0],	[75]   ]],
		[["EAST","COMBAT","RED","VEE"],   			[  [2,"Rifleman_E"]  ],   		["BoxPatrol",	[20735.3,14478.4,0],[20735.3,14478.4,0],	[75]   ]],
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],   		["BoxPatrol",	[20986.5,14604.9,0],[20986.5,14604.9,0],	[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Hunter_E"]  ],   		["Buildings",	[20863.3,14857.9,0],[20863.3,14857.9,0],	[75]   ]],		
		[["EAST","COMBAT","RED","STAG COLUMN"],   	[  [2,"Rifleman_E"]  ],   		["BoxPatrol",	[20938.3,14616.3,0],[20938.3,14616.3,0],	[75]   ]],		
		[["EAST","COMBAT","RED","COLUMN"],  		[  [2,"SMG_E"]  ],   			["Explore",		[20874.7,14577.7,0],[20874.7,14577.7,0],	[75]   ]],
		[["EAST","COMBAT","RED","VEE"],   			[  [2,"Rifleman_E"]  ],   		["BoxPatrol",	[20900.1,14492.4,0],[20900.1,14492.4,0],	[75]   ]]

	],
				// Example: PatrolBehavior: ["BoxPatrol", [100,0], [0,0],0 ]  
				// AI will spawn 100m east of encounter center, a 4 point patrol will be set up at 80% encounter radius. AI will move to this and start patrolling.
				// spawnoffsetloc: [x,y] where x and y are offsets in meters from the encounter center.Sets the spawn location for the group.
				// patroloffsetloc:[x,y] where x and y are offsets in meters from encounter center. Sets the center of the group's patrol zone,
				// or where it should travel too before starting its patrol pattern.
				// radius: in meters - used in establishing patrol geometry. If zero, then 80% of encounter radius will be used.
				// ###Patrol Options### 
				// Def:   "Perimeter", spawnloc, patrolloc, radius: - 12 waypoints set at radius from loc, group goes from point to point
				// Def:   "BoxPatrol", spawnloc, patrolloc, radius: - 4 waypoints set at radius from loc, group goes from point to point
				// Def:  "Explore", spawnloc, patrolloc, radius: - 12 waypoints set up at radius from loc, group moves randomly from point to point
				// Def:  "Guard", spawnloc, patrolloc, radius: - group patrols inside of buildings found within radius of loc.
				// Def:  "Sentry", spawnloc, patrolloc radius: - group moves to nearest building and takes up station in highest points within the building
				//     NOTE: if no buildings are located within 'radius' both Guard and Sentry will locate nearest buildings to the encounter and move there!
				//  "Loiter", loc, radius: - group just hangs out, in an unaware mode in vicinity of loc-radius.
				//  "Convoy", loc, data: group follows roads from startloc to stoploc, then loops back.
				//  "XCountry", loc, data: group goes from startloc to stoploc, then loops back.
	[			// Vehicles
		[  		// Convoy #1  
			[   // Vehicle                     Offset     				Crew (only 1 type!)   CargoLoot (see Loot section below for more detail!)
				[  "O_HMG_01_high_F",		[20869.6,14593.9,0.082015],			[0],        "None" ], 
				[  "O_HMG_01_high_F",		[20841,14591.4,0],					[0],     	"None" ], 
				[  "O_HMG_01_high_F",		[20849,14575.4,0],					[0],     	"None" ],
				[  "O_HMG_01_high_F",		[20876.5,14556.4,0],				[0],        "None" ], 
				[  "O_HMG_01_high_F",		[20872.2,14580.8,0],				[0],     	"None" ], 
				[  "O_HMG_01_high_F",		[20888.2,14685.5,0],				[0],     	"None" ],
				[  "O_HMG_01_high_F",		[20903.6,14698,0],					[0],        "None" ], 
				[  "O_HMG_01_high_F",		[21039.4,14639.6,3.09938],			[0],        "None" ], 
				[  "O_HMG_01_high_F",		[20929.6,14609.7,3.20546],			[0],     	"None" ], 
				[  "O_HMG_01_high_F",		[20915.3,14604.4,0],				[0],     	"None" ],
				[  "O_HMG_01_high_F",		[20923.5,14622.2,0.216671],			[0],        "None" ], 
				[  "O_HMG_01_high_F",		[20973.3,14602.5,0],				[0],     	"None" ], 
				[  "O_HMG_01_high_F",		[20971.5,14582,4.34833],			[0],     	"None" ],
				[  "O_HMG_01_high_F",		[20908.1,14631.6,0],				[0],        "None" ], 
				[  "O_HMG_01_high_F",		[20882.1,14629.6,0],				[0],     	"None" ]
				// If driver-less vehicles are desired, place them at the bottom of the list ND Hv less drivers than vehicles in the next section
				// NOTE: Troops WILL be placed into 'driver-less' vehicles if the other vehicles are full!!!
			],
			[  
				// Drivers                          	# and type  |         Patrol     |    spawn   | dest       | 'Patrol' options
				[
					["EAST","COMBAT","RED","COLUMN"],   [  [10, "Rifleman_E"]  ],   ["Gunner",[0,0],[0,0],[0]   ]

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
			["LUCNT",		["LowUnitCount","EAST",20,250,[0,0]]  ],	// Triggers call for reinforcements
			["LUCNT2",		["LowUnitCount","EAST",15,250,[0,0]]  ],	// Triggers call for reinforcements
			["LUCNT3",		["LowUnitCount","EAST",10,250,[0,0]]  ]		// Triggers call for reinforcements


		],
		[
			// Define what actions should occur when above trigger logics evaluate to true
			// Note: a comma between two logics is interpreted as "AND"
			[["WIN"],	["AllDead","PLAYERNEAR"]],
			[["LOSE"],	["TIMER"]],
			[["CHILD",	["Help_VehicleS",[0,0],1,120]],	["LUCNT"]],  
			[["CHILD",	["Help_VehicleE",[0,0],1,180]],	["LUCNT2"]],  
			[["CHILD",	["Help_Helo",[0,0],2,120]],		["LUCNT3"]],  
			[["END"],	["AllDead","OR","TIMER"]]  
		]
  
	]


];
