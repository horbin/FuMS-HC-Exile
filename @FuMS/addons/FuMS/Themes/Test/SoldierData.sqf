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
        "Sniper",[.08, .9, .1, .5, .5, .1, .1, .5],
        ["U_O_GhillieSuit",1], // Uniform
        [Vest_Tactical,1], // Vest.
        [Helmet_SF,.7], // Helmet.
        [Backpacks_All,1], // Backpack and chance to have it
        [RifleSniperPairs,1], // PriWeapon
        [ 1, .3 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,.8], // Secondary Weapon.
        [ .8, .9, .5, .3, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, .5, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.5],[1,1]], 
		  [[Drink,.5],[1,2]],
		  [["FAK",.5],[1,1]],
		  [[Explosives,.05],[1,1]]                    ] // Personal Gear [ "item", chance] [min, max]       
    ],[
        "Rifleman",[.05, .9, .1, .5, .5, .1, .1, .5],
        [Outfit_AnyMilitary,1], // Uniform
        [Vest_Carrier,1], // Vest.
        [Helmet_ECH,.8], // Helmet
        [Backpacks_All,.5], // Backpack and chance.
        [RifleAssaultPairs,1], // PriWeapon and chance
        [ .5, .3 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.1],[1,1]],[[Drink,.1],[1,1]],[["FAK",.1],[1,1]],[[Grenades_Smoke,.8],[1,1]],[[Grenades_Hand,.3],[1,1]]    ] 
    ],[
        "LMG",[.05, .9, .1, .5, .5, .1, .1, .5],
        [Outfit_AnyMilitary,1], // Uniform
        [Vest_Carrier,1], // Vest.
        [Helmet_Mich,.8], // Helmet.
        [Backpacks_All,.5], // Backpack and chance.
        [RifleLMGPairs,1], // PriWeapon and chance
        [ .2, .1 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,.5], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.1],[1,1]],[[Drink,.1],[1,1]],[["FAK",.1],[1,1]],[[Grenades_Smoke,.8],[1,1]],[[Grenades_Hand,.3],[1,1]]              ] 
    ],[
        "Hunter",[.03, .9, .1, .5, .5, .1, .1, .5],
        ["U_O_CombatUniform_ocamo",1], // Uniform
        [Vest_Bandolier,1], // Vest.
        [Hat_Boonie,.8], // Helmet.
        [Backpacks_All,.1], // Backpack and chance.
        [RifleAssaultPairs,1], // PriWeapon and chance
        [ .4, 0 , .8], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,.3], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.1],[1,1]], [[Drink,.1],[1,1]],[["FAK",.1],[1,1]],[[Grenades_Smoke,.8],[1,1]]            ] 
    ],[
        "Diver",[.05, .9, .1, .5, .5, .1, .1, .5],
        [Outfit_WetSuit,1], // Uniform
        [Vest_Rebreather,1], // Vest.
        [Hat_Military,.2], // Helmet
        [Backpacks_Kit,.2], // Backpack and chance.
        ["arifle_SDAR_F",1], // PriWeapon and chance
        [ .5, 0 , .5], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,.2], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.1],[1,1]], [[Drink,.1],[1,1]],[["20Rnd_556x45_UW_mag",1],[2,3]]             ] 
    ],[
        "Driver",[.05, .9, .1, .5, .5, .1, .1, .5],
        [Outfit_AnyMilitary,1], // Uniform
        [Vest_ChestRig,1], // Vest.
        [Hat_Military,.8], // Helmet
        [Backpacks_All,.1], // Backpack and chance.
        [RifleOtherPairs,.8], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,.9], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.1],[1,1]], [[Drink,.1],[1,1]],[["FAK",.1],[1,1]],[[Grenades_Smoke,.8],[1,1]]                ] 
    ],[
        "Pilot",[.05, .9, .1, .5, .5, .1, .1, .5],
        ["U_O_PilotCoveralls",1], // Uniform
        [Vest_ChestRig,1], // Vest.
        [Helmet_Pilot,1], // Helmet
        [Backpacks_All,.1], // Backpack and chance.
        [RifleOtherPairs,.5], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,1], // Secondary Weapon and chance
        [ .3, .3, 0, .1, 9],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .5, 0, .3 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.1],[1,1]], [[Drink,.1],[1,1]],[["FAK",.1],[1,1]],[[Grenades_Smoke,.8],[1,1]]                ]
    ],[
        "CivCombat",[.02, .7, .1, .5, .5, .08, .1, .5],
        [Outfit_Civilian,1], // Uniform
        [Vest_Bandolier,.3], // Vest.
        [Hat_Civilian,.8], // Helmet
        [Backpacks_All,.1], // Backpack and chance.
        [RifleOtherPairs,.9], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,.5], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ .1, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.8],[1,1]], [[Drink,.8],[1,1]],[["FAK",.05],[1,1]],[[Grenades_Smoke,.3],[1,1]]                ] 
    ],[
        "CivNonCombat",[.02, .7, .1, .3, .5, .08, .1, .1],
        [Outfit_Civilian,1], // Uniform
        [Vest_Bandolier,.1], // Vest.
        [Hat_Civilian,.8], // Helmet
        [Backpacks_All,.05], // Backpack and chance.
        [RifleOtherPairs,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,1], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.05],[1,1]], [[Drink,05],[1,1]]             ] 
    ],[
        "CivNoGun",[.02, .7, .1, .3, .5, .1, .05, .1],
        [Outfit_Civilian,1], // Uniform
        [Vest_Bandolier,0], // Vest.
        [Hat_Civilian,.8], // Helmet
        [Backpacks_All,0], // Backpack and chance.
        [RifleOtherPairs,0], // PriWeapon and chance
        [ 0, 0 , 0], // scope, muzzle, flashlight:  percent chance of having one appropriate to the rifle.
        [PistolPairs,0], // Secondary Weapon and chance
        [ .1, 0, 0, .1, 0],  // Map, Compass, GPS, Watch, Radio(1-9)
        [ 0, 0, 0 ], // Binoculars, RangeFinders, NVG's
        [ true, true], // DiverOverWater, UnlimitedAmmo
        [ [[Food_Canned,.05],[1,1]],[[Drink,.05],[1,1]]             ]
        
    ]
    
    
];
SOLDIERDATA set [_this select 0, _soldierData];
