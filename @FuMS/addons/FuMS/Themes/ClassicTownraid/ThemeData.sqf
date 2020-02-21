//ThemeData.sqf
// TheOneWhoKnocks
// 12/28/19
// Inputs: Theme index into which to store this data.
// Outputs: none
 //  Options , Mission List, Points List
_themeData =
[
    [  // *******Options*********
        "ClassicTownRaid", // Needs to match the folder name!
        3,  //Mission Selection: 1=Random, 2=In order, 3=Random, once only until all missions run
        500, // Respawn delay in seconds
		true, // Global loot data
		true, // Global soldier data  
		true,
        1,  // Player minimum to launch missions from this theme.
        100   // Player maximum above which missions will not launch
    ],
    [  //***** Mission List *****
    //see Test Theme ThemeData.sqf for other options
        // The below missions MUST be in the same folder as this file! 
		["RaidTown-S"],  	// spawn at the specific location. If '0' take from locations below!
		["RaidTown-S"],  	// spawn at the specific location. If '0' take from locations below!
		["RaidTown-M"],  	// spawn at the specific location. If '0' take from locations below!
		["RaidTown-M"],  	// spawn at the specific location. If '0' take from locations below!
		["RaidTown-M"],  	// spawn at the specific location. If '0' take from locations below!
		["RaidTown-M"],  	// spawn at the specific location. If '0' take from locations below!
		["RaidTown-L"],  	// spawn at the specific location. If '0' take from locations below!
		["RaidTown-L"]  	// spawn at the specific location. If '0' take from locations below!
    ],
    [   //***** Locations *****
	    //Location format ["keyword"] or [x,y,"optional name"]
		//  Where the 'optional name' is found, it will be used in place of the MissionName defined in the mission file.
		// Urban locations will always use their location instead of the mission name.
        // List of Encounter locations to be used if Global random locations are not desired
		// If keywords "Villages", "Cities", "Capitals" found as entries, the appropriate
		//  locations from the mission map will be added to the list.
		// Specific cities can also be included, if not all of a type are desired:
		// Ex: ["Charkia"], ["Neochori"]
		["Villages"],["Cities"],["Capitals"] //Encounter will only spawn in urban areas!
    ],
	[ //***** Radio Chatter *****
		[ // AI Radio Chatter configuration
			"ALL", 			// radio channel used by AI - "ALL"= messages heard w/o radio
							//0=Quartz, 1=Garnet, 2=Citrine, 3=Amethyst, 4=Topaz, 5=Sapphire, 6=Onyx, 7=Emerald, 8=Ruby, 9=Jade
			false, 			// silent Check-in =true: AI squads will NOT check-in with BaseOps when they spawn.
			true, 			// AI death messages enabled.
			1500, 			// Radio Range (for AI. BaseOps's high power radio has unlimited range)
			"Reaper",    	// AI callsign, groups will be numbered..ie Bear01, Bear02
			"HomeOffice"	// BaseOps call sign
		],
		//**Do not remove or change order of these items. 
		// The 'chat text' can be changed to meet your theme's needs.
		// For the 'chat text', < and > are reserved characters. DO NOT use them for anything but
		//  for identifying one of the keywords!
		// Keywords: <DIST>, <DIR>, <MSNNAME>, <POS>, <#ALIVE>, <#DEAD>, <STATUS>
		[  // AI to Base Chatter 
			["CheckIn", "On station. Inbound to <MSNNAME>."],
			["Position", "Currently at <POS>."],
			["Detected", "Clones detected within <MSNNAME>."],
			["Less50", "We are taking heavy casualties! Request evac!"],
			["SitRep", "On station. <#ALIVE> souls, <#DEAD> dead. <STATUS>."],//<--this is the response to Base's '99' call.
			["Done", "Roger Out."],
			["Death", "We are taking casualties!"],
			["DetHostileAI", "Human Mercenaries have been spotted in the area."]
		],
		[   // Base to AI chatter
			["CheckIn", "Base copies all."],
			["Position", "Say your current position."],
			["Detected", "Roger. Weapons Free. All clones hostile."],
			["Less50", "We have you Lima Charlie. Stand bye!"],
			["SitRep", "99 pass SITREP."], //<-- This is broadcast every 30 minutes.  All groups will respond.
			["HELP", "Support is on its way!"],
			["Death", "Copy all. Keep us advised of your status."],
			["DetHostileAI", "Roger. Weapons Free, Capture as many as you can."]			
		]
	]	
];

FuMS_THEMEDATA set [_this select 0, _themeData];