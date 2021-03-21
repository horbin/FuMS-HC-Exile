//ThemeData.sqf
// Horbin
// 10/26/15					
// Inputs: Theme index into which to store this data.
// Outputs: none
 //  Options , Mission List, Points List
_themeData =
[
    [
        "Roadblock_ChernoRedux",   	// Needs to match the folder name!
        2,  					//Mission Selection: 1=Random, 2=In order, 3=Random, once only until all missions run
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
		["SmallRoadblock"],	//Roadblock coming into map in lower left corner
		["SmallRoadblock"],	//Roadblock coming into map in lower left corner
		["SmallRoadblock"]	//Roadblock coming into map in lower left corner

		// Make sure no comma at end of last mission
		
    ],
    [   
        // List of Encounter locations to be used if Global random locations are not desired
		[13040.9,8114.69],
		[580.978,1773.2],
		[8460.64,2914.48],
		[2046.15,3163.31],	
		[4720.79,6803.46],
		[10240.3,3173.3],
		[7155.22,4552.62],
		[4470.3,8831.64],
		[10884.3,9972.27],
		[11914.4,6433.5],
		[5842.58,10099],
		[11114.7,9319.84]
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
