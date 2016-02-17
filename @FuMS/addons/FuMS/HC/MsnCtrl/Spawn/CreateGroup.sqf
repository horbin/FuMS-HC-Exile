//HC_CreateGroup.sqf
// Horbin
// 12/26/2014
//INPUTS::Group, Position,  array of #units and type (see SpawnSoldier for format), Theme Index
// [group, pos, partycomp, themeindex]
//RETURNS:: group created
// Note:   group must remain in scope to maintain proper interaction with players.
//SpawnSoldier = compile preprocessFileLineNumbers "HC\Encounters\AI_Logic\SpawnSoldier.sqf"; 

private ["_partycomp","_group","_unit","_i","_pos","_partysize","_typesoldier","_themeIndex"];
_group = _this select 0;
_pos = _this select 1;
_partycomp = _this select 2;
_themeIndex = _this select 3;
//diag_log format ["<FuMS> HC_Create Group: _group:%1  _pos:%2  _partycomp:%3",_group, _pos, _partycomp];
{
    _partySize = _x select 0;
    _typesoldier = _x select 1;
    for [{_i=0},{ _i<_partySize}, {_i=_i+1}] do
    {
        _unit = [_group, _typesoldier, _pos, _themeIndex] call FuMS_fnc_HC_AI_SpawnSoldier;
        [_unit] join _group;
    };
} foreach _partycomp;

//Notify server of new group so it will perform clean up on an HC disconnect.
if (!isServer) then
{
    ["AIGroups",_group] call FuMS_fnc_HC_Util_HC_AddObject;   
};
// Return the Group of soldiers!
_group