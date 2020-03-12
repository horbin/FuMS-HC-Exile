// Assets.sqf
// TheOneWhoKnocks
// Overwrites the global variables used by FrSB to generate various elements of the system

// Global variables in this file are available to the AI creation and Loot creation portions of FuMS
// Any where you would normally place an item class name, one of these variables may be substituted in its place.
// When FuMS encounters one of these defined arrays, it will select one of the items from the array at random to use
// in the particular application (ie AI Uniform, loot in a box, etc).

private ["_cartContents","_cartName","_debugCart"];


///////////////////////////////////////////////////
// CART config ////////////////////////////////////
///////////////////////////////////////////////////
_cartName = "apex";
_debugCart = false;




// Some items are repeated to add a "chance" element.  The more duplicates, the higher chance of spawning, and conversely the lower for others

_cartContents = 
[	
	//////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// Uniforms ////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////
	//	I am missing the Apex uniform names, feel free to update
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	/////////////////////////////////////////////////////
	///////////// CAMS AI Models ////////////////////////
	/////////////////////////////////////////////////////
	// This whole section should be rebuilt to your content but keep the global groupings at the end
	// Just swap out your own global names
	
	/////////////// EAST
	[
		"CAMS_AI_CSAT_Pacific",1,true,
		[
			"O_T_Soldier_A_F",
			"O_T_Soldier_AAR_F",
			"O_T_Support_AMG_F",
			"O_T_Support_AMort_F",
			"O_T_Soldier_AAA_F",
			"O_T_Soldier_AAT_F",
			"O_T_Soldier_AR_F",
			"O_T_Medic_F",
			"O_T_Crew_F",
			"O_T_Engineer_F",
			"O_T_Soldier_Exp_F",
			"O_T_Soldier_GL_F",
			"O_T_Support_GMG_F",
			"O_T_Support_MG_F",
			"O_T_Support_Mort_F",
			"O_T_Helicrew_F",
			"O_T_Helipilot_F",
			"O_T_Soldier_M_F",
			"O_T_Soldier_AA_F",
			"O_T_Soldier_AT_F",
			"O_T_Officer_F",
			"O_T_Soldier_PG_F",
			"O_T_Pilot_F",
			"O_T_Soldier_Repair_F",
			"O_T_Soldier_F",
			"O_T_Soldier_LAT_F",
			"O_T_Soldier_SL_F",
			"O_T_Soldier_TL_F",
			"O_T_Soldier_UAV_F"
		]
	],	
	[
		"CAMS_AI_CSAT_Pacific_SF",1,true,
		[
			"O_T_Diver_F",
			"O_T_Diver_Exp_F",
			"O_T_Diver_TL_F",
			"O_T_Recon_Exp_F",
			"O_T_Recon_JTAC_F",
			"O_T_Recon_M_F",
			"O_T_Recon_Medic_F",
			"O_T_Recon_F",
			"O_T_Recon_LAT_F",
			"O_T_Recon_TL_F",
			"O_T_Sniper_F",
			"O_T_ghillie_tna_F",
			"O_T_Spotter_F"
		]
	],	
	[
		"CAMS_AI_Viper_Pacific",1,true,
		[
			"O_V_Soldier_ghex_F",
			"O_V_Soldier_TL_ghex_F",
			"O_V_Soldier_Exp_ghex_F",
			"O_V_Soldier_Medic_ghex_F",
			"O_V_Soldier_M_ghex_F",
			"O_V_Soldier_LAT_ghex_F",
			"O_V_Soldier_JTAC_ghex_F"
		]
	],
	[
		"CAMS_AI_Viper",1,true,
		[
			"O_V_Soldier_hex_F",
			"O_V_Soldier_TL_hex_F",
			"O_V_Soldier_Exp_hex_F",
			"O_V_Soldier_Medic_hex_F",
			"O_V_Soldier_M_hex_F",
			"O_V_Soldier_LAT_hex_F",
			"O_V_Soldier_JTAC_hex_F"
		]
	],
	[
		"CAMS_AI_ALL_E",0,false,
		[
			"CAMS_AI_CSAT_Pacific",
			"CAMS_AI_CSAT_Pacific_SF",
			"CAMS_AI_Viper_Pacific",
			"CAMS_AI_Viper"
		]
	],			
	//////////////// WEST
	[
		"CAMS_AI_NATO_Pacific",1,true,
		[
			"B_T_Soldier_A_F","B_T_Soldier_AAR_F","B_T_Support_AMG_F","B_T_Support_AMort_F","B_T_Soldier_AAA_F","B_T_Soldier_AAT_F",
			"B_T_Soldier_AR_F","B_T_Medic_F","B_T_Crew_F","B_T_Engineer_F","B_T_Soldier_Exp_F","B_T_Soldier_GL_F","B_T_Support_GMG_F",
			"B_T_Support_MG_F","B_T_Support_Mort_F","B_T_Helicrew_F","B_T_Helipilot_F","B_T_soldier_M_F","B_T_Soldier_AA_F",
			"B_T_Soldier_AT_F","B_T_Officer_F","B_T_Soldier_PG_F","B_T_Pilot_F","B_T_Soldier_Repair_F","B_T_Soldier_F",
			"B_T_Soldier_LAT_F","B_T_Soldier_SL_F","B_T_Soldier_TL_F","B_T_Soldier_UAV_F"
		]
	],	
	[
		"CAMS_AI_NATO_Pacific_SF",1,true,
		[
			"B_T_Diver_F","B_T_Diver_Exp_F","B_T_Diver_TL_F","B_T_Recon_Exp_F","B_T_Recon_JTAC_F","B_T_Recon_M_F",
			"B_T_Recon_Medic_F","B_T_Recon_F","B_T_Recon_LAT_F","B_T_Recon_TL_F","B_T_Sniper_F","B_T_Spotter_F","B_T_ghillie_tna_F"
		]
	],	[
		"CAMS_AI_CTRG",1,true,
		[
			"B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_Exp_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_M_tna_F",
			"B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Miller_F"
		]
	],
	[
		"CAMS_AI_Gendarmerie",1,true,
		[
			"B_GEN_Soldier_F","B_GEN_Commander_F"
		]
	],
	[
		"CAMS_AI_ALL_W",0,false,
		[
			"CAMS_AI_NATO_Pacific","CAMS_AI_NATO_Pacific_SF","CAMS_AI_CTRG","CAMS_AI_Gendarmerie"
		]
	],
	
	//////////////// IND
	[
		"CAMS_AI_Syndikat",1,true,
		[
			"I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F",
			"I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Camo_F","I_C_Helipilot_F","I_C_Soldier_base_unarmed_F"
		]
	],
	[
		"CAMS_AI_Bandits",1,true,
		[
			"I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_5_F",
			"I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_8_F","I_C_Pilot_F"
		]
	],
	[
		"CAMS_AI_ALL_I",0,false,
		[
			"CAMS_AI_Syndikat","CAMS_AI_Bandits"
		]
	],
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Items ///////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////


	///////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////// Explosives ///////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////


	/////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////// Weapons ////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////



	////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// VEHICLES //////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////

	// Water Vehicles - West
	[
		"CAMS_H20_Boats_W",1,false,
		[
			"B_T_Boat_Armed_01_minigun_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_W",1,false,
		[
			"B_T_Boat_Transport_01_F","B_T_Lifeboat"
		]
	],	
	[
		"CAMS_H20_ALL_W",0,true,
		[
			"CAMS_H20_Boats_W", "CAMS_H20_RubberDucks_W", "CAMS_H20_SDV_W"
		]
	],	
	
	// Water Vehicles - East
	[
		"CAMS_H20_Boats_E",1,false,
		[
			"O_T_Boat_Armed_01_hmg_F"
		]
	],
	[
		"CAMS_H20_RubberDucks_E",1,false,
		[
			"O_T_Boat_Transport_01_F","O_T_Lifeboat","O_G_Boat_Transport_01_F","O_G_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_ALL_E",0,true,
		[
			"CAMS_H20_Boats_E", "CAMS_H20_RubberDucks_E", "CAMS_H20_SDV_E"
		]
	],	
	
	// Water Vehicles - Ind
	[
		"CAMS_H20_Boats_I",1,false,
		[
		]
	],
	[
		"CAMS_H20_RubberDucks_I",1,false,
		[
			"I_C_Boat_Transport_01_F","I_C_Boat_Transport_02_F"
		]
	],
	[
		"CAMS_H20_SDV_I",1,false,
		[
			"I_SDV_01_F"
		]
	],	
	[
		"CAMS_H20_ALL_I",0,true,
		[
			"CAMS_H20_Boats_I", "CAMS_H20_RubberDucks_I", "CAMS_H20_SDV_I"
		]
	],

	[
		"CAMS_H20_ALL",0,true,
		[
			"CAMS_H20_ALL_W","CAMS_H20_ALL_E","CAMS_H20_ALL_I", "CAMS_H20_ALL_C"
		]
	],	

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////// Air Vehicles /////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_C",1,false,
		[
		]
	],	
	
	///////////////////////////////////////////////// Helicopters - West
	[
		"CAMS_Heli_Unarmed_W",1,false,
		[
			"B_T_VTOL_01_vehicle_F","B_T_VTOL_01_vehicle_blue_F","B_T_VTOL_01_vehicle_olive_F"
		]
	],
	[
		"CAMS_Heli_Armed_W",1,false,
		[
			"B_T_VTOL_01_armed_F","B_T_VTOL_01_armed_blue_F","B_T_VTOL_01_armed_olive_F"
		]
	],
	[
		"CAMS_Heli_Transport_W",1,false,
		[
			"B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F",
			"B_T_VTOL_01_infantry_F", "B_T_VTOL_01_infantry_blue_F", "B_T_VTOL_01_infantry_olive_F"
		]
	],

	///////////////////////////////////////////////// Helicopters - Civ
	[
		"CAMS_Heli_Unarmed_E",1,false,
		[
			"O_T_VTOL_02_vehicle_F","O_T_VTOL_02_vehicle_dynamicLoadout_F","O_T_VTOL_02_vehicle_F",
			"O_T_VTOL_02_vehicle_hex_F","O_T_VTOL_02_vehicle_ghex_F","O_T_VTOL_02_vehicle_grey_F"
		]
	],
	[
		"CAMS_Heli_Armed_E",1,false,
		[
		]
	],
	[
		"CAMS_Heli_Transport_E",1,false,
		[
			"O_T_VTOL_02_infantry_F","O_T_VTOL_02_infantry_dynamicLoadout_F","O_T_VTOL_02_infantry_hex_F","O_T_VTOL_02_infantry_ghex_F",
			"O_T_VTOL_02_infantry_grey_F", "O_T_VTOL_02_infantry_dynamicLoadout_F"
		]
	],
	
	/////////////////////////////////// Helicopters - Independant 
	[
		"CAMS_Heli_Unarmed_I",1,false,
		[
			"I_C_Heli_Light_01_civil_F"
		]
	],

	[
		"CAMS_Heli_Armed_I",1,false,
		[
		]
	],	
	[
		"CAMS_Heli_Transport_I",1,false,
		[
		]
	],
	
	/////////////////////////////////////// Aircraft - West
	[
		"CAMS_Plane_CAS_W",1,false,
		[
			"B_Plane_CAS_01_F","B_Plane_CAS_01_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F" // Double check where I got this from
		]
	],
	[
		"CAMS_Plane_UAV_W",1,false,
		[
			"B_T_UAV_03_F","B_T_UAV_03_dynamicLoadout_F"
		]
	],
	///////////////////////////////////// Aircraft - East
	[
		"CAMS_Plane_CAS_E",1,false,
		[
		]
	],
	[
		"CAMS_Plane_UAV_E",1,false,
		[
			"O_T_UAV_04_CAS_F","O_UAV_01_F"
		]
	],
	
	///////////////////////////////////// Aircraft - Ind
	[
		"CAMS_Plane_CAS_I",1,false,
		[
			"I_C_Plane_Civil_01_F"
		]
	],
	[
		"CAMS_Plane_UAV_I",1,false,
		[
		]
	],
	[
		"CAMS_Plane_CAS_C",1,true,
		[
			"C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"
		]
	],	


	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Land Vehicles ///////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////// Civilian Vehicles
	[
		"CAMS_Land_Car_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Offroad_C",1,false,
		[
			"C_Offroad_02_unarmed_black_F","C_Offroad_02_unarmed_blue_F","C_Offroad_02_unarmed_F","C_Offroad_02_unarmed_green_F",
			"C_Offroad_02_unarmed_orange_F","C_Offroad_02_unarmed_red_F","C_Offroad_02_unarmed_white_F"

		]
	],
	[
		"CAMS_Land_Transport_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_SUV_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Van_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Utility_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Kart_C",1,false,
		[
		]
	],
	[
		"CAMS_Land_Work_C",0,true,
		[
			"CAMS_Land_Car_C", "CAMS_Land_Offroad_C", "CAMS_Land_Van_C"
		]
	],	
	[
		"CAMS_Land_Truck_C",0,true,
		[
			"CAMS_Land_Offroad_C", "CAMS_Land_Transport_C", "CAMS_Land_SUV_C", "CAMS_Land_Van_C"
		]
	],
	[
		"CAMS_Land_ALL_C",0,true,
		[
			"CAMS_Land_Work_C", "CAMS_Land_Truck_C"
		]
	],	


	////////////////////////////////////////////////////// West Vehicles
	[
		"CAMS_Land_ArmedOffroad_W",1,false,
		[
			"B_T_LSV_01_armed_F","B_T_LSV_01_AT_F","B_T_LSV_01_armed_CTRG_F","B_LSV_01_armed_F","B_LSV_01_AT_F",
			"B_LSV_01_armed_black_F","B_LSV_01_armed_olive_F","B_LSV_01_armed_sand_F","B_T_LSV_01_armed_black_F",
			"B_T_LSV_01_armed_olive_F","B_T_LSV_01_armed_sand_F","B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F"
		
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_W",1,false,
		[
			"B_T_LSV_01_unarmed_F","B_T_LSV_01_unarmed_CTRG_F","B_LSV_01_unarmed_F","B_CTRG_LSV_01_light_F",
			"B_LSV_01_unarmed_black_F","B_LSV_01_unarmed_olive_F","B_LSV_01_unarmed_sand_F","B_T_LSV_01_unarmed_black_F",
			"B_T_LSV_01_unarmed_olive_F","B_T_LSV_01_unarmed_sand_F","B_T_MRAP_01_F","B_GEN_Offroad_01_gen_F"
		
		]
	],
	[
		"CAMS_Land_UGV_Armed_W",1,false,
		[
			"B_T_UGV_01_rcws_olive_F"		
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_W",1,false,
		[
			"B_T_UGV_01_olive_F"		
		]
	],
	[
		"CAMS_Land_Quad_W",1,false,
		[
			"B_T_Quadbike_01_F"
		]
	],
	[
		"CAMS_Land_Transport_W",1,false,
		[
			"B_T_Truck_01_transport_F","B_T_Truck_01_covered_F"			
		]
	],
	[
		"CAMS_Land_UtilityVehicle_W",1,false,
		[
			"B_T_Truck_01_mover_F","B_T_Truck_01_box_F",
			"B_T_Truck_01_Repair_F","B_T_Truck_01_ammo_F","B_T_Truck_01_fuel_F","B_T_Truck_01_medical_F" 		
		]
	],
	[
		"CAMS_Land_ArmedTransport_W",1,false,
		[
			"B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_CRV_F","B_T_APC_Tracked_01_rcws_F","B_T_APC_Tracked_01_AA_F"

		]
	],
	[
		"CAMS_Land_Tank_W",1,false,
		[
			"B_T_MBT_01_cannon_F","B_T_MBT_01_TUSK_F"		
		]
	],
	[
		"CAMS_Land_Artillery_W",1,false,
		[
			"B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"		
		]
	],
	[
		"CAMS_Land_Transport_ALL_W",0,true,
		[
			"CAMS_Land_Transport_W", "CAMS_Land_ArmedTransport_W"
		]
	],
	[
		"CAMS_Land_Unarmed_W",0,true,
		[
			"CAMS_Land_UnarmedOffroad_W", "CAMS_Land_Transport_W"
		]
	],
	[
		"CAMS_Land_Armed_W",0,true,
		[
			"CAMS_Land_ArmedOffroads_W", "CAMS_Land_ArmedTransport_W"
		]
	],
	[
		"CAMS_Land_ALL_W",0,true,
		[
			"CAMS_Land_Unarmed_W", "CAMS_Land_Armed_W"
		]
	],

	//////////////////////////////////////// EAST Vehicles
	[
		"CAMS_Land_ArmedOffroad_E",1,false,
		[
			"O_G_Offroad_01_armed_F",

			"O_T_LSV_02_armed_F","O_T_LSV_02_armed_viper_F","O_T_LSV_02_AT_F","O_LSV_02_armed_F","O_LSV_02_armed_viper_F","O_LSV_02_AT_F",
			"O_T_LSV_02_armed_black_F","O_T_LSV_02_armed_ghex_F","O_T_LSV_02_armed_arid_F","O_LSV_02_armed_black_F","O_LSV_02_armed_ghex_F",
			"O_LSV_02_armed_arid_F","O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F"		
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_E",1,false,
		[
			"O_G_Offroad_01_F",
			
			"O_T_LSV_02_unarmed_F","O_T_LSV_02_unarmed_viper_F","O_LSV_02_unarmed_F","O_LSV_02_unarmed_viper_F","O_T_LSV_02_unarmed_black_F",
			"O_T_LSV_02_unarmed_ghex_F","O_T_LSV_02_unarmed_arid_F","O_LSV_02_unarmed_black_F","O_LSV_02_unarmed_ghex_F","O_LSV_02_unarmed_arid_F"
		
		]
	],
	[
		"CAMS_Land_UGV_Armed_E",1,false,
		[
			"O_T_UGV_01_rcws_ghex_F"		
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_E",1,false,
		[
			"O_T_UGV_01_ghex_F"		
		]
	],
	[
		"CAMS_Land_Quad_E",1,false,
		[
			"O_G_Quadbike_01_F","O_T_Quadbike_01_ghex_F"		
		]
	],

	[
		"CAMS_Land_Transport_E",1,false,
		[
			"O_G_Van_01_transport_F",
			
			"O_T_MRAP_02_ghex_F","O_T_Truck_02_F","O_T_Truck_02_transport_F","O_T_Truck_03_covered_ghex_F",
			"O_T_Truck_03_transport_ghex_F","O_G_Van_02_transport_F","O_G_Van_02_vehicle_F"		
		]
	],
	[
		"CAMS_Land_UtilityVehicle_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_ArmedTransport_E",1,false,
		[
			"O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F","O_T_APC_Tracked_02_AA_ghex_F"
	
		]
	],
	[
		"CAMS_Land_Tank_E",1,false,
		[
			"O_T_MBT_02_cannon_ghex_F"		
		]
	],
	[
		"CAMS_Land_AA_E",1,false,
		[
		]
	],	
	[
		"CAMS_Land_Artillery_E",1,false,
		[
			"O_T_MBT_02_arty_ghex_F"
		
		]
	],
	[
		"CAMS_Land_Transport_ALL_E",0,true,
		[
			"CAMS_Land_Transport_E", "CAMS_Land_ArmedTransport_E"
		]
	],
	[
		"CAMS_Land_Unarmed_E",0,true,
		[
			"CAMS_Land_UnarmedOffroad_E", "CAMS_Land_Transport_E"
		]
	],	
	[
		"CAMS_Land_Armed_E",0,true,
		[
			"CAMS_Land_ArmedOffroad_E", "CAMS_Land_ArmedTransport_E"
		]
	],	
	[
		"CAMS_Land_ALL_E",0,true,
		[
			"CAMS_Land_Unarmed_E", "CAMS_Land_Armed_E"
		]
	],

	/////////////////////////////////////////////////////// Guerilla Vehicles
	[
		"CAMS_Land_ArmedOffroad_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_UnarmedOffroad_I",1,false,
		[
			"I_C_Offroad_02_unarmed_F","I_C_Offroad_02_unarmed_brown_F","I_C_Offroad_02_unarmed_olive_F"		
		]
	],
	[
		"CAMS_Land_UGV_Armed_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_UGV_Unarmed_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Quad_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_Transport_I",1,false,
		[
			"I_C_Van_01_transport_F","I_C_Van_01_transport_brown_F","I_C_Van_01_transport_olive_F"		
		]
	],
	[
		"CAMS_Land_UtilityVehicle_I",1,false,
		[
			"O_G_Van_01_fuel_F","O_Truck_03_repair_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F",
			"O_T_Truck_03_repair_ghex_F","O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_medical_ghex_F",
			"O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F",
			
			"O_T_Truck_02_Ammo_F","O_T_Truck_02_Box_F","O_T_Truck_02_fuel_F","O_T_Truck_02_Medical_F"		
		]
	],
	[
		"CAMS_Land_ArmedTransport_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Tank_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Transport_ALL_I",0,true,
		[
			"CAMS_Land_Transport_I", "CAMS_Land_ArmedTransport_I"
		]
	],
	[
		"CAMS_Land_Unarmed_I",0,true,
		[
			"CAMS_Land_UnarmedOffroad_I", "CAMS_Land_Transport_I"
		]
	],	
	[
		"CAMS_Land_Armed_I",0,true,
		[
			"CAMS_Land_ArmedOffroad_I", "CAMS_Land_ArmedTransport_I"
		]
	],	
	[
		"CAMS_Land_ALL_I",0,true,
		[
			"CAMS_Land_Unarmed_I", "CAMS_Land_Armed_I"
		]
	],

	//////////////////////////////////////////// Static Guns - West
	[
		"CAMS_Land_StaticGuns_W",1,false,
		[
			"B_T_HMG_01_F"		
		]
	],
	[
		"CAMS_Land_StaticGL_W",1,false,
		[
			"B_T_GMG_01_F        "		
		]
	],
	[
		"CAMS_Land_StaticAA_W",1,false,
		[
			"B_T_Static_AA_F"		
		]
	],
	[
		"CAMS_Land_StaticAT_W",1,false,
		[
			"B_T_Static_AT_F"		
		]
	],
	[
		"CAMS_Land_Mortar_W",1,false,
		[
			"B_T_Mortar_01_F"		
		]
	],

	//////////////////////////////////////////// Static Guns - East
	[
		"CAMS_Land_StaticGuns_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAA_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_E",1,false,
		[
		]
	],
	[
		"CAMS_Land_Mortar_E",1,false,
		[
			"O_G_Mortar_01_F"				
		]
	],

	//////////////////////////////////////////// Static Guns - Ind
	[
		"CAMS_Land_StaticGuns_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticGL_I",1,false,
		[
		]
	],
			
	[
		"CAMS_Land_StaticAA_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_StaticAT_I",1,false,
		[
		]
	],
	[
		"CAMS_Land_Mortar_I",1,false,
		[
		]
	]
];




/////////////////////////////
// Cart processing //////////
/////////////////////////////
////////////////////////  NEW for today

_hold = [_cartName,_cartContents,_debugCart] spawn CAMS_fnc_loadCart;
if (isNil "_hold") exitWith { diag_log format ["[CAMS:%1] Cart(%2): assets.sqf: ERROR in cart loading function",CAMS_Version,_cartName];CAMS_isStable=false;};
waitUntil { ScriptDone _hold};
//["CAMS System",format ["Cart:%1 assets loaded",_cartName]] spawn Haz_fnc_createNotification;