#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_vehicle", "_stuckCheckTime", "_checkPos", "_allWP", "_currentWP", "_nextWP","_leader"];

_unitGroup = _this select 0;
_vehicle = _this select 1;
_stuckCheckTime = _this select 2;

_allWP = (waypoints _unitGroup);
_leader = (leader _unitGroup);
if ((count _allWP) > 1) then {
	_checkPos = (getPosATL (leader _unitGroup));
	if ((((_leader distance (_leader findNearestEnemy _leader)) > NEAREST_ENEMY_INFANTRY) or {[_checkPos,NO_AGGRO_RANGE_MAN] call A3XAI_checkInNoAggroArea}) && ((_unitGroup getVariable ["antistuckPos",[0,0,0]]) distance _checkPos) < ANTISTUCK_MIN_TRAVEL_DIST_INFANTRY) then {
		_currentWP = (currentWaypoint _unitGroup);
		_nextWP = _currentWP + 1;
		if ((count _allWP) isEqualTo _nextWP) then {_nextWP = 0}; //Cycle back to first waypoint if group is currently on last waypoint.
		[_unitGroup] call A3XAI_fixStuckGroup;
		_unitGroup setCurrentWaypoint [_unitGroup,_nextWP];
		if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Antistuck triggered for AI %1 group %2. Forcing next waypoint.",(_unitGroup getVariable ["unitType","unknown"]),_unitGroup];};
		_unitGroup setVariable ["antistuckTime",diag_tickTime + (_stuckCheckTime/2)];
	} else {
		_unitGroup setVariable ["antistuckPos",_checkPos];
		_unitGroup setVariable ["antistuckTime",diag_tickTime];
	};
};

true