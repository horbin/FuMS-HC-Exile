///////////////////////////////////////////////////////////////////////
// MapImmersion.sqf
///////////////////////////////////////////////////////////////////////
// Written by TheOneWhoKnocks
// 3/14/2020
// Will perform map immersion by replacing specified buildings with others from the add-ons

_swapArray = missionNameSpace getvariable ["ImFX_BuildingSwap",[]];


/*
[
	["Land_wpp_Turbine_V1_F","Land_WX_Windmill",180],
	["Land_Chapel_Small_V2_F","LAND_CSJ_pagoda2",90],
	["Land_Pier_small_F","Land_Nav_Boathouse_PierT",90],
	["Land_i_House_Small_03_V1_F","Land_dum_istan3_pumpa",180],
	["Land_i_Shed_Ind_F","Land_SM_01_shed_F",90],
	["Land_GarbageBarrel_01_F","LAND_barel6",90],
	["Land_GarbageBarrel_01_english_F","wx_barrel05",90],
	["Land_MetalBarrel_F","LAND_barel5",90],
	["Land_MetalBarrel_empty_F","Barel",90],
	["Land_BarrelSand_F","wx_barrel01",90],
	["Land_BarrelSand_grey_F","wx_barrel03",90],
	["Land_i_Stone_HouseBig_V1_F","Land_raz_hut07",270],
	["Land_i_Stone_HouseSmall_V1_F","land_indo_hut_1",270],
	["Land_i_Stone_Shed_V1_F","Land_raz_hut06",0],

	["Land_i_Stone_HouseBig_V2_F","Land_raz_hut05",270],
	["Land_i_Stone_Shed_V3_F","Land_raz_hut03",270],

	["Land_i_Stone_HouseSmall_V3_F","Land_raz_hut05",0]
];
*/

_mapCenter = [worldSize / 2, worldsize / 2, 100]; 

{	
	_origBuild = _x select 0;
	_newBuild = _x select 1;
	_dirMod = _x select 2;
	
	_sites = nearestObjects [_mapCenter, [_origBuild], 30000,false];  
	{ 
		_tempPos = getPosATL _x; 
		_tempVec = vectorDir _x; 
		_tempUp = vectorUp _x; 
		_tempDir = getDir _x + _dirMod; 
		hideObjectGlobal _x; 
	   
		_bldg = createVehicle [ _newBuild, _tempPos,[],0,"CAN_COLLIDE"]; 
		_bldg setDir _tempdir; 
			  
	}foreach _sites;
}forEach _swapArray;

diag_log "<FuMS> MapImmersion system complete!";