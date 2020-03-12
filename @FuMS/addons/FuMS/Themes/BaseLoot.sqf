// BaseLoot.sqf
// Horbin
// 1/9/15
// 10/6/15 - modified to support Exile
// 4/20/19 - Heavy modification by TheOneWhoKnocks for new mission features, additional content

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

// INCLUDE MARKSMAN WEAPONS
// comment out if you do NOT want them included in loot tables
//#define FuMS_USE_MARKSMAN_WEAPONS 1
//#include "MarksmenLoot.hpp"

// INCLUDE APEX CONTENT 
// comment out BOTH LINES if you do NOT want them included in loot tables
//#define FuMS_USE_APEX_CONTENT 1
//#include "ApexLoot.hpp"

// INCLUDE CUP CONTENT 
// comment out BOTH LINES if you do NOT want them included in loot tables
//#define FuMS_USE_CUP_V_CONTENT 1
//#include "CupVLoot.hpp"


// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

FuMS_Building_Supplies = ["Exile_Item_Sand","Exile_Item_MetalWire","Exile_Item_MetalHedgehogKit","Exile_Item_Cement","Exile_Item_ConcreteWallKit","Exile_Item_ConcreteWallKit","Exile_Item_ConcreteWallKit","Exile_Item_ConcreteWallKit",
	"Exile_Item_ConcreteFloorKit","Exile_Item_ConcreteFloorKit","Exile_Item_ConcreteFloorKit","Exile_Item_ConcreteDoorKit","Exile_Item_ConcreteFloorKit",
	"Exile_Item_ConcreteGateKit","Exile_Item_RepairKitMetal","Exile_Item_DuctTape","Exile_Item_SafeKit","Exile_Item_CordlessScrewdriver",
	"Exile_Item_WoodDoorwayKit","Exile_Item_WooDDoorKit","Exile_Item_WoodWallKit","Exile_Item_WoodFloorKit"];

FuMS_Crafting_Wood = ["Exile_Item_FortificationUpgrade","Exile_Item_WoodDoorwayKit","Exile_Item_WoodFloorKit","Exile_Item_WoodFloorPortKit",
	"Exile_Item_WoodGateKit","Exile_Item_WoodPlank","Exile_Item_WoodStairsKit","Exile_Item_WoodSupportKit",
	"Exile_Item_WoodWallKit","Exile_Item_WoodWallHalfKit","Exile_Item_WoodWindowKit"];
FuMS_Crafting_Metal = ["Exile_Item_MetalBoard","Exile_Item_MetalPole"];
FuMS_Crafting_Other = ["Exile_Item_SleepingMat","Exile_Item_BaseCameraKit","Exile_Item_FloodLightKit","Exile_Item_PortableGeneratorKit",
	"Exile_Item_StorageCrateKit", "Exile_Item_CampFireKit","Exile_Item_FuelCanisterFull","Exile_Item_CodeLock","Exile_Item_SafeKit",
	"Exile_Item_CamoTentKit"];
FuMS_Crafting_Tools = ["Exile_Item_Grinder","Exile_Item_Foolbox","Exile_Item_CanOpener","Exile_Item_Laptop","Exile_Item_WorkBenchKit",
	"Exile_Item_CookingPot","Exile_Item_Matches","Exile_Item_InstaDoc","Exile_Item_Melee_Axe","Exile_Item_Handsaw","Exile_Item_Pliers",
	"Exile_Melee_Axe","Exile_Melee_SledgeHammmer","Exile_Item_FireExtinguisher","Exile_Item_Hammer","Exile_Item_OilCanister",
	"Exile_Item_Screwdriver","Exile_Item_Shovel","Exile_Item_ToiletPaper","Exile_Item_Wrench","Exile_Item_ZipTie"];
FuMS_Crafting_Raw = ["Exile_Item_CarWheel","Exile_Item_MetalScrews","Exile_Item_WoodLog","Exile_Item_LightBulb","Exile_Item_ExtensionCord",
	"Exile_Item_JunkMetal","Exile_Item_Rope","Exile_Item_PlasticBottleEmpty","Exile_Item_FuelCanisterEmpty","Exile_Item_DuctTape"];
FuMS_Crafting_ALL = FuMS_Crafting_Wood + FuMS_Crafting_Metal + FuMS_Crafting_Other + FuMS_Crafting_Tools + FuMS_Crafting_Raw;
FuMS_BaseBuilding_ALL = FuMS_Building_Supplies + FuMS_Crafting_ALL;

FuMS_FOOD_R2E = ["Exile_Item_BeefParts","Exile_Item_Cheathas","Exile_Item_EMRE","Exile_Item_InstantCoffee","Exile_Item_MacasCheese",
	"Exile_Item_Can_Empty","Exile_Item_Moobar","Exile_Item_Noodles","Exile_Item_Raisins"];
FuMS_Food_Cooked = ["Exile_Item_BBQSandwich_Cooked","Exile_Item_Catfood_Cooked","Exile_Item_ChristmasTinner_Cooked",
	"Exile_Item_GloriousKnakworst_Cooked","Exile_Item_SausageGravy_Cooked","Exile_Item_Surstromming_Cooked","Exile_Item_SeedAstics"];
FuMS_Food_Raw = ["Exile_Item_GloriousKnakworst","Exile_Item_Surstromming","Exile_Item_SausageGravy",
	"Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Catfood","Exile_Item_Dogfood"];
FuMS_Food_Caught_Cooked = ["Exile_Item_TurtleFilet_Cooked","Exile_Item_TunaFilet_Cooked","Exile_Item_SnakeFilet_Cooked",
	"Exile_Item_SheepSteak_Cooked","Exile_Item_SalemaFilet_Cooked","Exile_Item_RoosterFilet_Cooked","Exile_Item_RabbitSteak_Cooked",
	"Exile_Item_OrnateFilet_Cooked","Exile_Item_MulletFilet_Cooked","Exile_Item_MackerelFilet_Cooked","Exile_Item_GoatSteak_Cooked",
	"Exile_Item_FinSteak_Cooked","Exile_Item_ChickenFilet_Cooked","Exile_Item_CatSharkFilet_Cooked","Exile_Item_AlsatianSteak_Cooked"];
FuMS_Food_Caught_Raw = ["Exile_Item_TurtleFilet_Raw","Exile_Item_TunaFilet_Raw","Exile_Item_SnakeFilet_Raw","Exile_Item_SheepSteak_Raw",
	"Exile_Item_SalemaFilet_Raw","Exile_Item_RoosterFilet_Raw","Exile_Item_RabbitSteak_Raw","Exile_Item_OrnateFilet_Raw","Exile_Item_MulletFilet_Raw",
	"Exile_Item_MackerelFilet_Raw","Exile_Item_GoatSteak_Raw","Exile_Item_FinSteak_Raw","Exile_Item_ChickenFilet_Raw","Exile_Item_CatSharkFilet_Raw",
	"Exile_Item_AlsatianSteak_Raw"];
FuMS_Food_ALL = FuMS_FOOD_R2E + FuMS_Food_Cooked + FuMS_Food_Raw;
FuMS_Food_Caught_ALL = FuMS_FOOD_R2E + FuMS_Food_Cooked + FuMS_Food_Raw + FuMS_Food_Caught_Cooked + FuMS_Food_Caught_Raw;

FuMS_Drink = ["Exile_Item_PlasticBottleFreshWater","Exile_Item_PlasticBottleEmpty","Exile_Item_Beer","Exile_Item_PlasticBottleCoffee",
"Exile_Item_PowerDrink","Exile_Item_ChocolateMilk", "Exile_Item_MountainDupe","Exile_Item_Energydrink"];

FuMS_Medical_Supplies = ["Exile_Item_Heatpack","Exile_Item_Heatpack","Exile_Item_InstaDoc","Exile_Item_Bandage","Exile_Item_Vishpirin","Exile_Item_Bandage","Exile_Item_Vishpirin",
"Exile_Item_Bandage","Exile_Item_Vishpirin","Exile_Item_Bandage","Exile_Item_Vishpirin","Exile_Item_InstaDoc","Exile_Item_Bandage",
"Exile_Item_Vishpirin","Exile_Item_Bandage","Exile_Item_Vishpirin","Exile_Item_Bandage","Exile_Item_Vishpirin"];	
	

// Uniforms

FuMS_U_Civ = ["U_C_Journalist","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1",
	"U_C_Scientist","U_OrestesBody","U_Rangemaster","U_NikosAgedBody","U_NikosBody","U_Competitor"];
FuMS_U_Soldier = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest",
	"U_B_CombatUniform_mcam_worn","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_I_CombatUniform",
	"U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt","U_I_OfficerUniform","U_O_CombatUniform_ocamo",
	"U_O_CombatUniform_oucamo","U_O_OfficerUniform_ocamo","U_B_SpecopsUniform_sgg","U_O_SpecopsUniform_blk",
	"U_O_SpecopsUniform_ocamo","U_I_G_Story_Protagonist_F"];	
FuMS_U_Guerilla = ["U_C_HunterBody_grn","U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_BG_Guerilla2_1","U_IG_Guerilla3_2","U_BG_Guerrilla_6_1",
	"U_BG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_leader",
	"U_IG_leader","U_I_G_resistanceLeader_F","Exile_Uniform_Woodland"];
FuMS_U_Ghillie = ["U_B_FullGhillie_ard","U_B_FullGhillie_lsh","U_B_FullGhillie_sard",
	"U_B_GhillieSuit","U_I_FullGhillie_ard","U_I_FullGhillie_lsh","U_I_FullGhillie_sard",
	"U_I_GhillieSuit","U_O_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard",
	"U_O_GhillieSuit"];
FuMS_U_Aviation = ["U_B_HeliPilotCoveralls","U_B_PilotCoveralls","U_I_HeliPilotCoveralls",
	"U_I_pilotCoveralls","U_O_PilotCoveralls"];
FuMS_U_Wetsuit = ["U_I_Wetsuit","U_O_Wetsuit","U_B_Wetsuit","U_B_survival_uniform"];	
FuMS_U_All = FuMS_U_Civ + FuMS_U_Soldier + FuMS_U_Guerilla + FuMS_U_Ghillie + FuMS_U_Wetsuit + FuMS_U_Aviation;

// Vest / Chest container items
FuMS_V_Bandolliers = ["V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr"];
FuMS_V_Chestrig = ["V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"];
FuMS_V_Vests = ["V_Press_F","V_Rangemaster_belt","V_TacVest_blk","V_TacVest_blk_POLICE","V_TacVest_brn",
	"V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_TacVestCamo_khk","V_TacVestIR_blk",
	"V_I_G_resistanceLeader_F"];
FuMS_V_Harness = ["V_HarnessO_brn","V_HarnessO_gry","V_HarnessOGL_brn","V_HarnessOGL_gry",
	"V_HarnessOSpec_brn","V_HarnessOSpec_gry"];
FuMS_V_Plate = ["V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr",
	"V_PlateCarrier3_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp",
	"V_PlateCarrierGL_rgr","V_PlateCarrierH_CTRG","V_PlateCarrierIA1_dgtl",
	"V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli",
	"V_PlateCarrierL_CTRG","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp",
	"V_PlateCarrierSpec_rgr"];

FuMS_V_Rebreather = ["V_RebreatherB","V_RebreatherIA","V_RebreatherIR"];
FuMS_V_All = FuMS_V_Bandolliers + FuMS_V_Chestrig + FuMS_V_Vests + FuMS_V_Harness + FuMS_V_Plate;

// Head/Hat items
FuMS_H_Exile_Hats = ["Exile_Headgear_SafetyHelmet","Exile_Headgear_SantaHat"];
FuMS_H_Caps = ["H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn",
	"H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red",
	"H_Cap_tan","H_Cap_tan_specops_US"];
FuMS_H_MilitaryCaps = ["H_MilCap_blue","H_MilCap_dgtl","H_MilCap_mcamo","H_MilCap_ocamo","H_MilCap_oucamo","H_MilCap_rucamo"];
FuMS_H_Beanies = ["H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_sgg"];
FuMS_H_Bandannas = ["H_Bandanna_camo","H_Bandanna_cbr","H_Bandanna_gry","H_Bandanna_khk",
	"H_Bandanna_khk_hs","H_Bandanna_mcamo","H_Bandanna_sgg","H_Bandanna_surfer"];
FuMS_H_Boonie = ["H_Booniehat_dgtl","H_Booniehat_dirty","H_Booniehat_grn","H_Booniehat_indp",
	"H_Booniehat_khk","H_Booniehat_khk_hs","H_Booniehat_mcamo","H_Booniehat_tan"];
FuMS_H_Hats = ["H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_StrawHat","H_StrawHat_dark"];
FuMS_H_Berets = ["H_Beret_02","H_Beret_blk","H_Beret_blk_POLICE","H_Beret_brn_SF","H_Beret_Colonel",
	"H_Beret_grn","H_Beret_grn_SF","H_Beret_ocamo","H_Beret_red"];
FuMS_H_Shemags = ["H_Shemag_khk","H_Shemag_olive","H_Shemag_olive_hs","H_Shemag_tan","H_ShemagOpen_khk",
	"H_ShemagOpen_tan","H_TurbanO_blk"];
FuMS_H_LightHelmet = ["H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass",
	"H_HelmetB_light_sand","H_HelmetB_light_snakeskin"];
FuMS_H_RegHelmet = ["H_HelmetIA","H_HelmetIA_camo","H_HelmetIA_net","H_HelmetB","H_HelmetB_black","H_HelmetB_camo",
	"H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_paint","H_HelmetB_plain_blk","H_HelmetB_sand","H_HelmetB_snakeskin"];
FuMS_H_SuperHelmet = ["H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetSpecO_blk","H_HelmetSpecO_ocamo",
	"H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo"];
FuMS_H_SpecOps = ["H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2"];
FuMS_H_Aviation = ["H_CrewHelmetHeli_B","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O","H_HelmetCrew_I","H_HelmetCrew_B",
	"H_HelmetCrew_O","H_PilotHelmetHeli_B","H_PilotHelmetHeli_I","H_PilotHelmetHeli_O","H_PilotHelmetFighter_B",
	"H_PilotHelmetFighter_I","H_PilotHelmetFighter_O"];
FuMS_H_Civ = FuMS_H_Caps + FuMS_H_Beanies + FuMS_H_Bandannas + FuMS_H_Hats;
FuMS_H_Hunter = FuMS_H_Caps + FuMS_H_Boonie + FuMS_H_Shemags + FuMS_H_MilitaryCaps;
FuMS_H_Military = FuMS_H_MilitaryCaps + FuMS_H_Berets + FuMS_H_LightHelmet + FuMS_H_RegHelmet + FuMS_H_SuperHelmet + FuMS_H_SpecOps;
FuMS_H_ALL = FuMS_H_Military + FuMS_H_Civ + FuMS_H_Boonie + FuMS_H_Shemags + FuMS_H_Aviation;

/* Glasses to be added
"G_Aviator",
"G_B_Diving",
"G_Balaclava_TI_G_blk_F",
"G_Balaclava_TI_G_tna_F",
"G_Balaclava_TI_blk_F",
"G_Balaclava_TI_tna_F",
"G_Balaclava_blk",
"G_Balaclava_combat",
"G_Balaclava_lowprofile",
"G_Balaclava_oli",
"G_Bandanna_aviator",
"G_Bandanna_beast",
"G_Bandanna_blk",
"G_Bandanna_khk",
"G_Bandanna_oli",
"G_Bandanna_shades",
"G_Bandanna_sport",
"G_Bandanna_tan",
"G_Combat",
"G_Combat_Goggles_tna_F",
"G_Diving",
"G_Goggles_VR",
"G_I_Diving",
"G_Lady_Blue",
"G_Lady_Dark",
"G_Lady_Mirror",
"G_Lady_Red",
"G_Lowprofile",
"G_O_Diving",
"G_Shades_Black",
"G_Shades_Blue",
"G_Shades_Green",
"G_Shades_Red",
"G_Spectacles",
"G_Spectacles_Tinted",
"G_Sport_BlackWhite",
"G_Sport_Blackred",
"G_Sport_Blackyellow",
"G_Sport_Checkered",
"G_Sport_Greenblack",
"G_Sport_Red",
"G_Squares",
"G_Squares_Tinted",
"G_Tactical_Black",
"G_Tactical_Clear",
*/

// Weapon attachments
FuMS_W_Pointer = ["acc_flashlight","acc_pointer_IR"];
FuMS_W_Bipod = ["bipod_01_F_blk","bipod_01_F_mtp","bipod_01_F_snd","bipod_02_F_blk","bipod_02_F_hex",
	"bipod_02_F_tan","bipod_03_F_blk","bipod_03_F_oli"];
FuMS_W_Muzzle = ["muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand",
	"muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_acp","muzzle_snds_B","muzzle_snds_H",
	"muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_L","muzzle_snds_M"];
FuMS_W_OpticsLv1 = ["optic_Aco","optic_ACO_grn","optic_ACO_grn_smg","optic_Aco_smg","optic_Arco","optic_Holosight",
	"optic_Holosight_smg","optic_Yorris","optic_MRD","optic_MRCO"];
FuMS_W_OpticsLv2 = ["optic_LRPS","optic_NVS","optic_SOS"];
FuMS_W_OpticsLv3 = ["optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_DMS","optic_Hamr","optic_KHS_blk",
	"optic_KHS_hex","optic_KHS_old","optic_KHS_tan","optic_Nightstalker","optic_tws","optic_tws_mg"];
FuMS_W_Optics_ALL = FuMS_W_OpticsLv1 + FuMS_W_OpticsLv2 + FuMS_W_OpticsLv3;
FuMS_W_Attachments = FuMS_W_Pointer + FuMS_W_Bipod + FuMS_W_Muzzle + FuMS_W_Optics_ALL;	

// Navigation and Belt Items
FuMS_B_Navigation = ["ItemWatch","ItemGPS","ItemMap","ItemCompass","ItemRadio","Binocular",
	"Rangefinder","Laserdesignator","Laserdesignator_02","Laserdesignator_03","NVGoggles",
	"NVGoggles_INDEP","NVGoggles_OPFOR","Exile_Item_XM8"];
	
// Backpacks
FuMS_Packs_Lv1 = ["B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_dgtl","B_AssaultPack_khk",
	"B_AssaultPack_mcamo","B_AssaultPack_rgr","B_AssaultPack_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu",
	"B_OutdoorPack_tan"];
FuMS_Packs_Lv2 = ["B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_ocamo","B_FieldPack_oucamo",
	"B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo",
	"B_TacticalPack_oli","B_Bergen_blk","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_sgg"];
FuMS_Packs_Lv3 = ["B_Kitbag_cbr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Carryall_cbr","B_Carryall_khk",
	"B_Carryall_mcamo","B_Carryall_ocamo","B_Carryall_oli","B_Carryall_oucamo","B_HuntingBackpack"];
FuMS_Packs_ALL = FuMS_Packs_Lv1 + FuMS_Packs_Lv2 + FuMS_Packs_Lv3;

// Ammo
FuMS_Ammo_All = ["100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer","10Rnd_127x54_Mag","10Rnd_338_Mag","10Rnd_762x54_Mag",
"10Rnd_762x51_Mag","10Rnd_93x64_DMR_05_Mag","11Rnd_45ACP_Mag","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","16Rnd_9x21_Mag",
"200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","150Rnd_93x64_Mag","130Rnd_338_Mag","20Rnd_556x45_UW_mag","20Rnd_762x51_Mag",
"30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Red","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Yellow",
"30Rnd_556x45_Stanag_red","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_9x21_Mag","5Rnd_127x108_APDS_Mag",
"5Rnd_127x108_Mag","6Rnd_45ACP_Cylinder","6Rnd_GreenSignal_F","6Rnd_RedSignal_F","7Rnd_408_Mag","9Rnd_45ACP_Mag"];
FuMS_Ammo_762 = ["10Rnd_762x54_Mag","10Rnd_762x51_Mag","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","20Rnd_762x51_Mag"];
FuMS_Ammo_93 = ["10Rnd_93x64_DMR_05_Mag","150Rnd_93x64_Mag"];
FuMS_Ammo_45 = ["11Rnd_45ACP_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Red","6Rnd_45ACP_Cylinder","9Rnd_45ACP_Mag"];
FuMS_Ammo_65 = ["200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"];
FuMS_Ammo_338 = ["130Rnd_338_Mag"];
FuMS_Ammo_556 = ["20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Yellow",
"30Rnd_556x45_Stanag_red"];
FuMS_Ammo_water = ["20Rnd_556x45_UW_mag"];
FuMS_Ammo_9mm = ["16Rnd_9x21_Mag","30Rnd_9x21_Mag"];
FuMS_Ammo_127 = ["5Rnd_127x108_APDS_Mag","5Rnd_127x108_Mag"];
FuMS_Ammo_408 = ["7Rnd_408_Mag"];
// Setting this in the 'magazine' section of loot configuration (LootData.sqf) will ensure ammo for each weapon specified in the weapon section is also part
//  of the loot definition.
FuMS_AmmoForEach = ["FuMS_AmmoForEach"];

// Flares
FuMS_Flares_Chemical =["Chemlight_blue","Chemlight_green","Chemlight_red"];
FuMS_Flares_Normal =["FlareGreen_F","FlareRed_F","FlareWhite_F","FlareYellow_F"];
FuMS_Flares_1Rnd = ["UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareWhite_F","UGL_FlareYellow_F"];
FuMS_Flares_3Rnd = ["3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareYellow_F"];
FuMS_Flares_ALL = FuMS_Flares_Chemical + FuMS_Flares_Normal + FuMS_Flares_1Rnd + FuMS_Flares_3rnd;

//Smokes
FuMS_Smoke_Shell = ["SmokeShell","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange",
	"SmokeShellPurple","SmokeShellRed","SmokeShellYellow"];
FuMS_Smoke_1Rnd = ["1Rnd_Smoke_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell"];
FuMS_Smoke_3Rnd = ["3Rnd_Smoke_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell",
	"3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","3Rnd_SmokePurple_Grenade_shell",
	"3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell"];
FuMS_Smoke_All = FuMS_Smoke_Shell + FuMS_Smoke_1Rnd + FuMS_Smoke_3rnd;

// Explosives
FuMS_E_Grenade = ["HandGrenade","MiniGrenade"];
FuMS_E_GrenadeIR =["B_IR_Grenade","O_IR_Grenade","I_IR_Grenade"];
FuMS_E_1Rnd = ["1Rnd_HE_Grenade_shell"];
FuMS_E_3Rnd = ["3Rnd_HE_Grenade_shell"];
FuMS_E_Mine =["APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag","SLAMDirectionalMine_Wire_Mag"];
FuMS_E_IED = ["DemoCharge_Remote_Mag","IEDLandBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanBig_Remote_Mag",
	"IEDUrbanSmall_Remote_Mag","SatchelCharge_Remote_Mag"];
FuMS_E_All = FuMS_E_Grenade + FuMS_E_GrenadeIR + FuMS_E_1Rnd + FuMS_E_3Rnd + FuMS_E_Mine + FuMS_E_IED;

//Guns
FuMS_Pistols = ["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Pistol_Signal_F","hgun_Rook40_F",
	"Exile_Weapon_Colt1911","Exile_Weapon_Taurus","Exile_Weapon_TaurusGold","Exile_Weapon_Makarov"];
FuMS_Shotguns = ["Exile_Weapon_M1014"];
FuMS_SubMGs = ["hgun_PDW2000_F","SMG_01_F","SMG_02_F","Exile_Weapon_SA61"];
FuMS_LightMGs = ["arifle_MX_SW_Black_F","arifle_MX_SW_F","LMG_Mk200_F","LMG_Zafir_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_black_F",
	"MMG_02_camo_F","MMG_02_sand_F","Exile_Weapon_PK","Exile_Weapon_PKP","Exile_Weapon_RPK"];
FuMS_AssaultRifles = ["arifle_Katiba_C_F","arifle_Katiba_F","arifle_Katiba_GL_F","arifle_Mk20_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F",
	"arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MX_Black_F","arifle_MX_F","arifle_MX_GL_Black_F","arifle_MX_GL_F",
	"arifle_MXC_Black_F","arifle_MXC_F","arifle_SDAR_F","arifle_TRG20_F","arifle_TRG21_F","arifle_TRG21_GL_F",
	"Exile_Weapon_AK107","Exile_Weapon_AK107_GL","Exile_Weapon_AK47","Exile_Weapon_AK74","Exile_Weapon_AK74_GL","Exile_Weapon_AKM",
	"Exile_Weapon_AKS","Exile_Weapon_AKS_Gold","Exile_Weapon_M16A2","Exile_Weapon_M16A4","Exile_Weapon_M4"];
FuMS_SniperRifles = ["arifle_MXM_Black_F","arifle_MXM_F","srifle_DMR_01_F","srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F",
	"srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F","srifle_DMR_04_F",
	"srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F",
	"srifle_EBR_F","srifle_GM6_camo_F","srifle_GM6_F","srifle_LRR_camo_F","srifle_LRR_F",
	"Exile_Weapon_CZ550","Exile_Weapon_SVD","Exile_Weapon_SVDCamo","Exile_Weapon_VSSVintorez","Exile_Weapon_DMR","Exile_Weapon_LeeEnfield",
	"Exile_Weapon_m107","Exile_Weapon_ksvk"];

FuMS_Rifles_ALL = FuMS_LightMGs + FuMS_AssaultRifles + FuMS_SniperRifles;
FuMS_Guns_ALL = FuMS_Rifles_ALL + FuMS_SubMGs + FuMS_Pistols;

// *******VEHICLES********************
//  Toy / small / man powered type vehicles
FuMS_Toy_Bikes = ["Exile_Bike_OldBike","Exile_Bike_MountainBike"];
FuMS_Toy_Quads = ["Exile_Bike_QuadBike_Black","Exile_Bike_QuadBike_Blue","Exile_Bike_QuadBike_Red","Exile_Bike_QuadBike_White",
	"Exile_Bike_QuadBike_Nato","Exile_Bike_QuadBike_Csat","Exile_Bike_QuadBike_Fia","Exile_Bike_QuadBike_Guerilla01",
	"Exile_Bike_QuadBike_Guerilla02"];
FuMS_Toy_Karts = ["Exile_Car_Kart_BluKing","Exile_Car_Kart_RedStone","Exile_Car_Kart_Vrana","Exile_Car_Kart_Green",
"Exile_Car_Kart_Blue","Exile_Car_Kart_Orange","Exile_Car_Kart_White","Exile_Car_Kart_Yellow","Exile_Car_Kart_Black"];
FuMS_Toy_All = FuMS_Toy_Bikes + FuMS_Toy_Quads + FuMS_Toy_Karts;

//  Water vehicles
FuMS_H20_Boats = ["Exile_Boat_MotorBoat_Police","Exile_Boat_MotorBoat_Orange","Exile_Boat_MotorBoat_White"];
FuMS_H20_RubberDucks = ["Exile_Boat_RubberDuck_CSAT","Exile_Boat_RubberDuck_Digital","Exile_Boat_RubberDuck_Orange",
"Exile_Boat_RubberDuck_Blue","Exile_Boat_RubberDuck_Black"];
FuMS_H20_RHIB = ["Exile_Boat_RHIB"];
FuMS_H20_SDVs = ["Exile_Boat_SDV_CSAT","Exile_Boat_SDV_Digital","Exile_Boat_SDV_Grey"];
FuMS_H20_Jetski = ["Exile_Boat_WaterScooter"];
FuMS_H20_All = FuMS_H20_Boats + FuMS_H20_RubberDucks + FuMS_H20_SDVs + FuMS_H20_RHIB + FuMS_H20_Jetski;

// Helicopters
FuMS_Heli_Hellcats = ["Exile_Chopper_Hellcat_Green","Exile_Chopper_Hellcat_FIA"];
FuMS_Heli_UnarmedHueys = ["Exile_Chopper_Huey_Green","Exile_Chopper_Huey_Desert"];
FuMS_Heli_ArmedHueys = ["Exile_Chopper_Huey_Armed_Desert","Exile_Chopper_Huey_Armed_Green"];
FuMS_Heli_Hueys_All = FuMS_Heli_ArmedHueys + FuMS_Heli_UnarmedHueys;

FuMS_Heli_Hummingbirds =["Exile_Chopper_Hummingbird_Green","Exile_Chopper_Hummingbird_Civillian_Blue","Exile_Chopper_Hummingbird_Civillian_Red",
"Exile_Chopper_Hummingbird_Civillian_ION","Exile_Chopper_Hummingbird_Civillian_BlueLine",
"Exile_Chopper_Hummingbird_Civillian_Digital","Exile_Chopper_Hummingbird_Civillian_Elliptical",
"Exile_Chopper_Hummingbird_Civillian_Furious","Exile_Chopper_Hummingbird_Civillian_GrayWatcher",
"Exile_Chopper_Hummingbird_Civillian_Jeans","Exile_Chopper_Hummingbird_Civillian_Light","Exile_Chopper_Hummingbird_Civillian_Shadow",
"Exile_Chopper_Hummingbird_Civillian_Sheriff","Exile_Chopper_Hummingbird_Civillian_Speedy","Exile_Chopper_Hummingbird_Civillian_Sunset",
"Exile_Chopper_Hummingbird_Civillian_Vrana","Exile_Chopper_Hummingbird_Civillian_Wasp","Exile_Chopper_Hummingbird_Civillian_Wave"];
FuMS_Heli_Hurons = ["Exile_Chopper_Huron_Black","Exile_Chopper_Huron_Green"];
FuMS_Heli_Mohawks = ["Exile_Chopper_Mohawk_FIA"];
FuMS_Heli_Orcas = ["Exile_Chopper_Orca_CSAT","Exile_Chopper_Orca_Black","Exile_Chopper_Orca_BlackCustom"];
FuMS_Heli_Tarus = ["Exile_Chopper_Taru_Transport_CSAT","Exile_Chopper_Taru_Transport_Black","Exile_Chopper_Taru_CSAT",
"Exile_Chopper_Taru_Black","Exile_Chopper_Taru_Covered_CSAT","Exile_Chopper_Taru_Covered_Black"];
FuMS_Heli_Airdrop = FuMS_Heli_Hellcats + FuMS_Heli_UnarmedHueys;
CAMS_Heli_Transport_E = FuMS_Heli_UnarmedHueys + FuMS_Heli_Hummingbirds + FuMS_Heli_Hurons + FuMS_Heli_Mohawks + FuMS_Heli_Orcas;
FuMS_Heli_ALL = FuMS_Heli_Hellcats + FuMS_Heli_Hueys_All + FuMS_Heli_Hummingbirds+FuMS_Heli_Hurons+FuMS_Heli_Mohawks+FuMS_Heli_Orcas+FuMS_Heli_Tarus;

// UAV
FuMS_UAV_Devices = ["I_UAV_01_backpack_F","I_UavTerminal"];

// Aircraft
FuMS_Plane_AN2 = ["Exile_Plane_AN2_Green","Exile_Plane_AN2_Stripe","Exile_Plane_AN2_White"];
FuMS_Plane_VTOL = ["Exile_Plane_BlackfishInfantry","Exile_Plane_BlackfishVehicle"];
FuMS_Plane_Ceaser = ["Exile_Plane_Ceasar"];
FuMS_Plane_Cessnas = ["Exile_Plane_Cessna"];
FuMS_Plane_All = FuMS_Plane_Cessnas + FuMS_Plane_VTOL + FuMS_Plane_Ceaser + FuMS_Plane_AN2;


// Civilian Vehicles
FuMS_Civ_Hatchbacks = ["Exile_Car_Hatchback_Beige","Exile_Car_Hatchback_Green","Exile_Car_Hatchback_Blue","Exile_Car_Hatchback_BlueCustom",
"Exile_Car_Hatchback_BeigeCustom","Exile_Car_Hatchback_Yellow","Exile_Car_Hatchback_Grey","Exile_Car_Hatchback_Black","Exile_Car_Hatchback_Dark",
"Exile_Car_Hatchback_Rusty1","Exile_Car_Hatchback_Rusty2","Exile_Car_Hatchback_Rusty3"];
FuMS_Civ_SportHatchbacks = ["Exile_Car_Hatchback_Sport_Red","Exile_Car_Hatchback_Sport_Blue","Exile_Car_Hatchback_Sport_Orange",
"Exile_Car_Hatchback_Sport_White","Exile_Car_Hatchback_Sport_Beige","Exile_Car_Hatchback_Sport_Green"];
FuMS_Civ_Hatchbacks_ALL = FuMS_Civ_Hatchbacks + FuMS_Civ_SportHatchbacks;

FuMS_Civ_Offroads = ["Exile_Car_Offroad_Red","Exile_Car_Offroad_Beige","Exile_Car_Offroad_White","Exile_Car_Offroad_Blue",
"Exile_Car_Offroad_DarkRed","Exile_Car_Offroad_BlueCustom","Exile_Car_Offroad_Guerilla01","Exile_Car_Offroad_Guerilla02",
"Exile_Car_Offroad_Guerilla03","Exile_Car_Offroad_Guerilla04","Exile_Car_Offroad_Guerilla05","Exile_Car_Offroad_Guerilla06",
"Exile_Car_Offroad_Guerilla07","Exile_Car_Offroad_Guerilla08","Exile_Car_Offroad_Guerilla09","Exile_Car_Offroad_Guerilla10",
"Exile_Car_Offroad_Guerilla11","Exile_Car_Offroad_Guerilla12","Exile_Car_Offroad_Rusty1","Exile_Car_Offroad_Rusty2","Exile_Car_Offroad_Rusty3"];
FuMS_Civ_MB4WD = ["Exile_Car_MB4WD","Exile_Car_MB4WDOpen"];
FuMS_Civ_Quilin = ["Exile_Car_QilinUnarmed"];
FuMS_Civ_SUVs = ["Exile_Car_SUV_Red","Exile_Car_SUV_Black","Exile_Car_SUV_Grey","Exile_Car_SUV_Orange","Exile_Car_SUVXL_Black"];

FuMS_Civ_Vans = ["Exile_Car_Van_Black","Exile_Car_Van_White","Exile_Car_Van_Red","Exile_Car_Van_Guerilla01","Exile_Car_Van_Guerilla02",
"Exile_Car_Van_Guerilla03","Exile_Car_Van_Guerilla04","Exile_Car_Van_Guerilla05","Exile_Car_Van_Guerilla06","Exile_Car_Van_Guerilla07",
"Exile_Car_Van_Guerilla08"];
FuMS_Civ_Ikarus = ["Exile_Car_Ikarus_Blue","Exile_Car_Ikarus_Red","Exile_Car_Ikarus_Party"];
FuMS_Civ_Tractors = ["Exile_Car_Tractor_Red","Exile_Car_OldTractor_Red","Exile_Car_TowTractor_White"];
FuMS_Civ_Golf = ["Exile_Car_Golf_Black","Exile_Car_Golf_Red"];
FuMS_Civ_Octavius = ["Exile_Car_Octavius_White","Exile_Car_Octavius_Black"];
FuMS_Civ_UAZs = ["Exile_Car_UAZ_Green","Exile_Car_UAZ_Open_Green"];
FuMS_Civ_V3S = ["Exile_Car_V3S_Covered","Exile_Car_V3S_Open"];

FuMS_Civ_LandRover = [ "Exile_Car_LandRover_Red","Exile_Car_LandRover_Urban","Exile_Car_LandRover_Green","Exile_Car_LandRover_Sand","Exile_Car_LandRover_Desert"];
FuMS_Civ_Ambulance = ["Exile_Car_LandRover_Ambulance_Green","Exile_Car_LandRover_Ambulance_Desert", "Exile_Car_LandRover_Ambulance_Sand"];

FuMS_Civ_Ladas = ["Exile_Car_Lada_Green","Exile_Car_Lada_Taxi","Exile_Car_Lada_Red","Exile_Car_Lada_Hipster","Exile_Car_Lada_White"];

FuMS_Civ_Volhas = ["Exile_Car_Volha_White","Exile_Car_Volha_Blue","Exile_Car_Volha_Black"];

FuMS_Civ_Work = FuMS_Civ_Tractors + FuMS_Civ_Ikarus + FuMS_Civ_Ambulance; 
FuMS_Civ_Cars = FuMS_Civ_Hatchbacks_ALL + FuMS_Civ_SUVs + FuMS_Civ_Vans + FuMS_Civ_Octavius + FuMS_Civ_Ladas + FuMS_Civ_Volhas;
FuMS_Civ_Trucks = FuMS_Civ_Offroads + FuMS_Civ_MB4WD + FuMS_Civ_Quilin + FuMS_Civ_UAZs + FuMS_Civ_V3S + FuMS_Civ_LandRover ;

FuMS_Civ_All = FuMS_Civ_Work + FuMS_Civ_Cars + FuMS_Civ_Trucks;




// Civilian Work Vehicles
FuMS_Work_RepairOffroads = ["Exile_Car_Offroad_Repair_Civillian","Exile_Car_Offroad_Repair_Red","Exile_Car_Offroad_Repair_Beige",
"Exile_Car_Offroad_Repair_White","Exile_Car_Offroad_Repair_Blue","Exile_Car_Offroad_Repair_DarkRed","Exile_Car_Offroad_Repair_BlueCustom",
"Exile_Car_Offroad_Repair_Guerilla01","Exile_Car_Offroad_Repair_Guerilla02","Exile_Car_Offroad_Repair_Guerilla03",
"Exile_Car_Offroad_Repair_Guerilla04","Exile_Car_Offroad_Repair_Guerilla05","Exile_Car_Offroad_Repair_Guerilla06",
"Exile_Car_Offroad_Repair_Guerilla07","Exile_Car_Offroad_Repair_Guerilla08","Exile_Car_Offroad_Repair_Guerilla09",
"Exile_Car_Offroad_Repair_Guerilla10","Exile_Car_Offroad_Repair_Guerilla11","Exile_Car_Offroad_Repair_Guerilla12"];
FuMS_Work_BoxVans = ["Exile_Car_Van_Box_Black","Exile_Car_Van_Box_White","Exile_Car_Van_Box_Red","Exile_Car_Van_Box_Guerilla01",
"Exile_Car_Van_Box_Guerilla02","Exile_Car_Van_Box_Guerilla03","Exile_Car_Van_Box_Guerilla04","Exile_Car_Van_Box_Guerilla05",
"Exile_Car_Van_Box_Guerilla06","Exile_Car_Van_Box_Guerilla07","Exile_Car_Van_Box_Guerilla08"];
FuMS_Work_FuelVans = ["Exile_Car_Van_Fuel_Black","Exile_Car_Van_Fuel_White","Exile_Car_Van_Fuel_Red","Exile_Car_Van_Fuel_Guerilla01",
"Exile_Car_Van_Fuel_Guerilla02","Exile_Car_Van_Fuel_Guerilla03"];
FuMS_Work_All = FuMS_Work_RepairOffroads+FuMS_Work_BoxVans+FuMS_Work_FuelVans;

// Military Vehicles
FuMS_Mil_ArmedOffroads = ["Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_Offroad_Armed_Guerilla02","Exile_Car_Offroad_Armed_Guerilla03",
"Exile_Car_Offroad_Armed_Guerilla04","Exile_Car_Offroad_Armed_Guerilla05","Exile_Car_Offroad_Armed_Guerilla06",
"Exile_Car_Offroad_Armed_Guerilla07","Exile_Car_Offroad_Armed_Guerilla08","Exile_Car_Offroad_Armed_Guerilla09",
"Exile_Car_Offroad_Armed_Guerilla10","Exile_Car_Offroad_Armed_Guerilla11","Exile_Car_Offroad_Armed_Guerilla12"];

FuMS_Mil_UnarmedOffroads = ["Exile_Car_Offroad_Guerilla01",	"Exile_Car_Offroad_Guerilla02",	"Exile_Car_Offroad_Guerilla03",	"Exile_Car_Offroad_Guerilla04",	
"Exile_Car_Offroad_Guerilla05",	"Exile_Car_Offroad_Guerilla06",	"Exile_Car_Offroad_Guerilla07",	"Exile_Car_Offroad_Guerilla08",	"Exile_Car_Offroad_Guerilla09",
"Exile_Car_Offroad_Guerilla10",	"Exile_Car_Offroad_Guerilla11",	"Exile_Car_Offroad_Guerilla12"];

FuMS_Mil_HMMWV_Armed = ["Exile_Car_HMMWV_M134_Desert","Exile_Car_HMMWV_M134_Green","Exile_Car_HMMWV_M2_Desert","Exile_Car_HMMWV_M2_Green"];
FuMS_Mil_HMMWV_Unarmed = ["Exile_Car_HMMWV_MEV_Desert","Exile_Car_HMMWV_MEV_Green","Exile_Car_HMMWV_UNA_Desert","Exile_Car_HMMWV_UNA_Green"];
FuMS_Mil_HMMWV_ALL = FuMS_Mil_HMMWV_Armed + FuMS_Mil_HMMWV_Unarmed;

FuMS_Mil_SUV_Armed = ["Exile_Car_SUV_Armed_Black"];

FuMS_Mil_BTR_Armed = ["Exile_Car_BTR40_MG_Camo","Exile_Car_BTR40_MG_Green"];
FuMS_Mil_BTR_Unarmed = ["Exile_Car_BTR40_Camo","Exile_Car_BTR40_Green"];
FuMS_Mil_BTR_ALL = FuMS_Mil_BTR_Armed + FuMS_Mil_BTR_Unarmed;

FuMS_Mil_OpenUral = ["Exile_Car_Ural_Open_Worker","Exile_Car_Ural_Open_Yellow","Exile_Car_Ural_Open_Worker","Exile_Car_Ural_Open_Military"];
FuMS_Mil_CoveredUral = ["Exile_Car_Ural_Covered_Worker","Exile_Car_Ural_Covered_Blue","Exile_Car_Ural_Covered_Yellow","Exile_Car_Ural_Covered_Military"];
FuMS_Mil_Ural_ALL = FuMS_Mil_OpenUral + FuMS_Mil_CoveredUral;

FuMS_Mil_Hemmts = ["Exile_Car_HEMMT"];
FuMS_Mil_Hunters = ["Exile_Car_Hunter"];
FuMS_Mil_Ifrits = ["Exile_Car_Ifrit"];
FuMS_Mil_Striders = ["Exile_Car_Strider"];
FuMS_Mil_Tempests = ["Exile_Car_Tempest"];
FuMS_Mil_Zamaks = ["Exile_Car_Zamak"];
FuMS_Mil_Prowler = ["Exile_Car_ProwlerLight","Exile_Car_ProwlerUnarmed"];
FuMS_Mil_BRDM = ["Exile_Car_BRDM2_HQ"];

// CONFIRM UNARMED!
FuMS_Mil_Unarmed =FuMS_Mil_BTR_Unarmed + FuMS_Mil_HMMWV_Unarmed + FuMS_Mil_Hemmts + FuMS_Mil_Hunters + FuMS_Mil_Ifrits + FuMS_Mil_Striders+FuMS_Mil_Tempests+FuMS_Mil_Zamaks + FuMS_Mil_Prowler;
FuMS_Mil_Armed = FuMS_Mil_ArmedOffroads + FuMS_Mil_HMMWV_Armed + FuMS_Mil_BTR_Armed + FuMS_Mil_BRDM + FuMS_Mil_SUV_Armed;
FuMS_Mil_All = FuMS_Mil_Unarmed + FuMS_Mil_Armed;

// Static Guns

//////////////////////////// Misc
FuMS_Mil_StaticGuns = ["O_HMG_01_support_F","O_HMG_01_weapon_F","O_HMG_01_support_high_F"];

FuMS_Hist_Wreck = ["Land_HistoricalPlaneWreck_01_F","Land_HistoricalPlaneWreck_02_front_F","Land_HistoricalPlaneWreck_03_F"];
FuMS_Car_Wreck = ["Land_Wreck_Car_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_CarDismantled_F","Land_Wreck_Skodovka_F"];
FuMS_Truck_Wreck = ["Land_Wreck_Offroad_F","Land_Wreck_Offroad2_F"];
FuMS_Vehicle_Wreck = ["Land_Wreck_BMP2_F","Land_Wreck_HMMWV_F","Land_Wreck_BRDM2_F","Land_Wreck_Ural_F","Land_Wreck_Hunter_F"];
FuMS_Tank_Wreck = ["Land_Wreck_Slammer_F","Land_Wreck_Slammer_hull_F","Land_Wreck_T72_hull_F"];
FuMS_Heli_Wreck = ["Land_Wreck_Heli_Attack_02_F","Land_UWreck_Heli_Attack_02_F","Land_Wreck_Heli_Attack_01_F"];
FuMS_Plane_Wreck = ["Land_UWreck_MV22_F","Plane_Fighter_03_wreck_F","Land_Wreck_Plane_Transport_01_F"];
FuMS_Boat_Wreck = ["Land_UWreck_FishingBoat_F","Land_Wreck_Traw_F","Land_Wreck_Traw2_F"];
FuMS_Wreck_Land = FuMS_Car_Wreck + FuMS_Truck_Wreck + FuMS_Vehicle_Wreck + FuMS_Heli_Wreck + FuMS_Plane_Wreck + FuMS_Hist_Wreck;


// Global Collections
FuMS_Veh_Land = FuMS_Civ_All + FuMS_Work_All + FuMS_Mil_Unarmed;
FuMS_Loot_Items = FuMS_BaseBuilding_ALL + FuMS_Food_ALL + FuMS_Drink + FuMS_Medical_Supplies + FuMS_W_Optics_ALL + FuMS_W_Attachments;




FuMS_ListofFuMSGlobalItems =
[
"FuMS_Crafting_Wood","FuMS_Crafting_Metal","FuMS_Crafting_Other","FuMS_Crafting_Tools","FuMS_Crafting_Raw","FuMS_Crafting_ALL",
"FuMS_Food_Cooked","FuMS_Food_Raw","FuMS_Food_ALL","FuMS_Drink",

"FuMS_U_Civ","FuMS_U_Soldier","FuMS_U_Guerilla","FuMS_U_Ghillie","FuMS_U_Aviation","FuMS_U_Wetsuit","FuMS_U_All",

"FuMS_V_Bandolliers","FuMS_V_Chestrig","FuMS_V_Vests","FuMS_V_Harness","FuMS_V_Plate","FuMS_V_Rebreather","FuMS_V_All",

"FuMS_H_Caps","FuMS_H_MilitaryCaps","FuMS_H_Beanies","FuMS_H_Bandannas","FuMS_H_Boonie","FuMS_H_Hats","FuMS_H_Berets",
"FuMS_H_Shemags","FuMS_H_LightHelmet","FuMS_H_RegHelmet","FuMS_H_SuperHelmet","FuMS_H_SpecOps","FuMS_H_Aviation",
"FuMS_H_Civ","FuMS_H_Hunter","FuMS_H_Military","FuMS_H_ALL",

"FuMS_W_Pointer","FuMS_W_Bipod","FuMS_W_Muzzle",
"FuMS_W_OpticsLv1","FuMS_W_OpticsLv2","FuMS_W_OpticsLv3","FuMS_W_Optics_ALL","FuMS_W_Attachments",

"FuMS_B_Navigation","FuMS_Packs_Lv1","FuMS_Packs_Lv2","FuMS_Packs_Lv3","FuMS_Packs_ALL",

"FuMS_Ammo_All","FuMS_Ammo_762","FuMS_Ammo_93","FuMS_Ammo_45","FuMS_Ammo_65","FuMS_Ammo_338","FuMS_Ammo_556",
"FuMS_Ammo_water","FuMS_Ammo_9mm","FuMS_Ammo_127","FuMS_Ammo_408",

"FuMS_Flares_Chemical","FuMS_Flares_Normal","FuMS_Flares_1Rnd","FuMS_Flares_3Rnd","FuMS_Flares_ALL",
"FuMS_Smoke_Shell","FuMS_Smoke_1Rnd","FuMS_Smoke_3Rnd","FuMS_Smoke_All",

"FuMS_E_Grenade","FuMS_E_GrenadeIR","FuMS_E_1Rnd","FuMS_E_3Rnd","FuMS_E_Mine","FuMS_E_IED","FuMS_E_All",

"FuMS_Pistols","FuMS_SubMGs","FuMS_LightMGs","FuMS_AssaultRifles","FuMS_SniperRifles","FuMS_Rifles_ALL","FuMS_Guns_ALL",

"FuMS_AmmoForEach",

  //Vehicle
"FuMS_Toy_All","FuMS_Toy_Bikes","FuMS_Toy_Quads","FuMS_Toy_Karts",
"FuMS_H20_All","FuMS_H20_Boats","FuMS_H20_RubberDucks","FuMS_H20_SDVs",
"FuMS_Heli_ALL","FuMS_Heli_Hellcats","FuMS_Heli_Hummingbirds","FuMS_Heli_Hurons","FuMS_Heli_Mohawks","FuMS_Heli_Orcas","FuMS_Heli_Tarus",
"FuMS_Plane_All","FuMS_Plane_Cessnas",
"FuMS_Civ_All","FuMS_Civ_Hatchbacks","FuMS_Civ_SportHatchbacks","FuMS_Civ_Offroads","FumS_Civ_SUVs","FuMS_Civ_Vans",
"FuMS_Work_All","FuMS_Work_RepairOffroads","FuMS_Work_BoxVans","FuMS_Work_FuelVans",
"FuMS_Mil_Unarmed","FuMS_Mil_Hemmts","FuMS_Mil_Hunters","FuMS_Mil_Ifrits","FuMS_Mil_Striders","FuMS_Mil_Tempests","FuMS_Mil_Zamaks",
"FuMS_Mil_Armed","FuMS_Mil_ArmedOffroads",
"FuMS_Mil_All","FuMS_Veh_Land"

];

//Admin ATTENTION!
// Any new global arrays you want to have available on the headless client need to be defined in this file.
// Define the array below, then place the name of the array in the 'FuMS_ListofCustomGlobalItems' variable below.
// At initialization your global variable will be passed onto the HC prior to it attempting to initialize any missions.
FuMS_MyExampleGlobalVariable = ["Chemlight_blue","Chemlight_green","Chemlight_red"];

FuMS_ListofCustomGlobalItems =
[
	"FuMS_MyExampleGlobalVariable",
	"FuMS_Heli_Airdrop"
];

    
	
	
	

