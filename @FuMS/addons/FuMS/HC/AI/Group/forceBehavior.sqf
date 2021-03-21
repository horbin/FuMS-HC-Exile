private ["_action", "_unitGroup"];

_action = _this select 1;
_unitGroup = _this select 0;

if (_action isEqualTo "IgnoreEnemies") exitWith {
	_unitGroup setBehaviour "CARELESS";
	_unitGroup setCombatMode "BLUE";
	{_x doWatch objNull} forEach (units _unitGroup);

	true
};

if (_action isEqualTo "Behavior_Reset") exitWith {
	_unitGroup setBehaviour "AWARE";
	_unitGroup setCombatMode "YELLOW";

	true
};

if (_action isEqualTo "DefendOnly") exitWith {
	_unitGroup setBehaviour "AWARE";
	_unitGroup setCombatMode "GREEN";
	{_x doWatch objNull} forEach (units _unitGroup);

	true
};

false