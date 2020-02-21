//PlayerWatchControlLoop.sqf
// Horbin
// 10/27/15
/*
diag_log format ["**************##### List of Sounds #####"];
_cfg = (configFile >> "cfgSounds") call Bis_fnc_getCFGSubClasses;;
for "_i" from 0 to (count _cfg) -1 do
{    
    diag_log format ["%1", _cfg select _i ];
};
*/


private ["_player","_playerID","_themeIndex","_missionFileName","_dataFromServer","_pos","_msnTag","_var","_testDat"];
_player = _this select 0;
_playerID = _this select 1;
_themeIndex = 500+_playerID;

_player setVariable ["FuMS_PlayerWatch", true];
//_zombieMod = 

private ["_useChasePos","_inAirVehicle","_inLandVehicle","_inWaterVehicle","_inWater","_nearRoads","_roadList","_nearTown","_buildingList",
"_nearSpawnZone","_nearSafeZone","_nearTerritory","_inOwnTerritory","_maximumTerritoryRadius","_constructionConfig","_canBuildHereResult",
"_minimumDistanceToSpawnZone","_minimumDistanceToTraderZone"];
_useChasePos = false;
_inAirVehicle = false;
_inLandVehicle = false;
_inWaterVehicle = false;
_inWater = false;
_nearRoads = false;
_roadList = [];
_neartown = false;
_buildinglist = [];
_nearSpawnZone = false;
_nearSafeZone = false;
_nearTerritory = false;
_nearMilitary = false;
_inOwnTerritory = false;


// Used to find military locations
// Find military locations
	
FuMS_Military_buildings = 	[	"Land_TentHangar_V1_F","Land_Hangar_F","Land_Airport_Tower_F","Land_Cargo_House_V1_F",
                                "Land_Cargo_House_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F",
                                "Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_i_Barracks_V1_F","Land_Cargo_Patrol_V1_F",
                                "Land_Cargo_Patrol_V2_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F",
                                "Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F",
                                "Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_MilOffices_V1_F",
                                "Land_Radar_F","Land_budova4_winter","land_hlaska","Land_Vysilac_FM","land_st_vez","Land_ns_Jbad_Mil_Barracks",
                                "Land_ns_Jbad_Mil_ControlTower","Land_ns_Jbad_Mil_House","land_pozorovatelna","Land_vys_budova_p1",
                                "Land_Vez","Land_Mil_Barracks_i","Land_Mil_Barracks_L","Land_Mil_Barracks",
                                "Land_Hlidac_budka","Land_Ss_hangar","Land_Mil_ControlTower","Land_a_stationhouse",
                                "Land_Farm_WTower","Land_Mil_Guardhouse","Land_A_statue01","Land_A_Castle_Gate",
                                "Land_A_Castle_Donjon","Land_A_Castle_Wall2_30","Land_A_Castle_Stairs_A",
                                "Land_i_Barracks_V1_dam_F","Land_Cargo_Patrol_V3_F","Land_Radar_Small_F","Land_Dome_Big_F",
                                "Land_Dome_Small_F","Land_Army_hut3_long_int","Land_Army_hut_int","Land_Army_hut2_int",
                                // Additional Buildings
                                "Land_Barracks_01_camo_F","Land_Barracks_01_grey_F","land_AII_last_floor","land_AII_middle_floor",
                                "land_AII_upper_part","Land_Ind_IlluminantTower","Land_Misc_deerstand","Land_ns_Jbad_A_Stationhouse",
                                "Land_Airport_01_controlTower_F","Land_Airport_01_terminal_F","Land_Airport_02_controlTower_F",
                                "Land_Airport_02_terminal_F","Land_Cargo_House_V4_F","Land_Cargo_HQ_V4_F","Land_Cargo_Patrol_V4_F",
                                "Land_Cargo_Tower_V4_F"
                            ]; 
/*
							FuMS_MilitaryList = [];
{
	_currentBuilding = _x;
	_foundBuilding = FuMS_MapCenter nearObjects [_currentBuilding, 30000];
	{
		_pos = position _x;
		FuMS_MilitaryList pushBack _foundBuilding;
		// diag_log format ["<FuMS> FuMsnInit: Added building: %1 (object: %3) found at location: %2 @ ",_currentBuilding,_pos,_x];

	}forEach _foundBuilding;

}forEach FuMS_Military_buildings;
*/

// ExileTerritoryBuildRights is var on the flag that contains UID's of players that can build/own 
// ExileTerritoryModerators
// ExileOwnerUID
// ExileTerritoryLevel
// ExileTerritoryName
// ExileTerritorySize

/*
_buildRights = _flags getVariable ["ExileTerritoryBuildRights",[]];
if((getPlayerUID _playerObject) in _buildRights)then
{
    //can build here!
};

*/


// GET '_missionFileName'
// is player in air vehicle						
if (vehicle _player iskindof "AIR") then{_inAirVehicle=true;};
//Is player over water 
if (surfaceIsWater (position _player)) then {_inWater=true;};
// player is in a vehicle
if !(vehicle _player iskindof "Man") then {_inLandVehicle = true;};	
// this could be incorrect if player was in a car being carried by a helo...but ahhhh well.
if (_inWater and _inLandVehicle) then {_inLandVehicle=false; _inWaterVehicle=true;};					

//diag_log format ["<FuMS> PlayerWatchControlLoop trader zones:%1",exiletraderzonemarkerpositions];
//diag_log format ["<FuMS> PlayerWatchControlLoop spawn zones:%1", exilespawnzonemarkerpositions];  

//Is player in a territory
_maximumTerritoryRadius = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToOtherTerritories");
//diag_log format ["<FuMS> PlayerWatchControlLoop max Territory Radius:%1", _maximumTerritoryRadius];      
_nearTerritory = [getPos _player, _maximumTerritoryRadius] call ExileClient_util_world_isTerritoryInRange;
//diag_log format ["<FuMS> PlayerWatchControlLoop Near a Territory = %1", _nearTerritory];      

//Is player in his own territory!
_flagList = _player nearObjects ["Exile_Construction_Flag_Static",_maximumTerritoryRadius];
//diag_log format ["<FuMS> PlayerWatchControlLoop Flags within range of %2: %1", _flagList, _maximumTerritoryRadius];      
{
    _buildRights = _x getVariable ["ExileTerritoryBuildRights",[]];
    if ((getplayerUID _player) in _buildRights) exitWith {_inOwnTerritory = true;};
}foreach _flagList;
//diag_log format ["<FuMS> PlayerWatchControlLoop _inOwnTerritory = %1",_inOwnTerritory];

//Is player in a spawn zone!
{
    if (_x distance2d _player < 325) exitWith {_nearSpawnZone = true;};       
}foreach exilespawnzonemarkerpositions;


//Is player in a trader zone!
{
    if (_x distance2d _player < 325) exitWith {_nearSafeZone = true;};   
}foreach exiletraderzonemarkerpositions;

//Are zombies enabled
//if (FuMS_ZnDs) then {//zombie mod installed};				

//diag_log format ["<FuMS> PlayerWatchControlLoop Buildings within 50m: %1", _buildinglist];      
_buildinglist = _player nearObjects ["House",50];
//Is player near a town
if (count _buildinglist > 6) then {_neartown = true;};					
//diag_log format ["<FuMS> PlayerWatchControlLoop Buildings within 50m: %1", _buildinglist];      
//diag_log format ["<FuMS> PlayerWatchControlLoop Number of Buildings: %1", count _buildinglist];      

//Is player near a road					
_roadList = _player nearRoads 50;
//diag_log format ["<FuMS> PlayerWatchControlLoop : _roadList: #:%2 = %1",_roadList, count _roadList];
if (!isNil "_roadList") then
{
    if (count _roadList > 0) then 
    {
        _nearRoads = true;
    };
};

//if (_nearSafeZone) exitWith{};
_msnOption = 0;
while {true} do
{
    if (_nearSafeZone) exitWith {_msnOption = 0;};
    if (_inOwnTerritory) exitWith {_msnOption = 1;};
    if (_nearTerritory) exitWith {_msnOption = 2;};
    if (_inAirVehicle) exitWith {_msnOption = 3;};
    if (_inLandVehicle) exitWith {_msnOption = 4;};
    if (_inWaterVehicle) exitWith {_msnOption = 5;};
    if (_inWater) exitWith {_msnOption = 6;};
    if (_nearSpawnZone) exitWith { _msnOption = 7;};
    if (_neartown) exitWith {_msnOption = 8;};
    if (_nearRoads) exitWith {_msnOption = 9;};
    if (true) exitWith {_msnOption = 10;};	
};

//diag_log format ["<FuMS> PlayerWatchControlLoop: Player Missions:%1",FuMS_PlayerWatch_Configuration];
//diag_log format ["<FuMS> PlayerWatchControlLoop: Player Mission Option:%1",_msnOption];
_missionFileName = (FuMS_PlayerWatch_Configuration select _msnOption) call BIS_fnc_SelectRandom;

//diag_log format ["<FuMS> PlayerWatchControlLoop: Mission List:%1",FuMS_PlayerWatch_Configuration select _msnOption];
//diag_log format ["<FuMS> PlayerWatchControlLoop: Mission selected:%1",_missionFileName];

if !(toupper _missionFileName == "NONE") then
{
	//FuMS_GroupCount set [ _themeIndex, 0 ]; // set this themes group count to zero.
	FuMS_BodyCount set [_themeIndex, 0];
	FuMS_Trigger_ZupaCapture set [_themeIndex,false];

	while {!(FuMS_ServerFPS > FuMS_FPSMinimum and !FuMS_Mission_is_Starting)} do
	{
		uisleep 5;
	//  diag_log format ["<FuMS>: ControlLoop: waiting on server FPS: to become greater than :%2 and other missions to complete loading", FuMS_ServerFPS, FuMS_FPSMinimum];
	};

	FuMS_Mission_is_Starting = true;
	// if 1st time, initialize the master theme data
	_testDat = count FuMS_THEMEDATA;
	if (_testDat < _themeIndex) then
	{
		private ["_nextIndex"];
		_nextIndex = _themeIndex;
		FuMS_THEMEDATA set [_nextIndex, FUMS_THEMEDATA select 0];
		FuMS_LOOTDATA set [_nextIndex, FUMS_LOOTDATA select 0];
		FuMS_SOLDIERDATA set [_nextIndex, FUMS_SOLDIERDATA select 0];
		FuMS_ListofMissions set [ _nextIndex, FuMS_ListofMissions select 0];
	};

    _dataFromServer = [0,_missionFileName] call FuMS_fnc_HC_MsnCtrl_Util_PullData;
    if ( !(count _dataFromServer > 0) ) exitWith
    { 
        FuMS_Mission_is_Starting = false;
        diag_log format ["##ControlLoop: Theme: PLAYERWATCH : HC:%2 skipped mission %1 check your Server .rpt file.", _missionFileName, FuMS_ThemeControlID];
    };    
    
    //get location for player mission
    //  _pos = [_dataFromServer, _themeIndex, _missionFileName] call FuMS_fnc_HC_MsnCtrl_Util_GetSafeMissionSpawnPos; 
    _pos = GetPosATL _player;
    // if player in a vehicle, need to spawn encounter out in front of them so they dont' 'blow' by it.
    if (vehicle _player != _player) then
    {
        // get their speed
        _velocity = velocity _player;
        // set spawn location to be 5 seconds in front of them.
        _newX = (_velocity select 0) * 8;
        _newY = (_velocity select 1) * 8 ;
    //    diag_log format ["<FuMS> PlayerWatchControlLoop: Vehicle speed:%1, _newX:%2, _newY:%3",_velocity,_newX, _newY];
        // if vehicle is stationary or moving very slow
        
        if (_newX < 100 and _newY < 100) then {_newX = 100;_newY=100;};
        // do not place location further than 500m in front of player.
        if (_newX > 500) then {_newX = 500;};
        if (_newY > 500) then {_newY = 500;};

        _pos set [0, _newX + (_pos select 0)];
        _pos set [1, _newY + (_pos select 1)];
     //   diag_log format ["<FuMS> PlayerWatchControlLoop: _player pos:%1  Mission pos:%2",getPosATL _player, _pos];        
    };
    
    [_dataFromServer,[_pos, ["PlayerWatch",-1], _themeIndex, ""], [0,"PARENT",0,"ROOT"]] spawn FuMS_fnc_HC_MsnCtrl_NewLogicBomb;
    
    FuMS_Mission_is_Starting = false;
    _msnTag = format ["FuMS_%1_%2_%3",_themeIndex,0,0];       
    waitUntil
    {            
        _var = missionNamespace getVariable (format ["%1_MsnStatus",_msnTag]);            
        (!isNil "_var")
    };    
    // if MsnStatus is 'dead' at this point it was set by the previous mission. So wait until THIS mission changes the status to something other than DEAD!
    //  diag_log format ["<FuMS> ControlLoop: %1_MsnStatus defined with value of %2. Waiting for mission to start.",_msnTag, _var];
    waitUntil
    {			
        _var = missionNamespace getVariable (format ["%1_MsnStatus",_msnTag]);            
        ( (_var select 0) != "DEAD")
    };
    waitUntil
    {      
        // use _useChasePos in place of _pos for airborne encounters
        
        if (_player distance _pos > FuMS_PlayerWatch_DespawnRange) then
        {
            // kill mission
            missionNamespace setVariable [format ["%1TGR_FuMS_KillMe",_msnTag], true];
        };
        _var = missionNamespace getVariable (format ["%1_MsnStatus",_msnTag]);
        ( (_var select 0) == "DEAD")
    };
};
_player setVariable ["FuMS_PlayerWatch", false];



    
    