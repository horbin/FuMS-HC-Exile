// GlobalSoldierData.sqf

// Horbin
// Updated by TheOneWhoKnocks
// 9/26/18
// Skill levels now reflect "moderate" AI skills from similiar mission systems
// Change these numbers to better reflect your play style and group of players
// Inputs: Theme Index
// Default AI Skill Array
// [.4, .6, .6, .6, .6, 1, .8, .8, .6]
// AimAccuracy= 	.4 : target lead, bullet drop, recoil, how certain ai must be before opening fire
// 			*** This was set low to let them shoot at you a lot, but be more fun than deadly.  Make sure they have unlimited ammo to compensate
// AimShake = 		0.6 : how steady AI can hold a weapon.
// AimSpeed = 		0.6 : how quick AI can rotate and stablize its aim.
// SpotDistance = 	0.6 : affects ability to spot visually and audibly and the accuracy of the information.
// Spottime = 		0.6 : affects how quick AI reacts to death, damage or observing an enemy.
// Courage = 		1 : affects unit's subordinates' morale. (100% baby! These guys dont run)
// ReloadSpeed = 	0.8: affects delay between weapon switching and reloading 
// Commanding = 	0.8 : how quickly recognized targets are shared with the AI's group. 
// General = 		0.6 : This is an overall modifier to all other settings.  Let's you scale the skills up and down without 
//			modifying all the other values.  

// NOTE: Civilian and Zombie skill levels were not modified except to add the "general" skill setting.
// Civilian roles have a general setting of "0.5" and Zombies have "1"
// NOTE: AI FLAGS
// FlagWater = true: spawning over water will default to a "Diver" configuration (Frog suit and Rebreather!)
// FlagAmmo = true: ai will never run out of ammo.

_soldierData = 
[
    [
        "Sniper_E",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6], // Soldier skill levels
        [CAMS_U_Ghillie_E,1], // Uniform
        [CAMS_V_Vests,.5], // Vest.
        [CAMS_H_MilitaryCaps,.5], // Helmet.
        [CAMS_Packs_All,1], // Backpack and chance to have it
        [CAMS_SniperRifles_E,1], // PriWeapon
        [ 1, .3 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.8], // Secondary Weapon.
        [ .8, .9, .5, .3, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, .5, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        //Anti-Tank options:
        // true = RPG launcher with ammo.
        // "AIR" = Titan_F launcher with ammo.
        // "LAND" = RPG launcher with ammo.
        // "RANDOM" = 50/50 chance of Air or Land launcher
        // false = no special anti-vehicle weapons.
        // NOTE: controlling the deletion of this equipment upon AI death is controlled via settings in BaseServer.sqf
        [ 
		  [[CAMS_E_Grenade,.25],[1,2]]                    
		], // Personal Gear [ "item", chance] [min, max]     
        // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],
	[
        "Rifleman_E",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_E,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_E,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],
	[
        "Paratrooper_E",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_E,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_E,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
        "Pistolman_E",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_I,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_I,0], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]		
    ],[
        "LMG_E",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_E,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet.
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_LMG_E,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]              ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
	    "SMG_E",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_E,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet.
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_SMG_E,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]              ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
	
        "Hunter_E",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Guerilla_E,1], // Uniform
        [CAMS_V_Bandolliers,.2], // Vest.
        [CAMS_H_Hunter,.8], // Helmet.
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_AssaultRifles_E,1], // PriWeapon and chance
        [ .4, 0 , .8], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.3], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]            ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
        "Diver_E",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Wetsuit_E,1], // Uniform
        [CAMS_V_Rebreather,1], // Vest.
        [CAMS_H_Bandannas,.2], // Helmet
        [CAMS_Packs_ALL,.2], // Backpack and chance.
        ["arifle_SDAR_F",1], // PriWeapon and chance
        [ .5, 0 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.2], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [["20Rnd_556x45_UW_mag",2],[2,3]]             ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
        "Driver_E",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_E,1], // Uniform
        [CAMS_V_Chestrig,.1], // Vest.
        [CAMS_H_Military,.8], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_E,.8], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,.9], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
        "Pilot_E",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Aviation_E,1], // Uniform
        [CAMS_V_Chestrig,.8], // Vest.
        [CAMS_H_Aviation,1], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_E,.5], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
	
	
	
	
	"Sniper_W",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6], // Soldier skill levels
        [CAMS_U_Ghillie_W,1], // Uniform
        [CAMS_V_Vests,.5], // Vest.
        [CAMS_H_MilitaryCaps,.5], // Helmet.
        [CAMS_Packs_All,1], // Backpack and chance to have it
        [CAMS_SniperRifles_W,1], // PriWeapon
        [ 1, .3 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.8], // Secondary Weapon.
        [ .8, .9, .5, .3, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, .5, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        //Anti-Tank options:
        // true = RPG launcher with ammo.
        // "AIR" = Titan_F launcher with ammo.
        // "LAND" = RPG launcher with ammo.
        // "RANDOM" = 50/50 chance of Air or Land launcher
        // false = no special anti-vehicle weapons.
        // NOTE: controlling the deletion of this equipment upon AI death is controlled via settings in BaseServer.sqf
        [ 
		  [[CAMS_E_Grenade,.25],[1,2]]                    
		], // Personal Gear [ "item", chance] [min, max]     
        // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
        "Rifleman_W",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_W,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_W,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
        "Paratrooper_W",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_W,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_W,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
        "Pistolman_W",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_W,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_W,0], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]		
    ],[
        "LMG_W",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_W,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet.
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_LMG_W,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]              ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
	    "SMG_W",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_W,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet.
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_SMG_W,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]              ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
	
        "Hunter_W",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Guerilla_W,1], // Uniform
        [CAMS_V_Bandolliers,.2], // Vest.
        [CAMS_H_Hunter,.8], // Helmet.
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_AssaultRifles_W,1], // PriWeapon and chance
        [ .4, 0 , .8], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.3], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]            ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
        "Diver_W",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Wetsuit_W,1], // Uniform
        [CAMS_V_Rebreather,1], // Vest.
        [CAMS_H_Bandannas,.2], // Helmet
        [CAMS_Packs_ALL,.2], // Backpack and chance.
        ["arifle_SDAR_F",1], // PriWeapon and chance
        [ .5, 0 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.2], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [["20Rnd_556x45_UW_mag",2],[2,3]]             ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
        "Driver_W",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_W,1], // Uniform
        [CAMS_V_Chestrig,.1], // Vest.
        [CAMS_H_Military,.8], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_W,.8], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,.9], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
        "Pilot_W",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Aviation_W,1], // Uniform
        [CAMS_V_Chestrig,.8], // Vest.
        [CAMS_H_Aviation,1], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_W,.5], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_W,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
	
	
	
	
	
	
	
	"Sniper_I",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6], // Soldier skill levels
        [CAMS_U_Ghillie_I,1], // Uniform
        [CAMS_V_Vests,.5], // Vest.
        [CAMS_H_MilitaryCaps,.5], // Helmet.
        [CAMS_Packs_All,1], // Backpack and chance to have it
        [CAMS_SniperRifles_I,1], // PriWeapon
        [ 1, .3 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.8], // Secondary Weapon.
        [ .8, .9, .5, .3, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, .5, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        //Anti-Tank options:
        // true = RPG launcher with ammo.
        // "AIR" = Titan_F launcher with ammo.
        // "LAND" = RPG launcher with ammo.
        // "RANDOM" = 50/50 chance of Air or Land launcher
        // false = no special anti-vehicle weapons.
        // NOTE: controlling the deletion of this equipment upon AI death is controlled via settings in BaseServer.sqf
        [ 
		  [[CAMS_E_Grenade,.25],[1,2]]                    
		], // Personal Gear [ "item", chance] [min, max]     
        // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],
	[
        "Rifleman_I",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_I,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_I,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],
	[
        "Paratrooper_I",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_I,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_I,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],[
        "Pistolman_I",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_I,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_AssaultRifles_I,0], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]		
    ],[
        "LMG_I",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_I,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet.
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_LMG_I,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]              ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],[
	    "SMG_I",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_I,1], // Uniform
        [CAMS_V_Harness,.5], // Vest.
        [CAMS_H_Military,.5], // Helmet.
        [CAMS_Packs_All,.5], // Backpack and chance.
        [CAMS_SMG_I,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.3], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]],[[CAMS_E_Grenade,.3],[1,1]]              ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],
	[
        "Hunter_I",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Guerilla_I,1], // Uniform
        [CAMS_V_Bandolliers,.2], // Vest.
        [CAMS_H_Hunter,.8], // Helmet.
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_AssaultRifles_I,1], // PriWeapon and chance
        [ .4, 0 , .8], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.3], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]            ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],
	[
        "Diver_I",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Wetsuit_I,1], // Uniform
        [CAMS_V_Rebreather,1], // Vest.
        [CAMS_H_Bandannas,.2], // Helmet
        [CAMS_Packs_ALL,.2], // Backpack and chance.
        ["arifle_SDAR_F",1], // PriWeapon and chance
        [ .5, 0 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.2], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [["20Rnd_556x45_UW_mag",2],[2,3]]             ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],
	[
        "Driver_I",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Soldier_I,1], // Uniform
        [CAMS_V_Chestrig,.1], // Vest.
        [CAMS_H_Military,.8], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_I,.8], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.9], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],
	[
        "Pilot_I",
		[.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [CAMS_U_Aviation_I,1], // Uniform
        [CAMS_V_Chestrig,.8], // Vest.
        [CAMS_H_Aviation,1], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_I,.5], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
	],
	[	
        "Survivor",
        [.4, .6, .6, .6, .6, 1, .8, 1, .6],
        [ImFX_Uniform_Survivor,1], // Uniform
        [ImFX_Vest_Survivor,.5], // Vest.
        [ImFX_Helmet_Survivor,.5], // Helmet
        [ImFX_Pack_Survivor,.5], // Backpack and chance.
        [ImFX_Rifle_Survivor,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [ImFX_Pistol_Survivor,.5], // Secondary Weapon and chance
        [ .8, .8, .5, .8, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, ["RANDOM",0.15], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,2]],[[CAMS_E_Grenade,.4],[1,2]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 100],
			["RESPECTGROUP",10]
        ]
    ],
    [
		"CivCombat",
		[.02, .7, .1, .5, .5, .08, .1, .5, .5],
        [CAMS_U_Civ,1], // Uniform
        [CAMS_V_Bandolliers,.5], // Vest.
        [CAMS_H_Civ,.8], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_I,.9], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.5], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .1, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.3],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]
    ],
	[
        "CivNonCombat",
		[.02, .7, .1, .3, .5, .08, .1, .1, .5],
        [CAMS_U_Civ,1], // Uniform
        [CAMS_V_Bandolliers,.1], // Vest.
        [CAMS_H_Civ,.8], // Helmet
        [CAMS_Packs_All,.05], // Backpack and chance.
        [CAMS_SMG_I,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,1], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]
    ],[
        "Bambi",
		[.02, .7, .1, .3, .5, .1, .05, .1, .5],
        ["C_Man_UtilityWorker_01_F",1], // Uniform
        [CAMS_V_Bandolliers,0], // Vest.
        [CAMS_H_Civ,.8], // Helmet
        [CAMS_Packs_All,0], // Backpack and chance.
        [CAMS_SMG_E,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,0], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 0]
        ]		
    ],[
        "Doctor",
        [.6, .7, .7, .7, .7, 1, .8, 1, .7],
        [ImFX_Uniform_Scientist,1], // Uniform
        ["V_BandollierB_blk",0], // Vest.
        ["H_Bandanna_camo",1], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        ["arifle_Mk20_F",0], // PriWeapon and chance
        [ 1, 1 , 1], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,1], // Secondary Weapon and chance
        [ 1, 1, 1, 1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 1, 0, .1 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]		
    ],[        
		"Captive",
		[.02, .7, .1, .3, .5, .1, .05, .1, .5],
        [CAMS_U_Civ,1], // Uniform
        [CAMS_V_Vests,0], // Vest.
        [CAMS_H_Civ,.8], // Helmet
        [CAMS_packs_All,0], // Backpack and chance.
        [CAMS_SMG_E,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,0], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, [false,0.5], true], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [            ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", -1000],
			["RESCUEGROUP", 500],
			["RESCUETABS", 250]
        ]
	]
];
FuMS_SOLDIERDATA set [_this select 0, _soldierData];
