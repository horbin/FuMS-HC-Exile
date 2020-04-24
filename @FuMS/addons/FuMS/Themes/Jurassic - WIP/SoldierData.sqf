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
    [
        // requires installation of 'Raptor' Addon
        // http://makearmanotwar.com/entry/ec2EDrOCkM#.VT0zFfnF9EK
        // does not need to be commented out, but ensure missions are not attempting to build this
        // unit type unless the Addon is enabled!
        //**********
        // **NOTE** Only Helmet, and General Inventory items are valid for Raptors.
        //**********
        "RaptorM",[1,1,1,1,1,1,1,1,1],
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
        "RaptorF",[1,1,1,1,1,1,1,1,1],
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
//SOLDIERDATA set [_this select 0, _soldierData];
