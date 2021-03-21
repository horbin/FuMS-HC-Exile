private ["_unitGroup", "_vehicle", "_inArea", "_result", "_trigger", "_maxDistance","_leader", "_assignedTarget"];

_unitGroup = _this select 0;
//_vehicle = _this select 1;

_leader = (leader _unitGroup);
_inArea = [_leader,500] call FuMS_fnc_HC_AI_Group_checkInNoAggroArea;

if !(_inArea) then {
	_assignedTarget = (assignedTarget (vehicle _leader));
	if ((_assignedTarget distance _leader) < 500) then {	//900: replace with engagement range
		_inArea = [_assignedTarget,300] call FuMS_fnc_HC_AI_Group_checkInNoAggroArea;
	};
};

_result = [_unitGroup,_inArea] call FuMS_fnc_HC_AI_Group_noAggroAreaToggle;

/*
if !(_inArea) then {
	_trigger = _unitGroup getVariable "trigger";
	if !(isNil "_trigger") then {
		_maxDistance = _unitGroup getVariable ["patrolDist",250];
		if ((_leader distance2D _trigger) > (_maxDistance + PATROL_DISTANCE_BUFFER)) then {
			_randomWaypoint = _unitGroup call A3XAI_setRandomWaypoint;
			(units _unitGroup) doMove (waypointPosition _randomWaypoint);
			if (A3XAI_debugLevel > 0) then {diag_log format ["A3XAI Debug: Group %1 moved beyond allowed patrol radius, ordering group towards spawn center.",_unitGroup];};
		};
	};
};
*/

true
