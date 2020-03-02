//ThemeData.sqf
// Horbin
// 10/26/15					
// Inputs: Theme index into which to store this data.
// Outputs: none
 //  Options , Mission List, Points List
_themeData =
[
    [
        "RoadBlock_Altis",   	// Needs to match the folder name!
        5,  					//Mission Selection: 1=Random, 2=In order, 3=Random, once only until all missions run
        60, 					// Respawn delay in seconds
		true, 					// global loot
		true, 					// global soldier data
		true,  					// autostart
        1,  					// Player minimum to launch missions from this theme.
        100   					// Player maximum above which missions will not launch
    ],
    [  
        
        // The below missions MUST be in the same folder as this file! 
        // see Test Theme ThemeData.sqf for other options
		// Currently, these are map specific becuase of spawned in base configurations, so you have to comment out the ones you dont want
		// Future state will have additonal map specific locations as info is contributed, as well as random locations
		["WestIsland",	[8444.573,9860.862]],	// Used for Tanoa
		["SEIsland",	[11056.534,3734.269]],	// Used for Tanoa
		["HiddenBase"]							//Base spawns in random location with no marker.  This should always be the last mission in this file.
		// Make sure no comma at end of last mission
		
    ],
    [   
        // List of Encounter locations to be used if Global random locations are not desired
        
    ],
	[
		[ // AI Radio Chatter configuration
			1, // radio channel used by AI - "ALL"= messages heard w/o radio
			false, // silent Check-in =true: AI squads will NOT check-in with BaseOps when they spawn.
			true, // AI death messages enabled.
			1500, // Radio Range (for AI. BaseOps's high power radio has unlimited range)
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
			["Death", "We are under attack!"],
			["DetHostileAI", "Human Mercenaries have been spotted in the area."]
		],
		[   // Base to AI chatter
			["CheckIn", "Copy, return to base ASAP"],
			["Position", "Say your current position."],
			["Detected", "Roger. Weapons Free. All clones hostile."],
			["Less50", "We have you Lima Charlie. Stand bye!"],
			["SitRep", "99 <CALLSIGN> pass SITREP."],
			["HELP", "Support is on its way!."],
			["Death", ""],  // no response.
			["DetHostileAI", "Roger. Weapons Free, Capture as many as you can."]
		]
	]	
	
	
	
];

FuMS_THEMEDATA set [_this select 0, _themeData];
