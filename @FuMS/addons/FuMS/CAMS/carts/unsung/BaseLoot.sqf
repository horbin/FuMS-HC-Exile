// BaseLoot.sqf
// Horbin
// 1/9/15
// 10/6/15 - modified to support Exile

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

FuMS_Crafting_Wood = ["Exile_Item_FortificationUpgrade","Exile_Item_WoodDoorwayKit","Exile_Item_WoodFloorKit","Exile_Item_WoodFloorPortKit",
"Exile_Item_WoodGateKit","Exile_Item_WoodPlank","Exile_Item_WoodStairsKit","Exile_Item_WoodSupportKit",
"Exile_Item_WoodWallKit","Exile_Item_WoodWallHalfKit","Exile_Item_WoodWindowKit"];
FuMS_Crafting_Metal = ["Exile_Item_MetalBoard","Exile_Item_MetalPole"];
FuMS_Crafting_Other = ["Exile_Item_FloodLightKit","Exile_Item_PortableGeneratorKit","Exile_Item_StorageCrateKit", 
					"Exile_Item_CampFireKit","uns_ItemFuelcanEmpty","uns_ItemFuelcan","Exile_Item_CodeLock",
					"Exile_Item_SafeKit","Exile_Item_CamoTentKit"];
FuMS_Crafting_Tools = ["Exile_Item_CanOpener","Exile_Item_Handsaw","Exile_Item_Pliers","Exile_Item_Grinder","Exile_Item_Foolbox","Exile_Item_FireExtinguisher",
						"Exile_Item_Hammer","Exile_Item_OilCanister","Exile_Item_Screwdriver","Exile_Item_Screwdriver","Exile_Item_Screwdriver","Exile_Item_Shovel","Exile_Item_SleepingMat",
						"Exile_Item_ToiletPaper","Exile_Item_ZipTie","Exile_Item_BurlapSack","Exile_Item_WeaponParts","DDR_Item_Crowbar","DDR_Item_Pan","DDR_Item_Bucket",
						"DDR_Item_Old_Pot","DDR_Item_Pickaxe","DDR_Item_Fishing_Net","Exile_Item_Wrench","Exile_Item_Wrench","Exile_Item_Wrench","DDR_Item_Crowbar","DDR_Item_Pan","DDR_Item_Bucket","DDR_Item_Old_Pot",
						"DDR_Item_Pickaxe","DDR_Item_Fishing_Net","Exile_Item_WorkBenchKit","Exile_Item_CookingPot","Exile_Item_Matches","Exile_Item_InstaDoc","Exile_Item_Melee_Axe"
						];
FuMS_Crafting_Raw = ["Exile_Item_WoodLog","Exile_Item_LightBulb","Exile_Item_ExtensionCord","Exile_Item_JunkMetal",
					"Exile_Item_Rope","Exile_Item_PlasticBottleEmpty","Exile_Item_FuelCanisterEmpty","Exile_Item_DuctTape"];
FuMS_Crafting_ALL = FuMS_Crafting_Wood + FuMS_Crafting_Metal + FuMS_Crafting_Other + FuMS_Crafting_Tools + FuMS_Crafting_Raw;

FuMS_Food_Cooked = ["DDR_Item_Tacticalbacon_Cooked","DDR_Item_Rice_Cooked","DDR_Item_Bakedbeans_Cooked","Exile_Item_BBQSandwich_Cooked","Exile_Item_Catfood_Cooked",
				"Exile_Item_ChristmasTinner_Cooked","Exile_Item_GloriousKnakworst_Cooked","Exile_Item_SausageGravy_Cooked","Exile_Item_Surstromming_Cooked"];
FuMS_Food_Raw = ["DDR_Item_Tacticalbacon","DDR_Item_Rice","DDR_Item_Bakedbeans","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming","Exile_Item_SausageGravy",
				"Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Catfood"];
FuMS_Food_ALL = FuMS_Food_Cooked + FuMS_Food_Raw;
FuMS_Drink = ["DDR_Item_Canteen_Coffee","DDR_Item_Canteen_Fresh","DDR_Item_Canteen_Coffee_Milk","DDR_Item_Canteen_Dirty","DDR_Item_Canteen_Salt","DDR_Item_Canteen",
			"DDR_Item_Coke","DDR_Item_Jackoff","DDR_Item_Franta","DDR_Item_Redgull","DDR_Item_Spirit","DDR_Item_Yummy_Juice","Exile_Item_PlasticBottleFreshWater",
			"Exile_Item_PlasticBottleEmpty","Exile_Item_Beer","Exile_Item_Energydrink"];

// Uniforms
FuMS_U_Civ = ["U_C_Journalist","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1",
	"U_C_Scientist","U_OrestesBody","U_Rangemaster","U_NikosAgedBody","U_NikosBody","U_Competitor"];
FuMS_U_Soldier = ["UNS_NVA_G","UNS_NVA_GS","UNS_NVA_K","UNS_NVA_KS"

//	"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest",
//	"U_B_CombatUniform_mcam_worn","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_I_CombatUniform",
//	"U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt","U_I_OfficerUniform","U_O_CombatUniform_ocamo",
//	"U_O_CombatUniform_oucamo","U_O_OfficerUniform_ocamo","U_B_SpecopsUniform_sgg","U_O_SpecopsUniform_blk",
//	"U_O_SpecopsUniform_ocamo","U_I_G_Story_Protagonist_F"
	];
FuMS_U_Guerilla = ["UNS_VC_S","UNS_VC_U","UNS_VC_K","UNS_VC_G","UNS_VC_B"
//	"U_C_HunterBody_grn","U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2",
//	"U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_BG_Guerilla2_1","U_IG_Guerilla3_2","U_BG_Guerrilla_6_1",
//	"U_BG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_leader",
//	"U_IG_leader","U_I_G_resistanceLeader_F"
	];
FuMS_U_Ghillie = ["U_B_FullGhillie_ard","U_B_FullGhillie_lsh","U_B_FullGhillie_sard",
	"U_B_GhillieSuit","U_I_FullGhillie_ard","U_I_FullGhillie_lsh","U_I_FullGhillie_sard",
	"U_I_GhillieSuit","U_O_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard",
	"U_O_GhillieSuit"];
FuMS_U_Aviation = ["UNS_NVA_CG","UNS_NVA_CK","UNS_NVA_CC","UNS_NVA_CP"
//	"U_B_HeliPilotCoveralls","U_B_PilotCoveralls","U_I_HeliPilotCoveralls",
//	"U_I_pilotCoveralls","U_O_PilotCoveralls"
	];
FuMS_U_Wetsuit = ["U_I_Wetsuit","U_O_Wetsuit","U_B_Wetsuit","U_B_survival_uniform"];	
FuMS_U_All = FuMS_U_Civ + FuMS_U_Soldier + FuMS_U_Guerilla + FuMS_U_Ghillie + FuMS_U_Wetsuit + FuMS_U_Aviation;

// Vest / Chest container items
FuMS_V_Bandolliers = ["V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr"];
FuMS_V_Chestrig = ["V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"];
FuMS_V_Vests = ["V_Press_F","V_Rangemaster_belt","V_TacVest_blk","V_TacVest_blk_POLICE","V_TacVest_brn",
	"V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_TacVestCamo_khk","V_TacVestIR_blk","V_I_G_resistanceLeader_F"];
FuMS_V_Harness = ["V_HarnessO_brn","V_HarnessO_gry","V_HarnessOGL_brn","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_HarnessOSpec_gry"];
FuMS_V_Plate = ["UNS_VC_A1","UNS_VC_A2""UNS_VC_A3","UNS_VC_S1","UNS_VC_S2","UNS_NVA_A1","UNS_NVA_A2","UNS_NVA_A3","UNS_NVA_S1","UNS_NVA_S2"
//	"V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr",
//	"V_PlateCarrier3_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp",
//	"V_PlateCarrierGL_rgr","V_PlateCarrierH_CTRG","V_PlateCarrierIA1_dgtl",
//	"V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli",
//	"V_PlateCarrierL_CTRG","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp",
//	"V_PlateCarrierSpec_rgr"
	];
FuMS_V_Rebreather = ["V_RebreatherB","V_RebreatherIA","V_RebreatherIR"];
FuMS_V_All = FuMS_V_Bandolliers + FuMS_V_Chestrig + FuMS_V_Vests + FuMS_V_Harness + FuMS_V_Plate;

// Head/Hat items
FuMS_H_Caps = ["H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn",
	"H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red",
	"H_Cap_tan","H_Cap_tan_specops_US"];
FuMS_H_MilitaryCaps = ["H_MilCap_blue","H_MilCap_dgtl","H_MilCap_mcamo","H_MilCap_ocamo","H_MilCap_oucamo","H_MilCap_rucamo"];
FuMS_H_Beanies = ["H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_sgg"];
FuMS_H_Bandannas = ["uns_bandana_od","uns_bandana_od2","uns_bandana_od3","uns_field_cap","uns_boonie_4",
	"H_Bandanna_camo","H_Bandanna_cbr","H_Bandanna_gry","H_Bandanna_khk",
	"H_Bandanna_khk_hs","H_Bandanna_mcamo","H_Bandanna_sgg","H_Bandanna_surfer"
	];
FuMS_H_Boonie = ["H_Booniehat_dgtl","H_Booniehat_dirty","H_Booniehat_grn","H_Booniehat_indp",
	"H_Booniehat_khk","H_Booniehat_khk_hs","H_Booniehat_mcamo","H_Booniehat_tan"];
FuMS_H_Hats = ["H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_StrawHat","H_StrawHat_dark"];
FuMS_H_Berets = ["H_Beret_02","H_Beret_blk","H_Beret_blk_POLICE","H_Beret_brn_SF","H_Beret_Colonel",
	"H_Beret_grn","H_Beret_grn_SF","H_Beret_ocamo","H_Beret_red"];
FuMS_H_Shemags = ["H_Shemag_khk","H_Shemag_olive","H_Shemag_olive_hs","H_Shemag_tan","H_ShemagOpen_khk",
	"H_ShemagOpen_tan","H_TurbanO_blk"];
FuMS_H_LightHelmet = ["UNS_Headband_VC","UNS_Conehat_VC","UNS_Boonie_VC","UNS_Boonie2_VC","UNS_Boonie3_VC"

//	"H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass",
//	"H_HelmetB_light_sand","H_HelmetB_light_snakeskin"
	];
FuMS_H_RegHelmet = ["UNS_NVA_HG","UNS_NVA_HGG","UNS_NVA_HK","UNS_NVA_HKG"

//	"H_HelmetIA","H_HelmetIA_camo","H_HelmetIA_net","H_HelmetB","H_HelmetB_black","H_HelmetB_camo",
//	"H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_paint","H_HelmetB_plain_blk","H_HelmetB_sand","H_HelmetB_snakeskin"
	];
FuMS_H_SuperHelmet = [
//	"H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetSpecO_blk","H_HelmetSpecO_ocamo",
//	"H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo"
	];
FuMS_H_SpecOps = [
//	"H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2"
	];
FuMS_H_Aviation = ["UNS_NVA_CH","UNS_NVA_CHG","UNS_NVA_CHB","UNS_NVA_PL","UNS_NVA_PLC"

//	"H_CrewHelmetHeli_B","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O","H_HelmetCrew_I","H_HelmetCrew_B",
//	"H_HelmetCrew_O","H_PilotHelmetHeli_B","H_PilotHelmetHeli_I","H_PilotHelmetHeli_O","H_PilotHelmetFighter_B",
//	"H_PilotHelmetFighter_I","H_PilotHelmetFighter_O"
	];
FuMS_H_Civ = FuMS_H_Caps + FuMS_H_Beanies + FuMS_H_Bandannas + FuMS_H_Hats;
FuMS_H_Hunter = FuMS_H_Caps + FuMS_H_Boonie + FuMS_H_Shemags + FuMS_H_MilitaryCaps;
FuMS_H_Military = FuMS_H_MilitaryCaps + FuMS_H_Berets + FuMS_H_LightHelmet + FuMS_H_RegHelmet + FuMS_H_SuperHelmet + FuMS_H_SpecOps;
FuMS_H_ALL = FuMS_H_Military + FuMS_H_Civ + FuMS_H_Boonie + FuMS_H_Shemags + FuMS_H_Aviation;

// Weapon attachments
FuMS_W_Pointer = ["acc_flashlight","acc_pointer_IR","uns_BA30","uns_BA30_red","uns_BA30_green"];
FuMS_W_Bipod = ["uns_bp_DP28","uns_bp_MG42","uns_bp_PKM","uns_bp_RPD","uns_bp_RPK","uns_bp_RPK40"
//	"bipod_01_F_blk","bipod_01_F_mtp","bipod_01_F_snd","bipod_02_F_blk","bipod_02_F_hex",
//	"bipod_02_F_tan","bipod_03_F_blk","bipod_03_F_oli"
	];
FuMS_W_Muzzle = ["uns_s_PBS1","uns_s_APS","uns_s_mat49"
//	"muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand",
//	"muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_acp","muzzle_snds_B","muzzle_snds_H",
//	"muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_L","muzzle_snds_M"
	];
FuMS_W_OpticsLv1 = ["uns_o_APXSOM","uns_o_PSO1"
//	"optic_Aco","optic_ACO_grn","optic_ACO_grn_smg","optic_Aco_smg","optic_Arco","optic_Holosight",
//	"optic_Holosight_smg","optic_Yorris","optic_MRD","optic_MRCO"
	];
FuMS_W_OpticsLv2 = ["uns_o_PSO1_camo","uns_o_Akatihi4x"
//"optic_LRPS","optic_NVS","optic_SOS"
	];
FuMS_W_OpticsLv3 = ["uns_o_PU"
//	"optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_DMS","optic_Hamr","optic_KHS_blk",
//	"optic_KHS_hex","optic_KHS_old","optic_KHS_tan","optic_Nightstalker","optic_tws","optic_tws_mg"
	];
FuMS_W_Optics_ALL = FuMS_W_OpticsLv1 + FuMS_W_OpticsLv2 + FuMS_W_OpticsLv3;
FuMS_W_Attachments = FuMS_W_Pointer + FuMS_W_Bipod + FuMS_W_Muzzle + FuMS_W_Optics_ALL;	

// Navigation and Belt Items
FuMS_B_Navigation = ["ItemWatch","ItemGPS","ItemMap","ItemCompass","ItemRadio","Binocular"
//	"Rangefinder","Laserdesignator","Laserdesignator_02","Laserdesignator_03","NVGoggles",
//	"NVGoggles_INDEP","NVGoggles_OPFOR","Exile_Item_XM8"
	];
	
// Backpacks
FuMS_Packs_Lv1 = ["uns_civ_r1","uns_civ_r2","uns_civ_r3"
//	"B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_dgtl","B_AssaultPack_khk",
//	"B_AssaultPack_mcamo","B_AssaultPack_rgr","B_AssaultPack_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu",
//	"B_OutdoorPack_tan"
	];
FuMS_Packs_Lv2 = ["UNS_TROP_R1","UNS_TROP_R2","UNS_TROP_R3"
//	"B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_ocamo","B_FieldPack_oucamo",
//	"B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo",
//	"B_TacticalPack_oli","B_Bergen_blk","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_sgg"
	];
FuMS_Packs_Lv3 = ["UNS_Alice_1","UNS_Alice_2","UNS_Alice_3","UNS_Alice_4","UNS_Alice_5","UNS_Alice_6"
//	"B_Kitbag_cbr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Carryall_cbr","B_Carryall_khk",
//	"B_Carryall_mcamo","B_Carryall_ocamo","B_Carryall_oli","B_Carryall_oucamo","B_HuntingBackpack"
	];
FuMS_Packs_ALL = FuMS_Packs_Lv1 + FuMS_Packs_Lv2 + FuMS_Packs_Lv3;

// Ammo
FuMS_Ammo_All = ["uns_6Rnd_czak","uns_makarovmag",
				"uns_nagant_1895mag","uns_tokarevmag","uns_20Rnd_APS",
				"uns_m2carbinemag","uns_20rnd_sa61_pa","uns_25Rnd_pm_pa","uns_20rnd_sa61","uns_m2carbinemag","uns_m2carbinemag_T","uns_m2carbinemag_NT","uns_m1carbinemag","uns_m1carbinemag_T","uns_m1carbinemag_NT",
				"uns_25Rnd_pm","uns_f1_smg_mag","uns_thompsonmag_20","uns_thompsonmag_20_T","uns_thompsonmag_20_NT","uns_mat49mag","uns_mat49mag_T","uns_mat49mag_NT",
				"uns_ppshmag","uns_ppshmag_T","uns_ppshmag_NT","uns_k50mag","uns_k50mag_T","uns_k50mag_NT","uns_20rnd_sa61","uns_20rnd_sa61pa",
				"uns_30Rnd_kurtz_stg","uns_ak47mag","uns_ak47mag_T","uns_ak47mag_NT","uns_sa58mag","uns_sa58mag_T","uns_sa58mag_NT","uns_75Rnd_akdr",
				"uns_type100mag","uns_type100_T","uns_type100_NT","uns_mas4956mag","uns_mas4956mag_T",
				"uns_1rnd_22mm_AT","uns_1rnd_22mm_base","uns_1rnd_22mm_frag","uns_1rnd_22mm_heat","uns_1rnd_22mm_lume","uns_1rnd_22mm_m1a2_frag","uns_1rnd_22mm_smoke","uns_1rnd_22mm_WP","uns_1rnd_30mm_frag",
				
				"uns_sksmag","uns_sksmag_T","uns_sksmag_NT","uns_type99mag","uns_type99mag_T","uns_mas36mag","uns_mas36mag_T",
				
				"uns_m1_carbinemag","uns_m1_carbinemag_T","uns_m1_carbinemag_NT","uns_m2_carbinemag","uns_m2_carbinemag_T","uns_m2_carbinemag_NT",
				"uns_mosinmag","uns_mosinmag_T","uns_svdmag","uns_svdmag_T","uns_svtmag","uns_svtmag_T",
				
				"uns_rpkmag","uns_rpdmag","uns_rpdsogmag","uns_75Rnd_akdr",
				
				"uns_47Rnd_DP28","uns_100Rnd_762x54_PK","uns_50Rnd_792x57_Mg42","uns_250Rnd_792x57_Mg42","uns_ak47mag","uns_ak47mag_T","uns_ak47mag_NT",
				
				"uns_12gaugemag_2","uns_12gauge_buck","uns_12gauge_buck_no_shell","uns_12gauge_flechette"

	];
FuMS_Ammo_762 = ["uns_nagant_1895mag","uns_tokarevmag","uns_m2carbinemag","uns_m2carbinemag","uns_m2carbinemag_T","uns_m2carbinemag_NT","uns_m1carbinemag","uns_m1carbinemag_T","uns_m1carbinemag_NT",
				"uns_mat49mag","uns_mat49mag_T","uns_mat49mag_NT","uns_ppshmag","uns_ppshmag_T","uns_ppshmag_NT","uns_k50mag","uns_k50mag_T","uns_k50mag_NT",
				"uns_ak47mag","uns_ak47mag_T","uns_ak47mag_NT","uns_sa58mag","uns_sa58mag_T","uns_sa58mag_NT","uns_75Rnd_akdr","uns_sksmag","uns_sksmag_T","uns_sksmag_NT",
				"uns_m1_carbinemag","uns_m1_carbinemag_T","uns_m1_carbinemag_NT","uns_m2_carbinemag","uns_m2_carbinemag_T","uns_m2_carbinemag_NT","uns_mosinmag","uns_mosinmag_T",
				"uns_svdmag","uns_svdmag_T","uns_svtmag","uns_svtmag_T","","uns_rpkmag","uns_rpdmag","uns_rpdsogmag","uns_75Rnd_akdr","uns_47Rnd_DP28","uns_100Rnd_762x54_PK",
				"uns_ak47mag","uns_ak47mag_T","uns_ak47mag_NT"

				];
FuMS_Ammo_765 = ["uns_20rnd_sa61_pa","uns_20rnd_sa61","uns_20rnd_sa61","uns_20rnd_sa61pa"
//	"10Rnd_93x64_DMR_05_Mag","150Rnd_93x64_Mag"
				];
FuMS_Ammo_45 = ["uns_thompsonmag_20","uns_thompsonmag_20_T","uns_thompsonmag_20_NT"

//				"11Rnd_45ACP_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
//				"30Rnd_45ACP_Mag_SMG_01_Tracer_Red","6Rnd_45ACP_Cylinder","9Rnd_45ACP_Mag"
				];
FuMS_Ammo_12 = ["uns_12gaugemag_2","uns_12gauge_buck","uns_12gauge_buck_no_shell","uns_12gauge_flechette"

//"200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer",
//"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer" 
				];
FuMS_Ammo_8 = ["uns_type100mag","uns_type100_T","uns_type100_NT"
//				"130Rnd_338_Mag"
				];
FuMS_Ammo_75 = ["uns_mas4956mag","uns_mas4956mag_T","uns_mas36mag","uns_mas36mag_T"


//				"20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green",
//				"30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Yellow",
//				"30Rnd_556x45_Stanag_red"
				];
FuMS_Ammo_77 = ["uns_type99mag","uns_type99mag_T"


//				"20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green",
//				"30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Yellow",
//				"30Rnd_556x45_Stanag_red"
				];
				
FuMS_Ammo_water = ["20Rnd_556x45_UW_mag"];
FuMS_Ammo_9mm = ["uns_6Rnd_czak","uns_makarovmag","uns_20Rnd_APS","uns_25Rnd_pm_pa","uns_25Rnd_pm","uns_f1_smg_mag"

//				"16Rnd_9x21_Mag","30Rnd_9x21_Mag"
				];
FuMS_Ammo_792 = ["uns_50Rnd_792x57_Mg42","uns_250Rnd_792x57_Mg42"

//				"5Rnd_127x108_APDS_Mag","5Rnd_127x108_Mag"
				];
FuMS_Ammo_408 = [
//				"7Rnd_408_Mag"
				];
// Setting this in the 'magazine' section of loot configuration (LootData.sqf) will ensure ammo for each weapon specified in the weapon section is also part
//  of the loot definition.
FuMS_AmmoForEach = ["FuMS_AmmoForEach"];

// Flares
FuMS_Flares_Chemical =["Chemlight_blue","Chemlight_green","Chemlight_red"];
FuMS_Flares_Normal =["FlareGreen_F","FlareRed_F","FlareWhite_F","FlareYellow_F","uns_m127a1_flare"];
FuMS_Flares_1Rnd = ["UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareWhite_F","UGL_FlareYellow_F"];
FuMS_Flares_3Rnd = ["3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareYellow_F"];
FuMS_Flares_ALL = FuMS_Flares_Chemical + FuMS_Flares_Normal + FuMS_Flares_1Rnd + FuMS_Flares_3rnd;

//Smokes
FuMS_Smoke_Shell = [

	"SmokeShell","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange",
	"SmokeShellPurple","SmokeShellRed","SmokeShellYellow"];
FuMS_Smoke_1Rnd = ["1Rnd_Smoke_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell"];
FuMS_Smoke_3Rnd = ["3Rnd_Smoke_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell",
	"3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","3Rnd_SmokePurple_Grenade_shell",
	"3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell"];
FuMS_Smoke_All = FuMS_Smoke_Shell + FuMS_Smoke_1Rnd + FuMS_Smoke_3rnd;

// Explosives
FuMS_E_Grenade = ["uns_molotov_mag","uns_f1gren","uns_rg42gren","uns_t67gren","uns_rgd33gren","uns_rgd5gren"
//	"HandGrenade","MiniGrenade"
	];
FuMS_E_GrenadeIR =[
	"B_IR_Grenade","O_IR_Grenade","I_IR_Grenade"
	];
FuMS_E_1Rnd = ["uns_1rnd_30mm_frag","uns_1rnd_22mm_frag","uns_1rnd_22mm_m1a2_frag"
//				"1Rnd_HE_Grenade_shell"
	];
FuMS_E_3Rnd = [
//	"3Rnd_HE_Grenade_shell"
	];
FuMS_E_Mine =["uns_mine_M14","uns_mine_M16","uns_mine_M18_remote","uns_mine_M18","uns_mine_md82","uns_mine_m64","uns_mine_AP"
//	"APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","APERSTripMine_Wire_Mag",
//	"ClaymoreDirectionalMine_Remote_Mag","SLAMDirectionalMine_Wire_Mag"
	];
FuMS_E_IED = ["pipebomb","MineE","uns_mine_tm57","Mine ","uns_mine_t59"
//	"DemoCharge_Remote_Mag","IEDLandBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanBig_Remote_Mag",
//	"IEDUrbanSmall_Remote_Mag","SatchelCharge_Remote_Mag"
	];
FuMS_E_All = FuMS_E_Grenade + FuMS_E_GrenadeIR + FuMS_E_1Rnd + FuMS_E_3Rnd + FuMS_E_Mine + FuMS_E_IED;

//Guns
FuMS_Pistols = ["uns_p64","uns_makarov","uns_Tt30","uns_Tt33","uns_APS"
//	"hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Pistol_Signal_F","hgun_Rook40_F"
	];
FuMS_SubMGs = ["uns_pm63","uns_pm63f","uns_f1_smg","uns_thompsonvc","uns_mat49","uns_mat49_f","uns_ppsh41","uns_k50m","uns_k50mdrum","uns_sa61","uns_sa61f"
//	"hgun_PDW2000_F","SMG_01_F","SMG_02_F"
	];
FuMS_LightMGs = ["uns_RPK_40","uns_RPK_drum","uns_RPDsupport","uns_rpdsog","uns_PK","uns_PKsupport","uns_MG42","uns_MG42support","uns_mg42_bakelite"
//	"arifle_MX_SW_Black_F","arifle_MX_SW_F","LMG_Mk200_F","LMG_Zafir_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F","MMG_02_sand_F"
	];
FuMS_AssaultRifles = ["uns_STG_44","uns_AKS47","uns_aks47f","uns_AK47","uns_AK47_49","uns_AK47_52","uns_AKM","uns_akm_drum",
					"uns_AKMS","uns_AKMS_Drum","uns_AKMSF","uns_akmsf_drum","uns_mas4956","uns_mas4956_gl",
					"uns_SKS","uns_type99","uns_type99_gl","uns_mas36","uns_mas36_gl"

//	"arifle_Katiba_C_F","arifle_Katiba_F","arifle_Katiba_GL_F","arifle_Mk20_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_MX_Black_F","arifle_MX_F","arifle_MX_GL_Black_F","arifle_MX_GL_F","arifle_MXC_Black_F","arifle_MXC_F","arifle_SDAR_F","arifle_TRG20_F","arifle_TRG21_F","arifle_TRG21_GL_F"
	];
FuMS_SniperRifles = ["uns_m3carbine","uns_mosin","uns_SVD","uns_SVD_camo"

//	"arifle_MXM_Black_F","arifle_MXM_F","srifle_DMR_01_F","srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_EBR_F","srifle_GM6_camo_F","srifle_GM6_F","srifle_LRR_camo_F","srifle_LRR_F"
	];
FuMS_Rifles_ALL = FuMS_LightMGs + FuMS_AssaultRifles + FuMS_SniperRifles;
FuMS_Guns_ALL = FuMS_Rifles_ALL + FuMS_SubMGs + FuMS_Pistols;

FuMS_Rockets = ["uns_rpg2","uns_B40","uns_rpg7","uns_sa7","uns_sa7b"
	];


// *******VEHICLES********************
//  Toy / small / man powered type vehicles
FuMS_Toy_Bikes = ["Exile_Bike_OldBike","Exile_Bike_MountainBike"];
FuMS_Toy_Quads = ["Exile_Bike_QuadBike_Black","Exile_Bike_QuadBike_Blue","Exile_Bike_QuadBike_Red","Exile_Bike_QuadBike_White",
"Exile_Bike_QuadBike_Nato","Exile_Bike_QuadBike_Csat","Exile_Bike_QuadBike_Fia","Exile_Bike_QuadBike_Guerilla01",
"Exile_Bike_QuadBike_Guerilla02"];
FuMS_Toy_Karts = ["Exile_Car_Kart_BluKing","Exile_Car_Kart_RedStone","Exile_Car_Kart_Vrana","Exile_Car_Kart_Green",
"Exile_Car_Kart_Blue","Exile_Car_Kart_Orange","Exile_Car_Kart_White","Exile_Car_Kart_Yellow","Exile_Car_Kart_Black"];

//  Water vehicles
FuMS_H20_Boats = ["uns_skiff_C","uns_skiff2_c""uns_skiff_cargo_c","uns_skiff2_cargo_C","Exile_Boat_MotorBoat_Orange","Exile_Boat_MotorBoat_White"];
FuMS_H20_RubberDucks = ["UNS_Zodiac_VC","UNS_Zodiac_NVA","Exile_Boat_RubberDuck_Orange","Exile_Boat_RubberDuck_Blue","Exile_Boat_RubberDuck_Black"];
FuMS_H20_SDVs = ["UNS_PATROL_BOAT_VC","UNS_ASSAULT_BOAT_VC","UNS_PATROL_BOAT_NVA","uns_assault_BOAT_NVA"];

// Helicopters
FuMS_Heli_Hellcats = ["uns_ch34_vnaf_m60","uns_ch34_vnaf"
	];//large transport
FuMS_Heli_Hummingbirds =["uns_oh6_m60","uns_oh6_m27r","uns_oh6_m27","uns_oh6_transport","uns_oh6_xm8"
//	"Exile_Chopper_Hummingbird_Green","Exile_Chopper_Hummingbird_Civillian_Blue","Exile_Chopper_Hummingbird_Civillian_Red",
//	"Exile_Chopper_Hummingbird_Civillian_ION","Exile_Chopper_Hummingbird_Civillian_BlueLine",
//	"Exile_Chopper_Hummingbird_Civillian_Digital","Exile_Chopper_Hummingbird_Civillian_Elliptical",
//	"Exile_Chopper_Hummingbird_Civillian_Furious","Exile_Chopper_Hummingbird_Civillian_GrayWatcher",
//	"Exile_Chopper_Hummingbird_Civillian_Jeans","Exile_Chopper_Hummingbird_Civillian_Light","Exile_Chopper_Hummingbird_Civillian_Shadow",
//	"Exile_Chopper_Hummingbird_Civillian_Sheriff","Exile_Chopper_Hummingbird_Civillian_Speedy","Exile_Chopper_Hummingbird_Civillian_Sunset",
//	"Exile_Chopper_Hummingbird_Civillian_Vrana","Exile_Chopper_Hummingbird_Civillian_Wasp","Exile_Chopper_Hummingbird_Civillian_Wave"
	];
FuMS_Heli_Hurons = ["uns_ch47_m60_arvn"];//chinook
FuMS_Heli_Mohawks = ["uns_mi8t_vpaf","uns_mi8tv_vpaf_mg"];//heavy transport
FuMS_Heli_Orcas = ["uns_ah1g","uns_ah1g_m158","uns_ah1g_ffar","uns_ah1g_m195","uns_ah1g_m200","uns_ah1g_suu11"
//	"Exile_Chopper_Orca_CSAT","Exile_Chopper_Orca_Black","Exile_Chopper_Orca_BlackCustom"
	];//large attack heli

FuMS_Heli_Tarus = ["uns_h21c","uns_h21c_mg"
//	"Exile_Chopper_Taru_Transport_CSAT","Exile_Chopper_Taru_Transport_Black","Exile_Chopper_Taru_CSAT",
//	"Exile_Chopper_Taru_Black","Exile_Chopper_Taru_Covered_CSAT","Exile_Chopper_Taru_Covered_Black"
	];//lifter heli

// Aircraft
FuMS_Plane_Cessnas = ["Exile_Plane_Cessna","uns_skymaster_civ_blue","uns_skymaster_civ_gold","uns_skymaster_civ_red","uns_skymaster_civ","uns_skymaster_civ_yellow"
	];

// Civilian Vehicles
FuMS_Civ_Hatchbacks = ["Exile_Car_Hatchback_Beige","Exile_Car_Hatchback_Green","Exile_Car_Hatchback_Blue","Exile_Car_Hatchback_BlueCustom",
"Exile_Car_Hatchback_BeigeCustom","Exile_Car_Hatchback_Yellow","Exile_Car_Hatchback_Grey","Exile_Car_Hatchback_Black","Exile_Car_Hatchback_Dark",
"Exile_Car_Hatchback_Rusty1","Exile_Car_Hatchback_Rusty2","Exile_Car_Hatchback_Rusty3"];
FuMS_Civ_SportHatchbacks = [
//	"Exile_Car_Hatchback_Sport_Red","Exile_Car_Hatchback_Sport_Blue","Exile_Car_Hatchback_Sport_Orange",
//	"Exile_Car_Hatchback_Sport_White","Exile_Car_Hatchback_Sport_Beige","Exile_Car_Hatchback_Sport_Green"
	];
FuMS_Civ_Offroads = ["Exile_Car_Offroad_Red","Exile_Car_Offroad_Beige","Exile_Car_Offroad_White","Exile_Car_Offroad_Blue",
"Exile_Car_Offroad_DarkRed","Exile_Car_Offroad_BlueCustom","Exile_Car_Offroad_Guerilla01","Exile_Car_Offroad_Guerilla02",
"Exile_Car_Offroad_Guerilla03","Exile_Car_Offroad_Guerilla04","Exile_Car_Offroad_Guerilla05","Exile_Car_Offroad_Guerilla06",
"Exile_Car_Offroad_Guerilla07","Exile_Car_Offroad_Guerilla08","Exile_Car_Offroad_Guerilla09","Exile_Car_Offroad_Guerilla10",
"Exile_Car_Offroad_Guerilla11","Exile_Car_Offroad_Guerilla12","Exile_Car_Offroad_Rusty1","Exile_Car_Offroad_Rusty2","Exile_Car_Offroad_Rusty3"];
FuMS_Civ_SUVs = [
//	"Exile_Car_SUV_Red","Exile_Car_SUV_Black","Exile_Car_SUV_Grey","Exile_Car_SUV_Orange"
	];
FuMS_Civ_Vans = ["Exile_Car_Van_Black","Exile_Car_Van_White","Exile_Car_Van_Red","Exile_Car_Van_Guerilla01","Exile_Car_Van_Guerilla02",
"Exile_Car_Van_Guerilla03","Exile_Car_Van_Guerilla04","Exile_Car_Van_Guerilla05","Exile_Car_Van_Guerilla06","Exile_Car_Van_Guerilla07",
"Exile_Car_Van_Guerilla08"];

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

// Military Vehicles
FuMS_Mil_ArmedOffroads = ["Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_Offroad_Armed_Guerilla02","Exile_Car_Offroad_Armed_Guerilla03",
"Exile_Car_Offroad_Armed_Guerilla04","Exile_Car_Offroad_Armed_Guerilla05","Exile_Car_Offroad_Armed_Guerilla06",
"Exile_Car_Offroad_Armed_Guerilla07","Exile_Car_Offroad_Armed_Guerilla08","Exile_Car_Offroad_Armed_Guerilla09",
"Exile_Car_Offroad_Armed_Guerilla10","Exile_Car_Offroad_Armed_Guerilla11","Exile_Car_Offroad_Armed_Guerilla12"];
FuMS_Mil_Hemmts = ["uns_zil157","uns_nvatruck_open","uns_nvatruck"];
FuMS_Mil_Hunters = ["uns_type55","uns_type55_patrol"];
FuMS_Mil_Armed_Hunters = ["uns_type55_RR57","uns_type55_M40"];
FuMS_Mil_Ifrits = ["pook_ural_utiity_nva"];
FuMS_Mil_Striders = ["uns_xm706","uns_xm706e1","uns_xm706e2"];
FuMS_Mil_Tempests = ["uns_m37b1"];
FuMS_Mil_Armed_Tempests = ["uns_m37b1_m1919"];
FuMS_Mil_Zamaks = ["uns_m35A2","uns_m35A2_open"];

// Collections
FuMS_Toy_All = FuMS_Toy_Bikes + FuMS_Toy_Quads + FuMS_Toy_Karts;
FuMS_H20_All = FuMS_H20_Boats + FuMS_H20_RubberDucks+FuMS_H20_SDVs;
FuMS_Heli_ALL = FuMS_Heli_Hellcats+FuMS_Heli_Hummingbirds+FuMS_Heli_Hurons+FuMS_Heli_Mohawks+FuMS_Heli_Orcas+FuMS_Heli_Tarus;
FuMS_Plane_All = FuMS_Plane_Cessnas;
FuMS_Civ_All = FuMS_Civ_Hatchbacks + FuMS_Civ_SportHatchbacks + FuMS_Civ_Offroads + FumS_Civ_SUVs+FuMS_Civ_Vans;
FuMS_Work_All = FuMS_Work_RepairOffroads+FuMS_Work_BoxVans+FuMS_Work_FuelVans;
FuMS_Mil_Unarmed =FuMS_Mil_Hemmts + FuMS_Mil_Hunters + FuMS_Mil_Ifrits + FuMS_Mil_Tempests + FuMS_Mil_Zamaks;
FuMS_Mil_Armed = FuMS_Mil_ArmedOffroads + FuMS_Mil_Armed_Hunters + FuMS_Mil_Striders + FuMS_Mil_Armed_Tempests;
FuMS_Mil_All = FuMS_Mil_Unarmed + FuMS_Mil_Armed;
FuMS_Veh_Land = FuMS_Civ_All + FuMS_Work_All + FuMS_Mil_Unarmed;



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
	"FuMS_MyExampleGlobalVariable"
];

    
	
	
	

