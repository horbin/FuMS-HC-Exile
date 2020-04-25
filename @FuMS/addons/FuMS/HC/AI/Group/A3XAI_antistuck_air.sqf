#include "\A3XAI\globaldefines.hpp"

private ["_unitGroup", "_vehicle", "_stuckCheckTime", "_checkPos", "_tooClose", "_wpSelect", "_leader"];

_unitGroup = _this select 0;
_vehicle = _this select 1;
_stuckCheckTime = _this select 2;

if (isNull _vehicle) exitWith {};

_checkPos = (getPosATL _vehicle);
_leader = (leader _unitGroup);
if ((((_leader distance (_leader findNearestEnemy _vehicle)) > NEAREST_ENEMY_RANGE) or {[_checkPos,NO_AGGRO_RANGE_AIR] call A3XAI_checkInNoAggroArea}) && {_checkPos distance2D (_unitGroup getVariable ["antistuckPos",[0,0,0]]) < ANTISTUCK_MIN_TRAVEL_DIST_AIR} && {canMove _vehicle}) then {
	_tooClose = true;
	_wpSelect = [];
	while {_tooClose} do {
		_wpSelect = (A3XAI_locationsAir call A3XAI_selectRandom) select 1;
		if (((waypointPosition [_unitGroup,0]) distance2D _wpSelect) < ANTISTUCK_AIR_MIN_WP_DIST) then {
			_tooClose = false;
		} else {
			uiSleep 0.1;
		};
	};
	_wpSelect = [_wpSelect,ANTISTUCK_AIR_WP_DIST_BASE+(random ANTISTUCK_AIR_WP_DIST_VARIANCE),(random 360),1] call A3XAI_SHK_pos;
	[_unitGroup,0] setWPPos _wpSelect;
	[_unitGroup,1] setWPPos _wpSelect;
	if ((count (waypoints _unitGroup)) > 2) then {[_unitGroup,2] setWPPos _wpSelect;};
	[_unitGroup,"IgnoreEnemies"] call A3XAI_forceBehavior;
	_unitGroup setVariable ["antistuckPos",_wpSelect];
	_unitGroup setVariable ["antistuckTime",diag_tickTime + (_stuckCheckTime/2)];
	if (A3XAI_debugLevel > 1) then {diag_log format ["A3XAI Debug: Antistuck triggered for AI air vehicle %1 (Group: %2). Forcing next waypoint.",(typeOf _vehicle),_unitGroup];};
} else {
	_unitGroup setVariable ["antistuckPos",_checkPos];
	_unitGroup setVariable ["antistuckTime",diag_tickTime];
};

true