// PlayerWatch.sqf
// Horbin
// 10/26/2015
FuMS_PlayerWatch_Enable = true; // set to 'false' to turn off PlayerWatch missions
FuMS_PlayerWatch_CheckTime = 1200;  // default 20 mins. time, in seconds, between checks
FuMS_PlayerWatch_CheckChance = 50; // chance of a player mission spawning
FuMS_PlayerWatch_DespawnRange = 1500; // distance, in meters,player must get away from his encounter before it despawns.
FuMS_PlayerWatch_NotifyPlayer = true; // provides a notification to the player that something else is about

  // This is distance from the spawn point. AI will continue to follow the player if they are able to detect him or other players!!!!!
  
FuMS_PlayerWatch_Configuration =
[	
		// When a player event occurs, it will step through the below options until a condition is met
		// in order to determine the type of mission to present to the player
		// The center of the mission will always be AT the player's location.
		// It is up to the mission designer to ensure proper placement of objects and AI!!!
		
		// The below criteria are checked in the order listed. When one is found to be true, one of the missions
		// in that criteria's is selected.
		
		// To ignore the criteria, place "NONE" as the mission to be run!
		// ANY FuMS mission can be placed into these lists. Just ensure a copy of that mission is placed into
		//   the PlayerWatch theme folder!
		//  ALSO Ensure the mission name is added to the list of missions in the PlayerWatch/ThemeData.sqf or the mission's data will not
		//  be pushed to the HC.
		
		// NOTE: For missions in which a player is in a vehicle, the player's direction and speed is taken into account.
		//  PlayerWatch will attempt to place the encounter in front of the player 300-500m's depending upon the speed of the
		//   player's vehicle.
		
		/*
			STOCK MISSIONS
			Neutrals - creates 3 armed civilians and 3 unarmed civilians, all friendly
			HeloDrop - spawns a helo that paradrops AI into the area, then flys away
			ChaseHelo - spawns an armed helo that will patrol the area
			ChaseCar - spawns an armed unmanned vehicle
			SmallBand - spawns a squad of 3 AI (with rocket launchers)
			AttackBoat - spawns an armed attack boat
			Divers - spawns a squad of 3 divers
			Zombies - spawns a troop of zombies (Commented out, but easy to add by removing // in front of the mission name
			Gunfight - spawns two squads of AI that are against each other (and the players!)
		*/
		
		
		// Player is in a Safe Zone
	[
		"NONE"
	],
		// Player in Own Territory (defined at max range)
	[
	     "neutrals"  // 50/50 chance of nothing or 'neutrals' mission
	],
		// Player in someone else's Territory (defined at max range)
	[
	     "helodrop","neutrals"
	],
		// Player in Air vehicle
	[
		"chaseHelo","smallband"
	],	
		// Player in Land vehicle
	[
		"chaseCar","smallband"//,"zombies"
	],
		// Player in Water vehicle
	[
		"attackBoat","chaseHelo"
	],
		// Player is in Water
	[
	    "divers","chaseHelo"
	],
		// Player is in spawn zone (hard coded to 325m from all exile defined spawning locations)
	[
		//"zombies"
	],
		// Player near a town (more than 7 buildings within 50m of the player)
	[
		"smallband","gunfight"//,"zombies"
	],
		// Player near roads (at least 1 road within 10m of the player)
	[
		"smallband"//,	"zombies",	
	],
		//Player doesn't meet any of the above requirements
	[
		"gunfight"//,"zombies"
	]
];

    
	
	
	

