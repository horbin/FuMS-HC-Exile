//DmgObjects.sqf
// Horbin
// 6/3/15
// [_msnTag, _amount, _list];
private ["_result","_data","_objectList","_trigName","_msnTag","_objName","_objectsRemaining"];
_data = _this select 0;
_msnTag = _data select 0;
_trigName = _data select 1;
_objName = _data select 2;
_result = false;
_objectList = missionNameSpace getVariable (format ["%1_%2",_msnTag, _objName]);
_objectsRemaining = missionNameSpace getVariable (format ["%1_%2_ObjectTotal",_msnTag, _trigName]);

{
    private ["_var"];
	_var = _x getVariable "FuMS_ObjectDamage";
	if (!isNil "_var") then
	{
		if (_var select 1) then
		{
            private ["_damage"];
			_damage = getDammage _x;
			if (_damage >= _var select 0) then
			{
				_objectsRemaining = _objectsRemaining - 1;
				missionNameSpace setVariable [format ["%1_%2_ObjectTotal", _msnTag, _trigName],_objectsRemaining];
                _x setVariable ["FuMS_ObjectDamage",[_var select 0, false]];
                diag_log format ["<FUMS> DmgObjects : %1_%2 %3 reduced count to %4",_msnTag, _trigName, _x, _objectsRemaining];
                if (_objectsRemaining == 0) exitwith {_result=true;};
			};
			
		};
	};
}foreach _objectList;
// go through the list of objects
_result