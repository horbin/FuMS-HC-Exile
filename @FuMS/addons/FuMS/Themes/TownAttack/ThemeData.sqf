// TownRaid.sqf
// TheOneWhoKnocks
// 7/20/19
// Inputs: Theme index into which to store this data.
// Outputs: none
//  Options , Mission List, Points List
_themeData =
[
    [  // *******Options*********
        "TownAttack", // Needs to match the folder name!
        1,  		// Mission Selection: 1=Random, 2=In order, 3=Random, once only until all missions run
        90, 		// Respawn delay in seconds
		false, 		// Global loot data
		true, 		// Global soldier data  
		true,		// ThemeAutoStart: Setting this to 'false' will prevent normal start-up of the Theme! See \Docs\AdminControls.txt
        1,  		// Player minimum to launch missions from this theme.
        100   		// Player maximum above which missions will not launch
    ],
    [  //***** Mission List *****
		["RaidTown-S-Seed_W","Villages"],  // spawn at the specific location. If '0' take from locations below!
		["RaidTown-S-Seed_W","Villages"],
		["RaidTown-S-Seed_E","Villages"],
		["RaidTown-S-Seed_E","Villages"],
		["RaidTown-S-Seed_I","Villages"]		

/*
		["RaidTown-M-Seed_W","Cities"],  // These have not been written yet, but this is the intent
		["RaidTown-M-Seed_W","Cities"],
		["RaidTown-M-Seed_E","Cities"],
		["RaidTown-M-Seed_E","Cities"],
		["RaidTown-M-Seed_I","Cities"]	

		["RaidTown-L-Seed_W","Capitals"],  // These have not been written yet, but this is the intent
		["RaidTown-L-Seed_W","Capitals"],
		["RaidTown-L-Seed_E","Capitals"],
		["RaidTown-L-Seed_E","Capitals"],
		["RaidTown-L-Seed_I","Capitals"]	

*/	
    ],
    [   //***** Locations *****
		//["Villages"],["Cities"],["Capitals"];  //Encounter will only spawn in urban areas!
		//["Cities"],["Capitals"] 
		//Encounter will spawn in all urban areas as well the other points provided.       
    ],
	[ //***** Radio Chatter *****
		[ // AI Radio Chatter configuration
			"ALL", // radio channel used by AI - "ALL"= messages heard w/o radio
			//0=Quartz, 1=Garnet, 2=Citrine, 3=Amethyst, 4=Topaz, 5=Sapphire, 6=Onyx, 7=Emerald, 8=Ruby, 9=Jade
			false, // silent Check-in =true: AI squads will NOT check-in with BaseOps when they spawn.
			true, // AI death messages enabled.
			1500, // Radio Range (for AI. BaseOps's high power radio has unlimited range)
			"Reaper",    // AI callsign, groups will be numbered..ie Bear01, Bear02
			"HomeOffice" // BaseOps call sign
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