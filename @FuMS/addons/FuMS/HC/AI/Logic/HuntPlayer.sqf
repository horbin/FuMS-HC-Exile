// HuntPlayer
// TheOneWhoKnocks
// 4/11/2020
//INPUTS: Group, centroid, radius (meters), rotation, closeout
// Adds 1 waypoints to 'Group'.  This waypoint is the players position and AI will be 
// assigned a SAD mission as well as being informed of the players information

// OUTPUTS: 1st of the waypoints added, to permit further modification.
//  NOTE: closeout = TRUE => 6 points  FALSE=> 5 points   
//HC_AddWaypoint = compile preprocessFileLineNumbers "HC\Functions\HC_AddWaypoint.sqf";

//_wp = [_group, [_xx, _yy], 0] call HC_AddWaypoint;  
private ["_group","_radius","_centroid"];

_group = _this select 0;
_centroid = _this select 1;
_radius = _this select 2;

_target = nearestObjects [_centroid, ["player"], 300];
_targetPos = getPos _target;

diag_log format ["##HUNTPLAYER: Target :%1 at %2",_target,_targetPos];

_wp = [_group, _targetPos, 0] call FuMS_fnc_HC_AI_Logic_AddWaypoint;       
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointType "MOVE";

Hunt_players_fnc = 	
{
	_groupLoop = _this select 0;
	_targetLoop = _this select 1;

	_wp = _this addWaypoint [getPos _targetLoop, 50];
	_wp setWaypointStatements ["true", "_null = [_groupLoop,_targetLoop] spawn Hunt_players_fnc;"];
	_wp setWaypointType "SAD";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointSpeed "FULL";
};

_null = [_group,_target] spawn Hunt_players_fnc;

_wp