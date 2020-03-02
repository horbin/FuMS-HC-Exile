// BaseServer.sqf
// Horbin
// Updated by TheOneWhoKnocks
// 4/20/19
// Added in Altis missions and dynamic missions
// Data specifc to your server's map.
// ALTIS
FuMS_ServerData =
[
    [ 								// Map Definition and FuMS configuration
        false, 						// Enable FuMS missions to run on the main server.
									// NOTE: setting to 'true' may drasticly impact server performance.
        "testpath",                 // MySQL support testing
		true,						//Enable AdminControls! See Docs\AdminControls.txt
        20   						//minimum Server FPS. Below this FPS FuMS will not load new missions. 
									// NOTE: This was lowered until I can fix the FPS monitor which currently reads too low.
    ],
    [  								// Exclusion Areas
									// See \FuMS\HC\Util\GetWorldInfo.sqf if you need to make changes
    ],
    [ 								// Default Areas
									// See \FuMS\HC\Util\GetWorldInfo.sqf if you need to make changes
    ],
    [	 
		["PlayerWatch",-1], 		// DO NOT REMOVE OR COMMENT OUT THIS THEME!
									// ActiveThemes
									// A folder matching the names below needs to exist in the ..\Themes folder.
									// use this block to easily turn off/on your various mission sets.
									// -1 = all HC's.  0= Server only,  1=1st HC to connect, 2=2nd, etc.
									//  Note: Server option not currenty operational.
		
		//["Admin",-1],				// Remove this theme if on a production server.
		//["Test",-1], 				// Remove this theme if on a production server.
		//["Zombies",-1], 			// NOT TESTED, NOT UPDATED Uncomment this if you have the Zombies add on installed  (NOT TESTED)
		["MissionFX",-1], 			// Random ALIAS anomoliesthat look like small camps      
		["HeloPatrols",-1], 		// 2 sets of 3 armed helo's patrol the skys!!!      
		["SEM",-1], 				// basic old school Arma2 Epoch encounters
		["Townraid",-1], 			// random town is raided and then attacked!
		["TownAttack",-1], 			// random town is raided , with mutiple responses, based on player coming close!
		["Small",-1],  				// 6 man groups invade a random village
		["Aquatic",-1], 			// 1 coastal areas w/ boats and ai   
		//["Convoy",-1]				// DO NOT USE FOR NOW - 2 random convoys of 3 vehicles move across the map.
		["StaticSpawns",-1], 		// creates 10 Dayz style Helo crashes at random locations.
		//["Jurassic",-1], 			// NOT TESTED, NOT UPDATED creates 3 encounters with wondering Raptors and some scattered loot. (NOT TESTED)
		["Captive", -1], 			// Mission in which 7 hostages must be rescued from the humans within 30minutes while fending off paradropped reinforcemnets.
		["VehicleHeists", -1],		// Missions that spawn vehicles with guards for any map
		["DynamicVehicles", -1],		// Missions that spawn vehicles with guards for any map
		["DynamicLootDrops", -1],	// Missions that spawn various loot drop missions with guards for any map
		["DynamicAISpawns", -1],	// Missions that spawn AI groups with guards for any map
		["Altis", -1], 				// Missions specific to Altis ported from Exile.Com
		["RoadBlock_Altis",1] 		// Roadblocks specific to Altis
		//["RoadBlock_Tanoa",1] 	// Roadblocks specific to Tanoa

		
		// NOTE: If you run the Roadblock_Pato mission with mutiple HC's, they will spawn on top of each other and kill each other.
		// Line 50 has been updated to run on the FIRST HC only, so plan accordingly. See line 27 to understand how to change this

    ],
    [  // Event and AI Radio messsage behavior
	   // system no longer supported. Will be removed in follow on versions.
        false, // EnableRadioChatterSystem: turns on the system, allowing below options to function
        false, // EnableRadioAudio: turns on 'audio' effects for radio chatter
        true, // RadioRequired: if false, messages are heard without a radio on the player's belt.
        true, // RadioFollowTheme: Conforms with Theme radio channel choices. False:any radio works for all channels.
        true, 500 // EnableAIChatter: enables random radio chatter between AI when players get within the specified range (meters) as default.
              // NOTE: Theme 'Radio Range' will override this setting.
    ],
	[ // Soldier Defaults

		6, // default number of rifle magazines for each AI
		4, // default number of pistol magazines
		false, // Turns ON VCOM_Driving V1.01 = Genesis92x for all land/boat vehicle drivers
		      //http://forums.bistudio.com/showthread.php?187450-VCOM-AI-Driving-Mod
          //NOTE::**UNDER EXILE this is generating alot of 'string' errors in the HC's .rpt. May drastically impact performance!
		  //Skill Override options:
		  // Values here will override values for individual units defined in SoldierData.
		  // values ranges 1.0 -0.0      0= uses GlobalSoldierData.sqf setting for each soldier.
		  // Currently set to use the GlobalSoliderData.sqf file
		  // if unique AI are desired, modify these numbers in GlobalSoldierData.sqf or SoldierData.sqf as applicable.
		  // values here OVERRIDE any value set in the other files! (value of zero = use other files values).
		[
		0, // aimingAccuracy : target lead, bullet drop, recoil
		0,	// aimingShake : how steady AI can hold a weapon
		0,	// aimingSpeed : how quick AI can rotate and stabilize its aim and shoot.
		0,	// spotDistance : affects ability to spot visually and audibly and the accuracy of the information
		0,	// spotTime : affects how quick AI reacts to death, damage or observing an enemy.
		0,	// courage : affects unit's subordinates morale
		0,	// reloadSpeed :affects delay between weapon switching and reloading
		0,	// commanding : how quickly recognized targets are shared with the AI's group.
		0	// general 		: Overall multiplier for all other settings
		],
        // soldier only equipment. Items in this list are only available to AI.
        //  when an AI dies, gear on this list is deleted from the AI's inventory.
        [
            [], //Uniforms
            [], // Vests
            [], // Backpacks.
            [], // Helmets
            ["launch_RPG32_F","launch_I_Titan_F"], // Weapons
            ["RPG32_HE_F","RPG32_F","Titan_AA"], // Magazines
            [] // Items
        ],
        // List of UAV and UGV's that FuMS will recognize and populate with proper AI logic when created in the vehicle section of missions.
        // vehicles created in the 'buildings' section will be inactive!
        [
            // side 'GUER' or Resistance (ie the bad guys)
            "I_UGV_01_rcws_F",
            "I_UAV_01_F",
            "I_UAV_02_F",
            "I_UAV_02_CAS_F",
            "I_UGV_01_F"     ,
            // side West
            "B_UGV_01_rcws_F",
            "B_UAV_01_F",
            "B_UAV_02_F",
            "B_UAV_02_CAS_F",
            "B_UGV_01_F",
            // side East
            "O_UGV_01_rcws_F",
            "O_UAV_01_F",
            "O_UAV_02_F",
            "O_UAV_02_CAS_F",
            "O_UGV_01_F"     
			
        ]
            
	],
	[ // Loot Defaults

		30, // number of minutes after mission completion before deleting a loot box.
		// NOTE: This is not based on when the box is spawned, but WHEN the mission completes!
		[  // SMOKE BOX Options
            true, 				// true= smoke created with box for ease of location.
            100,  				// proximity character has to get to box before smokes start. 0=unlimited
            ["Red","Blue"],  	//["Red","Blue","White"]// colors of smoke
            3     				// Duration, in minutes, smoke lasts once triggered.
        ],
		true,  					// vehicles occupied by players persist through server reset and are sellable!
		
		// List of box types used by "Random" in LootData and GlobalLootData files.
		["B_supplyCrate_F","O_supplyCrate_F","I_supplyCrate_F","CargoNet_01_box_F"],
		
		// List of vehicles prohibited to use by players. This list allows them to be on the map for AI use
		// but will prevent players from entering the vehicle.
		["I_UGV_01_rcws_F","B_G_Offroad_01_armed_F","O_LSV_02_unarmed_F"], //Remove that last one if you want the "vehicle reinforcments" vehicle be able to be stolen
		
        true  //VehicleAmmoFlag true= sets vehicle ammo to zero when an AI vehicle is 1st occupied by a player.         
	]

];




