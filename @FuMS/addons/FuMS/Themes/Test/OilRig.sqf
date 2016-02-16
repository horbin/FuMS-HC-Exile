//OilRig.sqf
// Horbin
// 4/25/2015
// Data provided by HighTimeZ gamming community
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!


[[
//------------------------------------------------------------------------------------
//-----Mission Area Setup-----
    "OilRig",  // Mission Title NOSPACES!
    200   , "WATER"             // encounter radius
],[ 
//------------------------------------------------------------------------------------
//-----Notification Configuration-----
//--Map Marker Config.
    "Oil Rig Test",  // Name, set to "" for nothing
     "mil_dot", // icon type:                                     https://community.bistudio.com/wiki/cfgMarkers for other options.
                     // mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
     "ELLIPSE", // "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
     "ColorYellow",//                                                  https://community.bistudio.com/wiki/setMarkerColor
     "FDiagonal",// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
       200           // size of the marker.    
],[[
    // NOTIFICATION Messages and Map display Control.
	false,    // Notify players via Radio Message
    0,   // radio channel. "ALL" = no radio required.
    0,         //range from encounter center AI radio's can be heard (0=unlimited.)
    false,  // Notify players via global message - hint screen on right of game display -
    true,   // Show encounter area on the map
    120,      // Win delay: Time in seconds after a WIN before mission cleanup is performed
    10       // Lose delay: Time in seconds after a lose before mission cleanup is performed
//NOTE: the above delay must finish before the mission is considered 'complete' by the mission manager control loop.
// These two delays will also affect how much time will elapse from mission completion until living AI cleanup.
],[
   // Mission spawn message, DO NOT Remove these! They can be edited down to "" if desired.
     "CORE Directive",  // title line
     "Close Combat", 
     "A maze outpost has been established by bandits" //description/radio message.
],[  
    // Mission Success Message
    "Mission Success",  // title line
     "",
     "Notifying High Command that the FOB has been captured."
],[
   // Mission Failure Message
    "Mission Failure!",
    "",
    "Reconnaissance complete. All forces are to RTB."
]],[
//---------------------------------------------------------------------------------
//-----Loot Configuration-----    
// Refer to LootData.sqf for available loot types and contents.
[
 //  ["Random",[0,0]],["Random",[5,5]],["Random",[-5,5]]
   //Array of loot now supported using above syntax.
   // replace "Random" with your desired loot option from LootData.sqf, or leave random for random results!
   // AND don't forget you can use these loot options to fill vehicles with loot too!(see vehicle section below)
],[
    "Random" ,        // WIN Loot
    [0,0]                // Offset from mission center x,y, 3 coords [x,y,z] places loot at a specific map location!  
],[
    "None" ,            // Lose Loot.
     [0,0]                // Offset from mission center.
]],[
//---------------------------------------------------------------------------------
//-----Building Configuration-----       
//BUILDINGS: persist = 0: building deleted at event completion, 1= building remains until server reset.
    // building name                 | offset   |rotation|persist flag
["Land_nav_pier_m_F",[27408.7,18334.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447.8,18334.9,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486.8,18335.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525.9,18336.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27526,18328.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27487,18327.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447.9,18327.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27408.9,18326.4,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525.8,18344,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525.6,18351.9,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525.5,18359.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525.4,18367.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525.3,18375.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525.1,18383.4,9.12935],179.091,0],
["Land_nav_pier_m_F",[27525,18391.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524.9,18399.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524.8,18407.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524.6,18414.9,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524.5,18422.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524.4,18430.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524.3,18438.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524.1,18446.4,9.12935],179.091,0],
["Land_nav_pier_m_F",[27524,18454.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27523.9,18462.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27523.8,18470.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27523.6,18478,9.12935],179.091,0],
["Land_nav_pier_m_F",[27523.5,18485.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27523.4,18493.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27523.3,18501.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27523.1,18509.5,9.12935],179.091,0],
["Land_nav_pier_m_F",[27484.1,18508.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445,18508.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406,18507.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27408.6,18342.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27408.5,18350.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27408.4,18357.9,9.12935],179.091,0],
["Land_nav_pier_m_F",[27408.2,18365.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27408.1,18373.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27408,18381.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407.9,18389.5,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407.7,18397.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407.6,18405.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407.5,18413.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407.4,18421,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407.2,18428.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407.1,18436.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27407,18444.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406.9,18452.5,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406.7,18460.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406.6,18468.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406.5,18476.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406.4,18484,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406.2,18491.9,9.12935],179.091,0],
["Land_nav_pier_m_F",[27406.1,18499.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445.2,18500.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445.3,18492.5,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445.4,18484.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445.5,18476.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445.7,18468.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445.8,18461,9.12935],179.091,0],
["Land_nav_pier_m_F",[27445.9,18453.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446,18445.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446.2,18437.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446.3,18429.5,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446.4,18421.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446.5,18413.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446.7,18405.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446.8,18397.9,9.12935],179.091,0],
["Land_nav_pier_m_F",[27446.9,18390.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447,18382.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447.2,18374.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447.3,18366.4,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447.4,18358.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447.5,18350.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27447.7,18342.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486.7,18343.4,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486.6,18351.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486.5,18359.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486.3,18367.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486.2,18374.9,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486.1,18382.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27486,18390.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485.8,18398.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485.7,18406.4,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485.6,18414.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485.5,18422.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485.3,18430.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485.2,18438,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485.1,18445.8,9.12935],179.091,0],
["Land_nav_pier_m_F",[27485,18453.7,9.12935],179.091,0],
["Land_nav_pier_m_F",[27484.8,18461.6,9.12935],179.091,0],
["Land_nav_pier_m_F",[27484.7,18469.5,9.12935],179.091,0],
["Land_nav_pier_m_F",[27484.6,18477.3,9.12935],179.091,0],
["Land_nav_pier_m_F",[27484.5,18485.2,9.12935],179.091,0],
["Land_nav_pier_m_F",[27484.3,18493.1,9.12935],179.091,0],
["Land_nav_pier_m_F",[27484.2,18501,9.12935],179.091,0],
["Land_Pier_Box_F",[27552.6,18476,7.3],360,0],
["Land_Pier_F",[27620.7,18488.7,5],270,0],
["Land_Pier_F",[27620.7,18448.3,5],270,0],
["Land_Pier_addon",[27632.5,18501.7,1.4333],90,0],
["Land_Pier_addon",[27632.5,18484.9,1.4333],90,0],
["Land_Pier_addon",[27632.5,18468.1,1.4333],90,0],
["Land_Pier_addon",[27632.5,18468.3,1.4333],90,0],
["Land_Pier_addon",[27632.5,18434.5,1.4333],90,0],
["Land_Cargo40_brick_red_F",[27617.8,18433.7,7.25],256.818,0],
["Land_Cargo40_white_F",[27616.6,18446,7.25],90.454,0],
["Land_Cargo40_light_green_F",[27616.6,18458.2,7.25],270,0],
["Land_Crane_F",[27566.8,18472.9,7.25],360,0],
["Land_Cargo40_cyan_F",[27616.6,18470.3,7.25],90,0],
["Land_Cargo40_light_blue_F",[27616.6,18491.5,7.25],270,0],
["Land_Cargo40_light_green_F",[27618.2,18503.8,7.25],103.636,0],
["Land_Cargo40_grey_F",[27617.3,18498.6,9.86],103.727,0],
["Land_Cargo40_cyan_F",[27617.1,18439.5,9.86],83.182,0],
["Land_Cargo40_brick_red_F",[27616.6,18451.9,9.86],89.545,0],
["Land_Cargo40_military_green_F",[27616.6,18464.2,9.86],90,0],
["Land_LampHarbour_F",[27629.6,18509,7.32131],180,0],
["Land_LampHarbour_F",[27629.4,18427.9,7.32158],360,0],
["Land_Cargo10_blue_F",[27553.5,18469.9,7.23688],90,0],
["Land_IronPipes_F",[27551.1,18479.7,7.16667],172.728,0],
["Land_Cargo10_light_green_F",[27560.2,18483.3,7.29245],270,0],
["Land_FieldToilet_F",[27561,18476.3,7.37309],360,0],
["Land_TTowerBig_2_F",[27444.8,18426.8,15.1276],360,0],
["Land_dp_smallTank_F",[27516.2,18509,15.0719],360,0],
["Land_dp_smallTank_F",[27507.3,18509,15.0719],360,0],
["Land_dp_smallTank_F",[27498.4,18509,15.0719],360,0],
["Land_dp_smallTank_F",[27489.5,18509,15.0719],360,0],
["Land_dp_smallTank_F",[27480.6,18508.6,15.0719],360,0],
["Land_dp_mainFactory_F",[27457.7,18488.9,14.8946],268.182,0],
["Land_Offices_01_V1_F",[27412.5,18335.5,15.7663],179,0],
["Land_Factory_Main_F",[27423.1,18496.2,14.9747],90,0],
["Land_ReservoirTank_Airport_F",[27443.7,18508.5,15.0971],360,0],
["Land_Radar_Small_F",[27406,18354.5,34.9451],230,0],
["Land_i_Shed_Ind_F",[27526.7,18337.4,15.6609],360,0],
["Land_i_Shed_Ind_F",[27526.7,18358.2,15.6609],360,0],
["Land_dp_bigTank_F",[27535.6,18401.8,15.0616],357,0],
["Land_dp_bigTank_F",[27534.6,18421.2,15.0616],357,0],
["Land_dp_bigTank_F",[27533.6,18440.5,15.0616],357,0],
["Land_dp_bigTank_F",[27532.6,18459.8,15.0616],357,0],
["Land_dp_smallTank_F",[27536.2,18401.4,21.6792],360,0],
["Land_dp_smallTank_F",[27535,18420.6,21.6792],360,0],
["Land_dp_smallTank_F",[27534,18439.9,21.6792],360,0],
["Land_dp_smallTank_F",[27533,18459.4,21.6792],360,0],
["Land_i_Barracks_V2_F",[27446.4,18355.9,14.9024],359,0],
["Land_i_Barracks_V2_F",[27447.3,18385.1,14.9899],179.5,0],
["Land_BC_Court_F",[27447.1,18370.3,14.6842],269,0],
["Land_BC_Basket_F",[27436,18370,15.1293],89,0],
["Land_BC_Basket_F",[27458.5,18370.5,15.1714],269,0],
["Land_dp_mainFactory_F",[27415,18457.8,15.1638],269,0],
["Land_Hospital_main_F",[27410.5,18393.1,15.6],179,0],
["Land_Hospital_side2_F",[27438.3,18403.6,15.6],179,0],
["Land_Hospital_side1_F",[27406.3,18360.5,15.57],179.091,0],
["Land_Communication_F",[27401.3,18329.1,35.1533],360,0],
["Land_Crane_F",[27392.6,18499,14.8897],179,0],
["Land_Stadium_p9_F",[27461.1,18432.4,8.7739],269,0],
["Land_GH_Stairs_F",[27464.1,18435.4,13.6741],269,0],
["Land_IndPipe2_big_18_F",[27540.8,18487.3,15.1],359,0],
["Land_IndPipe2_big_ground1_F",[27541.2,18475.8,15.1],359,0],
["Land_IndPipe2_bigL_L_F",[27539.5,18499.1,15.1],359,0],
["Land_IndPipe2_big_18_F",[27527.1,18499.9,15.1],269,0],
["Land_IndPipe2_big_18_F",[27509.2,18499.6,15.1],269,0],
["Land_IndPipe2_big_18_F",[27491.3,18499.3,15.1],269,0],
["Land_IndPipe2_bigL_L_F",[27479.4,18498,15.1],269,0],
["Land_IndPipe2_big_18_F",[27478.6,18485.6,15.1],179,0],
["Land_IndPipe2_bigL_R_F",[27477.6,18473.6,15.1],179,0],
["Land_IndPipe2_big_ground1_F",[27472.5,18472.4,15.1],89,0],
["Land_BagBunker_Small_F",[27540.4,18493.3,14.9162],269,0],
["Land_BarGate_F",[27540.3,18485.6,15.448],89,0],
["Land_Cargo_Patrol_V1_F",[27535.5,18507.3,15.1339],179,0],
["Land_BagBunker_Small_F",[27525.5,18510.6,14.9049],179,0],
["Land_MilOffices_V1_F",[27494,18342,15.5566],89,0],
["Land_MilOffices_V1_F",[27491.5,18391,14.9497],359,0],
["Land_Crane_F",[27460.1,18349.9,14.8767],179,0],
["Land_Cargo40_blue_F",[27455.2,18324.7,15.1],359,0],
["Land_Cargo40_blue_F",[27442.8,18324.5,15.1],359,0],
["Land_Cargo40_blue_F",[27467.2,18324.9,15.1],359,0],
["Land_Cargo40_blue_F",[27467.2,18327.4,15.1],359,0],
["Land_Cargo40_blue_F",[27467.1,18329.9,15.1],359,0],
["Land_Cargo40_blue_F",[27467.1,18329.9,17.6849],359,0],
["Land_Cargo40_blue_F",[27442.7,18327,15.1],359,0],
["Land_Cargo40_blue_F",[27442.7,18329.4,15.1],359,0],
["Land_Cargo40_blue_F",[27442.7,18331.9,15.1],359,0],
["Land_Cargo40_blue_F",[27442.6,18334.4,15.1],359,0],
["Land_Cargo40_blue_F",[27442.6,18336.9,15.1],359,0],
["Land_Cargo40_blue_F",[27442.5,18339.4,15.1],359,0],
["Land_Cargo40_blue_F",[27442.5,18341.8,15.1],359,0],
["Land_Cargo40_blue_F",[27442.4,18344.3,15.1],359,0],
["Land_Cargo40_blue_F",[27455,18327.2,15.1],359,0],
["Land_Cargo40_blue_F",[27454.9,18329.7,15.1],359,0],
["Land_Cargo40_blue_F",[27454.9,18332.1,15.1],359,0],
["Land_Cargo40_blue_F",[27454.8,18334.6,15.1],359,0],
["Land_Cargo40_blue_F",[27454.8,18337.1,15.1],359,0],
["Land_Cargo40_blue_F",[27454.7,18339.6,15.1],359,0],
["Land_Cargo40_blue_F",[27454.7,18342.1,15.1],359,0],
["Land_Cargo40_blue_F",[27454.7,18344.5,15.1],359,0],
["Land_Cargo40_blue_F",[27467.1,18332.4,15.1],359,0],
["Land_Cargo40_blue_F",[27467,18334.8,15.1],359,0],
["Land_Cargo40_blue_F",[27467,18337.3,15.1],359,0],
["Land_Cargo40_blue_F",[27467,18339.8,15.1],359,0],
["Land_Cargo40_blue_F",[27466.9,18342.3,15.1],359,0],
["Land_Cargo40_blue_F",[27466.9,18344.8,15.1],359,0],
["Land_Cargo40_brick_red_F",[27455,18327.2,17.68],359,0],
["Land_Cargo40_brick_red_F",[27454.9,18329.7,17.68],359,0],
["Land_Cargo40_brick_red_F",[27454.9,18332.1,17.68],359,0],
["Land_Cargo40_brick_red_F",[27454.9,18334.6,17.68],359,0],
["Land_Cargo40_brick_red_F",[27454.8,18337.1,17.68],359,0],
["Land_Cargo40_brick_red_F",[27454.8,18339.6,17.68],359,0],
["Land_Cargo40_brick_red_F",[27454.7,18342.1,17.68],359,0],
["Land_Cargo40_brick_red_F",[27442.1,18340.5,17.68],221.171,0],
["Land_Cargo40_brick_red_F",[27441.6,18330,17.68],300.135,0],
["Land_Cargo40_brick_red_F",[27467.3,18339.3,17.68],224.042,0],
["Land_Cargo40_light_green_F",[27462.1,18339.3,20.3982],360,0],
["Land_Cargo40_light_green_F",[27448.6,18334.4,20.313],167.979,0],
["Land_Cargo40_light_green_F",[27455,18331.1,20.313],135.506,0],
["Land_IndPipe1_ground_F",[27536.1,18470.6,15.11],89,0],
["Land_IndPipe1_valve_F",[27530.7,18470.8,15.1],269,0],
["Land_IndPipe1_Uup_F",[27523.3,18470.4,15.1],89,0],
["Land_IndPipe1_90degL_F",[27518,18469.2,15.1],269,0],
["Land_IndPipe1_20m_F",[27516.7,18457.7,15.1],359,0],
["Land_IndPipe1_20m_F",[27517,18436.9,15.1],359,0],
["Land_IndPipe1_20m_F",[27517.4,18416.1,15.1],359,0],
["Land_IndPipe1_20m_F",[27517.6,18405.3,15.1],359,0],
["Land_IndPipe1_90degL_F",[27518.9,18393.6,15.1],179,0],
["Land_IndPipe1_Uup_F",[27524.1,18392.2,15.1],89,0],
["Land_IndPipe1_valve_F",[27524.1,18392.2,15.1],89,0],
["Land_IndPipe1_ground_F",[27537,18392.5,15.1],89,0],
["Land_IndPipe2_big_ground2_F",[27523.6,18473.9,15.1],359,0],
["Land_IndPipe2_big_18_F",[27523.6,18462.6,15.1],359,0],
["Land_IndPipe2_big_ground2_F",[27520.6,18473.8,15.1],359,0],
["Land_IndPipe2_big_18_F",[27523.9,18444.6,15.1],359,0],
["Land_IndPipe2_big_18_F",[27524.2,18426.6,15.1],359,0],
["Land_IndPipe2_big_18_F",[27524.5,18408.6,15.1],359,0],
["Land_IndPipe2_big_18_F",[27524.8,18390.6,15.1],359,0],
["Land_IndPipe2_big_ground1_F",[27525.2,18379.1,15.1],359,0],
["Land_IndPipe2_big_ground1_F",[27522.2,18379.1,15.1],359,0],
["Land_IndPipe2_big_ground2_F",[27517.5,18473.7,15.1],359,0],
["Land_IndPipe2_big_18_F",[27517.5,18462.5,15.1],359,0],
["Land_IndPipe2_big_18_F",[27517.8,18444.5,15.1],359,0],
["Land_IndPipe2_big_18_F",[27518.1,18426.5,15.1],359,0],
["Land_IndPipe2_big_18_F",[27518.4,18408.5,15.1],359,0],
["Land_IndPipe2_big_18_F",[27518.7,18390.5,15.1],359,0],
["Land_IndPipe2_big_ground1_F",[27519.1,18379,15.1],359,0],
["Land_Cargo40_blue_F",[27514.2,18469.7,15.1],89,0],
["Land_Cargo40_blue_F",[27514.4,18457.4,15.1],89,0],
["Land_Cargo40_blue_F",[27514.6,18445.2,15.1],89,0],
["Land_Cargo40_blue_F",[27514.8,18433,15.1],89,0],
["Land_Cargo40_blue_F",[27515,18420.8,15.1],89,0],
["Land_Cargo40_blue_F",[27515.2,18408.6,15.1],89,0],
["Land_Cargo40_blue_F",[27515.2,18408.6,17.7162],89,0],
["Land_Cargo40_blue_F",[27515,18420.8,17.7162],89,0],
["Land_Cargo40_blue_F",[27514.8,18433,17.7162],89,0],
["Land_Cargo40_blue_F",[27514.6,18445.2,17.7162],89,0],
["Land_Cargo40_blue_F",[27514.4,18457.4,17.7162],89,0],
["Land_Cargo40_blue_F",[27514.2,18469.7,17.7162],89,0],
["Land_Cargo40_blue_F",[27515.4,18396.4,15.1],89,0],
["Land_Cargo40_blue_F",[27515.6,18384.1,15.1],89,0],
["Land_Cargo40_blue_F",[27515.4,18396.4,17.72],89,0],
["Land_Cargo40_blue_F",[27515.6,18384.1,17.72],89,0],
["Land_BagBunker_Tower_F",[27540.5,18386.3,15.1],179,0],
["Land_WIP_F",[27490.6,18428.1,15.1],269,0],
["Land_PipeWall_concretel_8m_F",[27508.8,18474.9,15.1],359,0],
["Land_PipeWall_concretel_8m_F",[27501,18474.8,15.1],359,0],
["Land_PipeWall_concretel_8m_F",[27480.6,18474.4,15.1],359,0],
["Land_BagBunker_Small_F",[27495,18472.9,15],179,0],
["Land_BarGate_F",[27488,18474.1,15.1],179,0],
["Land_Cargo_Tower_V1_No1_F",[27502.8,18464.3,15.1],360,0],
["Land_Cargo_Tower_V1_No2_F",[27496.5,18364.3,15.1],360,0],
["Land_Crane_F",[27490.6,18413.3,27.4749],179,0],
["Land_PortableLight_double_F",[27447.1,18440.2,15.1],360,0],
["Land_PortableLight_double_F",[27442.4,18440,15.1],360,0],
["Land_Portable_generator_F",[27448.5,18419.4,15.1],360,0],
["Land_Pipes_small_F",[27438.2,18429,15.1],359,0],
["Land_Pipes_small_F",[27438.2,18429.6,15.1],359,0],
["Land_Pipes_small_F",[27438.2,18430.1,15.1],359,0],
["Land_Pipes_small_F",[27438.2,18430.7,15.1],359,0],
["Land_Pipes_small_F",[27438.2,18431.3,15.1],359,0],
["Land_Pipes_small_F",[27438.2,18431.9,15.1],359,0],
["Land_Pipes_small_F",[27438.1,18432.4,15.1],359,0],
["Land_Pipes_small_F",[27434.3,18432.4,15.1],359,0],
["Land_Pipes_small_F",[27434.3,18431.8,15.1],359,0],
["Land_Pipes_small_F",[27434.3,18431.2,15.1],359,0],
["Land_Pipes_small_F",[27434.3,18430.7,15.1],359,0],
["Land_Pipes_small_F",[27434.4,18430.1,15.1],359,0],
["Land_Pipes_small_F",[27434.4,18429.5,15.1],359,0],
["Land_Pipes_small_F",[27434.4,18428.9,15.1],359,0],
["Land_Pallets_F",[27438.3,18427,15.1],359,0],
["Land_ConcretePipe_F",[27452.7,18436.1,15],359,0],
["Land_ConcretePipe_F",[27452.7,18433.1,15],359,0],
["Land_ConcretePipe_F",[27452.8,18429.3,15],359,0],
["Land_ConcretePipe_F",[27452.8,18426.5,15],359,0],
["Land_ConcretePipe_F",[27452.9,18422.7,15],359,0],
["Land_ConcretePipe_F",[27452.9,18419.9,15],359,0],
["Land_ConcretePipe_F",[27453,18416.1,15],359,0],
["Land_CargoBox_V1_F",[27450.3,18437.5,15.1],360,0],
["Land_CargoBox_V1_F",[27450.3,18439,15.1],360,0],
["Land_ToolTrolley_02_F",[27448.3,18430.7,15.1],360,0],
["Land_ToolTrolley_01_F",[27442.8,18437.1,15.1],360,0],
["Land_WeldingTrolley_01_F",[27440.6,18421.3,15.1],360,0],
["Land_Coil_F",[27433.8,18426.3,15.1],360,0],
["Land_JunkPile_F",[27486,18453.6,15.1],360,0],
["Land_LampHalogen_F",[27455.7,18425.7,15.1],360,0],
["Land_LampHalogen_F",[27444.3,18444.9,15.1],269,0],
["Land_LampHalogen_F",[27428.8,18425.8,15.1],179,0],
["Land_GH_Stairs_F",[27543.9,18483.8,11.06],179,0],
["Land_GH_Stairs_F",[27545.4,18483.8,11.06],179,0],
["Land_GH_Stairs_F",[27545.5,18476.2,6.13689],179,0],
["Land_GH_Stairs_F",[27544.0,18476.2,6.13689],179,0],
["Land_nav_pier_m_F",[27598.4,18481.1,1.3],360,0],
["Land_nav_pier_m_F",[27563.3,18481.1,1.3],360,0],
["Land_PaperBox_closed_F",[27467.8,18457.5,15.1319],360,0],
["Land_PaperBox_closed_F",[27467.7,18455.4,15.1319],360,0],
["Land_PressureWasher_01_F",[27449.5,18422.3,15.1213],360,0],
["WaterPump_01_forest_F",[27445.1,18440.4,15.1394],360,0],
["Land_Tank_rust_F",[27436,18420.3,15.4061],89,0],
["Land_wpp_Turbine_V1_F",[27541.5,18373,15.8724],360,0],
["FirePlace_burning_F",[27460.5,18506,37.4258],360,0],
["FirePlace_burning_F",[27456.7,18505.9,37.4258],360,0],
["FirePlace_burning_F",[27418,18474.7,37.4258],360,0],
["FirePlace_burning_F",[27414.4,18474.6,37.4258],360,0],
["Land_Cargo40_brick_red_F",[27452.9,18443.7,15.1],359,0],
["Land_Cargo40_grey_F",[27462.4,18458,15.1],269,0],
["Land_Cargo40_light_blue_F",[27442,18447.1,15.1],359,0],
["Land_IndPipe2_big_ground1_F",[27451.1,18470.9,15.1],179,0],
["Land_IndPipe2_big_18_F",[27451.5,18459.4,15.1],179,0],
["Land_IndPipe2_big_ground2_F",[27451.5,18448.5,15.1],179,0],
["B_HMG_01_high_F",[27525.6,18510.8,15.1],360,0],
["B_HMG_01_high_F",[27398.6,18374.7,31.1787],269,0],
["B_HMG_01_high_F",[27413.7,18330.5,33.6438],179,0],
["B_HMG_01_high_F",[27410.4,18509,17.9284],360,0],
["B_HMG_01_high_F",[27406.1,18440.3,21.2967],269,0],
["B_HMG_01_high_F",[27519.4,18327.4,17.9298],179,0],
["B_HMG_01_high_F",[27540.8,18384.5,17.9354],89,0],
["Land_dp_transformer_F",[27511.9,18379.4,15.3919],360,0],
["Land_dp_transformer_F",[27462.5,18425.8,15.1],179,0],
["Land_dp_transformer_F",[27445.8,18469.8,15.1],269,0],
["Land_BagBunker_Tower_F",[27521.4,18328.3,15.1],269,0],
["Land_BagBunker_Tower_F",[27408.2,18508,15.1],89,0],
["Land_Cargo_Patrol_V1_F",[27391.8,18426.7,15.1],89,0],
["Land_HBarrier_5_F",[27530.7,18510.9,15.1],359,0],
["Land_HBarrier_5_F",[27536.5,18511,15.1],359,0],
["Land_HBarrier_5_F",[27540.1,18509.7,15.1],89,0],
["Land_HBarrier_5_F",[27540.2,18506.1,15.1],89,0],
["Land_BagFence_Long_F",[27446.6,18467.4,15.1],359,0],
["Land_BagFence_Long_F",[27444,18467.4,15.1],359,0],
["Land_BagFence_Long_F",[27441.4,18467.4,15.1],359,0],
["Land_BagFence_Long_F",[27446.3,18474.3,15.1],359,0],
["Land_BagFence_Long_F",[27443.7,18474.3,15.1],359,0],
["Land_BagFence_Long_F",[27441.1,18474.2,15.1],359,0],
["Land_BagFence_Long_F",[27439.8,18472.5,15.1],89,0],
["Land_Pallet_MilBoxes_F",[27473.5,18450.5,15.1],89,0],
["Land_Pallet_MilBoxes_F",[27471.6,18450.5,15.1],89,0],
["Land_HBarrier_3_F",[27510.8,18386,15.1],359,0],
["Land_HBarrier_3_F",[27512.6,18386,15.1],359,0],
["Land_PowerGenerator_F",[27418,18333.8,33.5467],359,0],
["Land_PowerGenerator_F",[27429.2,18412.6,31.0172],89,0],
["Land_PowerGenerator_F",[27405.2,18470.7,15.1],359,0],
["Land_BagFence_Round_F",[27403.1,18468.4,15.1],30,0],
["Land_BagFence_Round_F",[27402.1,18470.6,15.1],100,0],
["Land_IronPipes_F",[27510.2,18482.3,15.1],89,0],
["Land_IronPipes_F",[27498.5,18486.6,15.1],45,0],
["Land_Pallets_F",[27518.1,18490.5,15.1],360,0],
["Land_Bricks_V3_F",[27505.2,18485.9,15.1],360,0],
["Land_Bricks_V3_F",[27490.8,18489.9,15.1],360,0],
["Land_IronPipes_F",[27522.1,18484.6,15.1],45,0],
["B_HMG_01_high_F",[27627.2,18501.8,7.33893],45,0],
["B_HMG_01_high_F",[27626.6,18431.8,7.33893],135,0],
["Land_HBarrier_3_F",[27474.8,18344.3,15.1],359,0],
["Land_HBarrier_3_F",[27477.9,18344.3,15.1],359,0],
["Land_HBarrier_3_F",[27485.9,18344.7,15.1],359,0],
["Land_Shed_Small_F",[27411.3,18418.7,15.1],269,0],
["Land_CargoBox_V1_F",[27388.5,18470.4,15.1],360,0],
["Land_CargoBox_V1_F",[27390,18470.4,15.1],360,0],
["Land_CargoBox_V1_F",[27391.5,18470.4,15.1],360,0],
["Land_PaperBox_closed_F",[27394.5,18404.3,15.1],359,0],
["Land_PaperBox_closed_F",[27393,18404.3,15.1],359,0],
["Land_PaperBox_closed_F",[27389.1,18396.9,15.1],359,0],
["Land_PaperBox_closed_F",[27390.6,18396.9,15.1],359,0],
["Land_PaperBox_closed_F",[27394.8,18385,15.1],359,0],
["Land_PaperBox_closed_F",[27394.8,18386.5,15.1],359,0],
["Land_PaperBox_closed_F",[27394.8,18388,15.1],359,0],
["Land_PaperBox_open_full_F",[27395,18379.8,15.1],359,0],
["Land_PaperBox_open_full_F",[27393.5,18379.8,15.1],359,0],
["Land_PaperBox_open_full_F",[27392,18379.7,15.1],359,0],
["Land_Pallet_MilBoxes_F",[27389.4,18374.5,15.1],359,0],
["Land_Pallet_MilBoxes_F",[27391.2,18374.5,15.1],359,0],
["Land_HBarrier_3_F",[27397,18340.7,15.1],359,0],
["Land_HBarrier_3_F",[27391.1,18340.4,15.1],359,0],
["Land_LampHalogen_F",[27460.9,18370.5,15.1],360,0],
["Land_LampHalogen_F",[27433.4,18370.1,15.1],179,0],
["Land_LampHarbour_F",[27395,18393.7,15.1],269,0],
["Land_LampHarbour_F",[27403.7,18482.1,15.1],269,0],
["Land_LampShabby_F",[27538.7,18478.3,15.1],360,0],
["Land_LampShabby_F",[27487.4,18458.3,15.1],360,0],
["Land_LampShabby_F",[27508.8,18384.5,15.1],179,0],
["Land_LampShabby_F",[27398.7,18327.1,15.1],269,0],
["Land_IndPipe2_big_18_F",[27520.5,18462.5,15.1],359,0],
["Land_IndPipe2_big_18_F",[27520.9,18444.5,15.1],359,0],
["Land_IndPipe2_big_18_F",[27521.2,18426.5,15.1],359,0],
["Land_IndPipe2_big_18_F",[27521.5,18408.6,15.1],359,0],
["Land_IndPipe2_big_18_F",[27521.8,18390.6,15.1],359,0],
["Land_HelipadCircle_F",[27439.1,18406.6,38],360,0]


],[
//---------------------------------------------------------------------------------
//-----Group Configuration-----  see Convoy section for AI in vehicles! 
//--- See SoldierData.sqf for AI type options.
/*
    Defined AI logic options: See 'Documenation' for details'
["BUILDINGS", [spawnloc], [actionloc], [duration, range]]  
["EXPLORE   ",[spawnloc], [actionloc], [radius]]
["BOXPATROL", [spawnloc], [actionloc], [radius]]
["CONVOY",    [spawnloc], [actionloc], [speed, FlagRTB, FlagRoads, FlagDespawn, convoyType]]
["SENTRY",    [spawnloc], [actionloc], [radius]]
["PARADROP",  [spawnloc], [actionloc], [speed, altitude, FlagRTB, FlagSmokes]]  
["PATROLROUTE", [spawnloc], [actionloc], [behaviour, speed, [locations], FlagRTB, FlagRoads, FlagDespawn, flyHeight]    
    
*/
// **paste 'copy' below this line to add additional groups.

// **Start 'copy'****Spawn a Group of AI Config Data *********
// 3 rifleman that will spawn NW of encounter center and patrol all buildings within 70m
// Example below shows how town names can be used in place of spawn locations and offsets!
[["RESISTANCE","COMBAT","RED","LINE"],[[3,"Rifleman"]],["Buildings",[0,0],[0,0],[70] ]], // 3 rifleman that will patrol all buildings within 70m for unlimited duration
// **End 'copy'******(see Patrol Options below for other AI behaviour)
// Example of a 3D map location. This loc is specific to ALTIS
[["RESISTANCE","COMBAT","RED","LINE"],[[5,"Rifleman"]],["BoxPatrol",[0,0],[0,0],[70] ]]
    // 5 rifleman that spawn at [21520,11491.9,0] and march to encounter centr to set up a box patrol!    
// Expanded group example:
// 1 sniper, 2 rifleman, 2 hunters wil spawn east of encounter center and perform a box shaped patrol.

// 2 hunters that will spawn near encounter center and take up guard positions.
// This example the AI are spawned 6 meters NE of encoutner center, and will look for a building within 30meters of encounter senter to take up Sentry postions.
// [["RESISTANCE","COMBAT","RED","LINE"],[[2,"Hunter"]],["Sentry",[0,0],[0,0],[30]]
],
// NOTE: if no buildings are located within 'radius' both 'Buildings' and 'Lookout' will locate nearest buildings to the encounter and move there!
// NOTE: See AI_LOGIC.txt for detailed and most current descriptions of AI logic.

//---------------------------------------------------------------------------------
//-----LAND Vehicle Configuration----- 
[
 
],
[
	[
      //Define all the triggers this mission will be using
	  // Trigger names must be unique within each mission.
	  // NOTE: "FuMS_KillMe" is a reserved trigger word. Do not use!!!
	  // NOTE: "OK" is a reserved trigger. Do not define it here.
	  //  "OK" can be used in the actions section to force an action to occur at mission start!	 
//	  ["PROX",["ProxPlayer",[0,0],80,1]  ],
	  ["LUCNT",["LowUnitCount","GUER",1,0,[0,0]]  ]
//	  ["HUCNT",["HighUnitCount","GUER",6,0,[0,0]] ],
//	  ["Detect",["Detected","ALL","ALL"] ],
//	  ["BodyCount",["BodyCount",9] ]
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
	  [["WIN"],["LUCNT"     ]],  // 
	//  [["CHILD","Help_Helo",[0,0]],["OK"      ]],  // 
	// [["Reinforce","Help_Vehicle","Trig4"]], 
//	  [["LOSE"],["TIMER", "OR", "VehDmg1", "BldgDmg1"]   ],
      [["END"],["LUCNT"     ]]  
	]      
]
];
