#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_vehicle", "_stuckCheckTime", "_checkPos", "_currentWP", "_allWP", "_nextWP","_leader"];

_unitGroup = _this select 0;
_vehicle = _this select 1;
_stuckCheckTime = _this select 2;

if (isNull _vehicle) exitWith {};

_checkPos = (getWPPos [_unitGroup,(currentWaypoint _unitGroup)]);
_leader = (leader _unitGroup);
if ((((_leader distance (_leader findNearestEnemy _vehicle)) > NEAREST_ENEMY_RANGE) or {[_checkPos,NO_AGGRO_RANGE_AIR] call A3XAI_checkInNoAggroArea}) && {_checkPos isEqualTo (_unitGroup getVariable ["antistuckPos",[0,0,0]])} && {canMove _vehicle}) then {
	_currentWP = (currentWaypoint _unitGroup);
	_allWP = (waypoints _unitGroup);
	_nextWP = _currentWP + 1;
	if ((count _allWP) isEqualTo _nextWP) then {_nextWP = 1}; //Cycle back to first added waypoint if group is currently on last waypoint.
	_unitGroup setCurrentWaypoint [_unitGroup,_nextWP];
	_unitGroup setVariable ["antistuckPos",(getWPPos [_unitGroup,(currentWaypoint _unitGroup)])];
	_unitGroup setVariable ["antistuckTime",diag_tickTime + (_stuckCheckTime/2)];
	if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Antistuck triggered for AI air (custom) group %1. Forcing next waypoint.",_unitGroup];};
} else {
	_unitGroup setVariable ["antistuckPos",_checkPos];
	_unitGroup setVariable ["antistuckTime",diag_tickTime];
};

true