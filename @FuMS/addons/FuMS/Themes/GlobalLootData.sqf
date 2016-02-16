//LootData.sqf
// Horbin
// 1/8/15
//INPUTS: lootConfig, mission center, mission status.
// Intended as a #include to the Fulcrum Mission System init file.
// This function pulls the applicable data from here, and call the function to create the loot box.
// Note: "RANDOM" in any field will select a random type (BoxType, weapon, magazine, item, backpack, etc)
// Note: Placing a 'variable name' from BaseLoot into an option will direct FillLoot.sqf to select a random item from
//    the list of obtions in the 'variable name'
// Example: [Backpacks_All, 4] will select a random backpack, and place 4 of them in the container
// Example: ["FAK",[1,0,5] ] will add '1' FAK, and an additional '0' to '5' First Aid Kits to the container.
//    see BaseLoot.sqf for more specific 'random' lists you can choose from.
//*********************************************************************************************************
// LOOTDATA is GLOBAL to all mission sets to permit easier management of quantity/richness/type of loot
//   accross all missions and mission themes on the server.
//**********************************************************************************************************
_lootData =
[
    // To add more loot options, copy and paste all lines (including comments) from the 'CloneHunter' code below.
    // Paste the code above the '**** CloneHunter Loot**** line.
    
    
//******** CloneHunter Loot****************************
 [
// Loot Option title, and box to be used.  Use of array names is permitted. 
  ["CloneHunter", "box_nato_ammoveh_f","RANDOM"],
  [// All weapons and quantity 
      [FuMS_LightMGs, 2],
      [FuMS_AssaultRifles, 2]
  ],
  [// All magazines and quantity
      [FuMS_AmmoForEach, 4]    // 4 clips for each weapon Line defined above.
  // This will provide 4 clips for the LightMG's and 4 for the rifles for a total of 8 clips (not 16 clips)
  ],
  [// All items and quantity
      [FuMS_B_Navigation, 2],
      [FuMS_Crafting_Tools, 3],
      [FuMS_W_Opticslv1, 2],
      [FuMS_Food_Raw, 2],
      [FuMS_Drink, 2],
      ["G_Diving",2]
  ],
  [// All backpacks and quantity
    [FuMS_Packs_ALL, 1]
  ]
 ],//********** Loot**********************
//**********************************************************************************************************
//************ Generic Truck Loot
 [
// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
  ["Truck01","box_nato_ammo_f","RANDOM"],
  [// All weapons and quantity  
      ["LMG_Mk200_F", 2],
      [FuMS_SniperRifles, 2]
  ],
  [// All magazines and quantity
        [FuMS_AmmoForEach, 4]   
  ],
  [// All items and quantity     
	  [FuMS_Food_Cooked, 3],
      [FuMS_Crafting_Tools,1],
      [FuMS_Crafting_Tools,1],
     [FuMS_Crafting_Tools,1],
     [FuMS_Crafting_Tools,1],
     [FuMS_Crafting_Tools,1],
  ["G_Diving",2]
  ],// All backpacks and quantity
  [
     [FuMS_Packs_ALL, 2]
  ]
 ],  //*********** Loot************************ 
 [ // Zombie Bomb loot - specific to zombie encounters to provide a source for players to finish the objective!
 ["ZombieBomb","Scatter","Special"],
    [
        //weapons
    ],
    [
        //magazines
    ],
    [
        //items   
        ["SatchelCharge_Remote_Mag", 3]
    ],
    [
       // backpacks   
    ]          
 ],
 [
 //**SCATTER loot example.  Loot in this option will be distributed on the ground around the loot location center.
   ["Scatter", "none","Special"],
  [// All weapons and quantity 
      ["LMG_Mk200_F", 2],
      ["arifle_MXM_Black_F", 2]
  ],
  [// All magazines and quantity
      [FuMS_AmmoForEach, 4],
      ["200Rnd_65x39_cased_Box_Tracer", 4]
  ],
  [// All items and quantity
      [FuMS_B_Navigation, 2],
      [FuMS_Crafting_Tools, 3],
      [FuMS_W_OpticsLv1, 2],
      [FuMS_Food_Raw, 2],
      [FuMS_Drink, 2] ,
  ["G_Diving",2]
  ],
  [// All backpacks and quantity
    [FuMS_Packs_ALL, 1]
  ]
 ],
 [
// Loot Option title, and box to be used.  If box = 'VEHICLE' then loot is intended to be placed in a vehicle.
  ["RoadBlock","Land_Box_AmmoOld_F","special"],
  [// All weapons and quantity  
      [["arifle_Katiba_GL_F", "arifle_MX_GL_Black_F", "arifle_TRG21_F", "arifle_TRG20_F", "arifle_Mk20_plain_F", "arifle_Mk20_F", 
	    "arifle_MX_SW_Black_F", "arifle_MXM_Black_F", "srifle_EBR_F"] , 1],
	  [["arifle_Katiba_GL_F", "arifle_MX_GL_Black_F", "arifle_TRG21_F", "arifle_TRG20_F", "arifle_Mk20_plain_F", "arifle_Mk20_F", 
	    "arifle_MX_SW_Black_F", "arifle_MXM_Black_F", "srifle_EBR_F"] , 1]
      //[FuMS_SniperRifles, 2]
  ],
  [// All magazines and quantity
        [FuMS_AmmoForEach, 2]   
  ],
  [// All items and quantity  

	[["Exile_Item_InstaDoc", "Exile_Item_Surstromming_Cooked",
      "Exile_Item_PlasticBottleFreshWater", "Exile_Item_PlasticBottleFreshWater", "Exile_Item_Matches"],2],
	  
	[["Exile_Item_InstaDoc", "Exile_Item_Surstromming_Cooked",
      "Exile_Item_PlasticBottleFreshWater", "Exile_Item_PlasticBottleFreshWater", "Exile_Item_Matches"],2],
//	  [FuMS_Food_Cooked, 3],
 //     [FuMS_Crafting_Tools,1],
 //     [FuMS_Crafting_Tools,1],
 //    [FuMS_Crafting_Tools,1],
 //    [FuMS_Crafting_Tools,1],
//     [FuMS_Crafting_Tools,1],
  ["G_Diving",2]
  ],// All backpacks and quantity
  [
//     [FuMS_Packs_ALL, 2]
  ]
 ]
 
//**********************************************************************************************************
];

FuMS_LOOTDATA set [_this select 0, _lootData];

