// FindNearestRoad = // if no roads found within 2500m the original position is returned!
// Horbin
// 2/24/15
// Inputs: position
// Outputs position on the nearest road within 2500m of 'position'

private ["_stepdistance","_nearRoads","_pos","_return"];
_pos = _this select 0;
_stepdistance = 20;
_nearRoads = [];  
while {count _nearRoads == 0} do // while no road segemetns found, continue searching out further!
{
    _nearRoads = _pos nearRoads _stepdistance;
    _stepdistance = _stepdistance + _stepdistance;
    if (_stepdistance > 2500) exitWith
    {
        diag_log format ["<FuMS:%2> FindNeareastRoad: Unable to find a road near near position %1",_pos, FuMS_Version];
        _nearRoads = _pos nearRoads 9000;
    };
};
_return = _nearRoads call BIS_fnc_selectRandom;

//diag_log format ["<FuMS> FindNearestRoad: _nearRoads: %1",_nearRoads];
//diag_log format ["<FuMS> FindNearestRoad: _return: %1",_return];

if (!isnil "_return") then{    _pos = getPos _return;};
_pos
