//SoldierData.sqf
// Horbin
// 1/10/15
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
    [
        "Sniper",
		[.08, .9, .1, .5, .5, .1, .1, .5], // Soldier skill levels
        [FuMS_U_Ghillie,1], // Uniform
        [FuMS_V_Vests,.5], // Vest.
        [FuMS_H_MilitaryCaps,.5], // Helmet.
        [FuMS_Packs_All,1], // Backpack and chance to have it
        [FuMS_SniperRifles,1], // PriWeapon
        [ 1, .3 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,.8], // Secondary Weapon.
        [ .8, .9, .5, .3, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, .5, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo, anti-tank!, ISCAPTURED
        //Anti-Tank options:
        // true = RPG launcher with ammo.
        // "AIR" = Titan_F launcher with ammo.
        // "LAND" = RPG launcher with ammo.
        // "RANDOM" = 50/50 chance of Air or Land launcher
        // false = no special anti-vehicle weapons.
        // NOTE: controlling the deletion of this equipment upon AI death is controlled via settings in BaseServer.sqf
        [ [[FuMS_Food_Raw,.5],[1,1]], 
		  [[FuMS_Drink,.5],[1,2]],
		  [["Exile_Item_InstaDoc",.5],[1,1]],
		  [[FuMS_E_Grenade,.05],[1,1]]                    ], // Personal Gear [ "item", chance] [min, max]     
        // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]
    ],[
        "Rifleman",
        [.05, .9, .1, .5, .5, .1, .1, .5],
        [FuMS_U_Soldier,1], // Uniform
        [FuMS_V_Harness,.5], // Vest.
        [FuMS_H_Military,.5], // Helmet
        [FuMS_Packs_All,.5], // Backpack and chance.
        [FuMS_AssaultRifles,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, "RANDOM", false], // DiverOverWater, UnlimitedAmmo, anti-tank
        [ [[FuMS_Food_Raw,.1],[1,1]],[[FuMS_Drink,.1],[1,1]],[["Exile_Item_InstaDoc",.1],[1,1]],[[FuMS_Smoke_Shell,.8],[1,1]],[[FuMS_E_Grenade,.3],[1,1]]    ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]
    ],[
        "LMG",
        [.05, .9, .1, .5, .5, .1, .1, .5],
        [FuMS_U_Soldier,1], // Uniform
        [FuMS_V_Harness,.5], // Vest.
        [FuMS_H_Military,.5], // Helmet.
        [FuMS_Packs_All,.5], // Backpack and chance.
        [FuMS_LightMgs,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, true, false], // DiverOverWater, UnlimitedAmmo, anti-tank
        [ [[FuMS_Food_Raw,.1],[1,1]],[[FuMS_Drink,.1],[1,1]],[["Exile_Item_InstaDoc",.1],[1,1]],[[FuMS_Smoke_Shell,.8],[1,1]],[[FuMS_E_Grenade,.3],[1,1]]              ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]
    ],[
        "Hunter",
        [.03, .9, .1, .5, .5, .1, .1, .5],
        [FuMS_U_Guerilla,1], // Uniform
        [FuMS_V_Bandolliers,.2], // Vest.
        [FuMS_H_Hunter,.8], // Helmet.
        [FuMS_Packs_All,.1], // Backpack and chance.
        [FuMS_AssaultRifles,1], // PriWeapon and chance
        [ .4, 0 , .8], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,.3], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.1],[1,1]], [[FuMS_Drink,.1],[1,1]],[["Exile_Item_InstaDoc",.1],[1,1]],[[FuMS_Smoke_Shell,.8],[1,1]]            ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10],
			["RESPECTGROUP",1]
        ]
    ],[
        "Diver",
        [.05, .9, .1, .5, .5, .1, .1, .5],
        [FuMS_U_Wetsuit,1], // Uniform
        [FuMS_V_Rebreather,1], // Vest.
        [FuMS_H_Bandannas,.2], // Helmet
        [FuMS_Packs_ALL,.2], // Backpack and chance.
        ["arifle_SDAR_F",1], // PriWeapon and chance
        [ .5, 0 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,.2], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.1],[1,1]], [[FuMS_Drink,.1],[1,1]],[["20Rnd_556x45_UW_mag",2],[2,3]]             ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10]
        ]
    ],[
        "Driver",[.05, .9, .1, .5, .5, .1, .1, .5],
        [FuMS_U_Soldier,1], // Uniform
        [FuMS_V_Chestrig,.1], // Vest.
        [FuMS_H_Military,.8], // Helmet
        [FuMS_Packs_All,.1], // Backpack and chance.
        [FuMS_SubMGs,.8], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,.9], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.1],[1,1]], [[FuMS_Drink,.1],[1,1]],[["Exile_Item_InstaDoc",.1],[1,1]],[[FuMS_Smoke_Shell,.8],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10]
        ]
    ],[
        "Pilot",[.05, .9, .1, .5, .5, .1, .1, .5],
        [FuMS_U_Aviation,1], // Uniform
        [FuMS_V_Chestrig,.8], // Vest.
        [FuMS_H_Aviation,1], // Helmet
        [FuMS_Packs_All,.1], // Backpack and chance.
        [FuMS_SubMGs,.5], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.1],[1,1]], [[FuMS_Drink,.1],[1,1]],[["Exile_Item_InstaDoc",.1],[1,1]],[[FuMS_Smoke_Shell,.8],[1,1]]                ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 10]
        ]
    ],[
        "CivCombat",[.02, .7, .1, .5, .5, .08, .1, .5],
        [FuMS_U_Civ,1], // Uniform
        [FuMS_V_Bandolliers,.5], // Vest.
        [FuMS_H_Civ,.8], // Helmet
        [FuMS_Packs_All,.1], // Backpack and chance.
        [FuMS_SubMGs,.9], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,.5], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .1, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.8],[1,1]], [[FuMS_Drink,.8],[1,1]],[["Exile_Item_InstaDoc",.05],[1,1]],[[FuMS_Smoke_Shell,.3],[1,1]]                ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 5]
        ]
    ],[
        "CivNonCombat",[.02, .7, .1, .3, .5, .08, .1, .1],
        [FuMS_U_Civ,1], // Uniform
        [FuMS_V_Bandolliers,.1], // Vest.
        [FuMS_H_Civ,.8], // Helmet
        [FuMS_Packs_All,.05], // Backpack and chance.
        [FuMS_SubMGs,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,1], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]], [[FuMS_Drink,05],[1,1]]             ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 5]
        ]
    ],[
        "CivNoGun",[.02, .7, .1, .3, .5, .1, .05, .1],
        [FuMS_U_Civ,1], // Uniform
        [FuMS_V_Bandolliers,0], // Vest.
        [FuMS_H_Civ,.8], // Helmet
        [FuMS_Packs_All,0], // Backpack and chance.
        [FuMS_SubMGs,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,0], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]],[[FuMS_Drink,.05],[1,1]]             ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 0]
        ]
        
    ],[        
		"Civ01",[.02, .7, .1, .3, .5, .1, .05, .1],
        [FuMS_U_Civ,1], // Uniform
        [FuMS_V_Vests,0], // Vest.
        [FuMS_H_Civ,.8], // Helmet
        [FuMS_packs_All,0], // Backpack and chance.
        [FuMS_SubMGs,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [FuMS_Pistols,0], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, false, true], // DiverOverWater, UnlimitedAmmo, RPG_FLAG, ISCAPTURED
        [            ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", -1000],
			["RESCUEGROUP", 500],
			["RESCUETABS", 250]
        ]
	],
    [
        "Zombie",[1,1,1,.5,.5,1,1,.6],
        ["",0], // Uniform
        ["",0], // Vest.
        ["",0], // Helmet
        ["",0], // Backpack and chance.
        ["",0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["",0], // Secondary Weapon and chance
        [ 0, 0, 0, 0, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]],[[FuMS_Drink,.05],[1,1]]             ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 2]
        ]
    ],
     [
        "ZombieSoldier",[1,1,1,1,1,1,1,1],
        ["",0], // Uniform
        ["",0], // Vest.
        ["",0], // Helmet
        ["",0], // Backpack and chance.
        ["",0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["",0], // Secondary Weapon and chance
        [ 0, 0, 0, 0, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]],[[FuMS_Drink,.05],[1,1]]             ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 2]
        ]
    ],
     [
        "ZombieSpider",[1,1,1,1,1,1,1,1],
        ["",0], // Uniform
        ["",0], // Vest.
        ["",0], // Helmet
        ["",0], // Backpack and chance.
        ["",0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["",0], // Secondary Weapon and chance
        [ 0, 0, 0, 0, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]],[[FuMS_Drink,.05],[1,1]]             ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 2]
        ]
    ],
     [
        "ZombieBoss",[1,1,1,1,1,1,1,1],
        ["",0], // Uniform
        ["",0], // Vest.
        ["",0], // Helmet
        ["",0], // Backpack and chance.
        ["",0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["",0], // Secondary Weapon and chance
        [ 0, 0, 0, 0, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]],[[FuMS_Drink,.05],[1,1]]             ],
          // Crypto and Faction Rewards
        [
            ["RESPECT", 50]
        ]
    ],
    [
        // requires installation of 'Raptor' Addon
        // http://makearmanotwar.com/entry/ec2EDrOCkM#.VT0zFfnF9EK
        // does not need to be commented out, but ensure missions are not attempting to build this
        // unit type unless the Addon is enabled!
        //**********
        // **NOTE** Only Helmet, and General Inventory items are valid for Raptors.
        //**********
        "RaptorM",[1,1,1,1,1,1,1,1],
		// Raptor_Uniform_Base  RaptorM_Uniform_Base
        ["",0], // Uniform<<-- place holder, does nothing, skins randomized.
        ["",0], // Vest.
        ["Rup_ChristmasHata",0], // Helmet <<-- set this to 1 on the holidays ;)
        ["",0], // Backpack and chance.
        ["",0], // PriWeapon and chance <<-- place holder, does nothing.
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["",0], // Secondary Weapon and chance
        [ 0, 0, 0, 0, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]],[[FuMS_Drink,.05],[1,1]] ] ,
          // Crypto and Faction Rewards
        [
            ["RESPECT", 0],
			["RESPECTGROUP",0]
        ]
    ],
	 [
         // requires installation of 'Raptor' Addon
        // http://makearmanotwar.com/entry/ec2EDrOCkM#.VT0zFfnF9EK
        "RaptorF",[1,1,1,1,1,1,1,1],
		// Raptor_Uniform_Base  RaptorM_Uniform_Base
        ["",0], // Uniform
        ["",0], // Vest.
        ["Rup_ChristmasHat",0], // Helmet
        ["",0], // Backpack and chance.
        ["",0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        ["",0], // Secondary Weapon and chance
        [ 0, 0, 0, 0, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ false, false, false], // DiverOverWater, UnlimitedAmmo
        [ [[FuMS_Food_Raw,.05],[1,1]],[[FuMS_Drink,.05],[1,1]] ] ,
           // Crypto and Faction Rewards
        [
            ["RESPECT", 0],
			["RESPECTGROUP",0]
        ]
    ]
    
];
FuMS_SOLDIERDATA set [_this select 0, _soldierData];
