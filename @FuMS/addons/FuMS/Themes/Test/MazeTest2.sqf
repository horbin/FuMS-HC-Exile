//TestMission01.sqf
// Horbin
// 12/31/14
// Be cautious when editing data.

// NOTE: For all Offset values, if three dimensions are used, the point will be treated as an absolute point on the game map.
// Ex: [15,20] is an offset 15m east, 20m north of the encounter center
// Ex: [12100,11000,0] is a specific point on the map.
// absolute 3d locations can be subsituted for any offset within this file!


[[
//------------------------------------------------------------------------------------
//-----Mission Area Setup-----
    "MazeTest2",  // Mission Title NOSPACES!
    200   , "LAND"             // encounter radius
],[ 
//------------------------------------------------------------------------------------
//-----Notification Configuration-----
//--Map Marker Config.
    "Maze Test",  // Name, set to "" for nothing
     "mil_dot", // icon type:                                     https://community.bistudio.com/wiki/cfgMarkers for other options.
                     // mil_triangle, mil_objective, mil_box, group1, loc_Power, etc.
     "ELLIPSE", // "RECTANGLE". do not use "ICON", two markers are used in making each mission indicator.
     "ColorYellow",//                                                  https://community.bistudio.com/wiki/setMarkerColor
     "FDiagonal",// Cross, Vertical, Horizontal, etc      https://community.bistudio.com/wiki/setMarkerBrush 
       200           // size of the marker.    
],[[
    // NOTIFICATION Messages and Map display Control.
	false,    // Notify players via Radio Message
    "ALL",   // radio channel. "ALL" = no radio required.
    0,         //range from encounter center AI radio's can be heard (0=unlimited.)
    true,  // Notify players via global message - hint screen on right of game display -
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
["Land_HBarrierBig_F",[0,0,0],33.6364,0],
["Land_HBarrierBig_F",[7,-4.2,-4.76837E-07],33.6364,0],
["Land_HBarrierBig_F",[-21.5,19.3,4.76837E-07],122.727,0],
["Land_HBarrierBig_F",[-17.2,26.2,4.76837E-07],122.727,0],
["Land_HBarrierBig_F",[-13.1,33.3,0],122.727,0],
["Land_HBarrierBig_F",[-8.7,40.4,0],122.727,0],
["Land_HBarrierBig_F",[-2.5,40.5,-0.001553533],213.586,0],
["Land_HBarrierBig_F",[4.5,36,0.000173092],213.628,0],
["Land_HBarrierBig_F",[11.5,31.3,0.001195427],215.013,0],
["Land_HBarrierBig_F",[18.6,26.6,0.007080077],215.408,0],
["Land_HBarrierBig_F",[25.3,21.8,0.015634077],216.226,0],
["Land_HBarrierBig_F",[25.2,15.9,0.017685377],305.768,0],
["Land_HBarrierBig_F",[20.4,9.3,0.017614877],308.041,0],
["Land_HBarrierBig_F",[12.3,-2.2,0.019072077],307.128,0],
["Land_HBarrierBig_F",[17.9,0.1,0.018848877],213.5,0],
["Land_HBarrierBig_F",[20.6,3.8,0.018860377],217.14,0],
["Land_Shoot_House_Wall_Long_F",[14.9,5.2,4.76837E-07],338.182,0],
["Land_Shoot_House_Wall_Long_F",[11.8,3,4.76837E-07],309.091,0],
["Land_Shoot_House_Wall_Long_F",[10,-0.4,4.76837E-07],289.091,0],
["Land_Shoot_House_Wall_Long_F",[7.7,1.5,4.76837E-07],310.909,0],
["Land_Shoot_House_Wall_Long_F",[5.9,-0.5,4.76837E-07],311.364,0],
["Land_Shoot_House_Wall_Long_F",[4.2,7.3,4.76837E-07],34.0909,0],
["Land_Shoot_House_Wall_Long_Prone_F",[16.6,8.2,4.76837E-07],36.3636,0],
["Land_Shoot_House_Wall_Crouch_F",[12.3,6.5,4.76837E-07],341.818,0],
["Land_Shoot_House_Wall_Long_F",[14.3,8.4,4.76837E-07],304.546,0],
["Land_Shoot_House_Wall_Long_F",[10.1,10.3,4.76837E-07],310.909,0],
["Land_Shoot_House_Wall_Long_F",[7.3,7.5,4.76837E-07],319.545,0],
["Land_Shoot_House_Wall_Long_F",[-1.1,8.6,4.76837E-07],315,0],
["Land_Shoot_House_Wall_Long_F",[-0.4,14.7,0],218.182,0],
["Land_Shoot_House_Wall_Long_F",[-2.3,17.9,0],258.636,0],
["Land_Shoot_House_Wall_Long_F",[-3.5,21.6,4.76837E-07],243.636,0],
["Land_Shoot_House_Wall_Long_F",[-5.7,24.9,4.76837E-07],228.181,0],
["Land_Shoot_House_Wall_Long_F",[-5.2,27.1,0],336.818,0],
["Land_Shoot_House_Wall_Long_F",[-8,31.1,0],240,0],
["Land_Shoot_House_Wall_Long_F",[-9.6,33.9,0],240.454,0],
["Land_Shoot_House_Wall_Crouch_F",[16,10.7,4.76837E-07],308.637,0],
["Land_Shoot_House_Wall_Long_F",[17.7,13.1,9.53674E-07],304.091,0],
["Land_Shoot_House_Wall_Long_F",[10.2,4.6,4.76837E-07],306.364,0],
["Land_Shoot_House_Panels_F",[21.6,18.8,4.76837E-07],304.091,0],
["Land_Shoot_House_Wall_Long_F",[19.9,16.3,1.43051E-06],304.091,0],
["Land_Shoot_House_Panels_Windows_F",[-1.4,6.9,4.76837E-07],46.364,0],
["Land_Shoot_House_Wall_Long_F",[19.9,21.8,1.43051E-06],315.909,0],
["Land_Shoot_House_Wall_Long_Crouch_F",[4.4,10.6,4.76837E-07],29.5454,0],
["Land_Shoot_House_Wall_Long_Crouch_F",[9.2,11.9,9.53674E-07],69.5449,0],
["Land_Shoot_House_Wall_Long_F",[12.5,13.3,4.76837E-07],306.364,0],
["Land_Shoot_House_Wall_Long_F",[14.5,16,4.76837E-07],306.364,0],
["Land_Shoot_House_Wall_Long_F",[15.6,20.3,4.76837E-07],43.6364,0],
["Land_Shoot_House_Panels_Windows_F",[11.8,18.5,4.76837E-07],191.818,0],
["Land_Shoot_House_Wall_Long_F",[12.8,22.8,4.76837E-07],38.6364,0],
["Land_Shoot_House_Wall_Long_F",[12.7,25.2,4.76837E-07],22.7273,0],
["Land_Shoot_House_Wall_Long_F",[8.9,25.5,0],346.364,0],
["Land_Shoot_House_Wall_Long_F",[10.5,20.6,0],76.8179,0],
["Land_Shoot_House_Panels_Crouch_F",[6.2,5.3,4.76837E-07],249.091,0],
["Land_Shoot_House_Wall_F",[12.2,11.2,4.76837E-07],213.637,0],
["Land_Shoot_House_Wall_F",[12.4,7.3,9.53674E-07],208.182,0],
["Land_Shoot_House_Wall_Long_F",[1.9,11.1,4.76837E-07],326.818,0],
["Land_Shoot_House_Wall_Long_F",[6.8,14.5,4.76837E-07],317.273,0],
["Land_Shoot_House_Wall_Long_F",[9.6,17.3,4.76837E-07],311.364,0],
["Land_Shoot_House_Wall_Long_F",[8.5,23.8,0],39.5451,0],
["Land_Shoot_House_Wall_Long_F",[1.4,21.4,4.76837E-07],242.272,0],
["Land_Shoot_House_Panels_Vault_F",[-11.2,16.2,4.76837E-07],105.455,0],
["Land_Shoot_House_Wall_Long_F",[4.1,17.7,0],263.636,0],
["Land_Shoot_House_Wall_Long_Stand_F",[-1.2,31.1,4.76837E-07],36.8182,0],
["Land_Shoot_House_Wall_Long_Stand_F",[6.6,2.5,4.76837E-07],268.182,0],
["Land_Shoot_House_Wall_Long_F",[-3.2,5.4,4.76837E-07],292.273,0],
["Land_Shoot_House_Wall_Long_F",[-6.3,11.9,9.53674E-07],322.728,0],
["Land_Shoot_House_Wall_Long_F",[0.9,7.3,9.53674E-07],327.727,0],
["Land_Shoot_House_Wall_Long_F",[-6.7,9.1,1.43051E-06],238.183,0],
["Land_Shoot_House_Wall_Long_F",[2.7,14.7,4.76837E-07],325.454,0],
["Land_Shoot_House_Wall_Long_F",[-11.3,18.9,0],260,0],
["Land_Shoot_House_Wall_Long_F",[-10.9,23,0],182.273,0],
["Land_Shoot_House_Wall_Long_F",[-10.9,28.7,4.76837E-07],267.727,0],
["Land_Shoot_House_Wall_Long_F",[-8,24.6,0],299.545,0],
["Land_Shoot_House_Wall_Long_Stand_F",[-8.7,20.9,4.76837E-07],86.8182,0],
["Land_Shoot_House_Wall_Long_Stand_F",[-0.9,11.6,4.76837E-07],56.8182,0],
["Land_Shoot_House_Wall_Stand_F",[-13.6,23.6,4.76837E-07],30.4548,0],
["Land_Shoot_House_Wall_Long_F",[-11.1,15.1,0],11.8182,0],
["Land_Shoot_House_Wall_Long_Stand_F",[-8.9,26.5,4.76837E-07],187.273,0],
["Land_Shoot_House_Panels_Window_F",[12.7,27.9,4.76837E-07],306.364,0],
["Land_Shoot_House_Wall_Long_F",[4.3,19.6,-4.76837E-07],180.455,0],
["Land_Shoot_House_Wall_Long_F",[3.5,30.3,0],39.5454,0],
["Land_Shoot_House_Wall_Long_F",[0.4,32.8,-4.76837E-07],38.6364,0],
["Land_Shoot_House_Wall_Long_F",[-2.7,35.3,-4.76837E-07],38.6364,0],
["Land_Shoot_House_Wall_Long_F",[5.2,24.7,0],345.455,0],
["Land_Shoot_House_Wall_Long_F",[1.8,25.4,4.76837E-07],40,0],
["Land_Shoot_House_Wall_Long_F",[-1.6,27.2,4.76837E-07],17.7273,0],
["Land_Shoot_House_Panels_Prone_F",[10.6,23.3,4.76837E-07],308.637,0],
["Land_Shoot_House_Panels_F",[-15,14.9,4.76837E-07],118.182,0],
["Land_Shoot_House_Panels_F",[-14.1,26,4.76837E-07],320,0],
["Land_Shoot_House_Corner_F",[-14.8,24.7,4.76837E-07],25.4545,0],
["Land_Shoot_House_Panels_Window_F",[-15.1,23.2,4.76837E-07],301.364,0],
["Land_Shoot_House_Wall_Stand_F",[-15.6,18.9,4.76837E-07],278.637,0],
["Land_Shoot_House_Wall_Stand_F",[-17.4,17.2,0],238.637,0],
["Land_Shoot_House_Wall_Stand_F",[-19.8,18.4,-4.76837E-07],232.273,0],
["Land_Shoot_House_Wall_Stand_F",[7.8,31.3,-4.76837E-07],293.636,0],
["Land_Shoot_House_Wall_Stand_F",[4.5,12.7,0],330.909,0],
["Land_Shoot_House_Wall_Long_F",[-17.3,20.6,4.76837E-07],17.7273,0],
["Land_Shoot_House_Wall_Long_F",[-13.5,20.4,9.53674E-07],346.818,0],
["Land_Shoot_House_Wall_Long_F",[-3.3,14.5,9.53674E-07],315.909,0],
["Land_Shoot_House_Panels_F",[-7.7,32.4,4.76837E-07],0,0],
["Land_Shoot_House_Panels_F",[-5.7,32.4,4.76837E-07],0,0],
["Land_Shoot_House_Panels_F",[-3.7,32.4,4.76837E-07],0,0],
["Land_Shoot_House_Panels_F",[1.2,29.3,4.76837E-07],39.0909,0],
["Land_Shoot_House_Wall_Long_Stand_F",[-6,35.6,0],330.455,0],
["Land_Shoot_House_Panels_F",[2.7,28,9.53674E-07],41.8181,0],
["Land_Shoot_House_Panels_F",[4.3,27.2,1.43051E-06],190,0],
["Land_Shoot_House_Wall_Long_Crouch_F",[-13.6,12.2,4.76837E-07],117.272,0],
["Land_Shoot_House_Panels_Window_F",[16.2,12.7,4.76837E-07],26.3636,0],
["Land_Shoot_House_Panels_Window_F",[18.1,11.8,4.76837E-07],26.3636,0],
["Land_Shoot_House_Wall_Stand_F",[-18.6,13.5,4.76837E-07],111.818,0],
["Land_Shoot_House_Wall_Long_Crouch_F",[-1.3,24,4.76837E-07],26.8182,0],
["Land_Shoot_House_Wall_Long_Crouch_F",[4.5,22.7,4.76837E-07],227.273,0],
["Land_Shoot_House_Wall_Long_F",[-10.1,12.9,4.76837E-07],115,0],
["Land_Shoot_House_Panels_Window_F",[-4,28.7,9.53674E-07],236.364,0],
["Land_Shoot_House_Panels_F",[2.5,32.4,1.90735E-06],124.091,0],
["Land_Shoot_House_Tunnel_Crouch_F",[-12.2,30.5,4.76837E-07],30.4546,0],
["Land_Shoot_House_Wall_Crouch_F",[8.5,-1.6,4.76837E-07],33.636,0],
["Land_Mil_WallBig_4m_F",[27.5,18.7,2.594300477],307.273,0],
["Land_Mil_WallBig_4m_F",[25.2,15.5,2.594300477],303.636,0],
["Land_Mil_WallBig_4m_F",[23,12.4,2.594300477],307.273,0],
["Land_Mil_WallBig_4m_F",[20.7,9.3,2.594300477],307.273,0],
["Land_Mil_WallBig_4m_F",[19.8,4.5,2.594300477],214.091,0],
["Land_Mil_WallBig_4m_F",[27,20.9,2.594300477],212.727,0],
["Land_Mil_WallBig_4m_F",[23.8,23.1,2.594300477],215.455,0],
["Land_Mil_WallBig_4m_F",[20.6,25.3,2.594300477],215,0],
["Land_Mil_WallBig_4m_F",[17.5,27.5,2.594300477],216.818,0],
["Land_Mil_WallBig_4m_F",[14.3,29.8,2.594300477],215.909,0],
["Land_Mil_WallBig_4m_F",[11.2,31.9,2.594300477],214.091,0],
["Land_Mil_WallBig_4m_F",[8,34.1,2.594300477],214.091,0],
["Land_Mil_WallBig_4m_F",[4.8,36.3,2.613030477],214.546,0],
["Land_Mil_WallBig_4m_F",[1.6,38.3,2.613030477],214.546,0],
["Land_Mil_WallBig_4m_F",[-1.6,40.5,2.613030477],214.546,0],
["Land_Mil_WallBig_4m_F",[-4.9,42.4,2.613030477],207.273,0],
["Land_Mil_WallBig_4m_F",[-7.7,41.9,2.613030477],129.546,0],
["Land_Mil_WallBig_4m_F",[-12,35.4,2.613030477],122.273,0],
["Land_Mil_WallBig_4m_F",[-10,38.8,2.613030477],122.273,0],
["Land_Mil_WallBig_4m_F",[-14.1,32,2.613030477],120.455,0],
["Land_Mil_WallBig_4m_F",[-16,28.7,2.613030477],120.455,0],
["Land_Mil_WallBig_4m_F",[-18.1,25.4,2.613030477],122.273,0],
["Land_Mil_WallBig_4m_F",[-20.1,22.2,2.613030477],122.273,0],
["Land_Mil_WallBig_4m_F",[-22.2,18.8,2.613030477],122.273,0],
["Land_Mil_WallBig_4m_F",[-23.8,16.2,2.613030477],122.273,0],
["Land_Mil_WallBig_4m_F",[-23.3,13.8,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[-19.9,11.8,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[-16.6,9.8,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[-13.3,7.8,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[-9.9,5.8,2.613030477],32.2728,0],
["Land_Mil_WallBig_4m_F",[-6.7,3.8,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[-3.4,1.8,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[-0.1,-0.2,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[3.3,-2.2,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[6.6,-4.2,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[8.3,-5.2,2.613030477],30.4546,0],
["Land_Mil_WallBig_4m_F",[10.9,-4.6,2.613030477],304.091,0],
["Land_Mil_WallBig_4m_F",[12.4,-2.4,2.613030477],304.091,0],
["Land_Mil_WallBig_4m_F",[13.9,0,2.613030477],304.091,0],
["Land_Mil_WallBig_4m_F",[16.8,0.6,2.613030477],32.2728,0],
["Land_Mil_WallBig_4m_F",[19.3,7.4,2.613030477],305.909,0],
["Land_Shoot_House_Wall_Long_F",[17.1,19,4.76837E-07],314.546,0],
["Land_Shoot_House_Wall_Long_F",[3.8,5.2,9.53674E-07],287.273,0],
["Land_Shoot_House_Wall_Long_F",[0.5,2.9,9.53674E-07],296.819,0],
["Land_Shoot_House_Wall_Long_F",[16.3,23.6,9.53674E-07],22.7273,0],
["Land_Shoot_House_Wall_Long_F",[6.9,28.8,4.76837E-07],7.2727,0],
["Land_Shoot_House_Wall_Long_F",[7.9,26.8,4.76837E-07],117.273,0],
["Land_Shoot_House_Wall_Long_F",[-8.2,13.1,-4.76837E-07],57.2727,0],
["Land_Shoot_House_Wall_Long_F",[-15,16,0],11.8182,0],
["Land_Shoot_House_Wall_Long_F",[-18.8,16.1,0],353.636,0],
["Land_Shoot_House_Wall_Long_F",[-9,17.1,4.76837E-07],179.091,0],
["Land_Shoot_House_Wall_Long_F",[-7,17.1,9.53674E-07],265.455,0],
["Land_Shoot_House_Panels_F",[-9.7,8.1,9.53674E-07],118.182,0],
["Land_Shoot_House_Panels_F",[-3.3,7.9,9.53674E-07],40,0],
["Land_Shoot_House_Panels_F",[0.6,20.8,1.43051E-06],320,0],
["Land_Shoot_House_Panels_F",[10,19.2,1.43051E-06],30.4545,0],
["Land_Shoot_House_Panels_F",[7.2,19.1,1.43051E-06],30.4545,0],
["Land_Shoot_House_Panels_F",[-0.5,19.3,1.43051E-06],290.909,0],
["Land_Mil_WallBig_4m_F",[19.6,-1.1,2.613030477],32.2728,0],
["Land_Mil_WallBig_4m_F",[22.3,2.8,2.594300477],214.091,0]

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
// Triggers and Event control.
//  There are 3 general states for a mission. Win, Lose, or Phase Change.
// In order to establish a WIN or LOSE, all Trigger specified below must be met within their specified state.
// Same evaluation is done with checking for Phase changes. 
// Phase Change Detail:
//	When a 'phase change occurs the appropriate additional mission will be launched.
//  Win/Lose logic for this encounter will suspend when phase change is launched. 
//  If triggers in this mission are still desired, uncomment the "NO TRIGGERS" comment IN THE MISSION being launched by this mission"
// See the Triggers.txt file under Docs!
[ // NOTE: side RESISTANCE for groups == side GUER for Triggers.
    [    //WIN Triggers and Controls
      ["LowUnitCount", "GUER", 0, 0, [0,0]], // all enemies are dead:  side options "EAST","WEST","GUER","CIV","LOGIC","ANY"
       ["ProxPlayer", [0,0], 20, 1] // 1 player is within 50 meters of encounter center.
	//   ["Reinforce", 100, "Random"] // %chance when requested, Mission to run
//  ["BodyCount", 10] // when at least 10 AI are killed by players
	   // Note Reinforce trigger will not impact win/loss logic.
    ],
    [    //LOSE Triggers and Controls
//      ["HighUnitCount", "GUER",10,40,[0,0]] // 10 enemies get within 40m's of encounter center
           //["Timer",180]  // mission ends after 3 minutes if not completed
    ],   
    [    //Phase01 Triggers and Controls
//        ["Timer", 180]  // Mission launches in 180 seconds
//      ["Detected",0,0]    //Launch mission if any AI group or vehicle detects a player
       //  ["ProxPlayer", [0,0], 100, 1] // 1 player is within 100 meters of encounter center.
    ],
    [    //Phase02 Triggers and Controls
      //  ["Timer",120] // after 5 minutes Enemies to this AI arrive--town WAR!!!!!
    ],
    [    //Phase03 Triggers and Controls
    
    ],
    [    // NO TRIGGERS: Uncomment the line below to simply have this mission execute. Mission triggers from a mission that
          // launched this mission will continue to be observed.
    // Uncommenting this line will ignore all triggers defined above, and mission will pass neither a WIN or LOSE result.
    //   ["NO TRIGGERS"]
    ]
],

// Phased Missions.
// Chaininig of missions is unlimited.
// Above triggers will 'suspend' when below phase starts. Phase launched will use its own triggers as specified in its mission script.
// If it is desired to continue to use the above Triggers instead of the 'launched mission's' triggers do the following:
//   uncomment the "NO TRIGGERS' line from the mission being launched.
// The file needs to be located in the same folder as this mission launching them.
[
   // ["NukeDevice",["Paros"]],  //Phase01 <-- as an array a 3dlocation, offset, or town name can be specified for the phase mission's center
   // "TestMission01Enemy", //Phase02 <-- just a file name, phased mission uses THIS mission's center!
   // "TestPhase3" //Phase03
],
[
    //Airborne Vehicle Configuration

]
    
];
