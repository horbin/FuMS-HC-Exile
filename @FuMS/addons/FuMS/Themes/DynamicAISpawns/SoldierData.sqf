//SoldierData.sqf
// TheOneWhoKnocks
// 02/02/2020
// Inputs: Theme Index
// Default AI Skill Array
// [.05, .9, .1, .1, .5, .5, .1, .1]
// AimAccuracy= .05 : target lead, bullet drop, recoil, how certain ai must be before opening fire
// AimShake = .9 : how steady AI can hold a weapon.
// AimSpeed = .1 : how quick AI can rotate and stablize its aim.
// SpotDistance = .5 : affects ability to spot visually and audibly and the accuracy of the information.
// Spottime = .5 : affects how quick AI reacts to death, damage or observing an enemy.
// Courge = .1 : affects unit's subordinates' morale.
// ReloadSpeed = .1: affects delay between weapon switching and reloading
// Commanding = .5 : how quickly recognized targets are shared with the AI's group.

// NOTE: AI FLAGS
// FlagWater = true: spawning over water will default to a "Diver" configuration (Frog suit and Rebreather!)
// FlagAmmo = true: ai will never run out of ammo.

_soldierData = 
[
	[////////////////////////////////////////////////////////////////////////////
        "Bambi",
		[.02, .7, .1, .3, .5, .1, .05, .1, .5],
        [ImFX_Uniform_Bambi,1], // Uniform
        [CAMS_V_Bandolliers,0], // Vest.
        [CAMS_H_Civ,.8], // Helmet
        [CAMS_Packs_All,0], // Backpack and chance.
        [CAMS_SMG_E,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_E,0], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 1]
        ]		
	],
    [///////////////////////////////////////////////
        "Sniper",
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
            ["RESPECT", 200],
			["RESPECTGROUP",20]
        ]
    ],
	[//////////////////////////////////////////////////////////////////
        "Rifleman",
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
	[////////////////////////////////////////////////////////////////////////
        "BanditLeader",
        [.6, .7, .7, .7, .7, 1, .8, 1, .7],
        ["U_OrestesBody",1], // Uniform
        ["V_BandollierB_blk",.8], // Vest.
        ["H_StrawHat",1], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        ["arifle_Mk20_F",1], // PriWeapon and chance
        [ 1, 1 , 1], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["hgun_ACPC2_F",1], // Secondary Weapon and chance
        [ 1, 1, 1, 1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 1, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 200],
			["RESPECTGROUP",20]
        ]
    ],
	[///////////////////////////////////////////////////////////////
        "BanditGroup",
        [.4, .6, .6, .6, .6, 1, .8, 1, .7],
        ["U_C_WorkerCoveralls",1], // Uniform
        ["V_BandollierB_blk",.8], // Vest.
        ["H_Cap_blk",1], // Helmet
        [CAMS_Packs_All,.5], // Backpack and chance.
        ["arifle_Mk20_F",1], // PriWeapon and chance
        [ 1, 0 , 1], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["hgun_ACPC2_F",1], // Secondary Weapon and chance
        [ 1, 1, 0, 1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,.2], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.8],[1,1]]                ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 150],
			["RESPECTGROUP",15]
        ]
    ],
	[////////////////////////////////////////////////////////////////////////
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
    ],
	[/////////////////////////////////////////////////////////////////////////
        "Hunter",
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
            ["RESPECT", 150],
			["RESPECTGROUP",15]
        ]
    ],
	[////////////////////////////////////////////////////////////////////////////////////
        "Driver",
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
    [/////////////////////////////////////////////////////////////////////////////////////
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
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.3],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]
    ],	
    [/////////////////////////////////////////////////////////////////////////////////////
		"CivNonCombat",
		[.02, .7, .1, .5, .5, .08, .1, .5, .5],
        [CAMS_U_Civ,1], // Uniform
        [CAMS_V_Bandolliers,.5], // Vest.
        [CAMS_H_Civ,.8], // Helmet
        [CAMS_Packs_All,.1], // Backpack and chance.
        [CAMS_SMG_I,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [CAMS_Pistols_I,.5], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .1, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, true, [false,0.5], false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        [ [[CAMS_Smoke_Shell,.3],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", -50],
			["RESPECTGROUP",-5]
        ]
    ]
];
FuMS_SOLDIERDATA set [_this select 0, _soldierData];
//SOLDIERDATA set [_this select 0, _soldierData];
