// FindNearestWater = // if no water found within 2500m the original position is returned!
// Horbin
// 2/24/15
// Inputs: position
// Outputs: position with water nearest to 'position'

    private ["_pos","_safepos","_stepdistance"];
	_pos = _this select 0;
	_safepos = [];
	_stepdistance = 10;
	while {isNil "_safepos"} do
	{
		_pos = [_pos, 0, _stepdistance, 5,2, 10,0,[],[_safepos]] call BIS_fnc_findSafePos; // 2 implies water only!
		_stepdistance = _stepdistance + _stepdistance;
		if (_stepdistance > 2500) exitWith {diag_log format ["##FindNeareastWater: Unable to find water location near position %1",_pos];};
	};
	_pos
