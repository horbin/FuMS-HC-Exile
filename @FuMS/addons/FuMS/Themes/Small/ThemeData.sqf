// ThemeData.sqf
// Horbin
// 1/10/15
// Inputs: Theme index into which to store this data.
// Outputs: none
//  Options , Mission List, Points List
_themeData =
[
    [
        "Small",   	// Needs to match the folder name!
        1,  		// Mission Selection: 1=Random, 2=In order, 3=Random, once only until all missions run
        60, 		// Respawn delay in seconds
		true,  		// Global Loot Data
		true,  		// Global Soldier Data
		true,   	// AutoStart
        1,  		// Player minimum to launch missions from this theme.
        100   		// Player maximum above which missions will not launch
    ],
    [  
       //see Test Theme ThemeData.sqf for other options
		["SniperRaid","Villages"],
		["HostilePatrol","Villages"],
		["Gang","Villages"],
		["BanditPosse","Villages"]
		
    ],
    [   //***** Locations *****
		//["Villages"]        
    ],
	[
		[ // AI Radio Chatter configuration
			"ALL", // radio channel used by AI - "ALL"= messages heard w/o radio
			false, // silent Check-in =true: AI squads will NOT check-in with BaseOps when they spawn.
			true, // AI death messages enabled.
			5000, // Radio Range (for AI. BaseOps's high power radio has unlimited range)
			"Sudo",    // AI callsign, groups will be numbered..ie Bear01, Bear02
			"Kiwi" // BaseOps call sign
		],
		[  // AI to Base Chatter
			["CheckIn", "We are <DIST> meters <DIR> from <MSNNAME>."],
			["Position", "Currently at <POS>."],
			["Detected", "Enemies nearbye <MSNNAME>."],
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