// ThemeData.sqf
// Created by TheOneWhoKnocks
// 4/20/19
// This will spawn the missions specific to Altis and have been ported over from DMS add on missions 
//
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
// 
// Inputs: Theme index into which to store this data.
// Outputs: none
//  Options , Mission List, Points List
_themeData =
[
    [  											// *******Options*********
        "Bornholm", 								// Needs to match the folder name!
        4,  									//Mission Selection: 1=Random, 2=In order, 3=Random:once only until all missions run
												// 4=Static: All missions in 'Mission List' will be created at server start!
												// 5=Static: with no respawn. Use option 5 for 'create once' type missions.
												// Using option 4 will permit mission to run and re-spawn based upon the respawn delay below.
												//  option 5 will let the mission only spawn once per 6 hours (ie server reset)
        300, 									// Respawn delay in seconds
		false, 									// use Global Loot Data (GlobalLootData.sqf)
		true,  									// use Global Soldier Data file (GlobalSoldierData.sqf)
		true, 									// ThemeAutoStart: Setting this to 'false' will prevent normal start-up of the Theme! See \Docs\AdminControls.txt
        1,  									// Player minimum to launch missions from this theme.
        100   									// Player maximum above which missions will not launch
       
    ],
    [  											//***** Mission List *****
												// List of Missions. 
												// The below missions MUST be in the same folder as this file!            

		["Foothold", [7100.12,15745.2]]
    ],
    [   //***** Locations ***** !! 2D coords ONLY !!
		//Location format ["keyword"] or [[x,y],"optional name"] or [x,y]
		//  Where the 'optional name' is found, it will be used in place of the MissionName defined in the mission file.
		// Urban locations will always use their location instead of the mission name.
		// List of Encounter locations to be used if Global random locations are not desired
		// If keywords "Villages", "Cities", "Capitals" found as entries, the appropriate
		//  locations from the mission map will be added to the list.
		// Specific cities can also be included, if not all of a type are desired:
		// Ex: ["Charkia"], ["Neochori"]
		//["Marine"]
		//Encounter will only spawn in urban areas!
		//["Villages"],["Cities"],["Capitals"],[[10715,10175],"AREA51"],[10010,10010],["Charkia"]  
		//Encounter will spawn in all urban areas as well the other points provided.
		// Note these points are NOT offsets, but points specific to ALTIS !!
		// Note any locations here will OVERRIDE use of 'terrain type' checking provided by the "WATER" or "LAND" paramater in the Missions' area configuration section.
    ],
	[ 											//***** Radio Chatter *****
		[ 										// AI Radio Chatter configuration
            0, 									// radio channel used by AI - "ALL"= messages heard w/o radio (other options 0-9)
												//0=Quartz, 1=Garnet, 2=Citrine, 3=Amethyst, 4=Topaz, 5=Sapphire, 6=Onyx, 7=Emerald, 8=Ruby, 9=Jade
			false, 								// silent Check-in =true: AI squads will NOT check-in with BaseOps when they spawn.
			true, 								// AI death messages enabled.
			1500, 								// Radio Range (for AI. BaseOps's high power radio has unlimited range)
			"Bandit",    						// AI callsign, groups will be numbered..ie Bear01, Bear02
			"Snowman" 							// BaseOps call sign
		],
												//**Do not remove or change order of these items. 
												// The 'chat text' can be changed to meet your theme's needs.
												// For the 'chat text', < and > are reserved characters. DO NOT use them for anything but
												//  for identifying one of the keywords!
												// Keywords: <DIST>, <DIR>, <MSNNAME>, <POS>, <#ALIVE>, <#DEAD>, <STATUS>
		[  										// AI to Base Chatter 
			["CheckIn", "On station. <DIST> meters <DIR> of FOB <MSNNAME>."],
			["Position", "Currently at <POS>."],
			["Detected", "Clones detected within perimeter of <MSNNAME>."],
			["Less50", "We are taking heavy casualties! Request reinforcements!"],//<--this message initiates a call for reinforcements.
			["SitRep", "On station. <#ALIVE> souls, <#DEAD> dead. <STATUS>."],//<--this is the response to Base's '99' call.
			["Done", "Roger Out."],
			["Death", "We are taking casualties!"],
			["DetHostileAI", "Human Mercenaries have been spotted in the area of <MSNNAME>."]
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