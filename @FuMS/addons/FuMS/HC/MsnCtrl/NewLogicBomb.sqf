//NewLogicBomb.sqf
// Horbin
// 6/21/2015
// Inputs:
private ["_eCenter","_missionTheme","_missionArea","_markers","_curMission","_mkr1","_mkr2","_initData","_silentspawn",
"_notifications","_lootConfig","_buildingData","_groupData","_vehicleData","_encounterSize","_triggerData",
"_buildings","_groups","_vehicles","_convoys","_themeIndex",
"_missionNameOverride","_passthroughData","_boxes","_dat","_positionOffset","_startScript","_endScript","_customData","_relation",
"_lineage","_generation","_relation","_offspringID","_parentName","_msnTag"];

_initData = _this select 0;
_passthroughData = _this select 1;

_lineage = _this select 2;
_generation = _lineage select 0; //number representing how far displaced from generation '0' (root mission)
_relation = _lineage select 1; // child, stepchild, sibling
_offspringID = _lineage select 2; // number that represents birth order of this child
_parentName = _lineage select 3; // Full 'name' of the parent, name of "ROOT" implies spawned from controlloop.

_eCenter = _passthroughData select 0;
_missionTheme = _passthroughData select 1;
_themeIndex = _passthroughData select 2;
_missionNameOverride = _passthroughData select 3;
if (isNil "_missionNameOverride") then {_missionNameOverride = "";};
_boxes = [];
//diag_log format ["<FuMS> NewLogicBomb: _pos:%1, Theme:%2, _initData:%3",_eCenter, _missionTheme, _initData];
//diag_log format ["<FuMS> NewLogicBomb: _lineage: %1",_lineage];

_missionArea =_initData select 0;
_markers = _initData select 1;
_notifications = _initData select 2;
_lootConfig = _initData select 3;
_buildingData = _initData select 4;
_groupData = _initData select 5;
_vehicleData= _initData select 6;
_triggerData = _initData select 7;
 
// establish global variable prefix
_msnTag = format ["FuMS_%1_%2_%3",_themeIndex,_generation,_offspringID];
//diag_log format ["<FuMS> NewLogicBomb: _msnTag: %1",_msnTag];

// Example _msnTag = FuMS_8_1_3
// Theme #8, mission was executed by the 'root' (generation 0) and is the 4th child of the parent.
// _parent and _name of ROOT implies base mission launched from ControlLoop.sqf 
//   not a mission launched from another mission.

_endScript = "NONE";
//diag_log format ["<FuMS> NewLogicBomb: (count _missionArea): %1",(count _missionArea)];

if (count _missionArea > 3) then {_positionOffset = _missionArea select 3;};
if (count _missionArea > 4) then
{
    _startScript = _missionArea select 4;
    _endScript = _missionArea select 5;   
};
//diag_log format ["<FuMS> NewLogicBomb: _startScript: %1		_endScript:%2",_startScript,_endScript];

if (!isNil "_positionOffset") then
{
    private ["_min","_max","_dir","_dist"];
    // _positionOffset is [min,max, direction]
    _min = _positionOffset select 0;
    _max = _positionOffset select 1;
    _dir = _positionOffset select 2;
    _dist = (random (_max - _min)) + _min;
    if (_dir ==0) then {_dir = random 360;};
    //diag_log format ["<FuMS> NewLogicBomb: _dist:%1 _dir:%2 _eCenter:%3",_dist,_dir,_eCenter];
    _positionOffset = [_eCenter,_dist, _dir] call BIS_fnc_relPos;  
}else {_positionOffset = _eCenter;};
//diag_log format ["<FuMS> NewLogicBomb: _positionOffset:%1",_positionOffset];

if ( _missionNameOverride != "") then
{
    _curMission = _missionNameOverride;
}
else { _curMission = _missionArea select 0;};
_encounterSize = _missionArea select 1;

FuMS_MissionTerritory = FuMS_MissionTerritory + [[_eCenter, _encounterSize, format ["%1%2",_missionTheme,_curMission]]];

_mkr1 = format ["%3_%1_%2_1",_missionTheme select 0, _curMission, _eCenter,FuMS_HC_SlotNumber];
_mkr2 = format ["%3_%1_%2_2",_missionTheme select 0, _curMission ,_eCenter,FuMS_HC_SlotNumber];
createMarker [_mkr1, [0,0]];
createMarker [_mkr2, [0,0]];

_dat = [];
_dat = [_buildingData, _positionOffset, [_themeIndex, _generation, _offspringID], _curMission] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnBuildings;
_buildings = _dat select 0;
_vehicles = _dat select 1;

sleep 5; // pause for 5 seconds to allow buildings to fully materialize and position.
_silentspawn = (((FuMS_THEMEDATA select _themeIndex) select 3) select 0) select 1;

_groups = [_groupData, _positionOffset, _encounterSize, [_themeIndex, _generation, _offspringID], _silentspawn,_curMission] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnGroup;
_convoys = [_vehicleData, _positionOffset, _encounterSize, _groups, _vehicles,[ _themeIndex, _generation, _offspringID], _curMission] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnVehicle;
_groups = _convoys select 0;
_vehicles = _convoys select 1;

_boxes = [_lootConfig, _positionOffset, ["STATIC"], [_themeIndex, _generation, _offspringID], _boxes] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnMissionLoot;

[_markers, _notifications, ["STATIC"], _mkr1, _mkr2, _eCenter, _missionNameOverride] call FuMS_fnc_HC_MsnCtrl_Spawn_SpawnNotifications;

_customData = [];
// custom start script
if (!isNil "_startScript") then
{                                                                           
    if (toupper _startScript != "NONE") then
    {        
        //diag_log format ["<FuMS> NewLogicBomb: Running Custom Start Script :%1",_startScript];               
        _customData = [ _eCenter, _positionOffset, _buildings, _groups, _vehicles, _boxes] call (missionNamespace getVariable _startScript);
    };
};

//create global vars to track THIS mission's resources!
missionNamespace setVariable [format ["%1_buildings",_msnTag],_buildings];
missionNamespace setVariable [format ["%1_vehicles",_msnTag],_vehicles];
missionNamespace setVariable [format ["%1_groups",_msnTag],_groups];
missionNamespace setVariable [format ["%1_boxes",_msnTag],_boxes];

missionNamespace setVariable [format ["%1_closetriggers",_msnTag], false];  // used by all triggers to be told to terminate. 
missionNamespace setVariable [format ["%1_Children",_msnTag], []]; // list of active children.
missionNamespace setVariable [format ["%1_Lineage",_msnTag],[_themeIndex, _generation, _relation, _offspringID, _parentName]];
missionNamespace setVariable [format ["%1_MsnStatus",_msnTag],["RUNNING"]];


[_triggerData select 0, _msnTag,[_positionOffset, _eCenter, _themeIndex, _curMission] ] call FuMS_fnc_HC_MsnCtrl_LogicBomb_TriggerBomb;

// At this point all mission triggers are operational.
// launch into loop to watch trigger states and take applicable actions!

//diag_log format ["<FuMS> NewLogicBomb: _triggerData select 1 (action/trigger pairs):%1",_triggerData select 1];
[_triggerData select 1, _msnTag,
[_eCenter,_positionOffset,_buildings,_groups,_vehicles,_boxes,_customData, _endScript,_encounterSize,_missionTheme,_curMission, 
   _themeIndex, _generation,_offspringID, _mkr1, _mkr2, _missionNameOverride, _lootConfig, _markers, _notifications] ] spawn FuMS_fnc_HC_MsnCtrl_LogicBomb_ActionBomb;
// NOTE: the above 'spawns' so THIS script WILL terminate.
// FuMS missions now, do not remain open.
// Within the ControlLoop for the theme, the loop will 'watch for completion' of the root mission before starting another mission.
// Outside of the ROOT missions, ALL other missions will start with NO impact on other mission's trigger status or behaviour!

