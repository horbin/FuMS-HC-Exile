 //GetSafeMissionSpawnPos.sqf
 // Horbin
 // 4/2/2015
 // Inputs: mission data, themeIndex, 
// Mission file settings that affect _pos determination:
//  "NONE" - no checking for water/land proximity is made
// "LAND" - mission is a land mission, will attempt to place entire 'encounter radius' in land
// "WATER" - mission is a water mission, will attempt to place entire 'encounter radius' in water
private ["_minRange","_waterMode","_terrainGradient","_shoreMode","_encounterRadius","_missionData","_themeIndex","_MAXATTEMPTS",
                "_pos","_locType","_attempts","_folksHome","_playerList","_plotPoleList","_missionName","_goodPos"];
_missionData = _this select 0;
_themeIndex = _this select 1;
_missionName = _this select 2;

_MAXATTEMPTS = 15;  // number of attempts conducted before settling on a possible poor location.
 
// Basic random location generation
_minRange = 0;
_waterMode = 0; // 0=no, 1=either, 2=water only
_terrainGradient = 2; // 10=mountains, 4= fairly hilly, 1=flat
_shoreMode = 0; // 0=either, 1= shore only

// uncomment to force 'random' encounters to cluster for testing!
                   // FuMS_MapCenter = [23525, 19325];
                   // FuMS_MapRange = 200;
                    _pos = [FuMS_MapCenter, _minRange, FuMS_MapRange, _minRange, _waterMode, _terrainGradient, 
                    _shoreMode, FuMS_BlackList, FuMS_Defaultpos] call BIS_fnc_findSafePos;   

// determine if it should be a land or water position from the mission file
//diag_log format ["##GetSafeMissionSpawnPos: _missionData:%1",_missionData];

_locType = toupper ((_missionData select 0) select 2);
_encounterRadius = (_missionData select 0) select 1;

if (isNil "_locType") then { _locType = "NONE";};
switch (_locType) do
{
    case "LAND":
    {
        _waterMode = 0;
        _shoreMode = 0;
    };
    case "WATER":
    {
        _waterMode = 2;
    };
};
_goodPos = false;
_attempts = _MAXATTEMPTS;
while {_attempts > 0 and !_goodPos} do
{
      _pos = [FuMS_MapCenter, _minRange, FuMS_MapRange, _minRange, _waterMode, _terrainGradient, 
                    _shoreMode, FuMS_BlackList, FuMS_Defaultpos] call BIS_fnc_findSafePos;   
    
    // search the encounter radius for live players.
    _folksHome = false;
    _playersNear = _pos nearEntities _encounterRadius;
    {
        if (isPlayer _x and alive _x) exitWith {_folksHome=true;diag_log format ["<FuMS> GetSafeMissionSpawnPos: Player :%1 within range of mission spawn %2",_x,_pos];};
    }foreach _playersNear;
    // search for overlapping encounters
    {
        private ["_dist"];       
        // if distance between centers of two encounters are less than the sum of their radii they overlap.
        _dist = _pos distance (_x select 0);
        if (_dist < (_encounterRadius + (_x select 1) )   ) exitWith {_folksHome=true;diag_log format ["<FuMS> GetSafeMissionSpawnPos: Another mission: %1 too close.",_x select 2];};
    }foreach FuMS_MissionTerritory; // [_eCenter, _radius, "ThemeMissionname"]
    if (!_folksHome) then
    {
        if (_waterMode == 0) then
        {
            // check that the pos passes PlotPole safetey.
          //  diag_log format ["##GetSafeMissionSpawnPos: ""LAND"" Checking for plot poles within %1m of %2",_encounterRadius, _pos];
            _folksHome = false;
			
			_maximumTerritoryRadius = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToOtherTerritories");
			_nearTerritory = [_pos, _maximumTerritoryRadius] call ExileClient_util_world_isTerritoryInRange;
			
            
            if (_nearTerritory ) then // find a plot pole, check for players at home or base raiding.
            {
                diag_log format ["<FuMS> GetSafeMissionSpawnPos: Territory located near %1",_pos]; 
				_plotPoleList = nearestObjects [_pos, ["Exile_Construction_Flag_Static"], _encounterRadius];
				
                {
                    _playerList = _x nearEntities ["Man",_encounterRadius];
                    diag_log format ["<FuMS> GetSafeMissionSpawnPos: Players located:%1",_playerList];   
                    if (count _playerList > 0) exitwith {_folksHome = true;}; // plot pole, but  players home!
                }foreach _plotPoleList;           
            };
            if (!_folksHome) then // No one home, position is good wrt PlotPole and players.
            {
                // check in cardinal directions and 3rds for land.
                private ["_xx","_yy","_rad","_isSafe","_i","_rng"];
                _xx = _pos select 0;
                _yy = _pos select 1;
                _rad = _encounterRadius / 3;
                _isSafe = true;
                for [{_i=1},{_i < 4},{_i=_i+1}] do
                {        
                    _rng = _i * _rad;
                    if (surfaceIsWater [_xx+_rng, _yy]) exitwith {_isSafe = false;};
                    if (surfaceIsWater [_xx-_rng, _yy]) exitwith {_isSafe = false;};
                    if (surfaceIsWater [_xx, _yy+_rng]) exitwith {_isSafe = false;};
                    if (surfaceIsWater [_xx, _yy-_rng]) exitwith {_isSafe = false;};
                };
                if (!_isSafe) then {diag_log format ["<FuMS> GetSafeMissionSpawnPos: %1 not good, water found %2m's away",_pos,_rng];};
                if (_isSafe) exitWith {_goodPos = true;};
            };    
        };    
        if (_waterMode == 2) then
        {
            // check that the pos passes PlotPole safetey....no promise someone didn't build a water base!
            //diag_log format ["##GetSafeMissionSpawnPos: ""WATER"" Checking for plot poles within %1m of %2",_encounterRadius, _pos];
            _folksHome = false;
            _plotPoleList = nearestObjects [_pos, ["Exile_Construction_Flag_Static"], _encounterRadius];
            if (count _plotPoleList != 0 ) then // find a plot pole, check for players at home or base raiding.
            {
                diag_log format ["<FuMS> GetSafeMissionSpawnPos: Plotpoles located:%1",_plotPoleList];           
                {
                    _playerList = _x nearEntities ["Man",_encounterRadius];
                    diag_log format ["<FuMS> GetSafeMissionSpawnPos: Players located:%1",_playerList];   
                    if (count _playerList > 0) exitwith {_folksHome = true;}; // plot pole, but  players home!
                }foreach _plotPoleList;           
            };
            if (!_folksHome) then // No one home, position is good wrt PlotPole and players.
            {
                // check in cardinal directions and 3rds for land.
                private ["_xx","_yy","_rad","_isSafe","_i","_rng"];
                _xx = _pos select 0;
                _yy = _pos select 1;
                _rad = _encounterRadius / 3;
                _isSafe = true;
                for [{_i=0},{_i < 3},{_i=_i+1}] do
                {        
                    _rng = _i * _rad;
                    if (!surfaceIsWater [_xx+_rng, _yy]) exitwith {_isSafe = false;};
                    if (!surfaceIsWater [_xx-_rng, _yy]) exitwith {_isSafe = false;};
                    if (!surfaceIsWater [_xx, _yy+_rng]) exitwith {_isSafe = false;};
                    if (!surfaceIsWater [_xx, _yy-_rng]) exitwith {_isSafe = false;};
                };
                if (!_isSafe) then {diag_log format ["<FuMS> GetSafeMissionSpawnPos: %1 not good, land found %2m's away",_pos,_rng];};
                if (_isSafe) exitWith {_goodPos = true;};
            };    
        };   
    };
    _attempts = _attempts - 1;
};
if (!_goodPos) then { diag_log format ["<FuMS> GetSafeMissionSpawnPos: No good position found for %1 after %2 attempts. Using location:%3",_missionName,_MAXATTEMPTS,_pos];}
else 
{
    //diag_log format ["<FuMS> GetSafeMissionSpawnPos: Good position %2 found with %1 attempts remaining.",_attempts,_pos];
};
_pos					

