//ThemeData.sqf
// Horbin
// 10/27/2015
// This theme file is used to load and initialize playerWatch based missions.
//
// DO NOT MODIFY ANY SETTINGS IN THIS FILE!
//
// Only modify the list of missions!

_themeData =
[
    [
        "PlayerWatch",   // Needs to match the folder name!
        1,  //Mission Selection: 1=Random, 2=In order, 3=Random, once only until all missions run
        60, // Respawn delay in seconds
		true,  // Global Loot Data
		true,  // Global Soldier Data
		false,   // AutoStart (do not set this to true, or all sorts of crazy stuff will occur)
        1,  // Player minimum to launch missions from this theme.
        100   // Player maximum above which missions will not launch
    ],
    [  
       //All missions defined in PlayerWatchConfig.sqf MUST be declared here in order
	   //  for the server to properly compile and push the mission to the HC!
		["neutrals"],["helodrop"],["chaseHelo"],["chasecar"],["attackboat"],["divers"],["smallband"],//["zombies"],   // Enable random zombie spawn here by removing first set of //
		["gunfight"]
		
	
		
		
    ],
    [   //***** Locations *****

    ],
	[
		[ // AI Radio Chatter configuration
			0, // radio channel used by AI - "ALL"= messages heard w/o radio
			true, // silent Check-in =true: AI squads will NOT check-in with BaseOps when they spawn.
			false, // AI death messages enabled.
			500, // Radio Range (for AI. BaseOps's high power radio has unlimited range)
			"Sudo",    // AI callsign, groups will be numbered..ie Bear01, Bear02
			"Kiwi" // BaseOps call sign
		],
		[  // AI to Base Chatter
			["CheckIn", "We are <DIST> meters <DIR> from <MSNNAME>."],
			["Position", "Currently at <POS>."],
			["Detected", "Clones nearbye <MSNNAME>."],
			["Less50", "We are taking heavy casualties!"],
			["SitRep", "On station. <#ALIVE> souls, <#DEAD> dead. <STATUS>"],
			["Done", "Roger Out."],
			["Death", "We are under attack!"]
		],
		[   // Base to AI chatter
			["CheckIn", "Copy, return to base ASAP"],
			["Position", "Say your current position."],
			["Detected", "Roger. Weapons Free. All clones hostile."],
			["Less50", "We have you Lima Charlie. Stand bye!"],
			["SitRep", "99 <CALLSIGN> pass SITREP."],
			["HELP", "Support is on its way!."],
			["Death", ""]  // no response.
		]
	]	
	
	
	
];

FuMS_THEMEDATA set [_this select 0, _themeData];