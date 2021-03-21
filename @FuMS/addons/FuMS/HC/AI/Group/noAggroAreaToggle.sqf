private ["_unitGroup", "_object", "_nearNoAggroAreas", "_inNoAggroArea", "_objectPos","_combatMode"];

_unitGroup = _this select 0;
_inNoAggroArea = _this select 1;

_debug = true;

_combatMode = (combatMode _unitGroup);

if (_inNoAggroArea) then {
	if (_combatMode != "BLUE") then 
	{
		[_unitGroup,"IgnoreEnemies"] call FuMS_fnc_HC_AI_Group_forceBehavior;
		[_unitGroup,true] call FuMS_fnc_HC_AI_Group_setNoAggroStatus;
		if (_debug) then {diag_log format ["##FuMS: (noAggroAreaToggle): Group %1 in no-aggro zone.",_unitGroup];};
	};
} else {
	if (_combatMode isEqualTo "BLUE") then 
	{
		[_unitGroup,"Behavior_Reset"] call FuMS_fnc_HC_AI_Group_forceBehavior;
		[_unitGroup,false] call FuMS_fnc_HC_AI_Group_setNoAggroStatus;
		if (_debug) then {diag_log format ["##FuMS: (noAggroAreaToggle): Group %1 exited no-aggro zone.",_unitGroup];};
	};
};

true
