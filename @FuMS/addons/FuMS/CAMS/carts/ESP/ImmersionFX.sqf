// ImmersionFX.sqf
// Extended Survival Pack
// TheOneWhoKnocks
// Overwrites the global variables used by DEMS to integrate custom content into system

// Global variables in this file are available to the AI creation and Loot creation portions of DEMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When DEMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_immersionData","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "ESP"; 	// Change this to match the directory name of the content you are adding
_debugCart = false;		// Setting this to true adds additional info to log for troubleshooting purposes



_immersionData = 
[

	/////////////////////////////////////// AI Models 
	[
		"ImFX_AiModel_E",1,false,
		[
			// This will be the default enemy soldier (EAST)			
		]
	],
// Crafting Loot
	[
		"ImFX_Crafting_Wood",1,false,
		[
		]
	],
	[
		"ImFX_Crafting_Metal",1,false,
		[
		]
	],
	
	[
		"ImFX_Crafting_Raw",1,false,
		[
			"DDR_Item_Wood_Sticks","DDR_Item_Tailrotor","DDR_Item_Glass","DDR_Item_Fiberglass","DDR_Item_Engine",
			"DDR_Item_Electrical_Component","DDR_Item_Main_Rotor","DDR_Item_Battery","DDR_Item_Cinder_Block",
			"DDR_Item_Fuel_Tank"
		]
	],

	[
		"ImFX_Crafting_Kits",1,false,
		[
			"DDR_Item_Craft_Box"
		]
	],
	[
		"ImFX_Crafting_ALL",0,true,
		[
			"ImFX_Crafting_Wood","ImFX_Crafting_Metal","ImFX_Crafting_Raw","ImFX_Crafting_Kits"
		]
	],
	
	[
		"ImFX_Crafting_Tools",1,false,
		[
			"DDR_Item_Measuring_Tape","DDR_Item_Pan","DDR_Item_Crowbar","DDR_Item_Bucket","DDR_Item_Old_Pot",
			"DDR_Item_Pickaxe"
		]
	],
	[
		"ImFX_Food_Drink",1,false,
		[
			"DDR_Item_Canteen_Coffee","DDR_Item_Canteen_Fresh","DDR_Item_Canteen_Dirty","DDR_Item_Canteen_Salt",
			"DDR_Item_Canteen","DDR_Item_Franta","DDR_Item_Redgull","DDR_Item_Coke","DDR_Item_Jackoff",
			"DDR_Item_Spirit","DDR_Item_Yummy_Juice"
		]
	],
	[
		"ImFX_Food_Raw",1,false,
		[
			"DDR_Item_Blueberry","DDR_Item_Redberry","DDR_Item_Pumpkin","DDR_Item_Apple_Red","DDR_Item_Apple",
			"DDR_Item_Apple_Green","DDR_Item_Banana","DDR_Item_Pear","DDR_Item_Tomato","DDR_Item_Strawberry",
			"DDR_Item_Rice","DDR_Item_Mushrooms","DDR_Item_Potato","DDR_Item_Melon","DDR_Item_Beet",
			"DDR_Item_Passion_Fruit","DDR_Item_Pomegranate","DDR_Item_Cucumber","DDR_Item_Pineapple",
			"DDR_Item_Carrot","DDR_Item_Orange",
			
			"DDR_Item_Salema","DDR_Item_Mackerel","DDR_Item_Tunaa","DDR_Item_Mullet","DDR_Item_CatShark",
			"DDR_Item_Ornate","DDR_Item_Turtle",

			"DDR_Item_Container","DDR_Item_Salt_Shaker","DDR_Item_Pepper_Shaker","DDR_Item_Milkpowder","DDR_Item_Purificationtablets",

			"DDR_Item_Bakedbeans","DDR_Item_Tacticalbacon"			
		]
	],
	[
		"ImFX_Food_Cooked",1,false,
		[
			"DDR_Item_Bakedbeans_Cooked","DDR_Item_Rice_Cooked","DDR_Item_Tacticalbacon_Cooked"
		]
	],
	[
		"ImFX_Food_MRE",1,false,
		[
			"DDR_Item_Hamburger","DDR_Item_Bread","DDR_Item_Bread_Roll",
			
			"DDR_Item_Container_Soup","DDR_Item_Container_Chicken_Rice","DDR_Item_Container_Alsatian_Rice",
			"DDR_Item_Container_CatShark_Rice","DDR_Item_Container_Fin_Rice","DDR_Item_Container_Goat_Rice",
			"DDR_Item_Container_Mackerel_Rice","DDR_Item_Container_Mullet_Rice","DDR_Item_Container_Ornate_Rice",
			"DDR_Item_Container_Rabbit_Rice","DDR_Item_Container_Rooster_Rice","DDR_Item_Container_Salema_Rice",
			"DDR_Item_Container_Sheep_Rice","DDR_Item_Container_Snake_Rice","DDR_Item_Container_Tuna_Rice",
			"DDR_Item_Container_Turtle_Rice","DDR_Item_Container_Salemaa_Rice","DDR_Item_Container_Mackerell_Rice",
			"DDR_Item_Container_Tunaa_Rice","DDR_Item_Container_Mullett_Rice","DDR_Item_Container_CatSharkk_Rice",
			"DDR_Item_Container_Ornatee_Rice","DDR_Item_Container_Turtlee_Rice",
			
			"DDR_Item_Container_Chicken_Potato","DDR_Item_Container_Alsatian_Potato","DDR_Item_Container_CatShark_Potato",
			"DDR_Item_Container_Fin_Potato","DDR_Item_Container_Goat_Potato","DDR_Item_Container_Mackerel_Potato",
			"DDR_Item_Container_Mullet_Potato","DDR_Item_Container_Ornate_Potato","DDR_Item_Container_Rabbit_Potato",
			"DDR_Item_Container_Rooster_Potato","DDR_Item_Container_Salema_Potato","DDR_Item_Container_Sheep_Potato",
			"DDR_Item_Container_Snake_Potato","DDR_Item_Container_Tuna_Potato","DDR_Item_Container_Turtle_Potato",
			"DDR_Item_Container_Salemaa_Potato","DDR_Item_Container_Mackerell_Potato","DDR_Item_Container_Tunaa_Potato",
			"DDR_Item_Container_Mullett_Potato","DDR_Item_Container_CatSharkk_Potato","DDR_Item_Container_Ornatee_Potato",
			"DDR_Item_Container_Turtlee_Potato"
		]
	],
	[
		"ImFX_Cosmetic",1,false,
		[
		]
	],

	[
		"ImFX_Loot",1,false,
		[
			"DDR_Item_Silver_Bar","DDR_Item_Gold_Bar","DDR_Item_Silver_Ore","DDR_Item_Gold_Ore","DDR_Item_Iron_Ore",
			"DDR_Item_Money",
			
			"DDR_Item_Crystal_Purple","DDR_Item_Crystal_Green","DDR_Item_Gemstone_Blue","DDR_Item_Gemstone_Red",
			"DDR_Item_Diamond_Purple","DDR_Item_Diamond_Green","DDR_Item_Diamond_Yellow","DDR_Item_Diamond_Sky_Blue",
			"DDR_Item_Diamond_Red","DDR_Item_Diamond_Blue",
			
			"DDR_Item_Skull",
			"DDR_Crystal_Rock",
			"DDR_Mushrooms",
			"DDR_Ore_Rock",
			"DDR_Weed_Plant"
		]
	],
	
	[
		"ImFX_Lootboxes",1,false,
		[

		]
	],	
	////////////////////////////////////// Air Assets
	[
		"ImFX_Air_Patrol",1,false,
		[
			// Aircrat that should be used in air patrol roles (Used specificaly by DAPE)
			// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
			// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		]
	],
	[
		"ImFX_Air_Interceptor",1,false,
		[
			// Aircraft that should be used as interceptors (Used specificaly by DAPE)
			// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
			// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		]
	],
	[
		"ImFX_Air_Airdrop",1,false,
		[
			// Helos you want to use for airdrop type roles
		]
	],

	/////////////////////////////////////// Heli Assets
	[
		"ImFX_Heli_Escort",1,false,
		[
			// Helos you want to use for escort type roles
		]
	],
	[
		"ImFX_Heli_Transport",1,false,
		[
			// Helos you want to use in transport type roles
		]
	],
	[
		"ImFX_Heli_Troops",1,false,
		[
			// Helos you want to use as troop transport type roles
		]
	],
	[
		"ImFX_Air_Rescue_Heli",1,false,
		// NOTE: These MUST have a default crew assigned to them, otherwise the vehicle will just crash.  Not all content
		// providers crew all vehicles, be sure to test in the editor first toensure they have a deafult crew in the model
		[
			// Helos you want to use for Air Rescue type roles (Used specificaly by DAPE)
		]
	],

	
	/////////////////////////////////////// Land Assets

	[
		"ImFX_Land_Armed_Guard",1,false,
		[
			// Vehicles that will serve as armed guard roles
		]
	],	
	[
		"ImFX_Land_Armed_Transport",1,false,
		[
			// Vehicle that will serve as armed troop transports
		]
	],	
	[
		"ImFX_Land_Unarmed_Transport",1,false,
		[
			// Vehicle that will serve as unarmed troop transports
		]
	],	
	[
		"ImFX_Land_Civ_Truck",1,false,
		[
			// Vehicle that will serve as civilian transports
		]
	],	
	[
		"ImFX_Land_Civ_Car",1,false,
		[
			// Vehicle that will serve as civilian cars
		]
	],
	///////////////// DAPE Loot Tables
	[
		"ImFX_DAPE_lootWeapons",1,false,
		[
			// Weapons you want included as part of DAPE loot weapons found in rescue helicopter
		]
	],
	[
		"ImFX_DAPE_lootItems",1,false,
		[
			// Weapons you want included as part of DAPE loot items found in rescue helicopter
		]
	]
	/////////////////////////////////////// Misc Assets
	// Add any other groupings you want here
	
	
	
	
];

/////////////////////////////////////////////////////////////////////////////////////////////////
// Map Immersion Data
/////////////////////////////////////////////////////////////////////////////////////////////////

_swapArray = 
[
	//["Land_wpp_Turbine_V1_F","Land_WX_Windmill",180] // [Orig classname, new classname, rotation adjustment]
];


/////////////////////////////
// Cart processing //////////
/////////////////////////////
_hold = [_cartName,_immersionData,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): ImmersionFX.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};

_oldSwapArray = missionNameSpace getvariable ["ImFX_BuildingSwap",[]];
_newSwapArray = _oldSwapArray + _swapArray;
missionNameSpace setVariable ["ImFX_BuildingSwap",_newSwapArray,true];