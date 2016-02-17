//ThemeData.sqf
// Horbin
// 1/10/15
// Inputs: Theme index into which to store this data.
// Outputs: none
 //  Options , Mission List, Points List
_themeData =
[
    [  // *******Options*********
        "HeloPatrols", // Needs to match the folder name!
        5,  //Mission Selection: 1=Random, 2=In order, 3=Random:once only until all missions run
             // 4=Static: All missions in 'Mission List' will be created at server start!
        60, // Respawn delay in seconds
		true, // Use global loot data
		true, // Use global soldier data
		true, // Autostart
            0,  // Player minimum to launch missions from this theme.
        100   // Player maximum above which missions will not launch
    ],
    [  //***** Mission List *****
    // List of Missions. Value of '0' indicates random location ##NOT [0] ###, otherwise location indicated used for the encounter.
        // The below missions MUST be in the same folder as this file! 
       
		//["TestMission01",[10700,12200] ] // spawn at the specific location. If '0' take from locations below!
    //    ["BikeGang"],  // will spawn at any of the locations defined below!
	      //["TestMission01","Charkia"] // mission will only spawn in the town of Charkia
         // ["CloneArmy",[8440, 25120]]
	//	 ["HeloPatrolNorth",[02500,21000]], // patrol will spawn near Oreokastro before starting patrol.
		 ["HeloPatrolEast"] ,  // can change these city names to specific map locs or other city names
          ["HeloPatrolEast"]
	//	 ["HeloPatrolSouth",[21000,06000]],// if it is desired for helos to, say come from 1 specific location.
	//	 ["HeloPatrolWest",[04000,10000]]
		 
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
		
		//["Villages"],["Cities"],["Capitals"];  //Encounter will only spawn in urban areas!
	//	["Villages"],["Cities"],["Capitals"],[[10715,10175],"AREA51"],[10010,10010],["Charkia"]  
		//Encounter will spawn in all urban areas as well the other points provided.
         // Note these points are NOT offsets, but points specific to ALTIS !!
        
    ],
	[ //***** Radio Chatter *****
		[ // AI Radio Chatter configuration
             5, // radio channel used by AI - "ALL"= messages heard w/o radio (other options 0-9)
    //0=Quartz, 1=Garnet, 2=Citrine, 3=Amethyst, 4=Topaz, 5=Sapphire, 6=Onyx, 7=Emerald, 8=Ruby, 9=Jade
			false, // silent Check-in =true: AI squads will NOT check-in with BaseOps when they spawn.
			true, // AI death messages enabled.
			1500, // Radio Range for AI and Base Ops.
			"AVALANCHE",    // AI callsign, groups will be numbered..ie Bear01, Bear02
			"HUMMER" // BaseOps call sign
		],
		//**Do not remove or change order of these items. 
		// The 'chat text' can be changed to meet your theme's needs.
		// For the 'chat text', < and > are reserved characters. DO NOT use them for anything but
		//  for identifying one of the keywords!
		// Keywords: <DIST>, <DIR>, <MSNNAME>, <POS>, <#ALIVE>, <#DEAD>, <STATUS>
		[  // AI to Base Chatter 
			["CheckIn", "On station."],
			["Position", "Currently at <POS>."],
			["Detected", "Clones detected."],
			["Less50", ""],//<--this message initiates a call for reinforcements.
			["SitRep", "On station. <#ALIVE> souls, <#DEAD> dead. <STATUS>."],//<--this is the response to Base's '99' call.
			["Done", "Roger Out."],
			["Death", ""],
			["DetHostileAI", "Human Mercenaries have been spotted in the area."]
		],
		[   // Base to AI chatter
			["CheckIn", "Base copies all."],
			["Position", "Say your current position."],
			["Detected", "Roger. Weapons Free. All clones hostile."],
			["Less50", ""],
			["SitRep", "99 pass SITREP."], //<-- This is broadcast every 30 minutes.  All groups will respond.
			["HELP", "Support is on its way!"],
			["Death", ""], 
			["DetHostileAI", "Roger. Weapons Free, Capture as many as you can."]
		]
	]	
];
FuMS_THEMEDATA set [_this select 0, _themeData];