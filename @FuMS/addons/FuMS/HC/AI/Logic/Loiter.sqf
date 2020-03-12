// Loiter.sqf
// TheOneWhoKnocks
// 02/02/2020
//
// Inputs
// _group 
// Sets up LOITER waypoint
private ["_group","_options","_distance","_wp"];
_group = _this select 0;
_pos = _this select 1;
_options = _this select 2;
_distance = _options select 0;

_wp = [_group, _pos, 10] call FuMS_fnc_HC_AI_Logic_AddWaypoint;
// set mode and speed for each waypoint.
_wp SetWaypointType "LOITER";

_wp SetWaypointBehaviour "CARELESS";
[_group, 1] setWaypointLoiterRadius _distance;
[_group, 1] setWaypointLoiterType "CIRCLE_L";

//_type = waypointLoiterType [_group, 1];
//_radius = waypointLoiterRadius [_group, 1];
//_wPosArray = waypoints _group;
_ambientTypes = ["STAND", "STAND_IA", "SIT_LOW", "KNEEL", "LEAN", "WATCH", "WATCH1", "WATCH2"];

{
	_ambientType = selectRandom _ambientTypes;
	[_x, _ambientType, "ASIS"] call BIS_fnc_ambientAnimCombat;
} foreach units _group;

//diag_log format ["##LOITER: _group:%1 | _options:%2 | _distance:%3 | _pos:%4",_group,_options,_distance,_pos];
//diag_log format ["##LOITER: _type:%1 | _radius:%2 | _wPosArray:%3",_type,_radius,_wPosArray];
//diag_log format ["##LOITER: _pos0:%1 | _pos1:%2",getPos (_wPosArray select 0),getPos (_wPosArray select 1)];
//diag_log format ["##LOITER: _currentWaypoint:%1",currentWaypoint _group];
