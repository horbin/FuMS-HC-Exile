private ["_inNoAggroArea", "_objectPos", "_noAggroRange"];

_objectPos = _this select 0;
_noAggroRange = [_this,1,900] call FuMS_fnc_HC_Util_paramCheck;
_debug = true;

if (_objectPos isEqualTo objNull) exitWith {false};
if ((typeName _objectPos) isEqualTo "OBJECT") then {_objectPos = getPosATL _objectPos};

_inNoAggroArea = false;
/*
{
	if (((position _x) distance2D _objectPos) < _noAggroRange) exitWith {
		_inNoAggroArea = true;
		if (_debug) then
		{
			diag_log format ["##FUMS: (checkInNoAggro): TRUE for :%1",_x];
		};
	};
} count FuMS_BlackList;
*/
_inNoAggroArea
